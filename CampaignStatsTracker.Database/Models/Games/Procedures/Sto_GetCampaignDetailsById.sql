CREATE PROCEDURE [Games].[Sto_GetCampaignDetailsById]
	@PublicId	UNIQUEIDENTIFIER
AS
BEGIN

	SELECT
		EE.[PublicId],
		GC.[DateCreated],
		EN.[Name]
	FROM [Games].[Campaigns] AS GC
		INNER JOIN [Entities].[Entities] AS EE
			ON EE.[EntityId] = GC.[EntityId]
		INNER JOIN [Entities].[Names] EN
			ON EN.[NameId] = GC.[NameId]
	WHERE EE.[PublicId] = @PublicId
	;

	EXEC [Rolls].[Sto_GetRollStatsForEntity] @PublicId;

END

GO