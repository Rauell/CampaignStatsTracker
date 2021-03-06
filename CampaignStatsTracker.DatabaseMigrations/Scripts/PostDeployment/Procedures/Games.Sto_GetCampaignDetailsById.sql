USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Games].[Sto_GetCampaignDetailsById]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [Games].[Sto_GetCampaignDetailsById]
	@PublicId	UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CampignId INT;
	SELECT @CampignId = GC.[CampaignId]
	FROM [Games].[Campaigns] AS GC
		INNER JOIN [Entities].[Entities] AS EE
			ON EE.[EntityId] = GC.[EntityId]
	WHERE EE.[PublicId] = @PublicId
	;

	SELECT
		EE.[PublicId],
		GC.[DateCreated],
		EN.[Name]
	FROM [Games].[Campaigns] AS GC
		INNER JOIN [Entities].[Entities] AS EE
			ON EE.[EntityId] = GC.[EntityId]
		INNER JOIN [Entities].[Names] EN
			ON EN.[NameId] = GC.[NameId]
	WHERE GC.[CampaignId] = @CampignId
	;

	SELECT
		EE.[PublicId],
		GC.[DateCreated],
		EN.[Name]
	FROM [Games].[Characters] AS GC
		INNER JOIN [Games].[CharactersToCampaigns] AS CH2CA
			ON CH2CA.[CharacterId] = GC.[CharacterId]
		INNER JOIN [Entities].[Entities] AS EE
			ON EE.[EntityId] = GC.[EntityId]
		INNER JOIN [Entities].[Names] EN
			ON EN.[NameId] = GC.[NameId]
	WHERE CH2CA.[CampaignId] = @CampignId
	;

	EXEC [Rolls].[Sto_GetRollStatsForEntity] @PublicId;

	EXEC [Rolls].[Sto_GetLastRollsForEntity] @PublicId;

END
GO
