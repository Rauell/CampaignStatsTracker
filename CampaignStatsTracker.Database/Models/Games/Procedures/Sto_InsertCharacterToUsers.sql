CREATE PROCEDURE [Games].[Sto_InsertCharacterToUsers]
	@CharacterId		INT,
	@UserIds				VARCHAR(MAX),
	@AccessLevelId	TINYINT
AS
BEGIN
	INSERT INTO [Games].[CharactersToUsers]([CharacterId], [UserId], [AccessLevelId])
	SELECT
		@CharacterId,
		CAST(@UserIds AS INT),
		@AccessLevelId
	FROM STRING_SPLIT(@UserIds, ',')
	;

	RETURN 0;
END

GO