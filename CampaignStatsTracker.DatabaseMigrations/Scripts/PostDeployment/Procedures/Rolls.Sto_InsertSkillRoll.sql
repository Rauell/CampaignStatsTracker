USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertSkillRoll]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rolls].[Sto_InsertSkillRoll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Rolls].[Sto_InsertSkillRoll] AS'
END
GO
ALTER PROCEDURE [Rolls].[Sto_InsertSkillRoll]
	@Dice								[Rolls].[DieRollType] READONLY,
	@Modifiers					[Rolls].[RollModifierType] READONLY,
	@SkillType					VARCHAR(50),
	@Success						BIT,
	@Comments 					[Rolls].[RollCommentType] READONLY,
	@AssociatedEntities	[Entities].[EntitiesType] READONLY
AS
BEGIN
	DECLARE @NumberOfDice INT;
	SELECT @NumberOfDice = COUNT(1)
	FROM @Dice;

	IF (@NumberOfDice <> 1) THROW 51000, 'Skill Rolls only accept a single die', 1;

	DECLARE @RollId INT;
	EXEC @RollId = [Rolls].[Sto_InsertRoll]
		@Dice,
		@Modifiers,
		@Comments,
		@AssociatedEntities
	;

	DECLARE @SkillTypeId SMALLINT;
	EXEC @SkillTypeId = [Rolls].[Sto_GetSkillTypeId] @SkillType;

	INSERT INTO [Rolls].[SkillRolls]
		([RollId], [SkillTypeId], [Success])
	VALUES
		(@RollId, @SkillTypeId, @Success)
	;

	DECLARE @SkillRollId INT = SCOPE_IDENTITY();

	RETURN @SkillRollId;
END
GO
