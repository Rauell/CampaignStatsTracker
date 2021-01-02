CREATE PROCEDURE [Games].[Sto_InsertCampaign]
	@Name				VARCHAR(200)
AS
BEGIN
	DECLARE @NameId INT;
	EXEC @NameId = [Entities].[Sto_GetNameId] @Name, 1;

	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	INSERT INTO [Games].[Campaigns]([NameId], [EntityId])
	VALUES (@NameId, @EntityId)
	;

	DECLARE @CampaignId INT = SCOPE_IDENTITY();

	RETURN @CampaignId;
END

GO