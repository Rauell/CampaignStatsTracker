USE [$DatabaseName$]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [Rolls].[Sto_InsertSavingThrow]
	@Dice								[Rolls].[DieRollType] READONLY,
	@Modifiers					[Rolls].[RollModifierType] READONLY,
	@Comments 					[Rolls].[RollCommentType] READONLY,
	@AssociatedEntities	[Entities].[EntitiesType] READONLY,
	@AttributeType			VARCHAR(20),
	@Success						BIT
AS
BEGIN
	DECLARE @NumberOfDice INT;
	SELECT @NumberOfDice = COUNT(1)
	FROM @Dice;

	IF (@NumberOfDice <> 1) THROW 51000, 'Saving Throws only accept a single die', 1;

	DECLARE @RollId INT;
	EXEC @RollId = [Rolls].[Sto_InsertRoll]
		@Dice,
		@Modifiers,
		@Comments,
		@AssociatedEntities
	;

	DECLARE @AttributeId TINYINT;
	EXEC @AttributeId = [Games].[Sto_GetAttributeId] @AttributeType;

	INSERT INTO [Rolls].[SavingThrows]
		([RollId], [AttributeId], [Success])
	VALUES
		(@RollId, @AttributeId, @Success)
	;

	DECLARE @SavingThrowId INT = SCOPE_IDENTITY();

	RETURN @SavingThrowId;
END
GO
