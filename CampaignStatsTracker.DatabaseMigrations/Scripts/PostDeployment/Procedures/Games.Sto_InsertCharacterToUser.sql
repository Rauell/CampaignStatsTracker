USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertCharacterToUser]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Games].[Sto_InsertCharacterToUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Games].[Sto_InsertCharacterToUser] AS'
END
GO
ALTER PROCEDURE [Games].[Sto_InsertCharacterToUser]
	@CharacterId		INT,
	@UserId					INT,
	@AccessLevelId	TINYINT
AS
BEGIN
	DECLARE @UserIds VARCHAR(50) = CAST(@UserId AS VARCHAR(50));
	RETURN EXEC [Games].[Sto_InsertCharacterToUsers]
		@CharacterId,
		@UserIds,
		@AccessLevelId
	;
END
GO
