CREATE TABLE [Games].[CharactersToUsers]
(
	[CharacterToUserId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Games_CharactersToUsers_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Games_CharactersToUsers_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[CharacterId] INT
		NOT NULL,
	CONSTRAINT [FK_Games_CharactersToUsers_Games_Characters]
		FOREIGN KEY ([CharacterId])
		REFERENCES [Games].[Characters]([CharacterId]),

	[UserId] INT
		NOT NULL,
	CONSTRAINT [FK_Games_CharactersToUsers_Users_Users]
		FOREIGN KEY ([UserId])
		REFERENCES [Users].[Users]([UserId]),

	[AccessLevelId] TINYINT
		NOT NULL,
	CONSTRAINT [FK_Games_CharactersToUsers_Users_AccessLevels]
		FOREIGN KEY ([AccessLevelId])
		REFERENCES [Users].[AccessLevels]([AccessLevelId])
);
GO

CREATE TRIGGER [Games].[TR_CharactersToUsers_DateModified]
	ON [Games].[CharactersToUsers]
	AFTER UPDATE
	AS
		UPDATE [Games].[CharactersToUsers]
		SET [DateModified] = getUtcDate()
		WHERE [CharacterToUserId] in (SELECT DISTINCT [CharacterToUserId] FROM Inserted)
;
GO