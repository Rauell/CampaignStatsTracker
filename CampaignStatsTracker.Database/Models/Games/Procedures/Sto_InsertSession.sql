CREATE PROCEDURE [Games].[Sto_InsertSession]
	@Name				VARCHAR(200),
	@CampaignId INT
AS
BEGIN
	DECLARE @NameId INT;
	EXEC @NameId = [Entities].[Sto_GetNameId] @Name, 1;

	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	INSERT INTO [Games].[Sessions]([NameId], [EntityId], [CampaignId])
	VALUES (@NameId, @EntityId, @CampaignId);

	DECLARE @SessionId INT = SCOPE_IDENTITY();

	RETURN @SessionId;
END

GO