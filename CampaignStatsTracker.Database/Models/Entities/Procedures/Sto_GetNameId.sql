CREATE PROCEDURE [Entities].[Sto_GetNameId]
	@Name	VARCHAR(200),
	@CreateIfMissing BIT = 1
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @NameId INT = (
		SELECT [NameId]
		FROM [Entities].[Names]
		WHERE [Name] = @Name
	);

	IF @CreateIfMissing = 1 AND @NameId IS NULL
	BEGIN
		INSERT INTO [Entities].[Names]([Name])
		VALUES (@Name)
		;
		SET @NameId = SCOPE_IDENTITY();
	END

	RETURN @NameId;
END

GO