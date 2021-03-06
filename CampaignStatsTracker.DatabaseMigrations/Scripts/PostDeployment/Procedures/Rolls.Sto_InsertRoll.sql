USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertRoll]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rolls].[Sto_InsertRoll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Rolls].[Sto_InsertRoll] AS'
END
GO
ALTER PROCEDURE [Rolls].[Sto_InsertRoll]
	@Dice								[Rolls].[DieRollType]				READONLY,
	@Modifiers					[Rolls].[RollModifierType]	READONLY,
	@Comments 					[Rolls].[RollCommentType]		READONLY,
	@AssociatedEntities	[Entities].[EntitiesType]		READONLY
AS
BEGIN
	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	INSERT INTO [Rolls].[Rolls]
		([EntityId])
	VALUES
		(@EntityId)
	;

	DECLARE @RollId INT = SCOPE_IDENTITY();

	INSERT INTO [Rolls].[RollsToEntities]
		([RollId], [EntityId])
	SELECT
		@RollId,
		EE.[EntityId]
	FROM @AssociatedEntities AS AE
		INNER JOIN [Entities].[Entities] AS EE
		ON EE.[PublicId] = AE.[PublicId]
	;

	EXEC [Rolls].[Sto_InsertRollComments] @RollId, @Comments;

	EXEC [Rolls].[Sto_InsertIndividualRolls] @RollId, @Dice;

	EXEC [Rolls].[Sto_InsertRollModifiers] @RollId, @Modifiers;

	RETURN @RollId;
END
GO
