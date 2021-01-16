CREATE PROCEDURE [Rolls].[Sto_GetLastRollsForEntity]
	@PublicId UNIQUEIDENTIFIER
AS
BEGIN
	SELECT TOP 5
		SUM(IR.[Value]) AS [Value],
		SUM(ISNULL(RM.[Value], 0)) AS [Modifier],
		CASE
			WHEN AR.[AttackRollId] IS NOT NULL THEN 'Damage'
			WHEN InitR.[InitiativeRollId] IS NOT NULL THEN 'Initiatve'
			WHEN NULLIF(ST.[Name], '') IS NOT NULL THEN ST.[Name]
			WHEN SR.[SkillRollId] IS NOT NULL THEN 'Skill'
			ELSE NULL
		END AS [RollType],
		R2E.[DateCreated],
		EntityR.[PublicId]
	FROM [Entities].[Entities] AS EE
		INNER JOIN [Rolls].[RollsToEntities] AS R2E
		ON R2E.[EntityId] = EE.[EntityId]
		INNER JOIN [Rolls].[Rolls] AS RR
		ON RR.[RollId] = R2E.[RollId]
		INNER JOIN [Entities].[Entities] AS EntityR
		ON EntityR.[EntityId] = RR.[EntityId]
		LEFT JOIN [Rolls].[RollModifiers] AS RM
		ON RM.[RollId] = R2E.[RollId]
		INNER JOIN [Rolls].[IndividualRolls] AS IR
		ON IR.[RollId] = R2E.[RollId]
		LEFT JOIN [Rolls].[SkillRolls] AS SR
		ON SR.[RollId] = R2E.[RollId]
		LEFT JOIN [Rolls].[SkillTypes] AS ST
		ON ST.[SkillTypeId] = SR.[SkillTypeId]
		LEFT JOIN [Rolls].[AttackRolls] AS AR
		ON AR.[DamageRollId] = R2E.[RollId]
		LEFT JOIN [Rolls].[InitiativeRolls] AS InitR
		ON InitR.[RollId] = R2E.[RollId]
	WHERE
		EE.[PublicId] = @PublicId
	GROUP BY
		ST.[SkillTypeId],
		ST.[Name],
		AR.[AttackRollId],
		InitR.[InitiativeRollId],
		R2E.[DateCreated],
		SR.[SkillRollId],
		EntityR.[PublicId]
	ORDER BY
		R2E.[DateCreated] DESC
;

END
