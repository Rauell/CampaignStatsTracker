CREATE PROCEDURE [Rolls].[Sto_InsertDamageSource]
	@Name VARCHAR(40),
	@DamageType VARCHAR(40)
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @DamageSourceId INT = (
		SELECT [DamageSourceId]
		FROM [Rolls].[DamageSources]
		WHERE [Name] = @Name
	);

	IF @DamageSourceId IS NULL
	BEGIN
		DECLARE @DamageTypeId SMALLINT;
		EXEC @DamageTypeId = [Rolls].[Sto_InsertDamageType] @DamageType;

		INSERT INTO [Rolls].[DamageSources]([Name], [DamageTypeId])
		VALUES (@Name, @DamageTypeId)
		;

		SET @DamageSourceId = SCOPE_IDENTITY();
	END

	RETURN @DamageSourceId;
END

GO