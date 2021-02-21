USE [$DatabaseName$]
GO

-- Migrate Hit Rolls to be stored internally
ALTER TABLE [Rolls].[AttackRolls]
	ADD
		[RollId] INT NULL,
		CONSTRAINT [FK_Rolls_AttackRolls_Rolls_Rolls]
			FOREIGN KEY ([RollId])
			REFERENCES [Rolls].[Rolls]([RollId]),

		[SkillTypeId] SMALLINT NULL,
		CONSTRAINT [FK_Rolls_AttackRolls_Rolls_SkillTypes]
			FOREIGN KEY ([SkillTypeId])
			REFERENCES [Rolls].[SkillTypes]([SkillTypeId]),

		[Hit] BIT NULL
GO

UPDATE [Rolls].[AttackRolls]
	SET
		[RollId] = SR.[RollId],
		[SkillTypeId] = SR.[SkillTypeId],
		[Hit] = SR.[Success]
	FROM [Rolls].[AttackRolls] AS AR
	INNER JOIN [Rolls].[SkillRolls] AS SR
	ON SR.[SkillRollId] = AR.[HitRollId]
GO

ALTER TABLE [Rolls].[AttackRolls]
	ALTER COLUMN [RollId] INT NOT NULL
GO

ALTER TABLE [Rolls].[AttackRolls]
	ADD CONSTRAINT [UC_Rolls_AttackRolls_RollId]
		UNIQUE([RollId])
GO

ALTER TABLE [Rolls].[AttackRolls]
	ALTER COLUMN [SkillTypeId] SMALLINT NOT NULL
GO

-- Migrate damage rolls to new table
INSERT INTO [Rolls].[DamageRolls]
	([RollId], [DamageSourceId])
SELECT
	[DamageRollId],
	[DamageSourceId]
FROM [Rolls].[AttackRolls]
WHERE [DamageRollId] IS NOT NULL
GO

-- Cleanup
ALTER TABLE [Rolls].[AttackRolls]
	DROP CONSTRAINT
		[FK_Rolls_AttackRolls_HitRoll_Rolls_Rolls], --Note, this FK was to the wrong source
		[FK_Rolls_AttackRolls_Rolls_DamageSources],
		[FK_Rolls_AttackRolls_DamageRoll_Rolls_Rolls],
		[UC_Rolls_AttackRolls_HitRollId_DamageRollId]
GO

-- Remove previous skill rolls that should be attack rolls
DELETE SR
FROM [Rolls].[SkillRolls] AS SR
	INNER JOIN [Rolls].[AttackRolls] AS AR
	ON AR.[HitRollId] = SR.[SkillRollId]
GO

ALTER TABLE [Rolls].[AttackRolls]
	DROP COLUMN
		[DamageSourceId],
		[DamageRollId],
		[HitRollId]
;
GO