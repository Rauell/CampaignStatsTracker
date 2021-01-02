CREATE PROCEDURE [Rolls].[Sto_InsertDamageRoll]
	@HitDice						[Rolls].[DieRollType] READONLY,
	@HitModifiers				[Rolls].[RollModifierType] READONLY,
	@DamageDice					[Rolls].[DieRollType] READONLY,
	@DamageModifiers		[Rolls].[RollModifierType] READONLY,
	@DamageType					VARCHAR(50),
	@DamageSource				VARCHAR(50),
	@Comments 					[Rolls].[RollCommentType] READONLY,
	@AssociatedEntities	[Entities].[EntitiesType] READONLY
AS
BEGIN
	DECLARE @NumberOfHitDice INT;
	SELECT @NumberOfHitDice = COUNT(1) FROM @HitDice;

	IF @NumberOfHitDice <> 1
	BEGIN
		THROW 51000, 'Attack Hit Rolls only accept a single die', 1;
	END

	DECLARE @HitRollId INT;
	EXEC @HitRollId = [Rolls].[Sto_InsertRoll] @AssociatedEntities;
	EXEC [Rolls].[Sto_InsertIndividualRolls] @HitRollId, @HitDice;
	EXEC [Rolls].[Sto_InsertRollModifiers] @HitRollId, @HitModifiers;
	EXEC [Rolls].[Sto_InsertRollComments] @HitRollId, @Comments;

	DECLARE @DamageRollId INT;
	EXEC @DamageRollId = [Rolls].[Sto_InsertRoll] @AssociatedEntities;
	EXEC [Rolls].[Sto_InsertIndividualRolls] @DamageRollId, @DamageDice;
	EXEC [Rolls].[Sto_InsertRollModifiers] @DamageRollId, @DamageModifiers;

	DECLARE @DamageSourceId INT;
	EXEC @DamageSourceId = [Rolls].[Sto_InsertDamageType] @DamageType, @DamageSource;

	INSERT INTO [Rolls].[AttackRolls]([HitRollId], [DamageRollId], [DamageSourceId])
	VALUES(@HitRollId, @DamageRollId, @DamageSourceId)
	;

	DECLARE @AttackRollId INT = SCOPE_IDENTITY();

	RETURN @AttackRollId;
END

GO