USE [$DatabaseName$]
GO

CREATE TABLE [Rolls].[DamageRolls]
(
	[DamageRollId] INT
		IDENTITY(1,1)
		CONSTRAINT [PK_Rolls_DamageRolls]
			PRIMARY KEY
		NOT NULL,

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_DamageRolls_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_DamageRolls_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[RollId] INT
		CONSTRAINT [FK_Rolls_DamageRolls_Rolls_Rolls]
			FOREIGN KEY ([RollId])
			REFERENCES [Rolls].[Rolls]([RollId])
		NOT NULL,
	CONSTRAINT [UC_Rolls_DamageRolls_RollId]
		UNIQUE ([RollId]),

	[DamageSourceId] INT
		CONSTRAINT [FK_Rolls_DamageRolls_Rolls_DamageSources]
			FOREIGN KEY ([DamageSourceId])
			REFERENCES [Rolls].[DamageSources]([DamageSourceId])
)
GO

CREATE TRIGGER [Rolls].[TR_Rolls_DamageRolls] ON [Rolls].[DamageRolls]
AFTER UPDATE
AS
	UPDATE [Rolls].[DamageRolls]
	SET [DateModified] = getUtcDate()
	FROM [Rolls.DamageRolls] AS DR
	INNER JOIN Inserted AS I
	ON I.[DamageRollId] = DR.[DamageRollId]
GO
