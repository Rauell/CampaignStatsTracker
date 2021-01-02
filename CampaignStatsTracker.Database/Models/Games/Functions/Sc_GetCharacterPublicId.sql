CREATE FUNCTION [Games].[Sc_GetCharacterPublicId]
(
	@CharacterId INT
)
RETURNS UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @PublicId UNIQUEIDENTIFIER;

	SELECT @PublicId = EE.[PublicId]
	FROM [Games].[Characters] GC
		INNER JOIN [Entities].[Entities] EE
			ON EE.[EntityId] = GC.[EntityId]
	WHERE GC.[CharacterId] = @CharacterId
	;

	RETURN @PublicId
END
