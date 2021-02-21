USE [$DatabaseName$]
GO

CREATE TABLE [Rolls].[SavingThrows]
(
	[SavingThrowId] INT
		IDENTITY(1,1)
		CONSTRAINT [PK_Rolls_SavingThrows]
			PRIMARY KEY
		NOT NULL,

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_SavingThrows_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_SavingThrows_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[RollId] INT
		CONSTRAINT [FK_Rolls_SavingRolls_Rolls_Rolls]
			FOREIGN KEY ([RollId])
			REFERENCES [Rolls].[Rolls]([RollId])
		NOT NULL,
	CONSTRAINT [UC_Rolls_SavingRolls_RollId]
		UNIQUE ([RollId]),

	[AttributeId] TINYINT
		CONSTRAINT [FK_Rolls_SavingRolls_Games_Attributes]
			FOREIGN KEY ([AttributeId])
			REFERENCES [Games].[Attributes]([AttributeId])
		NOT NULL,

	[Success] BIT
		NOT NULL
)
GO

CREATE TRIGGER [Rolls].[TR_Rolls_SavingThrows]
	ON [Rolls].[SavingThrows]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[SavingThrows]
		SET [DateModified] = getUtcDate()
		WHERE [SavingThrowId] IN (SELECT DISTINCT [SavingThrowId]
FROM Inserted)
GO