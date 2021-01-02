CREATE TABLE [Games].[Characters]
(
	[CharacterId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[EntityId] BIGINT
		NOT NULL,
	CONSTRAINT [FK_Games_Characters_Entities_Entities]
		FOREIGN KEY ([EntityId])
		REFERENCES [Entities].[Entities]([EntityId]),
	CONSTRAINT [UC_Games_Characters_EntityId]
		UNIQUE ([EntityId]),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Games_Characters_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Games_Characters_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[NameId] INT
		NOT NULL,
	CONSTRAINT [FK_Games_Characters_Entities_Names]
		FOREIGN KEY ([NameId])
		REFERENCES [Entities].[Names]([NameId])
);
GO

CREATE TRIGGER [Games].[TR_Characters_DateModified]
	ON [Games].[Characters]
	AFTER UPDATE
	AS
		UPDATE [Games].[Characters]
		SET [DateModified] = getUtcDate()
		WHERE [CharacterId] in (SELECT DISTINCT [CharacterId] FROM Inserted)
;
GO