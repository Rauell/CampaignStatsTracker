CREATE TABLE [Games].[Sessions]
(
	[SessionId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[EntityId] BIGINT
		NOT NULL,
	CONSTRAINT [FK_Games_Sessions_Entities_Entities]
		FOREIGN KEY ([EntityId])
		REFERENCES [Entities].[Entities]([EntityId]),
	CONSTRAINT [UC_Games_Sessions_EntityId]
		UNIQUE ([EntityId]),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Games_Sessions_DateCreated]
			DEFAULT getUtcDate()
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Games_Sessions_DateModified]
			DEFAULT getUtcDate()
		NOT NULL,

	[NameId] INT
		NOT NULL,
	CONSTRAINT [FK_Games_Sessions_Entities_Names]
		FOREIGN KEY ([NameId])
		REFERENCES [Entities].[Names]([NameId]),

	[CampaignId] INT
		NOT NULL,
	CONSTRAINT [FK_Games_Sessions_Games_Campaigns]
		FOREIGN KEY ([CampaignId])
		REFERENCES [Games].[Campaigns]([CampaignId]),

	[CampaignSortOrder] SMALLINT
		CONSTRAINT [DF_Games_Sessions_CampaignSortOrder]
			DEFAULT 0
		NOT NULL,
	CONSTRAINT [UC_Games_Sessions_CampaignId_CampaignSortOrder]
		UNIQUE ([CampaignId], [CampaignSortOrder])
);
GO

CREATE TRIGGER [Games].[TR_Sessions_DateModified]
	ON [Games].[Sessions]
	AFTER UPDATE
	AS
		UPDATE [Games].[Sessions]
		SET [DateModified] = getUtcDate()
		WHERE [SessionId] in (SELECT DISTINCT [SessionId] FROM Inserted)
;
GO

CREATE TRIGGER [Games].[TR_Sessions_DefaultCampaignSortOrder]
	ON [Games].[Sessions]
	AFTER INSERT
	AS
		UPDATE [Games].[Sessions]
		SET [CampaignSortOrder] = (
			SELECT MAX([CampaignSortOrder]) + 1
			FROM [Games].[Sessions] AS [GS]
			WHERE [GS].[CampaignId] = [Inserted].[CampaignId]
		)
		FROM Inserted
		WHERE [Games].[Sessions].[SessionId] = [Inserted].[SessionId]
;
GO