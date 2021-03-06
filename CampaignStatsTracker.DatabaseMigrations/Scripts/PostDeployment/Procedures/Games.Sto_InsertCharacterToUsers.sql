USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertCharacterToUsers]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Games].[Sto_InsertCharacterToUsers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Games].[Sto_InsertCharacterToUsers] AS'
END
GO
ALTER PROCEDURE [Games].[Sto_InsertCharacterToUsers]
	@CharacterId		INT,
	@UserIds				VARCHAR(MAX),
	@AccessLevelId	TINYINT
AS
BEGIN
	INSERT INTO [Games].[CharactersToUsers]([CharacterId], [UserId], [AccessLevelId])
	SELECT
		@CharacterId,
		CAST(@UserIds AS INT),
		@AccessLevelId
	FROM STRING_SPLIT(@UserIds, ',')
	;

	RETURN 0;
END
GO
