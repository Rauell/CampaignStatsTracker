CREATE PROCEDURE [Rolls].[Sto_GetRollStatsForEntities]
	@Entities [Entities].[EntitiesType] READONLY
AS
BEGIN
	CREATE TABLE #Stats
	(
		[PublicId]							UNIQUEIDENTIFIER,
		[D20SkillCount]					INT,
		[D20SkillCritCount]			INT,
		[D20SkillSuccessCount]	INT,
		-- [D20SkillMode]					INT,
		[D20SkillAverage]				FLOAT,
		-- [D20SkillTypeMode]			VARCHAR(50),
		[D20AttackCount]				INT,
		[D20AttackCritCount]		INT,
		[D20AttackSuccessCount]	INT,
		-- [D20AttackMode]					INT,
		[D20AttackAverage]			FLOAT,
		-- [DamageSourceMode]			VARCHAR(50)
		[DamageAverage]					FLOAT
	);
	CREATE TABLE #Rolls (
		[RollId] INT PRIMARY KEY,
		[PublicId] UNIQUEIDENTIFIER NOT NULL,
		[RawValue] INT NOT NULL,
		[Value] INT NOT NULL,
		[IsSingleD20] BIT NOT NULL
	);

	INSERT INTO #Rolls
	SELECT
		R2E.[RollId],
		EE.[PublicId],
		SUM(IR.[Value]) AS [RawValue],
		(SUM(IR.[Value]) + SUM(ISNULL(RM.[Value], 0))) AS [Value],
		CAST(
			CASE
				WHEN COUNT(IR.[IndividualRollId]) <> 1 THEN 0
				WHEN MAX(DT.[NumberOfSides]) <> 20 THEN 0
				ELSE 1
			END
		AS BIT) AS IsSingleD20
	FROM @Entities E
		INNER JOIN [Entities].[Entities] AS EE
			ON EE.[PublicId] = E.[PublicId]
		INNER JOIN [Rolls].[RollsToEntities] AS R2E
			ON R2E.[EntityId] = EE.[EntityId]
		INNER JOIN [Rolls].[Rolls] AS RR
			ON RR.[RollId] = R2E.[RollId]
		INNER JOIN [Rolls].[IndividualRolls] AS IR
			ON IR.[RollId] = RR.[RollId]
		INNER JOIN [Rolls].[DieTypes] AS DT
			ON DT.[DieTypeId] = IR.[DieTypeId]
		LEFT JOIN [Rolls].[RollModifiers] AS RM
			ON RM.[RollId] = RR.[RollId]
	GROUP BY
		R2E.[RollId],
		EE.[PublicId]
	;

	INSERT INTO #Stats([PublicId])
	SELECT DISTINCT [PublicId] FROM @Entities
	;

	UPDATE #Stats
	SET
		[D20SkillCount] = ISNULL(NS.[D20SkillCount], 0),
		[D20SkillCritCount] = ISNULL(NS.[D20SkillCritCount], 0),
		[D20SkillSuccessCount] = ISNULL(NS.[D20SkillSuccessCount], 0),
		[D20SkillAverage] = NS.[D20SkillAverage]
	FROM #Stats S
		LEFT JOIN (
			SELECT
				R.[PublicId],
				COUNT(SR.[SkillRollId]) AS [D20SkillCount],
				COUNT(CASE WHEN R.[RawValue] = 20 THEN 1 ELSE NULL END) AS [D20SkillCritCount],
				SUM(CAST(SR.[Success] AS INT)) AS [D20SkillSuccessCount],
				AVG(R.[Value]) AS [D20SkillAverage]
			FROM #Rolls R
				INNER JOIN [Rolls].[SkillRolls] SR
					ON SR.[RollId] = R.[RollId]
			WHERE
				R.[IsSingleD20] = 1
			GROUP BY
				R.[PublicId]
		) AS NS
			ON NS.[PublicId] = S.[PublicId]
	;

	UPDATE #Stats
	SET
		[D20AttackCount] = ISNULL(NS.[D20AttackCount], 0),
		[D20AttackCritCount] = ISNULL(NS.[D20AttackCritCount], 0),
		[D20AttackSuccessCount] = ISNULL(NS.[D20AttackSuccessCount], 0),
		[D20AttackAverage] = NS.[D20AttackAverage],
		[DamageAverage] = NS.[DamageAverage]
	FROM #Stats S
		LEFT JOIN (
			SELECT
				R.[PublicId],
				COUNT(AR.[AttackRollId]) AS [D20AttackCount],
				COUNT(CASE WHEN R.[RawValue] = 20 THEN 1 ELSE NULL END) AS [D20AttackCritCount] ,
				COUNT(DR.[RollId]) AS [D20AttackSuccessCount],
				AVG(R.[Value]) AS [D20AttackAverage],
				AVG(DR.[Value]) AS [DamageAverage]
			FROM #Rolls R
				INNER JOIN [Rolls].[AttackRolls] AR
					ON AR.[HitRollId] = R.[RollId]
				LEFT JOIN #Rolls DR
					ON DR.[RollId] = AR.[DamageRollId]
			WHERE
				R.[IsSingleD20] = 1
			GROUP BY
				R.[PublicId]
		) AS NS
			ON S.[PublicId] = NS.[PublicId]
	;

	SELECT *
	FROM #Stats
	;

	DROP TABLE #Rolls, #Stats;
END
