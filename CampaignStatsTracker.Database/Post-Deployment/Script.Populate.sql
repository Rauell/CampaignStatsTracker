USE [CampaignStatsTracker.Database]
GO
;

INSERT INTO [Users].[AccessLevels]([DisplayName], [CanRead], [CanWrite], [CanDelete])
VALUES
	('Owner', 1, 1, 1),
	('Administrator', 1, 1, 1),
	('Writer', 1, 1, 0),
	('Reader', 1, 0, 0)
;
GO

EXEC [Rolls].[Sto_InsertDieType] 4, 'D4';
EXEC [Rolls].[Sto_InsertDieType] 6, 'D6';
EXEC [Rolls].[Sto_InsertDieType] 8, 'D8';
EXEC [Rolls].[Sto_InsertDieType] 10, 'D10';
EXEC [Rolls].[Sto_InsertDieType] 12, 'D12';
EXEC [Rolls].[Sto_InsertDieType] 20, 'D20';
EXEC [Rolls].[Sto_InsertDieType] 100, 'D100';
GO

DECLARE @campaignId INT;
EXEC @campaignId = [Games].[Sto_InsertCampaign] 'Test Campaign';

DECLARE @campaignPublicId UNIQUEIDENTIFIER;
SELECT @campaignPublicId = EE.[PublicId]
FROM [Entities].[Entities] EE
	INNER JOIN [Games].[Campaigns] GC
		ON GC.EntityId = EE.EntityId
;

DECLARE @skillRoll1 [Rolls].[DieRollType];
INSERT INTO @skillRoll1([NumberOfSides], [Value])
VALUES (20, 15)
;

DECLARE @skillRoll1Modifiers [Rolls].[RollModifierType];
INSERT INTO @skillRoll1Modifiers([Comment], [Value])
VALUES ('Positive Test', 2), ('Negative Test', -3)
;

DECLARE @skillRoll1Comments [Rolls].[RollCommentType];
INSERT INTO @skillRoll1Comments([Comment])
VALUES (''), ('Test Comment')
;

DECLARE @skillRoll1Entities [Entities].[EntitiesType];
INSERT INTO @skillRoll1Entities([PublicId])
VALUES (@campaignPublicId)
;
EXEC [Rolls].[Sto_InsertSkillRoll]
	@skillRoll1,
	@skillRoll1Modifiers,
	'Test Skill 1',
	1,
	@skillRoll1Comments,
	@skillRoll1Entities
;

EXEC [Rolls].[Sto_GetRollStatsForEntities] @skillRoll1Entities
GO

:r ./PopulateCtrirr.sql

;

-- INSERT INTO [Games].[Sessions] ([Name], [CampaignId])
-- VALUES ('0.5', 1)
-- GO
-- ;

-- INSERT INTO [Games].[Characters] ([Name], [CampaignId])
-- VALUES ('0.5', 1)
-- GO
-- ;

