USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertInitiativeRoll]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rolls].[Sto_InsertInitiativeRoll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Rolls].[Sto_InsertInitiativeRoll] AS'
END
GO
ALTER PROCEDURE [Rolls].[Sto_InsertInitiativeRoll]
	@Dice								[Rolls].[DieRollType] READONLY,
	@Modifiers					[Rolls].[RollModifierType] READONLY,
	@Comments 					[Rolls].[RollCommentType] READONLY,
	@AssociatedEntities	[Entities].[EntitiesType] READONLY,
	@Rank								TINYINT
AS
BEGIN
	DECLARE @NumberOfDice INT;
	SELECT @NumberOfDice = COUNT(1)
	FROM @Dice;

	IF (@NumberOfDice <> 1) THROW 51000, 'Initiative Rolls only accept a single die', 1;

	DECLARE @RollId INT;
	EXEC @RollId = [Rolls].[Sto_InsertRoll]
		@Dice,
		@Modifiers,
		@Comments,
		@AssociatedEntities
	;

	INSERT INTO [Rolls].[InitiativeRolls]
		([RollId], [Rank])
	VALUES
		(@RollId, @Rank)
	;

	DECLARE @InitiativeRollId INT = SCOPE_IDENTITY();

	RETURN @InitiativeRollId;
END
GO
