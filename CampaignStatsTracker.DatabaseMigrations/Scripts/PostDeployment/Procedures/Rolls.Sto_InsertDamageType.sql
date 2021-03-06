USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertDamageType]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rolls].[Sto_InsertDamageType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Rolls].[Sto_InsertDamageType] AS'
END
GO
ALTER PROCEDURE [Rolls].[Sto_InsertDamageType]
	@Name VARCHAR(40)
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @DamageTypeId INT = (
		SELECT [DamageTypeId]
		FROM [Rolls].[DamageTypes]
		WHERE [Name] = @Name
	);

	IF @DamageTypeId IS NULL
	BEGIN
		INSERT INTO [Rolls].[DamageTypes]([Name])
		VALUES (@Name)
		;

		SET @DamageTypeId = SCOPE_IDENTITY();
	END

	RETURN @DamageTypeId;
END
GO
