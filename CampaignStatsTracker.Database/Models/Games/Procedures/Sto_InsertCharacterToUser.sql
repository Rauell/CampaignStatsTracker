CREATE PROCEDURE [Games].[Sto_InsertCharacterToUser]
	@CharacterId		INT,
	@UserId					INT,
	@AccessLevelId	TINYINT
AS
BEGIN
	DECLARE @UserIds VARCHAR(50) = CAST(@UserId AS VARCHAR(50));
	RETURN EXEC [Games].[Sto_InsertCharacterToUsers]
		@CharacterId,
		@UserIds,
		@AccessLevelId
	;
END

GO