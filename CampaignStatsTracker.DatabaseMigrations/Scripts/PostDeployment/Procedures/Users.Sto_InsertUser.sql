USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Users].[Sto_InsertUser]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Users].[Sto_InsertUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Users].[Sto_InsertUser] AS'
END
GO
ALTER PROCEDURE [Users].[Sto_InsertUser]
	@Handle			VARCHAR(50),
	@Email			VARCHAR(200),
	@Password		VARCHAR(200),
	@FirstName	VARCHAR(100),
	@MiddleName	VARCHAR(100),
	@LastName		VARCHAR(100)
AS
BEGIN
	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	DECLARE @FirstNameId	INT,
					@MiddleNameId	INT,
					@LastNameId		INT
	;

	EXEC @FirstNameId		= [Users].[Sto_GetUserNameId] @FirstName;
	EXEC @MiddleNameId	= [Users].[Sto_GetUserNameId] @MiddleName;
	EXEC @LastNameId		= [Users].[Sto_GetUserNameId] @LastName;

	INSERT INTO [Users].[Users]([EntityId], [Handle], [Email], [PasswordHash], [FirstNameId], [MiddleNameId], [LastNameId])
	VALUES (
		@EntityId,
		@Handle,
		@Email,
		[Users].[Sc_GetUserPasswordHash](@Handle, @Password),
		@FirstNameId,
		@MiddleNameId,
		@LastNameId
	);

	RETURN SCOPE_IDENTITY();
END
GO
