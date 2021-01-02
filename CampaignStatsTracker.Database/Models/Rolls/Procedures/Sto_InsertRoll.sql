CREATE PROCEDURE [Rolls].[Sto_InsertRoll]
	@AssociatedEntities	[Entities].[EntitiesType] READONLY
AS
BEGIN
	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	INSERT INTO [Rolls].[Rolls]([EntityId])
	VALUES (@EntityId)
	;

	DECLARE @RollId INT = SCOPE_IDENTITY();

	INSERT INTO [Rolls].[RollsToEntities]([RollId], [EntityId])
	SELECT
		@RollId,
		EE.[EntityId]
	FROM @AssociatedEntities AS AE
		INNER JOIN [Entities].[Entities] AS EE
			ON EE.[PublicId] = AE.[PublicId]
	;

	RETURN @RollId;
END

GO