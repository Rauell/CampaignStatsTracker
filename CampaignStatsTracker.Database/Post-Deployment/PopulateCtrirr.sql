USE [CampaignStatsTracker.Database]
GO
;

DECLARE @mroysterUserId INT;
EXEC @mroysterUserId = [Users].[Sto_InsertUser]
	'Rauell',
	'me@michaelroyster.org',
	'mybadpassword',
	'Michael',
	'Scott',
	'Royster';
;

DECLARE @mbarnesUserId INT;
EXEC @mbarnesUserId = [Users].[Sto_InsertUser]
	'mbarnes',
	'mbarnes@michaelroyster.org',
	'mybadpassword',
	'Matthew',
	null,
	'Barnes';
;

DECLARE @equigleyUserId INT;
EXEC @equigleyUserId = [Users].[Sto_InsertUser]
	'equigley',
	'equigley@michaelroyster.org',
	'mybadpassword',
	'Edward',
	null,
	'Quigley';
;

DECLARE @nhornUserId INT;
EXEC @nhornUserId = [Users].[Sto_InsertUser]
	'nhorn',
	'nhorn@michaelroyster.org',
	'mybadpassword',
	'Noah',
	null,
	'Horn';
;

DECLARE @ctirrCampaignId INT;
EXEC @ctirrCampaignId = [Games].[Sto_InsertCampaign] 'Ctrirr';

DECLARE @hobbitId INT, @hobbitPublicId UNIQUEIDENTIFIER;
EXEC @hobbitId = [Games].[Sto_InsertCharacter] 'Bobby', @equigleyUserId, @ctirrCampaignId;
SET @hobbitPublicId = [Games].[Sc_GetCharacterPublicId](@hobbitId);

DECLARE @genieId INT, @geniePublicId UNIQUEIDENTIFIER;
EXEC @genieId = [Games].[Sto_InsertCharacter] 'Lehavah Aelynn', @mbarnesUserId, @ctirrCampaignId;
SET @geniePublicId = [Games].[Sc_GetCharacterPublicId](@genieId);

DECLARE @soldierId INT, @soldierPublicId UNIQUEIDENTIFIER;
EXEC @soldierId = [Games].[Sto_InsertCharacter] 'Atsu du Corrigor', @mroysterUserId, @ctirrCampaignId;
SET @soldierPublicId = [Games].[Sc_GetCharacterPublicId](@soldierId);

GO
/* Bobby Rolls */