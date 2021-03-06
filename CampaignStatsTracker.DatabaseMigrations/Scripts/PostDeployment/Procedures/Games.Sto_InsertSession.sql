USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertSession]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Games].[Sto_InsertSession]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Games].[Sto_InsertSession] AS'
END
GO
ALTER PROCEDURE [Games].[Sto_InsertSession]
	@Name				VARCHAR(200),
	@CampaignId INT
AS
BEGIN
	DECLARE @NameId INT;
	EXEC @NameId = [Entities].[Sto_GetNameId] @Name, 1;

	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	INSERT INTO [Games].[Sessions]([NameId], [EntityId], [CampaignId])
	VALUES (@NameId, @EntityId, @CampaignId);

	DECLARE @SessionId INT = SCOPE_IDENTITY();

	RETURN @SessionId;
END
GO
