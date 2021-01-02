CREATE PROCEDURE [Rolls].[Sto_GetSkillTypeId]
	@Name VARCHAR(40),
	@CreateIfMissing BIT = 1
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @SkillTypeId SMALLINT = (
		SELECT [SkillTypeId]
		FROM [Rolls].[SkillTypes]
		WHERE [Name] = @Name
	);

	IF @CreateIfMissing = 1 AND @SkillTypeId IS NULL
	BEGIN
		INSERT INTO [Rolls].[SkillTypes]([Name])
		VALUES (@Name)
		;
		SET @SkillTypeId = SCOPE_IDENTITY();
	END

	RETURN @SkillTypeId;
END

GO