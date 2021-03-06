USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Users].[Sto_GetUserNameId]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Users].[Sto_GetUserNameId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Users].[Sto_GetUserNameId] AS'
END
GO
ALTER PROCEDURE [Users].[Sto_GetUserNameId]
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
