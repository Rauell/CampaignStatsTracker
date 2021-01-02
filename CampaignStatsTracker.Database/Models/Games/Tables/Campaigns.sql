CREATE TABLE [Games].[Campaigns]
(
	[CampaignId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[EntityId] BIGINT
		NOT NULL,
	CONSTRAINT [FK_Games_Campaigns_Entities_Entities]
		FOREIGN KEY ([EntityId])
		REFERENCES [Entities].[Entities]([EntityId]),
	CONSTRAINT [UC_Games_Campaigns_EntityId]
		UNIQUE ([EntityId]),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Games_Campaigns_DateCreated]
			DEFAULT getUtcDate()
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Games_Campaigns_DateModified]
			DEFAULT getUtcDate()
		NOT NULL,

	[NameId] INT
		NOT NULL,
	CONSTRAINT [FK_Games_Campaigns_Entities_Names]
		FOREIGN KEY ([NameId])
		REFERENCES [Entities].[Names]([NameId])
);
GO

CREATE TRIGGER [Games].[TR_Campaigns_DateModified]
	ON [Games].[Campaigns]
	AFTER UPDATE
	AS
		UPDATE [Games].[Campaigns]
		SET [DateModified] = getUtcDate()
		WHERE [CampaignId] IN ((SELECT DISTINCT [CampaignId] FROM Inserted))
;
GO