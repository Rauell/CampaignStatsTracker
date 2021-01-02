CREATE PROCEDURE [Users].[Sto_GetUserNameId]
	@Name VARCHAR(100),
	@CreateIfMissing BIT = 1
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @UserNameId INT = (
		SELECT [UserNameId]
		FROM [Users].[UserNames]
		WHERE [Name] = @Name
	);

	IF @CreateIfMissing = 1 AND @UserNameId IS NULL
	BEGIN
		INSERT INTO [Users].[UserNames]([Name])
		VALUES (@Name)
		;
		SET @UserNameId = SCOPE_IDENTITY();
	END

	RETURN @UserNameId;
END

GO