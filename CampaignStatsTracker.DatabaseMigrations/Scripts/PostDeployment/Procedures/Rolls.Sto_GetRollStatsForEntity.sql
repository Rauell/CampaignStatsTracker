USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_GetRollStatsForEntity]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [Rolls].[Sto_GetRollStatsForEntity]
	@PublicId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Entities [Entities].[EntitiesType];

	INSERT INTO @Entities([PublicId])
	VALUES (@PublicId)
	;

	EXEC [Rolls].[Sto_GetRollStatsForEntities] @Entities;
END
GO
