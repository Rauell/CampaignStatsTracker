USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Entities].[Sto_InsertEntity]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Entities].[Sto_InsertEntity]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Entities].[Sto_InsertEntity] AS'
END
GO
ALTER PROCEDURE [Entities].[Sto_InsertEntity]
	@IsPublic	BIT = 1
AS
BEGIN
	INSERT INTO [Entities].[Entities]([IsPublic])
	VALUES (@IsPublic);

	RETURN SCOPE_IDENTITY();
END
GO
