USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertDamageSource]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rolls].[Sto_InsertDamageSource]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Rolls].[Sto_InsertDamageSource] AS'
END
GO
ALTER PROCEDURE [Rolls].[Sto_InsertDamageSource]
	@Name VARCHAR(40),
	@DamageType VARCHAR(40)
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @DamageSourceId INT = (
		SELECT [DamageSourceId]
		FROM [Rolls].[DamageSources]
		WHERE [Name] = @Name
	);

	IF @DamageSourceId IS NULL
	BEGIN
		DECLARE @DamageTypeId SMALLINT;
		EXEC @DamageTypeId = [Rolls].[Sto_InsertDamageType] @DamageType;

		INSERT INTO [Rolls].[DamageSources]([Name], [DamageTypeId])
		VALUES (@Name, @DamageTypeId)
		;

		SET @DamageSourceId = SCOPE_IDENTITY();
	END

	RETURN @DamageSourceId;
END
GO
