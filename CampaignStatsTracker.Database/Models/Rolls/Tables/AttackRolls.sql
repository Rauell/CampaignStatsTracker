CREATE TABLE [Rolls].[AttackRolls]
(
	[AttackRollId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_AttackRolls_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_AttackRolls_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[HitRollId] INT
		CONSTRAINT [FK_Rolls_AttackRolls_HitRoll_Rolls_Rolls]
			FOREIGN KEY ([HitRollId])
			REFERENCES [Rolls].[Rolls]([RollId])
		NOT NULL,

	[DamageRollId] INT
		CONSTRAINT [FK_Rolls_AttackRolls_DamageRoll_Rolls_Rolls]
			FOREIGN KEY ([DamageRollId])
			REFERENCES [Rolls].[Rolls]([RollId]),
		CONSTRAINT [UC_Rolls_AttackRolls_HitRollId_DamageRollId]
			UNIQUE ([HitRollId], [DamageRollId]),

	[DamageSourceId] INT
		CONSTRAINT [FK_Rolls_AttackRolls_Rolls_DamageSources]
			FOREIGN KEY ([DamageSourceId])
			REFERENCES [Rolls].[DamageSources]([DamageSourceId])
);
GO

CREATE TRIGGER [Rolls].[TR_AttackRolls_DateModified]
	ON [Rolls].[AttackRolls]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[AttackRolls]
		SET [DateModified] = getUtcDate()
		WHERE [AttackRollId] in (SELECT DISTINCT [AttackRollId] FROM Inserted)
;
GO