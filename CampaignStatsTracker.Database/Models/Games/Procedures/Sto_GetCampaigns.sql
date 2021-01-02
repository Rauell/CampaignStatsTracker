CREATE PROCEDURE [Games].[Sto_GetCampaigns]
AS
BEGIN
	SELECT
		EE.[PublicId],
		EN.[Name],
		GC.[DateCreated]
	FROM [Games].[Campaigns] GC
	INNER JOIN [Entities].[Entities] EE
		ON GC.[EntityId] = EE.[EntityId]
	INNER JOIN [Entities].[Names] EN
		ON GC.[NameId] = EN.[NameId]
END

GO