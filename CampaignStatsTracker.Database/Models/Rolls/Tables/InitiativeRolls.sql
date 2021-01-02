CREATE TABLE [Rolls].[InitiativeRolls]
(
	[InitiativeRollId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_InitiativeRolls_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_InitiativeRolls_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[RollId] INT
		CONSTRAINT [FK_Rolls_InitiativeRolls_Rolls_Rolls]
			FOREIGN KEY ([RollId])
			REFERENCES [Rolls].[Rolls]([RollId])
		NOT NULL,
	CONSTRAINT [UC_Rolls_InitiativeRolls_RollId]
		UNIQUE ([RollId]),

	[Rank] TINYINT
		NOT NULL
);
GO

CREATE TRIGGER [Rolls].[TR_InitiativeRolls_DateModified]
	ON [Rolls].[InitiativeRolls]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[InitiativeRolls]
		SET [DateModified] = getUtcDate()
		WHERE [InitiativeRollId] in (SELECT DISTINCT [InitiativeRollId] FROM Inserted)
;
GO