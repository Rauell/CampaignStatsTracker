USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertAttackRoll]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [Rolls].[Sto_InsertAttackRoll]
  @Dice               [Rolls].[DieRollType] READONLY,
  @Modifiers          [Rolls].[RollModifierType] READONLY,
  @SkillType          VARCHAR(50),
  @Hit                BIT,
  @Comments           [Rolls].[RollCommentType] READONLY,
  @AssociatedEntities [Entities].[EntitiesType] READONLY
AS
BEGIN
  DECLARE @NumberOfDice INT;
  SELECT @NumberOfDice = COUNT(1)
  FROM @Dice;

  IF (@NumberOfDice <> 1) THROW 51000, 'Attack Rolls only accept a single die', 1;

  DECLARE @RollId INT;
  EXEC @RollId = [Rolls].[Sto_InsertRoll]
    @Dice,
    @Modifiers,
    @Comments,
    @AssociatedEntities
  ;

  DECLARE @SkillTypeId SMALLINT;
  EXEC @SkillTypeId = [Rolls].[Sto_GetSkillTypeId] @SkillType;

  INSERT INTO [Rolls].[AttackRolls]
    ([RollId], [SkillTypeId], [Hit])
  VALUES
    (@RollId, @SkillTypeId, @Hit)
  ;

  DECLARE @AttackRollId INT = SCOPE_IDENTITY();

  RETURN @AttackRollId;
END
GO