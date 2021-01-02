CREATE TABLE [Games].[CharactersToCampaigns]
(
	[CharactersToCampaignsId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Games_CharactersToCampaigns_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Games_CharactersToCampaigns_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[CharacterId] INT
		NOT NULL,
	CONSTRAINT [FK_Games_CharactersToCampaigns_Games_Characters]
		FOREIGN KEY ([CharacterId])
		REFERENCES [Games].[Characters]([CharacterId]),

	[CampaignId] INT
		NOT NULL,
	CONSTRAINT [FK_Games_CharactersToCampaigns_Games_Campaigns]
		FOREIGN KEY ([CampaignId])
		REFERENCES [Games].[Campaigns]([CampaignId]),
);
GO

CREATE TRIGGER [Games].[TR_CharactersToCampaigns_DateModified]
	ON [Games].[CharactersToCampaigns]
	AFTER UPDATE
	AS
		UPDATE [Games].[CharactersToCampaigns]
		SET [DateModified] = getUtcDate()
		WHERE [CharactersToCampaignsId] in (SELECT DISTINCT [CharactersToCampaignsId] FROM Inserted)
;
GO