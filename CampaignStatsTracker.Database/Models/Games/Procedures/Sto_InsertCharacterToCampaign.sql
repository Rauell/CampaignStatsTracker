CREATE PROCEDURE [Games].[Sto_InsertCharacterToCampaign]
	@CharacterId	INT,
	@CampaignId	INT
AS
BEGIN
	INSERT INTO [Games].[CharactersToCampaigns]([CharacterId], [CampaignId])
	VALUES (@CharacterId, @CampaignId)

	RETURN 0;
END

GO