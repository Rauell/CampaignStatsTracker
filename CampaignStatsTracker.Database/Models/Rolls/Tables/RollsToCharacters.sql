CREATE TABLE [Rolls].[RollsToCharacters]
(
	[RollsToCharactersId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_RollsToCharacters_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_RollsToCharacters_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[CharacterId] INT
		NOT NULL,
	CONSTRAINT [FK_Rolls_RollsToCharacters_Games_Characters]
		FOREIGN KEY ([CharacterId])
		REFERENCES [Games].[Characters]([CharacterId]),

	[RollId] INT
		NOT NULL,
	CONSTRAINT [FK_Rolls_RollsToCharacters_Rolls_Rolls]
		FOREIGN KEY ([RollId])
		REFERENCES [Rolls].[Rolls]([RollId])
);
GO

CREATE TRIGGER [Rolls].[TR_RollsToCharacters_DateModified]
	ON [Rolls].[RollsToCharacters]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[RollsToCharacters]
		SET [DateModified] = getUtcDate()
		WHERE [RollsToCharactersId] in (SELECT DISTINCT [RollsToCharactersId] FROM Inserted)
;
GO