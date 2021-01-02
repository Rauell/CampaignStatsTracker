CREATE PROCEDURE [Entities].[Sto_InsertEntity]
	@IsPublic	BIT = 1
AS
BEGIN
	INSERT INTO [Entities].[Entities]([IsPublic])
	VALUES (@IsPublic);

	RETURN SCOPE_IDENTITY();
END

GO