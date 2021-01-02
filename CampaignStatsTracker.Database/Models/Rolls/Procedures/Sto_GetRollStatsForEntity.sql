CREATE PROCEDURE [Rolls].[Sto_GetRollStatsForEntity]
	@PublicId UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @Entities [Entities].[EntitiesType];

	INSERT INTO @Entities([PublicId])
	VALUES (@PublicId)
	;

	EXEC [Rolls].[Sto_GetRollStatsForEntities] @Entities;
END
