CREATE PROCEDURE [Rolls].[Sto_InsertSkillRoll]
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