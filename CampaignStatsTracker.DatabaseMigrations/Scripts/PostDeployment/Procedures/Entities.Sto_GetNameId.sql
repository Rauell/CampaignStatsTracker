USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Entities].[Sto_GetNameId]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Entities].[Sto_GetNameId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Entities].[Sto_GetNameId] AS'
END
GO
ALTER PROCEDURE [Entities].[Sto_GetNameId]
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
