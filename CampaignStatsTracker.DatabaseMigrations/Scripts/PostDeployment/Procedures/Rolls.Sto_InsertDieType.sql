USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertDieType]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rolls].[Sto_InsertDieType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Rolls].[Sto_InsertDieType] AS'
END
GO
ALTER PROCEDURE [Rolls].[Sto_InsertDieType]
	@Sides				TINYINT,
	@DisplayName	VARCHAR(10)
AS
BEGIN

	INSERT INTO [Rolls].[DieTypes]([DieTypeId], [DisplayName])
	VALUES (@Sides, @DisplayName)
	;

	RETURN @Sides;
END
GO
