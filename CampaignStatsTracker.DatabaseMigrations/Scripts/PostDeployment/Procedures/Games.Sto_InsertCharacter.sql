USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertCharacter]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Games].[Sto_InsertCharacter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Games].[Sto_InsertCharacter] AS'
END
GO
ALTER PROCEDURE [Games].[Sto_InsertCharacter]
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
