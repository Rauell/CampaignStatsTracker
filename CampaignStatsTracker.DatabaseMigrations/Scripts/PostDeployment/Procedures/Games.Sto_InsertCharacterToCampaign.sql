USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertCharacterToCampaign]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Games].[Sto_InsertCharacterToCampaign]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Games].[Sto_InsertCharacterToCampaign] AS'
END
GO
ALTER PROCEDURE [Games].[Sto_InsertCharacterToCampaign]
	@CharacterId	INT,
	@CampaignId	INT
AS
BEGIN
	INSERT INTO [Games].[CharactersToCampaigns]([CharacterId], [CampaignId])
	VALUES (@CharacterId, @CampaignId)

	RETURN 0;
END
GO
