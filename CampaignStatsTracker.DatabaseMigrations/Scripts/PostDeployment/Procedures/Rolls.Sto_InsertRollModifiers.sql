USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertRollModifiers]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rolls].[Sto_InsertRollModifiers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Rolls].[Sto_InsertRollModifiers] AS'
END
GO
ALTER PROCEDURE [Rolls].[Sto_InsertRollModifiers]
	@RollId			INT,
	@Modifiers	[Rolls].[RollModifierType] READONLY
AS
BEGIN
	INSERT INTO [Rolls].[RollModifiers]
		([RollId], [Value])
	OUTPUT
	INSERTED.[RollModifierId]
	SELECT
		@RollId,
		[Value]
	FROM @Modifiers
	WHERE [Value] <> 0
;
END
GO
