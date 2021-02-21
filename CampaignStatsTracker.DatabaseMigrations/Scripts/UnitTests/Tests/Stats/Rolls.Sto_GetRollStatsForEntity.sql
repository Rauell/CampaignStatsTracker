-- USE [$DatabaseName$]
-- GO

-- CREATE OR ALTER PROCEDURE [TestStats].[test Rolls.Sto_GetRollStatsForEntity provides accurate data with single die without modifiers]
-- AS
-- BEGIN

--   DECLARE @EntityId INT;
--   EXEC @EntityId = [Entities].[Sto_InsertEntity];

--   DECLARE @PublicId UNIQUEIDENTIFIER;
--   SELECT @PublicId = [PublicId]
--   FROM [Entities].[Entities]
--   WHERE [EntityId] = @EntityId
--   ;

--   DECLARE @AssociatedEntities	[Entities].[EntitiesType];
--   INSERT INTO @AssociatedEntities([PublicId]) VALUES (@PublicId);

--   DECLARE @Counter INT;
--   SET @Counter = 0;

--   -- Skill Rolls
--   WHILE (@Counter < 1)
--   BEGIN
--     DECLARE @Dice [Rolls].[DieRollType];
--     DECLARE @Modifiers [Rolls].[RollModifierType];
--     DECLARE @Comments [Rolls].[RollCommentType];
--     DECLARE @RollValue INT = (@Counter % 20) + 1;
--     DECLARE @Success BIT = CASE WHEN @RollValue < 15 THEN 0 ELSE 1 END;

--     INSERT INTO @Dice([NumberOfSides], [Value])
--     VALUES (20, @RollValue)

--     EXEC [Rolls].[Sto_InsertSkillRoll]
--       @Dice,
--       @Modifiers,
--       '',
--       @Success,
--       @Comments,
--       @AssociatedEntities

--     SET @Counter = @Counter + 1;
--   END

--   INSERT INTO #myTempTable
--   EXEC [Rolls].[Sto_GetRollStatsForEntity] @EntityId;

--   EXEC [tSQLt].[AssertEqualsTable] #myTempTable, #myTempTable;

-- END
-- GO