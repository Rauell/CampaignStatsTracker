CREATE PROCEDURE [Rolls].[Sto_InsertDamageType]
	@Name VARCHAR(40)
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @DamageTypeId INT = (
		SELECT [DamageTypeId]
		FROM [Rolls].[DamageTypes]
		WHERE [Name] = @Name
	);

	IF @DamageTypeId IS NULL
	BEGIN
		INSERT INTO [Rolls].[DamageTypes]([Name], [DamageTypeId])
		VALUES (@Name, @DamageTypeId)
		;

		SET @DamageTypeId = SCOPE_IDENTITY();
	END

	RETURN @DamageTypeId;
END

GO