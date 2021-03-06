USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_GetSkillTypeId]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rolls].[Sto_GetSkillTypeId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Rolls].[Sto_GetSkillTypeId] AS'
END
GO
ALTER PROCEDURE [Rolls].[Sto_GetSkillTypeId]
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
