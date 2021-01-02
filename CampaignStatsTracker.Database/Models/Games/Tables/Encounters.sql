CREATE TABLE [Games].[Encounters]
(
	[EncounterId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[EntityId] BIGINT
		NOT NULL,
	CONSTRAINT [FK_Games_Encounters_Entities_Entities]
		FOREIGN KEY ([EntityId])
		REFERENCES [Entities].[Entities]([EntityId]),
	CONSTRAINT [UC_Games_Encounters_EntityId]
		UNIQUE ([EntityId]),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Games_Encounters_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Games_Encounters_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[NameId] INT
		NOT NULL,
	CONSTRAINT [FK_Games_Encounters_Entities_Names]
		FOREIGN KEY ([NameId])
		REFERENCES [Entities].[Names]([NameId]),

	[SessionId] INT
		NOT NULL,
	CONSTRAINT [FK_Games_Encounters_Games_Sessions]
		FOREIGN KEY ([SessionId])
		REFERENCES [Games].[Sessions]([SessionId]),

	[SessionSortOrder] SMALLINT
		CONSTRAINT [DF_Games_Encounters_SessionSortOrder]
			DEFAULT 0
		NOT NULL,
	CONSTRAINT [UC_Games_Encounters_SessionId_SessionSortOrder]
		UNIQUE ([SessionId], [SessionSortOrder])
);
GO

CREATE TRIGGER [Games].[TR_Encounters_DateModified]
	ON [Games].[Encounters]
	AFTER UPDATE
	AS
		UPDATE [Games].[Encounters]
		SET [DateModified] = getUtcDate()
		WHERE [EncounterId] in (SELECT DISTINCT [EncounterId] FROM Inserted)
;
GO

CREATE TRIGGER [Games].[TR_Encounters_DefaultSessionSortOrder]
	ON [Games].[Encounters]
	AFTER INSERT
	AS
		UPDATE [Games].[Encounters]
		SET [SessionSortOrder] = (
			SELECT MAX([SessionSortOrder]) + 1
			FROM [Games].[Encounters] AS [GE]
			WHERE [GE].[SessionId] = [Inserted].[SessionId]
		)
		FROM Inserted
		WHERE [Games].[Encounters].[EncounterId] = [Inserted].[EncounterId]
;
GO