USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_GetLastRollsForEntity]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [Rolls].[Sto_GetLastRollsForEntity]
  @PublicId UNIQUEIDENTIFIER
AS
BEGIN
  SET NOCOUNT ON;
  SELECT TOP 5
    SUM(IR.[Value]) AS [Value],
    SUM(ISNULL(RM.[Value], 0)) AS [Modifier],
    CASE
      WHEN DR.[DamageRollId] IS NOT NULL THEN 'Damage'
      WHEN AR.[AttackRollId] IS NOT NULL THEN 'Attack'
      WHEN InitR.[InitiativeRollId] IS NOT NULL THEN 'Initiatve'
      WHEN NULLIF(ST.[Name], '') IS NOT NULL THEN ST.[Name]
      WHEN SR.[SkillRollId] IS NOT NULL THEN 'Skill'
      ELSE NULL
    END AS [RollType],
    R2E.[DateCreated],
    EntityR.[PublicId]
  FROM [Entities].[Entities] AS EE
    INNER JOIN [Rolls].[RollsToEntities] AS R2E ON R2E.[EntityId] = EE.[EntityId]
    INNER JOIN [Rolls].[Rolls] AS RR ON RR.[RollId] = R2E.[RollId]
    INNER JOIN [Entities].[Entities] AS EntityR ON EntityR.[EntityId] = RR.[EntityId]
    INNER JOIN [Rolls].[IndividualRolls] AS IR ON IR.[RollId] = RR.[RollId]
    LEFT JOIN [Rolls].[RollModifiers] AS RM ON RM.[RollId] = RR.[RollId]
    LEFT JOIN [Rolls].[SkillRolls] AS SR ON SR.[RollId] = RR.[RollId]
    LEFT JOIN [Rolls].[SkillTypes] AS ST ON ST.[SkillTypeId] = SR.[SkillTypeId]
    LEFT JOIN [Rolls].[AttackRolls] AS AR ON AR.[RollId] = RR.[RollId]
    LEFT JOIN [Rolls].[DamageRolls] AS DR ON DR.[RollId] = RR.[RollId]
    LEFT JOIN [Rolls].[InitiativeRolls] AS InitR ON InitR.[RollId] = RR.[RollId]
  WHERE
    EE.[PublicId] = @PublicId
  GROUP BY
    ST.[SkillTypeId],
    ST.[Name],
    AR.[AttackRollId],
    DR.[DamageRollId],
    InitR.[InitiativeRollId],
    R2E.[DateCreated],
    SR.[SkillRollId],
    EntityR.[PublicId]
  ORDER BY
    R2E.[DateCreated] DESC
;

END
GO
