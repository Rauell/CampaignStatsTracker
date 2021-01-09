CREATE PROCEDURE [Rolls].[Sto_InsertAttackRoll]
	@Dice								[Rolls].[DieRollType] READONLY,
	@Modifiers					[Rolls].[RollModifierType] READONLY,
	@DamageDice					[Rolls].[DieRollType] READONLY,
	@DamageModifiers		[Rolls].[RollModifierType] READONLY,
	@SkillType					VARCHAR(50),
	@DamageType					VARCHAR(50),
	@DamageSource				VARCHAR(50),
	@Success						BIT,
	@Comments 					[Rolls].[RollCommentType] READONLY,
	@AssociatedEntities	[Entities].[EntitiesType] READONLY
AS
BEGIN
	DECLARE @NumberOfHitDice INT;
	SELECT @NumberOfHitDice = COUNT(1)
	FROM @Dice
	;

	DECLARE @HitRollId INT;
	EXEC @HitRollId = [Rolls].[Sto_InsertSkillRoll]
		@Dice,
		@Modifiers,
		@SkillType,
		@Success,
		@Comments,
		@AssociatedEntities
	;
	DECLARE @DamageRollId INT = NULL;
	DECLARE @DamageSourceId INT = NULL;

	IF @Success = 1
	BEGIN
		DECLARE @DamageComments [Rolls].[RollCommentType];
		EXEC @DamageRollId = [Rolls].[Sto_InsertRoll]
			@DamageDice,
			@DamageModifiers,
			@DamageComments,
			@AssociatedEntities
		;

		EXEC @DamageSourceId = [Rolls].[Sto_InsertDamageSource] @DamageSource, @DamageType;
	END

	INSERT INTO [Rolls].[AttackRolls]
		([HitRollId], [DamageRollId], [DamageSourceId])
	VALUES(@HitRollId, @DamageRollId, @DamageSourceId)
	;

	DECLARE @AttackRollId INT = SCOPE_IDENTITY();

	RETURN @AttackRollId;
END

GO