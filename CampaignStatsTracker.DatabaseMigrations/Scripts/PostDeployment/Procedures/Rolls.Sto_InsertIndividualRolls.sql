USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertIndividualRolls]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rolls].[Sto_InsertIndividualRolls]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Rolls].[Sto_InsertIndividualRolls] AS'
END
GO
ALTER PROCEDURE [Rolls].[Sto_InsertIndividualRolls]
	@RollId	INT,
	@Dice		[Rolls].[DieRollType] READONLY
AS
BEGIN
	INSERT INTO [Rolls].[IndividualRolls]([RollId], [DieTypeId], [Value])
	OUTPUT INSERTED.[IndividualRollId]
	SELECT
		@RollId,
		DT.[DieTypeId],
		D.[Value]
	FROM @Dice D
	INNER JOIN [Rolls].[DieTypes] DT
		ON DT.[NumberOfSides] = D.[NumberOfSides]
	;
END
GO
