CREATE PROCEDURE [Games].[Sto_InsertCharacter]
	@Name				VARCHAR(200),
	@CreatedBy	INT,
	@CampaignId INT
AS
BEGIN
	DECLARE @NameId INT;
	EXEC @NameId = [Entities].[Sto_GetNameId] @Name, 1;

	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	INSERT INTO [Games].[Characters]([NameId], [EntityId])
	VALUES (@NameId, @EntityId);

	DECLARE @CharacterId INT = SCOPE_IDENTITY();

	IF @CreatedBy IS NOT NULL
	BEGIN
		EXEC [Games].[Sto_InsertCharacterToUser]
			@CharacterId,
			@CreatedBy,
			1-- [Users].[Sc_GetAccessLevelId]('Owner');
	END

	IF @CampaignId IS NOT NULL
	BEGIN
		EXEC [Games].[Sto_InsertCharacterToCampaign]
			@CharacterId,
			@CampaignId;
	END

	RETURN @CharacterId;
END

GO