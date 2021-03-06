USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_GetRollStatsForEntities]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [Rolls].[Sto_GetRollStatsForEntities]
  @Entities [Entities].[EntitiesType] READONLY
AS
BEGIN
  SET NOCOUNT ON;

  DROP TABLE IF EXISTS #Rolls, #Stats;

  CREATE TABLE #Stats
  (
    [EntityId]                  INT NOT NULL,
    [PublicId]                  UNIQUEIDENTIFIER NOT NULL,
    [D20SkillCount]             INT,
    [D20SkillCritSuccessCount]  INT,
    [D20SkillCritFailureCount]  INT,
    [D20SkillSuccessCount]      INT,
    [D20SkillFailureCount]      INT,
    -- [D20SkillMode]					INT,
    [D20SkillAverage]           FLOAT,
    -- [D20SkillTypeMode]			VARCHAR(50),
    [D20AttackCount]            INT,
    [D20AttackCritSuccessCount] INT,
    [D20AttackCritFailureCount] INT,
    [D20AttackSuccessCount]     INT,
    [D20AttackFailureCount]     INT,
    -- [D20AttackMode]					INT,
    [D20AttackAverage]          FLOAT,
    -- [DamageSourceMode]			VARCHAR(50),
    [DamageAverage]             FLOAT,
    [D20InitCount]              INT,
    [D20InitAverage]            FLOAT,
    [InitRankAverage]           FLOAT,
    [SavingThrowCount]          INT,
    [SavingThrowAverage]        FLOAT

    -- CONSTRAINT [UC_EntityId] UNIQUE ([EntityId]),
    -- CONSTRAINT [UC_PublicId] UNIQUE ([PublicId])
  );
  CREATE TABLE #Rolls
  (
    [RollId] INT,
    [EntityId] INT NOT NULL,
    [RawValue] INT NOT NULL,
    [Value] INT NOT NULL,
    [IsAttack] BIT NOT NULL,
    [IsDamage] BIT NOT NULL,
    [IsInitiative] BIT NOT NULL,
    [IsSavingThrow] BIT NOT NULL,
    [IsSkill] BIT NOT NULL,
    [Success] BIT,
    [Rank] INT

    -- CONSTRAINT [Uc_RollId_EntityId] UNIQUE ([RollId], [EntityId])
  );

  INSERT INTO #Rolls
  SELECT
    R2E.[RollId],
    EE.[EntityId],
    SUM(IR.[Value]) AS [RawValue],
    0 AS [Value],
    -- (SUM(IR.[Value]) + SUM(ISNULL(RM.[Value], 0))) AS [Value],
    CAST(
      CASE WHEN COUNT(AR.[AttackRollId]) > 0 THEN 1 ELSE 0 END
    AS BIT) AS [IsAttack],
    CAST(
      CASE WHEN COUNT(DR.[DamageRollId]) > 0 THEN 1 ELSE 0 END
    AS BIT) AS [IsDamage],
    CAST(
      CASE WHEN COUNT(InitR.[InitiativeRollId]) > 0 THEN 1 ELSE 0 END
    AS BIT) AS [IsInitiative],
    CAST(
      CASE WHEN COUNT(ST.[SavingThrowId]) > 0 THEN 1 ELSE 0 END
    AS BIT) AS [IsSavingThrow],
    CAST(
      CASE WHEN COUNT(SR.[SkillRollId]) > 0 THEN 1 ELSE 0 END
    AS BIT) AS [IsSkill],
    ISNULL(AR.[Hit], SR.[Success]) AS [Success],
    InitR.[Rank]
  FROM @Entities E
    INNER JOIN [Entities].[Entities] AS EE ON EE.[PublicId] = E.[PublicId]
    INNER JOIN [Rolls].[RollsToEntities] AS R2E ON R2E.[EntityId] = EE.[EntityId]
    INNER JOIN [Rolls].[Rolls] AS RR ON RR.[RollId] = R2E.[RollId]
    INNER JOIN [Rolls].[IndividualRolls] AS IR ON IR.[RollId] = RR.[RollId]
    INNER JOIN [Rolls].[DieTypes] AS DT ON DT.[DieTypeId] = IR.[DieTypeId]
    -- LEFT JOIN [Rolls].[RollModifiers] AS RM ON RM.[RollId] = RR.[RollId]
    LEFT JOIN [Rolls].[AttackRolls] AS AR ON AR.[RollId] = RR.[RollId]
    LEFT JOIN [Rolls].[DamageRolls] AS DR ON DR.[RollId] = RR.[RollId]
    LEFT JOIN [Rolls].[SkillRolls] AS SR ON SR.[RollId] = RR.[RollId]
    LEFT JOIN [Rolls].[InitiativeRolls] AS InitR ON InitR.[RollId] = RR.[RollId]
    LEFT JOIN [Rolls].[SavingThrows] AS ST ON ST.[RollId] = RR.[RollId]
  GROUP BY
    R2E.[RollId],
    EE.[EntityId],
    AR.[Hit],
    SR.[Success],
    InitR.[Rank]
  ;

  -- Include modifiers
  UPDATE #Rolls
  SET [Value] = RR.[RawValue] + M.[Modifier]
  FROM #Rolls AS RR
    INNER JOIN (
      SELECT
        RR.[RollId],
        ISNULL(SUM(RM.[Value]), 0) AS [Modifier]
      FROM #Rolls AS RR
        LEFT JOIN [Rolls].[RollModifiers] AS RM ON RM.[RollId] = RR.[RollId]
      GROUP BY RR.RollId
    ) AS M ON M.[RollId] = RR.[RollId]
  ;

  INSERT INTO #Stats
    ([EntityId], [PublicId])
  SELECT DISTINCT EE.[EntityId], EE.[PublicId]
  FROM @Entities E INNER JOIN Entities.Entities AS EE ON EE.[PublicId] = E.[PublicId]
  ;

  -- Skill
  UPDATE #Stats
  SET
    [D20SkillCount] = ISNULL(NS.[D20SkillCount], 0),
    [D20SkillCritSuccessCount] = ISNULL(NS.[D20SkillCritSuccessCount], 0),
    [D20SkillCritFailureCount] = ISNULL(NS.[D20SkillCritFailureCount], 0),
    [D20SkillSuccessCount] = ISNULL(NS.[D20SkillSuccessCount], 0),
    [D20SkillFailureCount] = ISNULL(NS.[D20SkillFailureCount], 0),
    [D20SkillAverage] = NS.[D20SkillAverage]
  FROM #Stats S
    LEFT JOIN (
      SELECT
      R.[EntityId],
      COUNT(R.[EntityId]) AS [D20SkillCount],
      COUNT(CASE WHEN R.[RawValue] = 20 THEN 1 ELSE NULL END) AS [D20SkillCritSuccessCount],
      COUNT(CASE WHEN R.[RawValue] = 1 THEN 1 ELSE NULL END) AS [D20SkillCritFailureCount],
      COUNT(CASE WHEN R.Success = 1 THEN 1 ELSE NULL END) AS [D20SkillSuccessCount],
      COUNT(CASE WHEN R.Success = 0 THEN 1 ELSE NULL END) AS [D20SkillFailureCount],
      AVG(CAST(R.[Value] AS FLOAT)) AS [D20SkillAverage]
    FROM #Rolls R
    WHERE
        R.[IsSkill] = 1
    GROUP BY
        R.[EntityId]
    ) AS NS
    ON NS.[EntityId] = S.[EntityId]
  ;

  -- Attack
  UPDATE #Stats
  SET
    [D20AttackCount] = ISNULL(NS.[D20AttackCount], 0),
    [D20AttackCritSuccessCount] = ISNULL(NS.[D20AttackCritSuccessCount], 0),
    [D20AttackCritFailureCount] = ISNULL(NS.[D20AttackCritFailureCount], 0),
    [D20AttackSuccessCount] = ISNULL(NS.[D20AttackSuccessCount], 0),
    [D20AttackFailureCount] = ISNULL(NS.[D20AttackFailureCount], 0),
    [D20AttackAverage] = NS.[D20AttackAverage]
  FROM #Stats S
    LEFT JOIN (
      SELECT
      R.[EntityId],
      COUNT(R.[EntityId]) AS [D20AttackCount],
      COUNT(CASE WHEN R.[RawValue] = 20 THEN 1 ELSE NULL END) AS [D20AttackCritSuccessCount],
      COUNT(CASE WHEN R.[RawValue] = 1 THEN 1 ELSE NULL END) AS [D20AttackCritFailureCount] ,
      COUNT(CASE WHEN R.Success = 1 THEN 1 ELSE NULL END) AS [D20AttackSuccessCount],
      COUNT(CASE WHEN R.Success = 0 THEN 1 ELSE NULL END) AS [D20AttackFailureCount],
      AVG(CAST(R.[Value] AS FLOAT)) AS [D20AttackAverage]
    FROM #Rolls R
    WHERE
        R.[IsAttack] = 1
    GROUP BY
        R.[EntityId]
    ) AS NS
    ON S.[EntityId] = NS.[EntityId]
  ;

  -- Damage
  UPDATE #Stats
  SET
    [DamageAverage] = NS.[DamageAverage]
  FROM #Stats S
    LEFT JOIN (
      SELECT
      R.[EntityId],
      AVG(CAST(R.[Value] AS FLOAT)) AS [DamageAverage]
    FROM #Rolls R
    WHERE
        R.[IsDamage] = 1
    GROUP BY
        R.[EntityId]
    ) AS NS
    ON S.[EntityId] = NS.[EntityId]
  ;

  -- Initiative
  UPDATE #Stats
  SET
    [D20InitCount] = ISNULL(NS.[D20InitCount], 0),
    [D20InitAverage] = NS.[D20InitAverage],
    [InitRankAverage] = NS.[InitRankAverage]
  FROM #Stats S
    LEFT JOIN (
      SELECT
      R.[EntityId],
      COUNT(R.[EntityId]) AS [D20InitCount],
      AVG(CAST(R.[Value] AS FLOAT)) AS [D20InitAverage],
      AVG(CAST(R.[Rank] AS FLOAT)) AS [InitRankAverage]
    FROM #Rolls R
    WHERE
        R.[IsInitiative] = 1
    GROUP BY
        R.[EntityId]
    ) AS NS
    ON S.[EntityId] = NS.[EntityId]
  ;

  -- Saving Throw
  UPDATE #Stats
  SET
    [SavingThrowCount] = ISNULL(NS.[SavingThrowCount], 0),
    [SavingThrowAverage] = NS.[SavingThrowAverage]
  FROM #Stats S
    LEFT JOIN (
      SELECT
      R.[EntityId],
      COUNT(R.[EntityId]) AS [SavingThrowCount],
      AVG(CAST(R.[Value] AS FLOAT)) AS [SavingThrowAverage]
    FROM #Rolls R
    WHERE
        R.[IsSavingThrow] = 1
    GROUP BY
        R.[EntityId]
    ) AS NS
    ON S.[EntityId] = NS.[EntityId]
  ;

  SELECT *
  FROM #Stats
  ;

  -- SELECT EE.[PublicId], S.*
  -- FROM #Stats S
  -- 	INNER JOIN [Entities].[Entities] AS EE
  -- 	ON EE.[EntityId] = S.[EntityId]
  -- ;
  -- ALTER TABLE #Rolls
  --   DROP CONSTRAINT [Uc_RollId_EntityId]
  -- ;
  -- ALTER TABLE #Stats
  --   DROP CONSTRAINT [UC_EntityId], [UC_PublicId]
  -- ;

  DROP TABLE #Rolls, #Stats;
END
GO
