CREATE TYPE [Rolls].[RollStatsType] AS TABLE
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
)
