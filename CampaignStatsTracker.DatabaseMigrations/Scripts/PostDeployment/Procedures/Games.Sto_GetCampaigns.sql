USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Games].[Sto_GetCampaigns]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Games].[Sto_GetCampaigns]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Games].[Sto_GetCampaigns] AS'
END
GO
ALTER PROCEDURE [Games].[Sto_GetCampaigns]
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
