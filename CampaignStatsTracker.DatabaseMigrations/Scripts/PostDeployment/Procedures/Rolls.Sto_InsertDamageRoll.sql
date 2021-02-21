USE [$DatabaseName$]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [Rolls].[Sto_InsertDamageRoll]
	@Dice								[Rolls].[DieRollType] READONLY,
	@Modifiers					[Rolls].[RollModifierType] READONLY,
	@DamageType					VARCHAR(50),
	@DamageSource				VARCHAR(50),
	@Comments 					[Rolls].[RollCommentType] READONLY,
	@AssociatedEntities	[Entities].[EntitiesType] READONLY
AS
BEGIN
	DECLARE @RollId INT;
	EXEC @RollId = [Rolls].[Sto_InsertRoll]
		@Dice,
		@Modifiers,
		@Comments,
		@AssociatedEntities
	;

	DECLARE @DamageSourceId INT = NULL;

	EXEC @DamageSourceId = [Rolls].[Sto_InsertDamageSource] @DamageSource, @DamageType;

	INSERT INTO [Rolls].[DamageRolls]
		([RollId], [DamageSourceId])
	VALUES(@RollId, @DamageSourceId)
	;

	DECLARE @DamageRollId INT = SCOPE_IDENTITY();

	RETURN @DamageRollId;
END
GO
