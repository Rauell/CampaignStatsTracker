CREATE PROCEDURE [Games].[Sto_InsertEncounter]
	@Name				VARCHAR(200),
	@SessionId	INT
AS
BEGIN
	DECLARE @NameId INT;
	EXEC @NameId = [Entities].[Sto_GetNameId] @Name, 1;

	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	INSERT INTO [Games].[Encounters]([NameId], [EntityId], [SessionId])
	VALUES (@NameId, @EntityId, @SessionId);

	DECLARE @EncounterId INT = SCOPE_IDENTITY();

	RETURN @EncounterId;
END

GO