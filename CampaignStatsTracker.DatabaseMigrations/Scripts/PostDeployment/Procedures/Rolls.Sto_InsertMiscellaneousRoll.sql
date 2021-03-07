USE [$DatabaseName$]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [Rolls].[Sto_InsertMiscellaneousRoll]
	@Dice								[Rolls].[DieRollType] READONLY,
	@Modifiers					[Rolls].[RollModifierType] READONLY,
	@Comments 					[Rolls].[RollCommentType] READONLY,
	@AssociatedEntities	[Entities].[EntitiesType] READONLY,
	@Success						BIT NULL
AS
BEGIN
	DECLARE @RollId INT;
	EXEC @RollId = [Rolls].[Sto_InsertRoll]
		@Dice,
		@Modifiers,
		@Comments,
		@AssociatedEntities
	;

	INSERT INTO [Rolls].[MiscellaneousRolls]
		([RollId], [Success])
	VALUES(@RollId, @Success)
	;

	DECLARE @MiscRollId INT = SCOPE_IDENTITY();

	RETURN @MiscRollId;
END
GO
