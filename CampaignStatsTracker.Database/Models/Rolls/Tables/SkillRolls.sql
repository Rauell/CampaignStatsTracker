CREATE TABLE [Rolls].[SkillRolls]
(
	[SkillRollId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_SkillRolls_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_SkillRolls_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[RollId] INT
		CONSTRAINT [FK_Rolls_SkillRolls_Rolls_Rolls]
			FOREIGN KEY ([RollId])
			REFERENCES [Rolls].[Rolls]([RollId])
		NOT NULL,
	CONSTRAINT [UC_Rolls_SkillRolls_RollId]
		UNIQUE ([RollId]),

	[SkillTypeId] SMALLINT
		CONSTRAINT [FK_Rolls_SkillRolls_Rolls_SkillTypes]
			FOREIGN KEY ([SkillTypeId])
			REFERENCES [Rolls].[SkillTypes]([SkillTypeId]),

	[Success] BIT
		NOT NULL
);
GO

CREATE TRIGGER [Rolls].[TR_SkillRolls_DateModified]
	ON [Rolls].[SkillRolls]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[SkillRolls]
		SET [DateModified] = getUtcDate()
		WHERE [SkillRollId] in (SELECT DISTINCT [SkillRollId] FROM Inserted)
;
GO