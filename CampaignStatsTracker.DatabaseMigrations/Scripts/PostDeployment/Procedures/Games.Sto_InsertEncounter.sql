USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertEncounter]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Games].[Sto_InsertEncounter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Games].[Sto_InsertEncounter] AS'
END
GO
ALTER PROCEDURE [Games].[Sto_InsertEncounter]
	@Name				VARCHAR(200),
	@SessionId	INT
AS
BEGIN
	DECLARE @NameId INT;
	EXEC @NameId = [Entities].[Sto_GetNameId] @Name, 1;

	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	INSERT INTO [Games].[Encounters]([NameId], [EntityId], [SessionId])
	VALUES (@NameId, @EntityId, @SessionId);

	DECLARE @EncounterId INT = SCOPE_IDENTITY();

	RETURN @EncounterId;
END
GO
