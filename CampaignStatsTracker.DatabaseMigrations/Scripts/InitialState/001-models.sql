USE [master]
GO
/****** Object:  Database [$DatabaseName$]    Script Date: 2/20/2021 5:01:13 PM ******/
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [$DatabaseName$].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [$DatabaseName$] SET ANSI_NULL_DEFAULT ON
GO
ALTER DATABASE [$DatabaseName$] SET ANSI_NULLS ON
GO
ALTER DATABASE [$DatabaseName$] SET ANSI_PADDING ON
GO
ALTER DATABASE [$DatabaseName$] SET ANSI_WARNINGS ON
GO
ALTER DATABASE [$DatabaseName$] SET ARITHABORT ON
GO
ALTER DATABASE [$DatabaseName$] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [$DatabaseName$] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [$DatabaseName$] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [$DatabaseName$] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [$DatabaseName$] SET CURSOR_DEFAULT  LOCAL
GO
ALTER DATABASE [$DatabaseName$] SET CONCAT_NULL_YIELDS_NULL ON
GO
ALTER DATABASE [$DatabaseName$] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [$DatabaseName$] SET QUOTED_IDENTIFIER ON
GO
ALTER DATABASE [$DatabaseName$] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [$DatabaseName$] SET  DISABLE_BROKER
GO
ALTER DATABASE [$DatabaseName$] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [$DatabaseName$] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [$DatabaseName$] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [$DatabaseName$] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [$DatabaseName$] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [$DatabaseName$] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [$DatabaseName$] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [$DatabaseName$] SET RECOVERY FULL
GO
ALTER DATABASE [$DatabaseName$] SET  MULTI_USER
GO
ALTER DATABASE [$DatabaseName$] SET PAGE_VERIFY NONE
GO
ALTER DATABASE [$DatabaseName$] SET DB_CHAINING OFF
GO
ALTER DATABASE [$DatabaseName$] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [$DatabaseName$] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO
ALTER DATABASE [$DatabaseName$] SET DELAYED_DURABILITY = DISABLED
GO
ALTER DATABASE [$DatabaseName$] SET QUERY_STORE = OFF
GO
USE [$DatabaseName$]
GO
ALTER DATABASE SCOPED CONFIGURATION SET ACCELERATED_PLAN_FORCING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ADAPTIVE_JOINS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DEFERRED_COMPILATION_TV = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET GLOBAL_TEMPORARY_TABLE_AUTO_DROP = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET INTERLEAVED_EXECUTION_TVF = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LAST_QUERY_PLAN_STATS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LIGHTWEIGHT_QUERY_PROFILING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ROW_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET TSQL_SCALAR_UDF_INLINING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [$DatabaseName$]
GO
/****** Object:  Schema [Entities]    Script Date: 2/20/2021 5:01:13 PM ******/
CREATE SCHEMA [Entities]
GO
/****** Object:  Schema [Games]    Script Date: 2/20/2021 5:01:13 PM ******/
CREATE SCHEMA [Games]
GO
/****** Object:  Schema [Rolls]    Script Date: 2/20/2021 5:01:13 PM ******/
CREATE SCHEMA [Rolls]
GO
/****** Object:  Schema [Users]    Script Date: 2/20/2021 5:01:13 PM ******/
CREATE SCHEMA [Users]
GO
/****** Object:  UserDefinedTableType [Entities].[EntitiesType]    Script Date: 2/20/2021 5:01:13 PM ******/
CREATE TYPE [Entities].[EntitiesType] AS TABLE(
	[PublicId] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [Rolls].[DieRollType]    Script Date: 2/20/2021 5:01:13 PM ******/
CREATE TYPE [Rolls].[DieRollType] AS TABLE(
	[NumberOfSides] [tinyint] NOT NULL,
	[Value] [smallint] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [Rolls].[RollCommentType]    Script Date: 2/20/2021 5:01:13 PM ******/
CREATE TYPE [Rolls].[RollCommentType] AS TABLE(
	[Comment] [varchar](200) NULL
)
GO
/****** Object:  UserDefinedTableType [Rolls].[RollModifierType]    Script Date: 2/20/2021 5:01:13 PM ******/
CREATE TYPE [Rolls].[RollModifierType] AS TABLE(
	[Value] [smallint] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [Rolls].[RollStatsType]    Script Date: 2/20/2021 5:01:13 PM ******/
CREATE TYPE [Rolls].[RollStatsType] AS TABLE(
	[PublicId] [uniqueidentifier] NULL,
	[D20SkillCount] [int] NULL,
	[D20SkillCritCount] [int] NULL,
	[D20SkillSuccessCount] [int] NULL,
	[D20SkillAverage] [float] NULL,
	[D20AttackCount] [int] NULL,
	[D20AttackCritCount] [int] NULL,
	[D20AttackSuccessCount] [int] NULL,
	[D20AttackAverage] [float] NULL,
	[DamageAverage] [float] NULL
)
GO
/****** Object:  UserDefinedFunction [Games].[Sc_GetCharacterPublicId]    Script Date: 2/20/2021 5:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Games].[Sc_GetCharacterPublicId]
(
	@CharacterId INT
)
RETURNS UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @PublicId UNIQUEIDENTIFIER;

	SELECT @PublicId = EE.[PublicId]
	FROM [Games].[Characters] GC
		INNER JOIN [Entities].[Entities] EE
			ON EE.[EntityId] = GC.[EntityId]
	WHERE GC.[CharacterId] = @CharacterId
	;

	RETURN @PublicId
END
GO
/****** Object:  UserDefinedFunction [Rolls].[Sc_IsValidRoll]    Script Date: 2/20/2021 5:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Rolls].[Sc_IsValidRoll]
(
	@Value TINYINT,
	@DieTypeId TINYINT
)
RETURNS BIT
AS
BEGIN
	DECLARE @isValid AS BIT;

	SET @isValid =
	CASE
		WHEN @Value < 0 THEN 0
		WHEN @Value > (SELECT NumberOfSides FROM [Rolls].[DieTypes] WHERE DieTypeId = @DieTypeId) THEN 0
		ELSE 1
	END

	RETURN @isValid
END
GO
/****** Object:  UserDefinedFunction [Users].[Sc_GetAccessLevelId]    Script Date: 2/20/2021 5:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Users].[Sc_GetAccessLevelId]
(
	@AccessLevel VARCHAR(50)
)
RETURNS TINYINT
AS
BEGIN
	RETURN (
		SELECT [AccessLevelId]
		FROM [Users].[AccessLevels]
		WHERE [DisplayName] = @AccessLevel
	)
END
GO
/****** Object:  UserDefinedFunction [Users].[Sc_GetUserPasswordHash]    Script Date: 2/20/2021 5:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Users].[Sc_GetUserPasswordHash]
(
	@Password VARCHAR(250),
	@Handle VARCHAR(50)
)
RETURNS BINARY(64)
AS
BEGIN
	RETURN HASHBYTES('SHA2_512', CONCAT(@Handle, @Password));
END
GO
/****** Object:  UserDefinedFunction [Users].[Sc_IsValidEmail]    Script Date: 2/20/2021 5:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Users].[Sc_IsValidEmail]
(
	@Email VARCHAR(250)
)
RETURNS BIT
AS
BEGIN
	DECLARE @bitEmailVal AS BIT
	DECLARE @EmailText VARCHAR(100)

	SET @EmailText=ltrim(rtrim(isnull(@EMAIL,'')))

	SET @bitEmailVal =
	CASE
		WHEN @EmailText = '' THEN 0
		WHEN @EmailText LIKE '% %' THEN 0
		WHEN @EmailText LIKE ('%["(),:;<>\]%') THEN 0
		WHEN substring(@EmailText,charindex('@',@EmailText),len(@EmailText)) LIKE ('%[!#$%&*+/=?^`_{|]%') THEN 0
		WHEN (left(@EmailText,1) LIKE ('[-_.+]') OR right(@EmailText,1) LIKE ('[-_.+]')) THEN 0
		WHEN (@EmailText LIKE '%[%' or @EmailText LIKE '%]%') THEN 0
		WHEN @EmailText LIKE '%@%@%' THEN 0
		WHEN @EmailText NOT LIKE '_%@_%._%' THEN 0
		ELSE 1
	END
	RETURN @bitEmailVal
END
GO
/****** Object:  Table [Entities].[Entities]    Script Date: 2/20/2021 5:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Entities].[Entities](
	[EntityId] [bigint] IDENTITY(1,1) NOT NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[InitiativeRolls]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[InitiativeRolls](
	[InitiativeRollId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[RollId] [int] NOT NULL,
	[Rank] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[InitiativeRollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[AttackRolls]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[AttackRolls](
	[AttackRollId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[HitRollId] [int] NOT NULL,
	[DamageRollId] [int] NULL,
	[DamageSourceId] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[AttackRollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[RollModifiers]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[RollModifiers](
	[RollModifierId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[RollId] [int] NULL,
	[Value] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[RollModifierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[SkillRolls]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[SkillRolls](
	[SkillRollId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[RollId] [int] NOT NULL,
	[SkillTypeId] [smallint] NULL,
	[Success] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[SkillRollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[SkillTypes]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[SkillTypes](
	[SkillTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[Name] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[SkillTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[Rolls]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[Rolls](
	[RollId] [int] IDENTITY(1,1) NOT NULL,
	[EntityId] [bigint] NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[RollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[IndividualRolls]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[IndividualRolls](
	[IndividualRollId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[RollId] [int] NULL,
	[DieTypeId] [tinyint] NOT NULL,
	[Value] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[IndividualRollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Rolls].[Vw_RollDetails]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Rolls].[Vw_RollDetails]
AS
	SELECT
		RR.[DateCreated],
		EE.[PublicId],
		SUM(IR.[Value]) AS [RollValue],
		SUM(ISNULL(RM.[Value], 0)) AS [RollModifier],
		CASE
			WHEN AR.[AttackRollId] IS NOT NULL THEN 'Damage'
			WHEN InitR.[InitiativeRollId] IS NOT NULL THEN 'Initiatve'
			WHEN SR.[SkillRollId] IS NOT NULL THEN 'Skill'
			ELSE NULL
		END AS [RollType],
		InitR.[Rank] AS [InitiaitveRank],
		SR.[Success] AS [RollSucceeded],
		ST.[Name] AS [SkillType]
	FROM [Rolls].[Rolls] AS RR
		INNER JOIN [Entities].[Entities] AS EE
		ON EE.[EntityId] = RR.[EntityId]
		INNER JOIN [Rolls].[IndividualRolls] AS IR
		ON IR.[RollId] = RR.[RollId]
		LEFT JOIN [Rolls].[RollModifiers] AS RM
		ON RM.[RollId] = RR.[RollId]
		LEFT JOIN [Rolls].[SkillRolls] AS SR
		ON SR.[RollId] = RR.[RollId]
		LEFT JOIN [Rolls].[SkillTypes] AS ST
		ON ST.[SkillTypeId] = SR.[SkillTypeId]
		LEFT JOIN [Rolls].[AttackRolls] AS AR
		ON AR.[DamageRollId] = RR.[RollId]
		LEFT JOIN [Rolls].[InitiativeRolls] AS InitR
		ON InitR.[RollId] = RR.[RollId]
	GROUP BY
		ST.[SkillTypeId],
		ST.[Name],
		AR.[AttackRollId],
		InitR.[InitiativeRollId],
		SR.[SkillRollId],
		EE.[PublicId],
		RR.[DateCreated],
		InitR.[Rank],
		SR.[Success]
GO
/****** Object:  Table [Entities].[Names]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Entities].[Names](
	[NameId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[Name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[NameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Games].[Campaigns]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Games].[Campaigns](
	[CampaignId] [int] IDENTITY(1,1) NOT NULL,
	[EntityId] [bigint] NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[NameId] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Games].[Characters]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Games].[Characters](
	[CharacterId] [int] IDENTITY(1,1) NOT NULL,
	[EntityId] [bigint] NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[NameId] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[CharacterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Games].[CharactersToCampaigns]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Games].[CharactersToCampaigns](
	[CharactersToCampaignsId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[CharacterId] [int] NOT NULL,
	[CampaignId] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[CharactersToCampaignsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Games].[CharactersToUsers]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Games].[CharactersToUsers](
	[CharacterToUserId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[CharacterId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[AccessLevelId] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[CharacterToUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Games].[Encounters]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Games].[Encounters](
	[EncounterId] [int] IDENTITY(1,1) NOT NULL,
	[EntityId] [bigint] NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[NameId] [int] NOT NULL,
	[SessionId] [int] NOT NULL,
	[SessionSortOrder] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[EncounterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Games].[Sessions]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Games].[Sessions](
	[SessionId] [int] IDENTITY(1,1) NOT NULL,
	[EntityId] [bigint] NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[NameId] [int] NOT NULL,
	[CampaignId] [int] NOT NULL,
	[CampaignSortOrder] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[DamageSources]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[DamageSources](
	[DamageSourceId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[DamageTypeId] [smallint] NULL,
	[Name] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[DamageSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[DamageTypes]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[DamageTypes](
	[DamageTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[Name] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[DamageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[DieTypes]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[DieTypes](
	[DieTypeId] [tinyint] NOT NULL,
	[NumberOfSides]  AS ([DieTypeId]),
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[DisplayName] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[DieTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[RollComments]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[RollComments](
	[RollCommentId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[RollId] [int] NOT NULL,
	[Comment] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[RollCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[RollsToCharacters]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[RollsToCharacters](
	[RollsToCharactersId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[CharacterId] [int] NOT NULL,
	[RollId] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[RollsToCharactersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[RollsToEntities]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[RollsToEntities](
	[RollToEntityId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[RollId] [int] NOT NULL,
	[EntityId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[RollToEntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Rolls].[RollsToUsers]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rolls].[RollsToUsers](
	[RollsToUsersId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[UserId] [int] NOT NULL,
	[RollId] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[RollsToUsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Users].[AccessLevels]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users].[AccessLevels](
	[AccessLevelId] [tinyint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[CanRead] [bit] NOT NULL,
	[CanWrite] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[AccessLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Users].[UserNames]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users].[UserNames](
	[UserNameId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[Name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[UserNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Users].[Users]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[EntityId] [bigint] NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateModified] [datetime2](2) NOT NULL,
	[Handle] [varchar](50) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[PasswordHash] [binary](64) NOT NULL,
	[FirstNameId] [int] NOT NULL,
	[MiddleNameId] [int] NULL,
	[LastNameId] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Entities].[Entities] ON

INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (1, N'3d1ca5b2-4e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:03:17.4900000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (2, N'3e1ca5b2-4e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:03:17.5000000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (3, N'3f1ca5b2-4e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (4, N'401ca5b2-4e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (5, N'411ca5b2-4e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (6, N'421ca5b2-4e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (7, N'431ca5b2-4e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (8, N'441ca5b2-4e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (9, N'451ca5b2-4e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (10, N'461ca5b2-4e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (11, N'231b1181-534d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:37:41.7900000' AS DateTime2), CAST(N'2021-01-02T23:37:41.7900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (12, N'8efe90e7-544d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:47:43.2500000' AS DateTime2), CAST(N'2021-01-02T23:47:43.2500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (13, N'e3af9cee-544d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:47:55.0700000' AS DateTime2), CAST(N'2021-01-02T23:47:55.0700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (14, N'35fc56ff-544d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:48:23.1400000' AS DateTime2), CAST(N'2021-01-02T23:48:23.1400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (15, N'ab09d3a9-554d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:53:09.1700000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (16, N'ac09d3a9-554d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (17, N'4076651e-564d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:56:24.7400000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (18, N'4176651e-564d-eb11-a44d-7085c257c993', CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (19, N'0f5336d0-564d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:01:23.0700000' AS DateTime2), CAST(N'2021-01-03T00:01:23.0700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20, N'105336d0-564d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (21, N'cb53b51a-574d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:03:28.0500000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (22, N'cc53b51a-574d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (23, N'f051396a-574d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (24, N'f151396a-574d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (25, N'64d270e2-574d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (26, N'8e2cf318-584d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:10:34.6000000' AS DateTime2), CAST(N'2021-01-03T00:10:34.6000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (27, N'49dcfa25-5b4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:32:24.9500000' AS DateTime2), CAST(N'2021-01-03T00:32:24.9500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (28, N'f0dd066a-5b4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:34:19.1100000' AS DateTime2), CAST(N'2021-01-03T00:34:19.1100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (29, N'e0656186-5b4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:35:06.6800000' AS DateTime2), CAST(N'2021-01-03T00:35:06.6800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (30, N'e1656186-5b4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:35:14.7400000' AS DateTime2), CAST(N'2021-01-03T00:35:14.7400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (31, N'98552eab-5b4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:36:08.4200000' AS DateTime2), CAST(N'2021-01-03T00:36:08.4200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (32, N'99552eab-5b4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:36:15.3400000' AS DateTime2), CAST(N'2021-01-03T00:36:15.3400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (33, N'ae4c42b5-5b4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:36:25.3300000' AS DateTime2), CAST(N'2021-01-03T00:36:25.3300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (34, N'c90ae930-5c4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:39:52.7800000' AS DateTime2), CAST(N'2021-01-03T00:39:52.7800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (35, N'1bebfc5c-5c4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:41:06.7300000' AS DateTime2), CAST(N'2021-01-03T00:41:06.7300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (36, N'416e4480-5c4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:42:05.9200000' AS DateTime2), CAST(N'2021-01-03T00:42:05.9200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (37, N'426e4480-5c4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (38, N'eb7831d3-5c4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:44:25.0500000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (39, N'ec7831d3-5c4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (40, N'2ab0183c-5d4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:47:21.0500000' AS DateTime2), CAST(N'2021-01-03T00:47:21.0500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (41, N'ec37467b-5d4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:49:07.0400000' AS DateTime2), CAST(N'2021-01-03T00:49:07.0400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (42, N'ed37467b-5d4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (43, N'9f9cf914-5e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:53:24.9100000' AS DateTime2), CAST(N'2021-01-03T00:53:24.9100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (44, N'5934d041-5e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:54:40.1400000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (45, N'5a34d041-5e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (46, N'1c60624e-5e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:55:01.2200000' AS DateTime2), CAST(N'2021-01-03T00:55:01.2200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (47, N'b478c2e8-5e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T00:59:20.2200000' AS DateTime2), CAST(N'2021-01-03T00:59:20.2200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (48, N'9c4a7e02-5f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:00:03.4000000' AS DateTime2), CAST(N'2021-01-03T01:00:03.4000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (49, N'cbaf0c3f-5f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:01:44.9900000' AS DateTime2), CAST(N'2021-01-03T01:01:44.9900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (50, N'73250269-5f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:02:55.3900000' AS DateTime2), CAST(N'2021-01-03T01:02:55.3900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (51, N'0d10eda5-5f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:04:37.5900000' AS DateTime2), CAST(N'2021-01-03T01:04:37.5900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (52, N'416120af-5f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:04:53.0300000' AS DateTime2), CAST(N'2021-01-03T01:04:53.0300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (53, N'426120af-5f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:04:59.6900000' AS DateTime2), CAST(N'2021-01-03T01:04:59.6900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (54, N'2810b821-624d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:22:24.2800000' AS DateTime2), CAST(N'2021-01-03T01:22:24.2800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (55, N'2a3e0adc-624d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:27:36.8700000' AS DateTime2), CAST(N'2021-01-03T01:27:36.8700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (56, N'dd5e5a24-654d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:43:57.1900000' AS DateTime2), CAST(N'2021-01-03T01:43:57.1900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (57, N'de5e5a24-654d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (58, N'f7c0c186-654d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:46:42.2800000' AS DateTime2), CAST(N'2021-01-03T01:46:42.2800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (59, N'fb8fdedc-654d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:49:06.7500000' AS DateTime2), CAST(N'2021-01-03T01:49:06.7500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (60, N'86bb4b7d-664d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:53:35.9000000' AS DateTime2), CAST(N'2021-01-03T01:53:35.9000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (61, N'fa7ce349-674d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:59:19.1500000' AS DateTime2), CAST(N'2021-01-03T01:59:19.1500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (62, N'fb7ce349-674d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T01:59:23.4700000' AS DateTime2), CAST(N'2021-01-03T01:59:23.4700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (63, N'3e09216b-674d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T02:00:14.9200000' AS DateTime2), CAST(N'2021-01-03T02:00:14.9200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (64, N'c12071de-6a4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T02:24:56.8700000' AS DateTime2), CAST(N'2021-01-03T02:24:56.8700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (65, N'dfd01cda-6e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T02:53:27.6000000' AS DateTime2), CAST(N'2021-01-03T02:53:27.6000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (66, N'c21fa0fa-6e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T02:54:22.1500000' AS DateTime2), CAST(N'2021-01-03T02:54:22.1500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (67, N'c31fa0fa-6e4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T02:54:24.6100000' AS DateTime2), CAST(N'2021-01-03T02:54:24.6100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (68, N'd9663401-6f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T02:54:33.1800000' AS DateTime2), CAST(N'2021-01-03T02:54:33.1800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (69, N'da663401-6f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T02:54:39.1300000' AS DateTime2), CAST(N'2021-01-03T02:54:39.1300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (70, N'1db5dc20-6f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T02:55:26.3000000' AS DateTime2), CAST(N'2021-01-03T02:55:26.3000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (71, N'35dfc027-6f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T02:55:37.8600000' AS DateTime2), CAST(N'2021-01-03T02:55:37.8600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (72, N'767f5a44-6f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T02:56:25.8400000' AS DateTime2), CAST(N'2021-01-03T02:56:25.8400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (73, N'4a250e4d-6f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T02:56:40.4400000' AS DateTime2), CAST(N'2021-01-03T02:56:40.4400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (74, N'418c12d3-6f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T03:00:25.2800000' AS DateTime2), CAST(N'2021-01-03T03:00:25.2800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (75, N'428c12d3-6f4d-eb11-a44d-7085c257c993', CAST(N'2021-01-03T03:00:33.6100000' AS DateTime2), CAST(N'2021-01-03T03:00:33.6100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (76, N'4ddf5dd6-9652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:22:16.9900000' AS DateTime2), CAST(N'2021-01-09T16:22:16.9900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (77, N'd8f615fe-9652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:23:23.6300000' AS DateTime2), CAST(N'2021-01-09T16:23:23.6300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (78, N'e7990aab-9852-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:35:23.3000000' AS DateTime2), CAST(N'2021-01-09T16:35:23.3000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (79, N'e8990aab-9852-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (80, N'e8bb2fa4-9952-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:42:21.3000000' AS DateTime2), CAST(N'2021-01-09T16:42:21.3000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (81, N'31bd8515-9a52-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:45:31.4400000' AS DateTime2), CAST(N'2021-01-09T16:45:31.4400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (82, N'754c2f26-9a52-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:45:59.4000000' AS DateTime2), CAST(N'2021-01-09T16:45:59.4000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (83, N'764c2f26-9a52-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:46:02.6500000' AS DateTime2), CAST(N'2021-01-09T16:46:02.6500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (84, N'774c2f26-9a52-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:46:04.1400000' AS DateTime2), CAST(N'2021-01-09T16:46:04.1400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (85, N'67921740-9a52-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:46:42.8600000' AS DateTime2), CAST(N'2021-01-09T16:46:42.8600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (86, N'd41bc383-9a52-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:48:36.3900000' AS DateTime2), CAST(N'2021-01-09T16:48:36.3900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (87, N'd51bc383-9a52-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:48:39.1100000' AS DateTime2), CAST(N'2021-01-09T16:48:39.1100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (88, N'66c1168f-9a52-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (89, N'6072351c-9b52-eb11-a44d-7085c257c993', CAST(N'2021-01-09T16:52:52.1600000' AS DateTime2), CAST(N'2021-01-09T16:52:52.1600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (90, N'3f01461f-a352-eb11-a44d-7085c257c993', CAST(N'2021-01-09T17:50:13.2700000' AS DateTime2), CAST(N'2021-01-09T17:50:13.2700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (91, N'c74aaddd-a952-eb11-a44d-7085c257c993', CAST(N'2021-01-09T18:38:29.7000000' AS DateTime2), CAST(N'2021-01-09T18:38:29.7000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (92, N'c84aaddd-a952-eb11-a44d-7085c257c993', CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (93, N'304171e8-a952-eb11-a44d-7085c257c993', CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (94, N'314171e8-a952-eb11-a44d-7085c257c993', CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (95, N'3d7df6cd-aa52-eb11-a44d-7085c257c993', CAST(N'2021-01-09T18:45:12.8300000' AS DateTime2), CAST(N'2021-01-09T18:45:12.8300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (96, N'3e7df6cd-aa52-eb11-a44d-7085c257c993', CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (97, N'2c657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:06.7600000' AS DateTime2), CAST(N'2021-01-09T19:35:06.7600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (98, N'2d657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:10.3500000' AS DateTime2), CAST(N'2021-01-09T19:35:10.3500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (99, N'2e657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:11.0200000' AS DateTime2), CAST(N'2021-01-09T19:35:11.0200000' AS DateTime2), 1, 0)
GO
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (100, N'2f657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:11.5400000' AS DateTime2), CAST(N'2021-01-09T19:35:11.5400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (101, N'30657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:12.0100000' AS DateTime2), CAST(N'2021-01-09T19:35:12.0100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (102, N'31657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:12.6200000' AS DateTime2), CAST(N'2021-01-09T19:35:12.6200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (103, N'32657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:12.9500000' AS DateTime2), CAST(N'2021-01-09T19:35:12.9500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (104, N'33657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:13.1600000' AS DateTime2), CAST(N'2021-01-09T19:35:13.1600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (105, N'34657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:13.3400000' AS DateTime2), CAST(N'2021-01-09T19:35:13.3400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (106, N'35657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:13.5200000' AS DateTime2), CAST(N'2021-01-09T19:35:13.5200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (107, N'36657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:13.6700000' AS DateTime2), CAST(N'2021-01-09T19:35:13.6700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (108, N'37657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:13.8300000' AS DateTime2), CAST(N'2021-01-09T19:35:13.8300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (109, N'38657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:13.9800000' AS DateTime2), CAST(N'2021-01-09T19:35:13.9800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (110, N'39657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:14.2600000' AS DateTime2), CAST(N'2021-01-09T19:35:14.2600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (111, N'3a657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:14.3900000' AS DateTime2), CAST(N'2021-01-09T19:35:14.3900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (112, N'3b657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:14.5500000' AS DateTime2), CAST(N'2021-01-09T19:35:14.5500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (113, N'3c657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:14.7000000' AS DateTime2), CAST(N'2021-01-09T19:35:14.7000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (114, N'3d657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:14.8700000' AS DateTime2), CAST(N'2021-01-09T19:35:14.8700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (115, N'3e657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:15.0400000' AS DateTime2), CAST(N'2021-01-09T19:35:15.0400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (116, N'3f657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:15.2000000' AS DateTime2), CAST(N'2021-01-09T19:35:15.2000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (117, N'40657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:15.3800000' AS DateTime2), CAST(N'2021-01-09T19:35:15.3800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (118, N'41657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:15.5600000' AS DateTime2), CAST(N'2021-01-09T19:35:15.5600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (119, N'42657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:15.7300000' AS DateTime2), CAST(N'2021-01-09T19:35:15.7300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (120, N'43657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:15.9000000' AS DateTime2), CAST(N'2021-01-09T19:35:15.9000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (121, N'44657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:16.0600000' AS DateTime2), CAST(N'2021-01-09T19:35:16.0600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (122, N'45657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:16.2200000' AS DateTime2), CAST(N'2021-01-09T19:35:16.2200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (123, N'46657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:16.3900000' AS DateTime2), CAST(N'2021-01-09T19:35:16.3900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (124, N'47657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:16.5500000' AS DateTime2), CAST(N'2021-01-09T19:35:16.5500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (125, N'48657cc6-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:16.6900000' AS DateTime2), CAST(N'2021-01-09T19:35:16.6900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (126, N'fc347fcc-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:16.8500000' AS DateTime2), CAST(N'2021-01-09T19:35:16.8500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (127, N'fd347fcc-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:16.9800000' AS DateTime2), CAST(N'2021-01-09T19:35:16.9800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (128, N'd2ccfbe3-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:56.2500000' AS DateTime2), CAST(N'2021-01-09T19:35:56.2500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (129, N'd3ccfbe3-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:56.4200000' AS DateTime2), CAST(N'2021-01-09T19:35:56.4200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (130, N'd4ccfbe3-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:56.9500000' AS DateTime2), CAST(N'2021-01-09T19:35:56.9500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (131, N'd5ccfbe3-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:57.1400000' AS DateTime2), CAST(N'2021-01-09T19:35:57.1400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (132, N'd6ccfbe3-b152-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:35:57.5700000' AS DateTime2), CAST(N'2021-01-09T19:35:57.5700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (133, N'efb15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:39.2200000' AS DateTime2), CAST(N'2021-01-09T19:37:39.2200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (134, N'f0b15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:39.4800000' AS DateTime2), CAST(N'2021-01-09T19:37:39.4800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (135, N'f1b15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:39.8700000' AS DateTime2), CAST(N'2021-01-09T19:37:39.8700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (136, N'f2b15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:40.2100000' AS DateTime2), CAST(N'2021-01-09T19:37:40.2100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (137, N'f3b15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:40.4600000' AS DateTime2), CAST(N'2021-01-09T19:37:40.4600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (138, N'f4b15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:40.6300000' AS DateTime2), CAST(N'2021-01-09T19:37:40.6300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (139, N'f5b15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:40.8000000' AS DateTime2), CAST(N'2021-01-09T19:37:40.8000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (140, N'f6b15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:40.9900000' AS DateTime2), CAST(N'2021-01-09T19:37:40.9900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (141, N'f7b15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:41.1500000' AS DateTime2), CAST(N'2021-01-09T19:37:41.1500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (142, N'f8b15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:41.3200000' AS DateTime2), CAST(N'2021-01-09T19:37:41.3200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (143, N'f9b15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:41.4700000' AS DateTime2), CAST(N'2021-01-09T19:37:41.4700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (144, N'fab15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:41.6400000' AS DateTime2), CAST(N'2021-01-09T19:37:41.6400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (145, N'fbb15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:41.8100000' AS DateTime2), CAST(N'2021-01-09T19:37:41.8100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (146, N'fcb15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:41.9700000' AS DateTime2), CAST(N'2021-01-09T19:37:41.9700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (147, N'fdb15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:42.1900000' AS DateTime2), CAST(N'2021-01-09T19:37:42.1900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (148, N'feb15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:42.3000000' AS DateTime2), CAST(N'2021-01-09T19:37:42.3000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (149, N'ffb15a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:42.4800000' AS DateTime2), CAST(N'2021-01-09T19:37:42.4800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (150, N'00b25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:42.6400000' AS DateTime2), CAST(N'2021-01-09T19:37:42.6400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (151, N'01b25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:42.8100000' AS DateTime2), CAST(N'2021-01-09T19:37:42.8100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (152, N'02b25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:42.9900000' AS DateTime2), CAST(N'2021-01-09T19:37:42.9900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (153, N'03b25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:43.1600000' AS DateTime2), CAST(N'2021-01-09T19:37:43.1600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (154, N'04b25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:43.3200000' AS DateTime2), CAST(N'2021-01-09T19:37:43.3200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (155, N'05b25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:43.4900000' AS DateTime2), CAST(N'2021-01-09T19:37:43.4900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (156, N'06b25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:43.6500000' AS DateTime2), CAST(N'2021-01-09T19:37:43.6500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (157, N'07b25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:43.8400000' AS DateTime2), CAST(N'2021-01-09T19:37:43.8400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (158, N'08b25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:44.0100000' AS DateTime2), CAST(N'2021-01-09T19:37:44.0100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (159, N'09b25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:44.2100000' AS DateTime2), CAST(N'2021-01-09T19:37:44.2100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (160, N'0ab25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:44.4400000' AS DateTime2), CAST(N'2021-01-09T19:37:44.4400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (161, N'0bb25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:44.7200000' AS DateTime2), CAST(N'2021-01-09T19:37:44.7200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (162, N'0cb25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:45.1300000' AS DateTime2), CAST(N'2021-01-09T19:37:45.1300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (163, N'0db25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:45.5200000' AS DateTime2), CAST(N'2021-01-09T19:37:45.5200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (164, N'0eb25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:45.9600000' AS DateTime2), CAST(N'2021-01-09T19:37:45.9600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (165, N'0fb25a21-b252-eb11-a44d-7085c257c993', CAST(N'2021-01-09T19:37:46.6600000' AS DateTime2), CAST(N'2021-01-09T19:37:46.6600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (166, N'0c3f4847-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:20.8400000' AS DateTime2), CAST(N'2021-01-09T20:07:20.8400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (167, N'0d3f4847-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:27.9500000' AS DateTime2), CAST(N'2021-01-09T20:07:27.9500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (168, N'0e3f4847-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:28.4200000' AS DateTime2), CAST(N'2021-01-09T20:07:28.4200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (169, N'0f3f4847-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:28.9000000' AS DateTime2), CAST(N'2021-01-09T20:07:28.9000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (170, N'103f4847-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:29.3200000' AS DateTime2), CAST(N'2021-01-09T20:07:29.3200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (171, N'113f4847-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:29.7300000' AS DateTime2), CAST(N'2021-01-09T20:07:29.7300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (172, N'123f4847-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:30.0400000' AS DateTime2), CAST(N'2021-01-09T20:07:30.0400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (173, N'133f4847-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:30.3200000' AS DateTime2), CAST(N'2021-01-09T20:07:30.3200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (174, N'143f4847-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:30.5000000' AS DateTime2), CAST(N'2021-01-09T20:07:30.5000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (175, N'153f4847-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:30.6500000' AS DateTime2), CAST(N'2021-01-09T20:07:30.6500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (176, N'163f4847-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:30.8400000' AS DateTime2), CAST(N'2021-01-09T20:07:30.8400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (177, N'f442564d-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:30.9900000' AS DateTime2), CAST(N'2021-01-09T20:07:30.9900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (178, N'f542564d-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:31.1200000' AS DateTime2), CAST(N'2021-01-09T20:07:31.1200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (179, N'f642564d-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:31.2700000' AS DateTime2), CAST(N'2021-01-09T20:07:31.2700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (180, N'f742564d-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:31.4300000' AS DateTime2), CAST(N'2021-01-09T20:07:31.4300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (181, N'f842564d-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:31.5700000' AS DateTime2), CAST(N'2021-01-09T20:07:31.5700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (182, N'f942564d-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:31.7200000' AS DateTime2), CAST(N'2021-01-09T20:07:31.7200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (183, N'fa42564d-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:31.8600000' AS DateTime2), CAST(N'2021-01-09T20:07:31.8600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (184, N'fb42564d-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:32.0100000' AS DateTime2), CAST(N'2021-01-09T20:07:32.0100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (185, N'fc42564d-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:32.1800000' AS DateTime2), CAST(N'2021-01-09T20:07:32.1800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (186, N'fd42564d-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:32.5000000' AS DateTime2), CAST(N'2021-01-09T20:07:32.5000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (187, N'fe42564d-b652-eb11-a44d-7085c257c993', CAST(N'2021-01-09T20:07:32.6700000' AS DateTime2), CAST(N'2021-01-09T20:07:32.6700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (188, N'200b81de-d352-eb11-a44d-7085c257c993', CAST(N'2021-01-09T23:39:09.9500000' AS DateTime2), CAST(N'2021-01-09T23:39:09.9500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (189, N'210b81de-d352-eb11-a44d-7085c257c993', CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (190, N'1cf277e9-d352-eb11-a44d-7085c257c993', CAST(N'2021-01-09T23:39:28.3400000' AS DateTime2), CAST(N'2021-01-09T23:39:28.3400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (191, N'fe6045e5-d452-eb11-a44d-7085c257c993', CAST(N'2021-01-09T23:46:30.8000000' AS DateTime2), CAST(N'2021-01-09T23:46:30.8000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (192, N'69832991-d752-eb11-a44d-7085c257c993', CAST(N'2021-01-10T00:05:38.1800000' AS DateTime2), CAST(N'2021-01-10T00:05:38.1800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (193, N'c1c7e5f3-db52-eb11-a44d-7085c257c993', CAST(N'2021-01-10T00:37:01.8100000' AS DateTime2), CAST(N'2021-01-10T00:37:01.8100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (194, N'63875c2f-dc52-eb11-a44d-7085c257c993', CAST(N'2021-01-10T00:38:41.5800000' AS DateTime2), CAST(N'2021-01-10T00:38:41.5800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (195, N'2f6802c0-dd52-eb11-a44d-7085c257c993', CAST(N'2021-01-10T00:49:53.7500000' AS DateTime2), CAST(N'2021-01-10T00:49:53.7500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (196, N'ea7bd789-de52-eb11-a44d-7085c257c993', CAST(N'2021-01-10T00:55:32.3700000' AS DateTime2), CAST(N'2021-01-10T00:55:32.3700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (197, N'0bbafe9d-df52-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:03:15.6800000' AS DateTime2), CAST(N'2021-01-10T01:03:15.6800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (198, N'43db7ea4-df52-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (199, N'f8db5255-e052-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:08:23.2600000' AS DateTime2), CAST(N'2021-01-10T01:08:23.2600000' AS DateTime2), 1, 0)
GO
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (200, N'6348d571-e052-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (201, N'f35c8181-e052-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:09:37.3800000' AS DateTime2), CAST(N'2021-01-10T01:09:37.3800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (202, N'4c0874b5-e052-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:11:04.5300000' AS DateTime2), CAST(N'2021-01-10T01:11:04.5300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (203, N'ccf40ffb-e052-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:13:01.3200000' AS DateTime2), CAST(N'2021-01-10T01:13:01.3200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (204, N'573c8524-e152-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:14:10.8700000' AS DateTime2), CAST(N'2021-01-10T01:14:10.8700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (205, N'22522bb1-e152-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:18:06.8400000' AS DateTime2), CAST(N'2021-01-10T01:18:06.8400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (206, N'baf61528-e252-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:21:26.3500000' AS DateTime2), CAST(N'2021-01-10T01:21:26.3500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (207, N'fc82bc36-e252-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:21:50.9300000' AS DateTime2), CAST(N'2021-01-10T01:21:50.9300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (208, N'e7282fcb-e252-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:25:59.9900000' AS DateTime2), CAST(N'2021-01-10T01:25:59.9900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (209, N'44dc2533-e752-eb11-a44d-7085c257c993', CAST(N'2021-01-10T01:57:32.3900000' AS DateTime2), CAST(N'2021-01-10T01:57:32.3900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (210, N'80e46a5c-e952-eb11-a44d-7085c257c993', CAST(N'2021-01-10T02:13:00.6300000' AS DateTime2), CAST(N'2021-01-10T02:13:00.6300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (211, N'3b02bb1f-6353-eb11-a44d-7085c257c993', CAST(N'2021-01-10T16:44:37.4100000' AS DateTime2), CAST(N'2021-01-10T16:44:37.4100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (212, N'3079a138-6353-eb11-a44d-7085c257c993', CAST(N'2021-01-10T16:45:19.1900000' AS DateTime2), CAST(N'2021-01-10T16:45:19.1900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (213, N'8c0acabf-6654-eb11-a44d-7085c257c993', CAST(N'2021-01-11T23:43:05.6000000' AS DateTime2), CAST(N'2021-01-11T23:43:05.6000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (214, N'd8b9bfe6-6654-eb11-a44d-7085c257c993', CAST(N'2021-01-11T23:44:10.9600000' AS DateTime2), CAST(N'2021-01-11T23:44:10.9600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (215, N'08d27e1e-9057-eb11-a44f-7085c257c993', CAST(N'2021-01-16T00:16:47.3400000' AS DateTime2), CAST(N'2021-01-16T00:16:47.3400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (216, N'41172c13-9357-eb11-a44f-7085c257c993', CAST(N'2021-01-16T00:37:56.8400000' AS DateTime2), CAST(N'2021-01-16T00:37:56.8400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (217, N'64420820-9357-eb11-a44f-7085c257c993', CAST(N'2021-01-16T00:38:18.4100000' AS DateTime2), CAST(N'2021-01-16T00:38:18.4100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (218, N'5a316750-9357-eb11-a44f-7085c257c993', CAST(N'2021-01-16T00:39:39.5700000' AS DateTime2), CAST(N'2021-01-16T00:39:39.5700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (219, N'0203168f-0d58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:14:43.3300000' AS DateTime2), CAST(N'2021-01-16T15:14:43.3300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (220, N'68834485-0e58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:21:36.3600000' AS DateTime2), CAST(N'2021-01-16T15:21:36.3600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (221, N'eef7bec0-0e58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:23:16.1400000' AS DateTime2), CAST(N'2021-01-16T15:23:16.1400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (222, N'de718aea-0e58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:24:26.2600000' AS DateTime2), CAST(N'2021-01-16T15:24:26.2600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (223, N'3b1984a1-0f58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:29:33.2400000' AS DateTime2), CAST(N'2021-01-16T15:29:33.2400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (224, N'3c1984a1-0f58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:29:42.4700000' AS DateTime2), CAST(N'2021-01-16T15:29:42.4700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (225, N'ecc8ada5-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:43:59.2200000' AS DateTime2), CAST(N'2021-01-16T15:43:59.2200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (226, N'edc8ada5-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:44:05.4600000' AS DateTime2), CAST(N'2021-01-16T15:44:05.4600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (227, N'982ad3ae-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:44:14.5700000' AS DateTime2), CAST(N'2021-01-16T15:44:14.5700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (228, N'191005b5-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:44:24.9600000' AS DateTime2), CAST(N'2021-01-16T15:44:24.9600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (229, N'1a1005b5-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:44:25.3800000' AS DateTime2), CAST(N'2021-01-16T15:44:25.3800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (230, N'1b1005b5-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:44:26.0300000' AS DateTime2), CAST(N'2021-01-16T15:44:26.0300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (231, N'1c1005b5-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:44:29.2400000' AS DateTime2), CAST(N'2021-01-16T15:44:29.2400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (232, N'1d1005b5-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:44:29.6800000' AS DateTime2), CAST(N'2021-01-16T15:44:29.6800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (233, N'1e1005b5-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:44:30.2200000' AS DateTime2), CAST(N'2021-01-16T15:44:30.2200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (234, N'1f1005b5-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:44:30.9500000' AS DateTime2), CAST(N'2021-01-16T15:44:30.9500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (235, N'201005b5-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:44:31.3400000' AS DateTime2), CAST(N'2021-01-16T15:44:31.3400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (236, N'211005b5-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:44:31.7400000' AS DateTime2), CAST(N'2021-01-16T15:44:31.7400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (237, N'221005b5-1158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:44:33.2200000' AS DateTime2), CAST(N'2021-01-16T15:44:33.2200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (238, N'208e91a1-1358-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:58:11.3200000' AS DateTime2), CAST(N'2021-01-16T15:58:11.3200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (239, N'218e91a1-1358-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:58:12.1100000' AS DateTime2), CAST(N'2021-01-16T15:58:12.1100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (240, N'228e91a1-1358-eb11-a44f-7085c257c993', CAST(N'2021-01-16T15:58:14.8800000' AS DateTime2), CAST(N'2021-01-16T15:58:14.8800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (241, N'7196d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:22.7200000' AS DateTime2), CAST(N'2021-01-16T22:45:22.7200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (242, N'7296d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:23.2200000' AS DateTime2), CAST(N'2021-01-16T22:45:23.2200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (243, N'7396d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:23.7300000' AS DateTime2), CAST(N'2021-01-16T22:45:23.7300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (244, N'7496d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:24.2000000' AS DateTime2), CAST(N'2021-01-16T22:45:24.2000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (245, N'7596d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:24.6200000' AS DateTime2), CAST(N'2021-01-16T22:45:24.6200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (246, N'7696d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:25.1800000' AS DateTime2), CAST(N'2021-01-16T22:45:25.1800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (247, N'7796d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:25.4400000' AS DateTime2), CAST(N'2021-01-16T22:45:25.4400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (248, N'7896d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:25.6400000' AS DateTime2), CAST(N'2021-01-16T22:45:25.6400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (249, N'7996d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:25.7900000' AS DateTime2), CAST(N'2021-01-16T22:45:25.7900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (250, N'7a96d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:25.9600000' AS DateTime2), CAST(N'2021-01-16T22:45:25.9600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (251, N'7b96d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:26.1500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.1500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (252, N'7c96d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:26.2900000' AS DateTime2), CAST(N'2021-01-16T22:45:26.2900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (253, N'7d96d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:26.4500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.4500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (254, N'7e96d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:26.6100000' AS DateTime2), CAST(N'2021-01-16T22:45:26.6100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (255, N'7f96d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:26.7500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.7500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (256, N'8096d083-4c58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T22:45:26.9100000' AS DateTime2), CAST(N'2021-01-16T22:45:26.9100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (257, N'c1d4ceb5-4e58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:01:05.5800000' AS DateTime2), CAST(N'2021-01-16T23:01:05.5800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (258, N'c2d4ceb5-4e58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:01:07.1800000' AS DateTime2), CAST(N'2021-01-16T23:01:07.1800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (259, N'c3d4ceb5-4e58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:01:08.7700000' AS DateTime2), CAST(N'2021-01-16T23:01:08.7700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (260, N'c4d4ceb5-4e58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:01:12.0900000' AS DateTime2), CAST(N'2021-01-16T23:01:12.0900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (261, N'c5d4ceb5-4e58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:01:14.0400000' AS DateTime2), CAST(N'2021-01-16T23:01:14.0400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (262, N'c6d4ceb5-4e58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:01:14.6000000' AS DateTime2), CAST(N'2021-01-16T23:01:14.6000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (263, N'6d7521bc-4e58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:01:16.1900000' AS DateTime2), CAST(N'2021-01-16T23:01:16.1900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (264, N'6e7521bc-4e58-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:01:18.2900000' AS DateTime2), CAST(N'2021-01-16T23:01:18.2900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (265, N'af2104f8-5058-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:17:15.6600000' AS DateTime2), CAST(N'2021-01-16T23:17:15.6600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (266, N'c572a9fe-5058-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:17:26.8100000' AS DateTime2), CAST(N'2021-01-16T23:17:26.8100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (267, N'25789a16-5158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (268, N'69c78d1e-5158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (269, N'2603952e-5158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:18:47.2000000' AS DateTime2), CAST(N'2021-01-16T23:18:47.2000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (270, N'2703952e-5158-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:18:49.9100000' AS DateTime2), CAST(N'2021-01-16T23:18:49.9100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (271, N'7a298076-5358-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:35:06.8600000' AS DateTime2), CAST(N'2021-01-16T23:35:06.8600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (272, N'4a2a5f7d-5358-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (273, N'8bb2e684-5358-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (274, N'fb4b54b6-5358-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:36:53.9400000' AS DateTime2), CAST(N'2021-01-16T23:36:53.9400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (275, N'60000f2a-5458-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:40:08.1000000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (276, N'61000f2a-5458-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:40:08.1100000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (277, N'346e5c60-5458-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:41:39.2100000' AS DateTime2), CAST(N'2021-01-16T23:41:39.2100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (278, N'7c4f1795-5458-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:43:07.6700000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (279, N'7d4f1795-5458-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (280, N'd0c99234-5558-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:47:35.2400000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (281, N'd1c99234-5558-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (282, N'c3ac6152-5558-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:48:25.2500000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (283, N'c4ac6152-5558-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (284, N'843d879d-5558-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:50:31.3300000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (285, N'853d879d-5558-eb11-a44f-7085c257c993', CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (286, N'e8b376b3-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:12:36.6200000' AS DateTime2), CAST(N'2021-01-17T00:12:36.6200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (287, N'e9b376b3-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:12:36.6300000' AS DateTime2), CAST(N'2021-01-17T00:12:36.6300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (288, N'eab376b3-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (289, N'ebb376b3-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (290, N'3ad04cbc-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (291, N'3bd04cbc-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (292, N'3cd04cbc-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (293, N'3dd04cbc-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (294, N'3086a1c3-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (295, N'3186a1c3-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (296, N'136aadd5-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:13:34.0200000' AS DateTime2), CAST(N'2021-01-17T00:13:34.0200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (297, N'146aadd5-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (298, N'156aadd5-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:13:36.6600000' AS DateTime2), CAST(N'2021-01-17T00:13:36.6600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (299, N'166aadd5-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), 1, 0)
GO
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (300, N'71bb25dc-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:13:44.8700000' AS DateTime2), CAST(N'2021-01-17T00:13:44.8700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (301, N'72bb25dc-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:13:44.8800000' AS DateTime2), CAST(N'2021-01-17T00:13:44.8800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (302, N'034d14fb-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:14:36.7700000' AS DateTime2), CAST(N'2021-01-17T00:14:36.7700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (303, N'044d14fb-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (304, N'054d14fb-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (305, N'064d14fb-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (306, N'074d14fb-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (307, N'084d14fb-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (308, N'094d14fb-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (309, N'0a4d14fb-5858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (310, N'b55ab60c-5958-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (311, N'b65ab60c-5958-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (312, N'b75ab60c-5958-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (313, N'b85ab60c-5958-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (314, N'b95ab60c-5958-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (315, N'ba5ab60c-5958-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (316, N'bb5ab60c-5958-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (317, N'bc5ab60c-5958-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (318, N'd6b6c5b3-5a58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:26:56.1300000' AS DateTime2), CAST(N'2021-01-17T00:26:56.1300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (319, N'6f3dc8f8-5a58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:28:51.9100000' AS DateTime2), CAST(N'2021-01-17T00:28:51.9100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (320, N'6f63b901-5b58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:29:06.9100000' AS DateTime2), CAST(N'2021-01-17T00:29:06.9100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (321, N'7063b901-5b58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (322, N'0911e313-5b58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (323, N'7a7ca4a2-5b58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:33:36.8900000' AS DateTime2), CAST(N'2021-01-17T00:33:36.8900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (324, N'cd0ce7a8-5b58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (325, N'ce0ce7a8-5b58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:33:56.8800000' AS DateTime2), CAST(N'2021-01-17T00:33:56.8800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (326, N'247ee7df-5c58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:42:29.1600000' AS DateTime2), CAST(N'2021-01-17T00:42:29.1600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (327, N'f16160aa-5d58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:48:08.8600000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (328, N'f26160aa-5d58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (329, N'52fd62c1-5d58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:48:47.4600000' AS DateTime2), CAST(N'2021-01-17T00:48:47.4600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (330, N'12c5a0f8-5d58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:50:20.1400000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (331, N'13c5a0f8-5d58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (332, N'77cd0b5b-5e58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:53:05.2600000' AS DateTime2), CAST(N'2021-01-17T00:53:05.2600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (333, N'f9a583cf-5e58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T00:56:20.6600000' AS DateTime2), CAST(N'2021-01-17T00:56:20.6600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (334, N'274f9862-5f58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:00:27.4200000' AS DateTime2), CAST(N'2021-01-17T01:00:27.4200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (335, N'35921612-6058-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:05:21.8500000' AS DateTime2), CAST(N'2021-01-17T01:05:21.8500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (336, N'7d992fc7-6058-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:10:25.6800000' AS DateTime2), CAST(N'2021-01-17T01:10:25.6800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (337, N'ed50a50b-6158-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:12:20.5400000' AS DateTime2), CAST(N'2021-01-17T01:12:20.5400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (338, N'6e66f587-6358-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:30:08.0900000' AS DateTime2), CAST(N'2021-01-17T01:30:08.0900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (339, N'6f66f587-6358-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (340, N'7aa4e801-6458-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:33:32.6900000' AS DateTime2), CAST(N'2021-01-17T01:33:32.6900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (341, N'7ba4e801-6458-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (342, N'29b67046-6458-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:35:27.6700000' AS DateTime2), CAST(N'2021-01-17T01:35:27.6700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (343, N'f89137e4-6458-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:39:52.3700000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (344, N'f99137e4-6458-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (345, N'ff12bb53-6558-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:42:59.4600000' AS DateTime2), CAST(N'2021-01-17T01:42:59.4600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (346, N'60d7ef80-6558-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:44:15.3100000' AS DateTime2), CAST(N'2021-01-17T01:44:15.3100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (347, N'a8f7728b-6558-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (348, N'a9f7728b-6558-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (349, N'e10123ba-6558-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:45:51.2700000' AS DateTime2), CAST(N'2021-01-17T01:45:51.2700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (350, N'0cbe40e8-6558-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:47:08.6400000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (351, N'0dbe40e8-6558-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (352, N'ccaec9d4-6658-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:53:45.4800000' AS DateTime2), CAST(N'2021-01-17T01:53:45.4800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (353, N'777be8fe-6658-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:54:56.1500000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (354, N'787be8fe-6658-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (355, N'78259e25-6758-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:56:01.0900000' AS DateTime2), CAST(N'2021-01-17T01:56:01.0900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (356, N'79259e25-6758-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (357, N'719b0633-6758-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (358, N'729b0633-6758-eb11-a44f-7085c257c993', CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (359, N'b80dd59c-6858-eb11-a44f-7085c257c993', CAST(N'2021-01-17T02:06:30.6000000' AS DateTime2), CAST(N'2021-01-17T02:06:30.6000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (360, N'abae3170-6958-eb11-a44f-7085c257c993', CAST(N'2021-01-17T02:12:25.2000000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (361, N'acae3170-6958-eb11-a44f-7085c257c993', CAST(N'2021-01-17T02:12:25.2100000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (362, N'30f07690-6958-eb11-a44f-7085c257c993', CAST(N'2021-01-17T02:13:19.3400000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (363, N'31f07690-6958-eb11-a44f-7085c257c993', CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (364, N'6a519e8d-6a58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T02:20:24.0700000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (365, N'6b519e8d-6a58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (366, N'ffafed69-6b58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T02:26:33.6800000' AS DateTime2), CAST(N'2021-01-17T02:26:33.6800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (367, N'00b0ed69-6b58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (368, N'bbde911e-6c58-eb11-a44f-7085c257c993', CAST(N'2021-01-17T02:31:36.7500000' AS DateTime2), CAST(N'2021-01-17T02:31:36.7500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (369, N'35311feb-d25d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:30:04.4100000' AS DateTime2), CAST(N'2021-01-23T23:30:04.4100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (370, N'36311feb-d25d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (371, N'd5c85df2-d25d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (372, N'338c9016-d45d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:38:26.7900000' AS DateTime2), CAST(N'2021-01-23T23:38:26.7900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (373, N'58c8892f-d45d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:39:08.6900000' AS DateTime2), CAST(N'2021-01-23T23:39:08.6900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (374, N'18a91084-d45d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:41:30.5000000' AS DateTime2), CAST(N'2021-01-23T23:41:30.5000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (375, N'74f4938c-d45d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:41:44.7900000' AS DateTime2), CAST(N'2021-01-23T23:41:44.7900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (376, N'75f4938c-d45d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (377, N'4c1a1323-d55d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:45:57.2800000' AS DateTime2), CAST(N'2021-01-23T23:45:57.2800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (378, N'ca0f61c1-d55d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:50:22.8700000' AS DateTime2), CAST(N'2021-01-23T23:50:22.8700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (379, N'f2cd1011-d65d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:52:36.5600000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (380, N'f3cd1011-d65d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (381, N'968af855-d65d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:54:32.1600000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (382, N'978af855-d65d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (383, N'a84dc00e-d75d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:59:42.1700000' AS DateTime2), CAST(N'2021-01-23T23:59:42.1700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (384, N'bf73b915-d75d-eb11-a44f-7085c257c993', CAST(N'2021-01-23T23:59:53.8700000' AS DateTime2), CAST(N'2021-01-23T23:59:53.8700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (385, N'809472e7-d75d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:05:45.7300000' AS DateTime2), CAST(N'2021-01-24T00:05:45.7300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (386, N'819472e7-d75d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:05:54.9700000' AS DateTime2), CAST(N'2021-01-24T00:05:54.9700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (387, N'cb2384f4-d75d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:06:07.6600000' AS DateTime2), CAST(N'2021-01-24T00:06:07.6600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (388, N'77dcb89b-d85d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:10:48.1800000' AS DateTime2), CAST(N'2021-01-24T00:10:48.1800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (389, N'78dcb89b-d85d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:10:48.2200000' AS DateTime2), CAST(N'2021-01-24T00:10:48.2200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (390, N'1e66b5b4-d85d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:11:30.1000000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (391, N'1f66b5b4-d85d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (392, N'970940d7-d85d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:12:28.0500000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (393, N'980940d7-d85d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (394, N'f48e7324-d95d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:14:37.5700000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (395, N'f58e7324-d95d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (396, N'89085d66-d95d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:16:28.1600000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (397, N'8a085d66-d95d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:16:28.1700000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (398, N'77ef6179-d95d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:17:00.0700000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (399, N'78ef6179-d95d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), 1, 0)
GO
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (400, N'008d0b96-d95d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:17:48.1500000' AS DateTime2), CAST(N'2021-01-24T00:17:48.1500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (401, N'e1581ed0-d95d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:19:25.5800000' AS DateTime2), CAST(N'2021-01-24T00:19:25.5800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (402, N'e2581ed0-d95d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (403, N'72afd9f3-d95d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:20:25.5300000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (404, N'73afd9f3-d95d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:20:25.5500000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (405, N'e091080e-da5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:21:09.4600000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (406, N'e191080e-da5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (407, N'40ef0b2c-da5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:21:59.8100000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (408, N'41ef0b2c-da5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:21:59.8400000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (409, N'e9755a52-da5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:23:04.0800000' AS DateTime2), CAST(N'2021-01-24T00:23:04.0800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (410, N'356bfc6f-da5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:23:53.8000000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (411, N'366bfc6f-da5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (412, N'3073f085-da5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:24:30.6300000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (413, N'3173f085-da5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (414, N'3e767e8c-da5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (415, N'2e7ee6c0-da5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:26:09.5500000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (416, N'2f7ee6c0-da5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (417, N'52f86375-db5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:31:12.3600000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (418, N'53f86375-db5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (419, N'a46734a8-dc5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:39:47.1100000' AS DateTime2), CAST(N'2021-01-24T00:39:47.1100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (420, N'e3c759b1-dc5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (421, N'bc52e5b9-dc5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:40:16.7900000' AS DateTime2), CAST(N'2021-01-24T00:40:16.7900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (422, N'330d9ec5-dc5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:40:36.4600000' AS DateTime2), CAST(N'2021-01-24T00:40:36.4600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (423, N'574dd8d6-dc5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:41:05.3600000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (424, N'584dd8d6-dc5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (425, N'6b12b3e3-dc5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:41:26.9300000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (426, N'6c12b3e3-dc5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (427, N'6a62341f-dd5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:43:06.7600000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (428, N'6b62341f-dd5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (429, N'217579be-dd5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:47:33.9700000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (430, N'227579be-dd5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (431, N'010ceee3-dd5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:48:36.8100000' AS DateTime2), CAST(N'2021-01-24T00:48:36.8100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (432, N'6e2838eb-dd5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (433, N'3815eb2e-de5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:50:42.6200000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (434, N'3915eb2e-de5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (435, N'c6465c7f-de5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:52:57.5800000' AS DateTime2), CAST(N'2021-01-24T00:52:57.5800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (436, N'c7465c7f-de5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:52:57.6200000' AS DateTime2), CAST(N'2021-01-24T00:52:57.6200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (437, N'578f9cbf-de5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:54:45.3700000' AS DateTime2), CAST(N'2021-01-24T00:54:45.3700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (438, N'588f9cbf-de5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (439, N'18142dd6-de5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:55:23.2300000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (440, N'19142dd6-de5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (441, N'fd0b5f05-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:56:42.4100000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (442, N'fe0b5f05-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (443, N'c56cb821-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:57:29.9700000' AS DateTime2), CAST(N'2021-01-24T00:57:29.9700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (444, N'c66cb821-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (445, N'a3c67050-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:58:48.3600000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (446, N'a4c67050-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (447, N'dee95262-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:59:18.3600000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (448, N'dfe95262-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (449, N'41163575-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:59:50.0400000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (450, N'42163575-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (451, N'0457f589-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:00:24.8600000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (452, N'0557f589-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (453, N'5b752cb1-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:01:30.6500000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (454, N'5c752cb1-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (455, N'20a618cb-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:02:14.1400000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (456, N'21a618cb-df5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (457, N'7c80d635-e25d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:19:32.2200000' AS DateTime2), CAST(N'2021-01-24T01:19:32.2200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (458, N'774e9d7d-e45d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:35:51.6300000' AS DateTime2), CAST(N'2021-01-24T01:35:51.6300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (459, N'f535b227-e55d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:40:36.9800000' AS DateTime2), CAST(N'2021-01-24T01:40:36.9800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (460, N'7a38216a-e55d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:42:28.4400000' AS DateTime2), CAST(N'2021-01-24T01:42:28.4400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (461, N'18af5e88-e55d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:43:19.1700000' AS DateTime2), CAST(N'2021-01-24T01:43:19.1700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (462, N'ad42399a-e55d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:43:49.1200000' AS DateTime2), CAST(N'2021-01-24T01:43:49.1200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (463, N'e2465da3-e55d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:44:04.4600000' AS DateTime2), CAST(N'2021-01-24T01:44:04.4600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (464, N'e3465da3-e55d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (465, N'f5f7c85d-e95d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T02:10:45.7100000' AS DateTime2), CAST(N'2021-01-24T02:10:45.7100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (466, N'7c9acec8-ea5d-eb11-a44f-7085c257c993', CAST(N'2021-01-24T02:20:54.7600000' AS DateTime2), CAST(N'2021-01-24T02:20:54.7600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (10369, N'76ec2f3e-5363-eb11-a450-7085c257c993', CAST(N'2021-01-30T23:31:15.1700000' AS DateTime2), CAST(N'2021-01-30T23:31:15.1700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (10370, N'f02bffec-5c63-eb11-a450-7085c257c993', CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (10371, N'cebef2cd-5e63-eb11-a450-7085c257c993', CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (10372, N'bb718a5f-6263-eb11-a450-7085c257c993', CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (10373, N'f3214498-6263-eb11-a450-7085c257c993', CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (10374, N'2df3a7a7-6363-eb11-a450-7085c257c993', CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (10375, N'9fccae01-6463-eb11-a450-7085c257c993', CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (10376, N'36e3fd27-6463-eb11-a450-7085c257c993', CAST(N'2021-01-31T01:32:19.3700000' AS DateTime2), CAST(N'2021-01-31T01:32:19.3700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (10377, N'234f6b50-6563-eb11-a450-7085c257c993', CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (10378, N'8b51b99d-6563-eb11-a450-7085c257c993', CAST(N'2021-01-31T01:42:46.3900000' AS DateTime2), CAST(N'2021-01-31T01:42:46.3900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20369, N'd4f46b55-da68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:20:52.0200000' AS DateTime2), CAST(N'2021-02-07T00:20:52.0200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20370, N'23c60b5f-da68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20371, N'6e866967-da68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20372, N'aad89ee0-da68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:24:45.5600000' AS DateTime2), CAST(N'2021-02-07T00:24:45.5600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20373, N'b8bbbf3d-dc68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:34:31.3000000' AS DateTime2), CAST(N'2021-02-07T00:34:31.3000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20374, N'b9bbbf3d-dc68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:34:36.0100000' AS DateTime2), CAST(N'2021-02-07T00:34:36.0100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20375, N'1106835a-dc68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:35:19.5500000' AS DateTime2), CAST(N'2021-02-07T00:35:19.5500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20376, N'0a3307a3-dd68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:44:30.7100000' AS DateTime2), CAST(N'2021-02-07T00:44:30.7100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20377, N'0b3307a3-dd68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20378, N'd04f99ae-dd68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:44:50.1300000' AS DateTime2), CAST(N'2021-02-07T00:44:50.1300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20379, N'd14f99ae-dd68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:44:51.9000000' AS DateTime2), CAST(N'2021-02-07T00:44:51.9000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20380, N'ef80d90a-de68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:47:24.9000000' AS DateTime2), CAST(N'2021-02-07T00:47:24.9000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20381, N'46d8ead7-de68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:53:08.9400000' AS DateTime2), CAST(N'2021-02-07T00:53:08.9400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20382, N'29ba1997-df68-eb11-a451-7085c257c993', CAST(N'2021-02-07T00:58:29.7000000' AS DateTime2), CAST(N'2021-02-07T00:58:29.7000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20383, N'e5b60403-e168-eb11-a451-7085c257c993', CAST(N'2021-02-07T01:08:40.2500000' AS DateTime2), CAST(N'2021-02-07T01:08:40.2500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20384, N'a934033c-e168-eb11-a451-7085c257c993', CAST(N'2021-02-07T01:10:15.8700000' AS DateTime2), CAST(N'2021-02-07T01:10:15.8700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20385, N'23484758-e168-eb11-a451-7085c257c993', CAST(N'2021-02-07T01:11:03.2900000' AS DateTime2), CAST(N'2021-02-07T01:11:03.2900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20386, N'56d1ba05-e368-eb11-a451-7085c257c993', CAST(N'2021-02-07T01:23:03.7900000' AS DateTime2), CAST(N'2021-02-07T01:23:03.7900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20387, N'5274939d-e468-eb11-a451-7085c257c993', CAST(N'2021-02-07T01:34:28.0400000' AS DateTime2), CAST(N'2021-02-07T01:34:28.0400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20388, N'741eef15-e568-eb11-a451-7085c257c993', CAST(N'2021-02-07T01:37:49.9700000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20389, N'751eef15-e568-eb11-a451-7085c257c993', CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20390, N'8a88e248-e568-eb11-a451-7085c257c993', CAST(N'2021-02-07T01:39:15.4500000' AS DateTime2), CAST(N'2021-02-07T01:39:15.4500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20391, N'32ebcf15-e668-eb11-a451-7085c257c993', CAST(N'2021-02-07T01:44:59.2600000' AS DateTime2), CAST(N'2021-02-07T01:44:59.2600000' AS DateTime2), 1, 0)
GO
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20392, N'bd0d00dd-e668-eb11-a451-7085c257c993', CAST(N'2021-02-07T01:50:33.4400000' AS DateTime2), CAST(N'2021-02-07T01:50:33.4400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20393, N'2dcc5b84-e768-eb11-a451-7085c257c993', CAST(N'2021-02-07T01:55:14.2200000' AS DateTime2), CAST(N'2021-02-07T01:55:14.2200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20394, N'58d0f44c-e968-eb11-a451-7085c257c993', CAST(N'2021-02-07T02:08:00.2700000' AS DateTime2), CAST(N'2021-02-07T02:08:00.2700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20395, N'221cb676-e968-eb11-a451-7085c257c993', CAST(N'2021-02-07T02:09:10.3200000' AS DateTime2), CAST(N'2021-02-07T02:09:10.3200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20396, N'db35550c-ea68-eb11-a451-7085c257c993', CAST(N'2021-02-07T02:13:21.3500000' AS DateTime2), CAST(N'2021-02-07T02:13:21.3500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20397, N'253df69c-ea68-eb11-a451-7085c257c993', CAST(N'2021-02-07T02:17:23.9900000' AS DateTime2), CAST(N'2021-02-07T02:17:23.9900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20398, N'befb17ad-eb68-eb11-a451-7085c257c993', CAST(N'2021-02-07T02:25:00.5500000' AS DateTime2), CAST(N'2021-02-07T02:25:00.5500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20399, N'b24ccde5-eb68-eb11-a451-7085c257c993', CAST(N'2021-02-07T02:26:35.7000000' AS DateTime2), CAST(N'2021-02-07T02:26:35.7000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20400, N'd07e569f-526e-eb11-a451-7085c257c993', CAST(N'2021-02-13T23:24:31.4500000' AS DateTime2), CAST(N'2021-02-13T23:24:31.4500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20401, N'44c7c1b1-526e-eb11-a451-7085c257c993', CAST(N'2021-02-13T23:25:02.3600000' AS DateTime2), CAST(N'2021-02-13T23:25:02.3600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20402, N'd882a2a4-546e-eb11-a451-7085c257c993', CAST(N'2021-02-13T23:38:59.3300000' AS DateTime2), CAST(N'2021-02-13T23:38:59.3300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20403, N'a062afe4-576e-eb11-a451-7085c257c993', CAST(N'2021-02-14T00:02:15.2800000' AS DateTime2), CAST(N'2021-02-14T00:02:15.2800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20404, N'ddcaeffe-576e-eb11-a451-7085c257c993', CAST(N'2021-02-14T00:02:59.3200000' AS DateTime2), CAST(N'2021-02-14T00:02:59.3200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20405, N'e8b21979-5a6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T00:20:43.2800000' AS DateTime2), CAST(N'2021-02-14T00:20:43.2800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20406, N'44cc57ac-5a6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T00:22:09.2400000' AS DateTime2), CAST(N'2021-02-14T00:22:09.2400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20407, N'a022c2e8-5b6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T00:31:00.1000000' AS DateTime2), CAST(N'2021-02-14T00:31:00.1000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20408, N'3552bc2b-5c6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T00:32:52.4700000' AS DateTime2), CAST(N'2021-02-14T00:32:52.4700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20409, N'e96cf6e7-5d6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T00:45:17.7600000' AS DateTime2), CAST(N'2021-02-14T00:45:17.7600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20410, N'23462e91-5e6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T00:50:01.6600000' AS DateTime2), CAST(N'2021-02-14T00:50:01.6600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20411, N'cf97302e-5f6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T00:54:25.0800000' AS DateTime2), CAST(N'2021-02-14T00:54:25.0800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20412, N'd5b0045a-5f6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T00:55:38.6100000' AS DateTime2), CAST(N'2021-02-14T00:55:38.6100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20413, N'a6c68f8b-5f6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T00:57:01.7300000' AS DateTime2), CAST(N'2021-02-14T00:57:01.7300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20414, N'2d636631-606e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:01:39.9600000' AS DateTime2), CAST(N'2021-02-14T01:01:39.9600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20415, N'2e636631-606e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:01:49.8200000' AS DateTime2), CAST(N'2021-02-14T01:01:49.8200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20416, N'bf37763e-606e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:02:01.8800000' AS DateTime2), CAST(N'2021-02-14T01:02:01.8800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20417, N'2a1bb97c-606e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:03:46.3300000' AS DateTime2), CAST(N'2021-02-14T01:03:46.3300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20418, N'101c5675-616e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:10:43.4400000' AS DateTime2), CAST(N'2021-02-14T01:10:43.4400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20419, N'c71f9917-626e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:15:15.6700000' AS DateTime2), CAST(N'2021-02-14T01:15:15.6700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20420, N'9417b91d-626e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:15:25.9400000' AS DateTime2), CAST(N'2021-02-14T01:15:25.9400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20421, N'012bab24-626e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20422, N'7efcaee1-626e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:20:54.7100000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20423, N'7ffcaee1-626e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20424, N'0568cd67-636e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:24:39.7200000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20425, N'0668cd67-636e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20426, N'46deead5-636e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:27:44.4700000' AS DateTime2), CAST(N'2021-02-14T01:27:44.4700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20427, N'47deead5-636e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20428, N'ca8ca9b5-646e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:33:59.8500000' AS DateTime2), CAST(N'2021-02-14T01:33:59.8500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20429, N'f52f0abd-646e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20430, N'3853c408-656e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:36:19.2700000' AS DateTime2), CAST(N'2021-02-14T01:36:19.2700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20431, N'3953c408-656e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:36:28.1700000' AS DateTime2), CAST(N'2021-02-14T01:36:28.1700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20432, N'53b69c96-656e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:40:17.2500000' AS DateTime2), CAST(N'2021-02-14T01:40:17.2500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20433, N'3ea882c1-656e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:41:29.2200000' AS DateTime2), CAST(N'2021-02-14T01:41:29.2200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20434, N'f90a603d-666e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:44:57.0300000' AS DateTime2), CAST(N'2021-02-14T01:44:57.0300000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20435, N'0c2f0176-666e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:46:32.0400000' AS DateTime2), CAST(N'2021-02-14T01:46:32.0400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20436, N'efdbe9bf-666e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:48:36.0400000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20437, N'f0dbe9bf-666e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20438, N'18de45ee-666e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:49:53.8200000' AS DateTime2), CAST(N'2021-02-14T01:49:53.8200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20439, N'57dbe182-676e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:54:03.1400000' AS DateTime2), CAST(N'2021-02-14T01:54:03.1400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20440, N'73a0ad12-686e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:58:04.3900000' AS DateTime2), CAST(N'2021-02-14T01:58:04.3900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20441, N'74a0ad12-686e-eb11-a451-7085c257c993', CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20442, N'7d20df9e-686e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:01:59.6000000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20443, N'7e20df9e-686e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20444, N'40d56fc5-686e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:03:04.3000000' AS DateTime2), CAST(N'2021-02-14T02:03:04.3000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20445, N'5061611c-696e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:05:30.1700000' AS DateTime2), CAST(N'2021-02-14T02:05:30.1700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20446, N'20fb3e6b-696e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:07:42.4800000' AS DateTime2), CAST(N'2021-02-14T02:07:42.4800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20447, N'e3e73e74-696e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:07:57.5800000' AS DateTime2), CAST(N'2021-02-14T02:07:57.5800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20448, N'b93df3b0-6a6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:16:48.9200000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20449, N'ba3df3b0-6a6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20450, N'6373c8d2-6a6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:17:45.6900000' AS DateTime2), CAST(N'2021-02-14T02:17:45.6900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20451, N'6473c8d2-6a6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20452, N'b076b4ed-6a6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:18:30.8500000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20453, N'b176b4ed-6a6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20454, N'ec1c7048-6b6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:21:03.0800000' AS DateTime2), CAST(N'2021-02-14T02:21:03.0800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20455, N'f79d45ac-6b6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:23:50.5700000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5700000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20456, N'f89d45ac-6b6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20457, N'268ea0d3-6b6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:24:56.6000000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6000000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20458, N'278ea0d3-6b6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20459, N'68e998e1-6b6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:25:20.0400000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20460, N'69e998e1-6b6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20461, N'fef3ae17-6c6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:26:50.7800000' AS DateTime2), CAST(N'2021-02-14T02:26:50.7800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20462, N'052cf25e-6c6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:28:50.3400000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3400000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20463, N'062cf25e-6c6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20464, N'54aa4583-6c6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:29:51.2800000' AS DateTime2), CAST(N'2021-02-14T02:29:51.2800000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20465, N'1b048f93-6c6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:30:18.6100000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6100000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20466, N'1c048f93-6c6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20467, N'f2d221e5-6d6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:39:44.9600000' AS DateTime2), CAST(N'2021-02-14T02:39:44.9600000' AS DateTime2), 1, 0)
INSERT [Entities].[Entities] ([EntityId], [PublicId], [DateCreated], [DateModified], [IsPublic], [IsDeleted]) VALUES (20468, N'5a3738f2-6d6e-eb11-a451-7085c257c993', CAST(N'2021-02-14T02:40:06.9200000' AS DateTime2), CAST(N'2021-02-14T02:40:06.9200000' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [Entities].[Entities] OFF
SET IDENTITY_INSERT [Entities].[Names] ON

INSERT [Entities].[Names] ([NameId], [DateCreated], [DateModified], [Name]) VALUES (1, CAST(N'2021-01-02T23:03:17.4900000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4900000' AS DateTime2), N'Test Campaign')
INSERT [Entities].[Names] ([NameId], [DateCreated], [DateModified], [Name]) VALUES (2, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), N'Ctrirr')
INSERT [Entities].[Names] ([NameId], [DateCreated], [DateModified], [Name]) VALUES (3, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), N'Bobbit Brandytook')
INSERT [Entities].[Names] ([NameId], [DateCreated], [DateModified], [Name]) VALUES (4, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), N'Lehavah Aelynn')
INSERT [Entities].[Names] ([NameId], [DateCreated], [DateModified], [Name]) VALUES (5, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), N'Atsu du Corrigor')
SET IDENTITY_INSERT [Entities].[Names] OFF
SET IDENTITY_INSERT [Games].[Campaigns] ON

INSERT [Games].[Campaigns] ([CampaignId], [EntityId], [DateCreated], [DateModified], [NameId]) VALUES (1, 1, CAST(N'2021-01-02T23:03:17.4900000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4900000' AS DateTime2), 1)
INSERT [Games].[Campaigns] ([CampaignId], [EntityId], [DateCreated], [DateModified], [NameId]) VALUES (2, 7, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), 2)
SET IDENTITY_INSERT [Games].[Campaigns] OFF
SET IDENTITY_INSERT [Games].[Characters] ON

INSERT [Games].[Characters] ([CharacterId], [EntityId], [DateCreated], [DateModified], [NameId]) VALUES (1, 8, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), 3)
INSERT [Games].[Characters] ([CharacterId], [EntityId], [DateCreated], [DateModified], [NameId]) VALUES (2, 9, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), 4)
INSERT [Games].[Characters] ([CharacterId], [EntityId], [DateCreated], [DateModified], [NameId]) VALUES (3, 10, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), 5)
SET IDENTITY_INSERT [Games].[Characters] OFF
SET IDENTITY_INSERT [Games].[CharactersToCampaigns] ON

INSERT [Games].[CharactersToCampaigns] ([CharactersToCampaignsId], [DateCreated], [DateModified], [CharacterId], [CampaignId]) VALUES (1, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), 1, 2)
INSERT [Games].[CharactersToCampaigns] ([CharactersToCampaignsId], [DateCreated], [DateModified], [CharacterId], [CampaignId]) VALUES (2, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), 2, 2)
INSERT [Games].[CharactersToCampaigns] ([CharactersToCampaignsId], [DateCreated], [DateModified], [CharacterId], [CampaignId]) VALUES (3, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), 3, 2)
SET IDENTITY_INSERT [Games].[CharactersToCampaigns] OFF
SET IDENTITY_INSERT [Rolls].[AttackRolls] ON

INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (1, CAST(N'2021-01-02T23:53:09.1900000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1900000' AS DateTime2), 6, 7, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (2, CAST(N'2021-01-02T23:56:24.7600000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7600000' AS DateTime2), 7, 9, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (3, CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), 8, 11, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (4, CAST(N'2021-01-03T00:03:28.0700000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0700000' AS DateTime2), 9, 13, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (5, CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), 10, 15, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (6, CAST(N'2021-01-03T00:39:52.7900000' AS DateTime2), CAST(N'2021-01-03T00:39:52.7900000' AS DateTime2), 20, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (7, CAST(N'2021-01-03T00:41:06.7400000' AS DateTime2), CAST(N'2021-01-03T00:41:06.7400000' AS DateTime2), 21, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (8, CAST(N'2021-01-03T00:42:05.9400000' AS DateTime2), CAST(N'2021-01-03T00:42:05.9400000' AS DateTime2), 22, 28, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (9, CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), 23, 30, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (10, CAST(N'2021-01-03T00:47:21.0600000' AS DateTime2), CAST(N'2021-01-03T00:47:21.0600000' AS DateTime2), 24, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (11, CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), 25, 33, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (12, CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), 27, 36, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (13, CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), 38, 48, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (14, CAST(N'2021-01-09T16:35:23.3200000' AS DateTime2), CAST(N'2021-01-09T16:35:23.3200000' AS DateTime2), 59, 70, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (15, CAST(N'2021-01-09T16:42:21.3100000' AS DateTime2), CAST(N'2021-01-09T16:42:21.3100000' AS DateTime2), 60, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (16, CAST(N'2021-01-09T16:48:36.4100000' AS DateTime2), CAST(N'2021-01-09T16:48:36.4100000' AS DateTime2), 62, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (17, CAST(N'2021-01-09T16:48:39.1100000' AS DateTime2), CAST(N'2021-01-09T16:48:39.1100000' AS DateTime2), 63, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (18, CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), 64, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (19, CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), 67, 83, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (20, CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), 68, 85, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (21, CAST(N'2021-01-09T18:45:12.8500000' AS DateTime2), CAST(N'2021-01-09T18:45:12.8500000' AS DateTime2), 69, 87, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (22, CAST(N'2021-01-09T19:37:39.2300000' AS DateTime2), CAST(N'2021-01-09T19:37:39.2300000' AS DateTime2), 106, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (23, CAST(N'2021-01-09T19:37:39.4900000' AS DateTime2), CAST(N'2021-01-09T19:37:39.4900000' AS DateTime2), 107, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (24, CAST(N'2021-01-09T19:37:39.8800000' AS DateTime2), CAST(N'2021-01-09T19:37:39.8800000' AS DateTime2), 108, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (25, CAST(N'2021-01-09T19:37:40.2300000' AS DateTime2), CAST(N'2021-01-09T19:37:40.2300000' AS DateTime2), 109, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (26, CAST(N'2021-01-09T19:37:40.4700000' AS DateTime2), CAST(N'2021-01-09T19:37:40.4700000' AS DateTime2), 110, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (27, CAST(N'2021-01-09T19:37:40.6400000' AS DateTime2), CAST(N'2021-01-09T19:37:40.6400000' AS DateTime2), 111, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (28, CAST(N'2021-01-09T19:37:40.8100000' AS DateTime2), CAST(N'2021-01-09T19:37:40.8100000' AS DateTime2), 112, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (29, CAST(N'2021-01-09T19:37:41.0000000' AS DateTime2), CAST(N'2021-01-09T19:37:41.0000000' AS DateTime2), 113, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (30, CAST(N'2021-01-09T19:37:41.1600000' AS DateTime2), CAST(N'2021-01-09T19:37:41.1600000' AS DateTime2), 114, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (31, CAST(N'2021-01-09T19:37:41.3300000' AS DateTime2), CAST(N'2021-01-09T19:37:41.3300000' AS DateTime2), 115, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (32, CAST(N'2021-01-09T19:37:41.4800000' AS DateTime2), CAST(N'2021-01-09T19:37:41.4800000' AS DateTime2), 116, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (33, CAST(N'2021-01-09T19:37:41.6500000' AS DateTime2), CAST(N'2021-01-09T19:37:41.6500000' AS DateTime2), 117, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (34, CAST(N'2021-01-09T19:37:41.8200000' AS DateTime2), CAST(N'2021-01-09T19:37:41.8200000' AS DateTime2), 118, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (35, CAST(N'2021-01-09T19:37:41.9900000' AS DateTime2), CAST(N'2021-01-09T19:37:41.9900000' AS DateTime2), 119, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (36, CAST(N'2021-01-09T19:37:42.2000000' AS DateTime2), CAST(N'2021-01-09T19:37:42.2000000' AS DateTime2), 120, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (37, CAST(N'2021-01-09T19:37:42.3100000' AS DateTime2), CAST(N'2021-01-09T19:37:42.3100000' AS DateTime2), 121, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (38, CAST(N'2021-01-09T19:37:42.4900000' AS DateTime2), CAST(N'2021-01-09T19:37:42.4900000' AS DateTime2), 122, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (39, CAST(N'2021-01-09T19:37:42.6600000' AS DateTime2), CAST(N'2021-01-09T19:37:42.6600000' AS DateTime2), 123, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (40, CAST(N'2021-01-09T19:37:42.8200000' AS DateTime2), CAST(N'2021-01-09T19:37:42.8200000' AS DateTime2), 124, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (41, CAST(N'2021-01-09T19:37:43.0100000' AS DateTime2), CAST(N'2021-01-09T19:37:43.0100000' AS DateTime2), 125, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (42, CAST(N'2021-01-09T19:37:43.1700000' AS DateTime2), CAST(N'2021-01-09T19:37:43.1700000' AS DateTime2), 126, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (43, CAST(N'2021-01-09T19:37:43.3200000' AS DateTime2), CAST(N'2021-01-09T19:37:43.3200000' AS DateTime2), 127, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (44, CAST(N'2021-01-09T19:37:43.4900000' AS DateTime2), CAST(N'2021-01-09T19:37:43.4900000' AS DateTime2), 128, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (45, CAST(N'2021-01-09T19:37:43.6600000' AS DateTime2), CAST(N'2021-01-09T19:37:43.6600000' AS DateTime2), 129, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (46, CAST(N'2021-01-09T19:37:43.8400000' AS DateTime2), CAST(N'2021-01-09T19:37:43.8400000' AS DateTime2), 130, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (47, CAST(N'2021-01-09T19:37:44.0100000' AS DateTime2), CAST(N'2021-01-09T19:37:44.0100000' AS DateTime2), 131, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (48, CAST(N'2021-01-09T19:37:44.2200000' AS DateTime2), CAST(N'2021-01-09T19:37:44.2200000' AS DateTime2), 132, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (49, CAST(N'2021-01-09T19:37:44.4400000' AS DateTime2), CAST(N'2021-01-09T19:37:44.4400000' AS DateTime2), 133, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (50, CAST(N'2021-01-09T19:37:44.7200000' AS DateTime2), CAST(N'2021-01-09T19:37:44.7200000' AS DateTime2), 134, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (51, CAST(N'2021-01-09T19:37:45.1400000' AS DateTime2), CAST(N'2021-01-09T19:37:45.1400000' AS DateTime2), 135, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (52, CAST(N'2021-01-09T19:37:45.5200000' AS DateTime2), CAST(N'2021-01-09T19:37:45.5200000' AS DateTime2), 136, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (53, CAST(N'2021-01-09T19:37:45.9600000' AS DateTime2), CAST(N'2021-01-09T19:37:45.9600000' AS DateTime2), 137, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (54, CAST(N'2021-01-09T19:37:46.6600000' AS DateTime2), CAST(N'2021-01-09T19:37:46.6600000' AS DateTime2), 138, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (55, CAST(N'2021-01-16T00:37:56.8500000' AS DateTime2), CAST(N'2021-01-16T00:37:56.8500000' AS DateTime2), 165, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (56, CAST(N'2021-01-16T23:36:53.9500000' AS DateTime2), CAST(N'2021-01-16T23:36:53.9500000' AS DateTime2), 220, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (57, CAST(N'2021-01-16T23:40:08.1200000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1200000' AS DateTime2), 221, 267, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (58, CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), 223, 270, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (59, CAST(N'2021-01-16T23:47:35.2600000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2600000' AS DateTime2), 224, 272, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (60, CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), 225, 274, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (61, CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), 226, 276, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (62, CAST(N'2021-01-17T00:12:36.6300000' AS DateTime2), CAST(N'2021-01-17T00:12:36.6300000' AS DateTime2), 227, 278, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (63, CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), 228, 280, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (64, CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), 229, 282, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (65, CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), 230, 284, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (66, CAST(N'2021-01-17T00:13:03.7500000' AS DateTime2), CAST(N'2021-01-17T00:13:03.7500000' AS DateTime2), 231, 286, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (67, CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), 232, 288, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (68, CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), 233, 290, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (69, CAST(N'2021-01-17T00:13:44.8800000' AS DateTime2), CAST(N'2021-01-17T00:13:44.8800000' AS DateTime2), 234, 292, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (70, CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), 235, 294, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (71, CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), 236, 296, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (72, CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), 237, 298, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (73, CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), 238, 300, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (74, CAST(N'2021-01-17T00:15:06.3600000' AS DateTime2), CAST(N'2021-01-17T00:15:06.3600000' AS DateTime2), 239, 302, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (75, CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), 240, 304, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (76, CAST(N'2021-01-17T00:15:10.4400000' AS DateTime2), CAST(N'2021-01-17T00:15:10.4400000' AS DateTime2), 241, 306, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (77, CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), 242, 308, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (78, CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), 249, 319, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (79, CAST(N'2021-01-17T00:48:47.4700000' AS DateTime2), CAST(N'2021-01-17T00:48:47.4700000' AS DateTime2), 250, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (80, CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), 251, 322, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (81, CAST(N'2021-01-17T01:05:21.8600000' AS DateTime2), CAST(N'2021-01-17T01:05:21.8600000' AS DateTime2), 255, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (82, CAST(N'2021-01-17T01:12:20.5500000' AS DateTime2), CAST(N'2021-01-17T01:12:20.5500000' AS DateTime2), 257, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (83, CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), 258, 330, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (84, CAST(N'2021-01-17T01:33:32.7100000' AS DateTime2), CAST(N'2021-01-17T01:33:32.7100000' AS DateTime2), 259, 332, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (85, CAST(N'2021-01-17T01:35:27.6800000' AS DateTime2), CAST(N'2021-01-17T01:35:27.6800000' AS DateTime2), 260, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (86, CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), 261, 335, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (87, CAST(N'2021-01-17T01:42:59.4800000' AS DateTime2), CAST(N'2021-01-17T01:42:59.4800000' AS DateTime2), 262, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (88, CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), 264, 339, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (89, CAST(N'2021-01-17T01:45:51.2800000' AS DateTime2), CAST(N'2021-01-17T01:45:51.2800000' AS DateTime2), 265, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (90, CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), 266, 342, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (91, CAST(N'2021-01-17T01:53:45.4900000' AS DateTime2), CAST(N'2021-01-17T01:53:45.4900000' AS DateTime2), 267, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (92, CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), 268, 345, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (93, CAST(N'2021-01-17T01:56:01.1100000' AS DateTime2), CAST(N'2021-01-17T01:56:01.1100000' AS DateTime2), 269, 347, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (94, CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), 270, 349, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (95, CAST(N'2021-01-17T02:06:30.6100000' AS DateTime2), CAST(N'2021-01-17T02:06:30.6100000' AS DateTime2), 271, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (96, CAST(N'2021-01-17T02:12:25.2200000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2200000' AS DateTime2), 272, 352, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (97, CAST(N'2021-01-17T02:13:19.3600000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3600000' AS DateTime2), 273, 354, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (98, CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), 274, 356, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (99, CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), 275, 358, 1)
GO
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (100, CAST(N'2021-01-23T23:45:57.3000000' AS DateTime2), CAST(N'2021-01-23T23:45:57.3000000' AS DateTime2), 282, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (101, CAST(N'2021-01-23T23:52:36.5900000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5900000' AS DateTime2), 284, 371, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (102, CAST(N'2021-01-23T23:54:32.1900000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1900000' AS DateTime2), 285, 373, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (103, CAST(N'2021-01-24T00:10:48.2400000' AS DateTime2), CAST(N'2021-01-24T00:10:48.2400000' AS DateTime2), 288, 380, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (104, CAST(N'2021-01-24T00:11:30.1300000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1300000' AS DateTime2), 289, 382, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (105, CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), 290, 384, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (106, CAST(N'2021-01-24T00:14:37.6000000' AS DateTime2), CAST(N'2021-01-24T00:14:37.6000000' AS DateTime2), 291, 386, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (107, CAST(N'2021-01-24T00:16:28.1800000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1800000' AS DateTime2), 292, 388, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (108, CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), 293, 390, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (109, CAST(N'2021-01-24T00:17:48.1700000' AS DateTime2), CAST(N'2021-01-24T00:17:48.1700000' AS DateTime2), 294, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (110, CAST(N'2021-01-24T00:19:25.6100000' AS DateTime2), CAST(N'2021-01-24T00:19:25.6100000' AS DateTime2), 295, 393, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (111, CAST(N'2021-01-24T00:20:25.5600000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5600000' AS DateTime2), 296, 395, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (112, CAST(N'2021-01-24T00:21:09.4900000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4900000' AS DateTime2), 297, 397, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (113, CAST(N'2021-01-24T00:21:59.8400000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8400000' AS DateTime2), 298, 399, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (114, CAST(N'2021-01-24T00:23:04.1000000' AS DateTime2), CAST(N'2021-01-24T00:23:04.1000000' AS DateTime2), 299, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (115, CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), 300, 402, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (116, CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), 301, 404, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (117, CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), 302, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (118, CAST(N'2021-01-24T00:26:09.5800000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5800000' AS DateTime2), 303, 407, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (119, CAST(N'2021-01-24T00:31:12.3900000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3900000' AS DateTime2), 304, 409, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (120, CAST(N'2021-01-24T00:40:36.4800000' AS DateTime2), CAST(N'2021-01-24T00:40:36.4800000' AS DateTime2), 305, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (121, CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), 306, 415, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (122, CAST(N'2021-01-24T00:41:26.9500000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9500000' AS DateTime2), 307, 417, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (123, CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), 308, 419, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (124, CAST(N'2021-01-24T00:47:34.0000000' AS DateTime2), CAST(N'2021-01-24T00:47:34.0000000' AS DateTime2), 309, 421, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (125, CAST(N'2021-01-24T00:48:36.8300000' AS DateTime2), CAST(N'2021-01-24T00:48:36.8300000' AS DateTime2), 310, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (126, CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), 311, NULL, NULL)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (127, CAST(N'2021-01-24T00:50:42.6500000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6500000' AS DateTime2), 312, 425, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (128, CAST(N'2021-01-24T00:52:57.6400000' AS DateTime2), CAST(N'2021-01-24T00:52:57.6400000' AS DateTime2), 313, 427, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (129, CAST(N'2021-01-24T00:54:45.4000000' AS DateTime2), CAST(N'2021-01-24T00:54:45.4000000' AS DateTime2), 314, 429, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (130, CAST(N'2021-01-24T00:55:23.2600000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2600000' AS DateTime2), 315, 431, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (131, CAST(N'2021-01-24T00:56:42.4400000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4400000' AS DateTime2), 316, 433, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (132, CAST(N'2021-01-24T00:57:30.0000000' AS DateTime2), CAST(N'2021-01-24T00:57:30.0000000' AS DateTime2), 317, 435, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (133, CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), 318, 437, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (134, CAST(N'2021-01-24T00:59:18.3900000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3900000' AS DateTime2), 319, 439, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (135, CAST(N'2021-01-24T00:59:50.0700000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0700000' AS DateTime2), 320, 441, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (136, CAST(N'2021-01-24T01:00:24.8800000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8800000' AS DateTime2), 321, 443, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (137, CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), 322, 445, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (138, CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), 323, 447, 1)
INSERT [Rolls].[AttackRolls] ([AttackRollId], [DateCreated], [DateModified], [HitRollId], [DamageRollId], [DamageSourceId]) VALUES (139, CAST(N'2021-01-24T02:20:54.7800000' AS DateTime2), CAST(N'2021-01-24T02:20:54.7800000' AS DateTime2), 330, NULL, NULL)
SET IDENTITY_INSERT [Rolls].[AttackRolls] OFF
SET IDENTITY_INSERT [Rolls].[DamageSources] ON

INSERT [Rolls].[DamageSources] ([DamageSourceId], [DateCreated], [DateModified], [DamageTypeId], [Name]) VALUES (1, CAST(N'2021-01-02T23:53:09.1900000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1900000' AS DateTime2), 1, N'')
INSERT [Rolls].[DamageSources] ([DamageSourceId], [DateCreated], [DateModified], [DamageTypeId], [Name]) VALUES (2, CAST(N'2021-01-03T01:19:59.9500000' AS DateTime2), CAST(N'2021-01-03T01:19:59.9500000' AS DateTime2), 2, N'foo')
SET IDENTITY_INSERT [Rolls].[DamageSources] OFF
SET IDENTITY_INSERT [Rolls].[DamageTypes] ON

INSERT [Rolls].[DamageTypes] ([DamageTypeId], [DateCreated], [DateModified], [Name]) VALUES (1, CAST(N'2021-01-02T23:53:09.1900000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1900000' AS DateTime2), N'')
INSERT [Rolls].[DamageTypes] ([DamageTypeId], [DateCreated], [DateModified], [Name]) VALUES (2, CAST(N'2021-01-03T01:19:59.9400000' AS DateTime2), CAST(N'2021-01-03T01:19:59.9400000' AS DateTime2), N'bar')
SET IDENTITY_INSERT [Rolls].[DamageTypes] OFF
INSERT [Rolls].[DieTypes] ([DieTypeId], [DateCreated], [DateModified], [DisplayName]) VALUES (4, CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), N'D4')
INSERT [Rolls].[DieTypes] ([DieTypeId], [DateCreated], [DateModified], [DisplayName]) VALUES (6, CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), N'D6')
INSERT [Rolls].[DieTypes] ([DieTypeId], [DateCreated], [DateModified], [DisplayName]) VALUES (8, CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), N'D8')
INSERT [Rolls].[DieTypes] ([DieTypeId], [DateCreated], [DateModified], [DisplayName]) VALUES (10, CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), N'D10')
INSERT [Rolls].[DieTypes] ([DieTypeId], [DateCreated], [DateModified], [DisplayName]) VALUES (12, CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), N'D12')
INSERT [Rolls].[DieTypes] ([DieTypeId], [DateCreated], [DateModified], [DisplayName]) VALUES (20, CAST(N'2021-01-02T23:03:17.4800000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4800000' AS DateTime2), N'D20')
INSERT [Rolls].[DieTypes] ([DieTypeId], [DateCreated], [DateModified], [DisplayName]) VALUES (100, CAST(N'2021-01-02T23:03:17.4800000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4800000' AS DateTime2), N'D100')
SET IDENTITY_INSERT [Rolls].[IndividualRolls] ON

INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (1, CAST(N'2021-01-02T23:03:17.5100000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5100000' AS DateTime2), 1, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (2, CAST(N'2021-01-02T23:37:41.8000000' AS DateTime2), CAST(N'2021-01-02T23:37:41.8000000' AS DateTime2), 2, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (3, CAST(N'2021-01-02T23:47:43.2600000' AS DateTime2), CAST(N'2021-01-02T23:47:43.2600000' AS DateTime2), 3, 20, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (4, CAST(N'2021-01-02T23:47:55.0800000' AS DateTime2), CAST(N'2021-01-02T23:47:55.0800000' AS DateTime2), 4, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (5, CAST(N'2021-01-02T23:48:23.1500000' AS DateTime2), CAST(N'2021-01-02T23:48:23.1500000' AS DateTime2), 5, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (6, CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), 6, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (7, CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), 7, 10, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (8, CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), 8, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (9, CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), 9, 10, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (10, CAST(N'2021-01-03T00:01:23.0700000' AS DateTime2), CAST(N'2021-01-03T00:01:23.0700000' AS DateTime2), 10, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (11, CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), 11, 10, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (12, CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), 12, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (13, CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), 13, 4, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (14, CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), 14, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (15, CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), 15, 10, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (16, CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), 16, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (17, CAST(N'2021-01-03T00:10:34.6100000' AS DateTime2), CAST(N'2021-01-03T00:10:34.6100000' AS DateTime2), 17, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (18, CAST(N'2021-01-03T00:32:24.9600000' AS DateTime2), CAST(N'2021-01-03T00:32:24.9600000' AS DateTime2), 18, 20, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (19, CAST(N'2021-01-03T00:34:19.1200000' AS DateTime2), CAST(N'2021-01-03T00:34:19.1200000' AS DateTime2), 19, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20, CAST(N'2021-01-03T00:35:06.6900000' AS DateTime2), CAST(N'2021-01-03T00:35:06.6900000' AS DateTime2), 20, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (21, CAST(N'2021-01-03T00:35:14.7400000' AS DateTime2), CAST(N'2021-01-03T00:35:14.7400000' AS DateTime2), 21, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (22, CAST(N'2021-01-03T00:36:08.4300000' AS DateTime2), CAST(N'2021-01-03T00:36:08.4300000' AS DateTime2), 22, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (23, CAST(N'2021-01-03T00:36:15.3400000' AS DateTime2), CAST(N'2021-01-03T00:36:15.3400000' AS DateTime2), 23, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (24, CAST(N'2021-01-03T00:36:25.3300000' AS DateTime2), CAST(N'2021-01-03T00:36:25.3300000' AS DateTime2), 24, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (25, CAST(N'2021-01-03T00:39:52.7900000' AS DateTime2), CAST(N'2021-01-03T00:39:52.7900000' AS DateTime2), 25, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (26, CAST(N'2021-01-03T00:41:06.7400000' AS DateTime2), CAST(N'2021-01-03T00:41:06.7400000' AS DateTime2), 26, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (27, CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), 27, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (28, CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), 28, 4, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (29, CAST(N'2021-01-03T00:44:25.0500000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0500000' AS DateTime2), 29, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (30, CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), 30, 10, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (31, CAST(N'2021-01-03T00:47:21.0600000' AS DateTime2), CAST(N'2021-01-03T00:47:21.0600000' AS DateTime2), 31, 20, 8)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (32, CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), 32, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (33, CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), 33, 10, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (34, CAST(N'2021-01-03T00:53:24.9200000' AS DateTime2), CAST(N'2021-01-03T00:53:24.9200000' AS DateTime2), 34, 20, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (35, CAST(N'2021-01-03T00:54:40.1400000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1400000' AS DateTime2), 35, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (36, CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), 36, 10, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (37, CAST(N'2021-01-03T00:55:01.2300000' AS DateTime2), CAST(N'2021-01-03T00:55:01.2300000' AS DateTime2), 37, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (38, CAST(N'2021-01-03T00:59:20.2300000' AS DateTime2), CAST(N'2021-01-03T00:59:20.2300000' AS DateTime2), 38, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (39, CAST(N'2021-01-03T01:00:03.4100000' AS DateTime2), CAST(N'2021-01-03T01:00:03.4100000' AS DateTime2), 39, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (40, CAST(N'2021-01-03T01:01:45.0000000' AS DateTime2), CAST(N'2021-01-03T01:01:45.0000000' AS DateTime2), 40, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (41, CAST(N'2021-01-03T01:02:55.4000000' AS DateTime2), CAST(N'2021-01-03T01:02:55.4000000' AS DateTime2), 41, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (42, CAST(N'2021-01-03T01:04:37.6000000' AS DateTime2), CAST(N'2021-01-03T01:04:37.6000000' AS DateTime2), 42, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (43, CAST(N'2021-01-03T01:04:53.0400000' AS DateTime2), CAST(N'2021-01-03T01:04:53.0400000' AS DateTime2), 43, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (44, CAST(N'2021-01-03T01:04:59.7000000' AS DateTime2), CAST(N'2021-01-03T01:04:59.7000000' AS DateTime2), 44, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (45, CAST(N'2021-01-03T01:22:24.2900000' AS DateTime2), CAST(N'2021-01-03T01:22:24.2900000' AS DateTime2), 45, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (46, CAST(N'2021-01-03T01:27:36.8800000' AS DateTime2), CAST(N'2021-01-03T01:27:36.8800000' AS DateTime2), 46, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (47, CAST(N'2021-01-03T01:43:57.1900000' AS DateTime2), CAST(N'2021-01-03T01:43:57.1900000' AS DateTime2), 47, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (48, CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), 48, 8, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (49, CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), 48, 8, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (50, CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), 48, 8, 8)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (51, CAST(N'2021-01-03T01:46:42.2900000' AS DateTime2), CAST(N'2021-01-03T01:46:42.2900000' AS DateTime2), 49, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (52, CAST(N'2021-01-03T01:49:06.7600000' AS DateTime2), CAST(N'2021-01-03T01:49:06.7600000' AS DateTime2), 50, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (53, CAST(N'2021-01-03T01:53:35.9100000' AS DateTime2), CAST(N'2021-01-03T01:53:35.9100000' AS DateTime2), 51, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (54, CAST(N'2021-01-03T01:59:19.1600000' AS DateTime2), CAST(N'2021-01-03T01:59:19.1600000' AS DateTime2), 52, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (55, CAST(N'2021-01-03T01:59:23.4700000' AS DateTime2), CAST(N'2021-01-03T01:59:23.4700000' AS DateTime2), 53, 20, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (56, CAST(N'2021-01-03T02:00:14.9300000' AS DateTime2), CAST(N'2021-01-03T02:00:14.9300000' AS DateTime2), 54, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (57, CAST(N'2021-01-03T02:24:56.8800000' AS DateTime2), CAST(N'2021-01-03T02:24:56.8800000' AS DateTime2), 55, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (58, CAST(N'2021-01-03T02:53:27.6100000' AS DateTime2), CAST(N'2021-01-03T02:53:27.6100000' AS DateTime2), 56, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (59, CAST(N'2021-01-03T02:54:22.1500000' AS DateTime2), CAST(N'2021-01-03T02:54:22.1500000' AS DateTime2), 57, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (60, CAST(N'2021-01-03T02:54:24.6200000' AS DateTime2), CAST(N'2021-01-03T02:54:24.6200000' AS DateTime2), 58, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (61, CAST(N'2021-01-03T02:54:33.1900000' AS DateTime2), CAST(N'2021-01-03T02:54:33.1900000' AS DateTime2), 59, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (62, CAST(N'2021-01-03T02:54:39.1300000' AS DateTime2), CAST(N'2021-01-03T02:54:39.1300000' AS DateTime2), 60, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (63, CAST(N'2021-01-03T02:55:26.3100000' AS DateTime2), CAST(N'2021-01-03T02:55:26.3100000' AS DateTime2), 61, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (64, CAST(N'2021-01-03T02:55:37.8700000' AS DateTime2), CAST(N'2021-01-03T02:55:37.8700000' AS DateTime2), 62, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (65, CAST(N'2021-01-03T02:56:25.8500000' AS DateTime2), CAST(N'2021-01-03T02:56:25.8500000' AS DateTime2), 63, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (66, CAST(N'2021-01-03T02:56:40.4500000' AS DateTime2), CAST(N'2021-01-03T02:56:40.4500000' AS DateTime2), 64, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (67, CAST(N'2021-01-03T03:00:25.2900000' AS DateTime2), CAST(N'2021-01-03T03:00:25.2900000' AS DateTime2), 65, 20, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (68, CAST(N'2021-01-03T03:00:33.6200000' AS DateTime2), CAST(N'2021-01-03T03:00:33.6200000' AS DateTime2), 66, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (69, CAST(N'2021-01-09T16:22:17.0100000' AS DateTime2), CAST(N'2021-01-09T16:22:17.0100000' AS DateTime2), 67, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (70, CAST(N'2021-01-09T16:23:23.6400000' AS DateTime2), CAST(N'2021-01-09T16:23:23.6400000' AS DateTime2), 68, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (71, CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), 69, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (72, CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), 70, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (73, CAST(N'2021-01-09T16:42:21.3000000' AS DateTime2), CAST(N'2021-01-09T16:42:21.3000000' AS DateTime2), 71, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (74, CAST(N'2021-01-09T16:45:31.4500000' AS DateTime2), CAST(N'2021-01-09T16:45:31.4500000' AS DateTime2), 72, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (75, CAST(N'2021-01-09T16:45:59.4000000' AS DateTime2), CAST(N'2021-01-09T16:45:59.4000000' AS DateTime2), 73, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (76, CAST(N'2021-01-09T16:46:02.6600000' AS DateTime2), CAST(N'2021-01-09T16:46:02.6600000' AS DateTime2), 74, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (77, CAST(N'2021-01-09T16:46:04.1500000' AS DateTime2), CAST(N'2021-01-09T16:46:04.1500000' AS DateTime2), 75, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (78, CAST(N'2021-01-09T16:46:42.8600000' AS DateTime2), CAST(N'2021-01-09T16:46:42.8600000' AS DateTime2), 76, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (79, CAST(N'2021-01-09T16:48:36.4000000' AS DateTime2), CAST(N'2021-01-09T16:48:36.4000000' AS DateTime2), 77, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (80, CAST(N'2021-01-09T16:48:39.1100000' AS DateTime2), CAST(N'2021-01-09T16:48:39.1100000' AS DateTime2), 78, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (81, CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), 79, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (82, CAST(N'2021-01-09T16:52:52.1600000' AS DateTime2), CAST(N'2021-01-09T16:52:52.1600000' AS DateTime2), 80, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (83, CAST(N'2021-01-09T17:50:13.2800000' AS DateTime2), CAST(N'2021-01-09T17:50:13.2800000' AS DateTime2), 81, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (84, CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), 82, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (85, CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), 83, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (86, CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), 84, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (87, CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), 85, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (88, CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), 86, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (89, CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), 87, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (90, CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), 87, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (91, CAST(N'2021-01-09T19:35:06.7700000' AS DateTime2), CAST(N'2021-01-09T19:35:06.7700000' AS DateTime2), 88, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (92, CAST(N'2021-01-09T19:35:10.3500000' AS DateTime2), CAST(N'2021-01-09T19:35:10.3500000' AS DateTime2), 89, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (93, CAST(N'2021-01-09T19:35:11.0200000' AS DateTime2), CAST(N'2021-01-09T19:35:11.0200000' AS DateTime2), 90, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (94, CAST(N'2021-01-09T19:35:11.5400000' AS DateTime2), CAST(N'2021-01-09T19:35:11.5400000' AS DateTime2), 91, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (95, CAST(N'2021-01-09T19:35:12.0100000' AS DateTime2), CAST(N'2021-01-09T19:35:12.0100000' AS DateTime2), 92, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (96, CAST(N'2021-01-09T19:35:12.6300000' AS DateTime2), CAST(N'2021-01-09T19:35:12.6300000' AS DateTime2), 93, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (97, CAST(N'2021-01-09T19:35:12.9500000' AS DateTime2), CAST(N'2021-01-09T19:35:12.9500000' AS DateTime2), 94, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (98, CAST(N'2021-01-09T19:35:13.1600000' AS DateTime2), CAST(N'2021-01-09T19:35:13.1600000' AS DateTime2), 95, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (99, CAST(N'2021-01-09T19:35:13.3400000' AS DateTime2), CAST(N'2021-01-09T19:35:13.3400000' AS DateTime2), 96, 20, 1)
GO
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (100, CAST(N'2021-01-09T19:35:13.5200000' AS DateTime2), CAST(N'2021-01-09T19:35:13.5200000' AS DateTime2), 97, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (101, CAST(N'2021-01-09T19:35:13.6700000' AS DateTime2), CAST(N'2021-01-09T19:35:13.6700000' AS DateTime2), 98, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (102, CAST(N'2021-01-09T19:35:13.8300000' AS DateTime2), CAST(N'2021-01-09T19:35:13.8300000' AS DateTime2), 99, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (103, CAST(N'2021-01-09T19:35:13.9800000' AS DateTime2), CAST(N'2021-01-09T19:35:13.9800000' AS DateTime2), 100, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (104, CAST(N'2021-01-09T19:35:14.2600000' AS DateTime2), CAST(N'2021-01-09T19:35:14.2600000' AS DateTime2), 101, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (105, CAST(N'2021-01-09T19:35:14.3900000' AS DateTime2), CAST(N'2021-01-09T19:35:14.3900000' AS DateTime2), 102, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (106, CAST(N'2021-01-09T19:35:14.5500000' AS DateTime2), CAST(N'2021-01-09T19:35:14.5500000' AS DateTime2), 103, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (107, CAST(N'2021-01-09T19:35:14.7000000' AS DateTime2), CAST(N'2021-01-09T19:35:14.7000000' AS DateTime2), 104, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (108, CAST(N'2021-01-09T19:35:14.8700000' AS DateTime2), CAST(N'2021-01-09T19:35:14.8700000' AS DateTime2), 105, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (109, CAST(N'2021-01-09T19:35:15.0400000' AS DateTime2), CAST(N'2021-01-09T19:35:15.0400000' AS DateTime2), 106, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (110, CAST(N'2021-01-09T19:35:15.2000000' AS DateTime2), CAST(N'2021-01-09T19:35:15.2000000' AS DateTime2), 107, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (111, CAST(N'2021-01-09T19:35:15.3800000' AS DateTime2), CAST(N'2021-01-09T19:35:15.3800000' AS DateTime2), 108, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (112, CAST(N'2021-01-09T19:35:15.5600000' AS DateTime2), CAST(N'2021-01-09T19:35:15.5600000' AS DateTime2), 109, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (113, CAST(N'2021-01-09T19:35:15.7300000' AS DateTime2), CAST(N'2021-01-09T19:35:15.7300000' AS DateTime2), 110, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (114, CAST(N'2021-01-09T19:35:15.9000000' AS DateTime2), CAST(N'2021-01-09T19:35:15.9000000' AS DateTime2), 111, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (115, CAST(N'2021-01-09T19:35:16.0600000' AS DateTime2), CAST(N'2021-01-09T19:35:16.0600000' AS DateTime2), 112, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (116, CAST(N'2021-01-09T19:35:16.2200000' AS DateTime2), CAST(N'2021-01-09T19:35:16.2200000' AS DateTime2), 113, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (117, CAST(N'2021-01-09T19:35:16.3900000' AS DateTime2), CAST(N'2021-01-09T19:35:16.3900000' AS DateTime2), 114, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (118, CAST(N'2021-01-09T19:35:16.5500000' AS DateTime2), CAST(N'2021-01-09T19:35:16.5500000' AS DateTime2), 115, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (119, CAST(N'2021-01-09T19:35:16.7000000' AS DateTime2), CAST(N'2021-01-09T19:35:16.7000000' AS DateTime2), 116, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (120, CAST(N'2021-01-09T19:35:16.8500000' AS DateTime2), CAST(N'2021-01-09T19:35:16.8500000' AS DateTime2), 117, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (121, CAST(N'2021-01-09T19:35:16.9800000' AS DateTime2), CAST(N'2021-01-09T19:35:16.9800000' AS DateTime2), 118, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (122, CAST(N'2021-01-09T19:35:56.2600000' AS DateTime2), CAST(N'2021-01-09T19:35:56.2600000' AS DateTime2), 119, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (123, CAST(N'2021-01-09T19:35:56.4200000' AS DateTime2), CAST(N'2021-01-09T19:35:56.4200000' AS DateTime2), 120, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (124, CAST(N'2021-01-09T19:35:56.9500000' AS DateTime2), CAST(N'2021-01-09T19:35:56.9500000' AS DateTime2), 121, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (125, CAST(N'2021-01-09T19:35:57.1400000' AS DateTime2), CAST(N'2021-01-09T19:35:57.1400000' AS DateTime2), 122, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (126, CAST(N'2021-01-09T19:35:57.5700000' AS DateTime2), CAST(N'2021-01-09T19:35:57.5700000' AS DateTime2), 123, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (127, CAST(N'2021-01-09T19:37:39.2200000' AS DateTime2), CAST(N'2021-01-09T19:37:39.2200000' AS DateTime2), 124, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (128, CAST(N'2021-01-09T19:37:39.4900000' AS DateTime2), CAST(N'2021-01-09T19:37:39.4900000' AS DateTime2), 125, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (129, CAST(N'2021-01-09T19:37:39.8800000' AS DateTime2), CAST(N'2021-01-09T19:37:39.8800000' AS DateTime2), 126, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (130, CAST(N'2021-01-09T19:37:40.2200000' AS DateTime2), CAST(N'2021-01-09T19:37:40.2200000' AS DateTime2), 127, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (131, CAST(N'2021-01-09T19:37:40.4700000' AS DateTime2), CAST(N'2021-01-09T19:37:40.4700000' AS DateTime2), 128, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (132, CAST(N'2021-01-09T19:37:40.6400000' AS DateTime2), CAST(N'2021-01-09T19:37:40.6400000' AS DateTime2), 129, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (133, CAST(N'2021-01-09T19:37:40.8100000' AS DateTime2), CAST(N'2021-01-09T19:37:40.8100000' AS DateTime2), 130, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (134, CAST(N'2021-01-09T19:37:40.9900000' AS DateTime2), CAST(N'2021-01-09T19:37:40.9900000' AS DateTime2), 131, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (135, CAST(N'2021-01-09T19:37:41.1600000' AS DateTime2), CAST(N'2021-01-09T19:37:41.1600000' AS DateTime2), 132, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (136, CAST(N'2021-01-09T19:37:41.3200000' AS DateTime2), CAST(N'2021-01-09T19:37:41.3200000' AS DateTime2), 133, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (137, CAST(N'2021-01-09T19:37:41.4700000' AS DateTime2), CAST(N'2021-01-09T19:37:41.4700000' AS DateTime2), 134, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (138, CAST(N'2021-01-09T19:37:41.6500000' AS DateTime2), CAST(N'2021-01-09T19:37:41.6500000' AS DateTime2), 135, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (139, CAST(N'2021-01-09T19:37:41.8200000' AS DateTime2), CAST(N'2021-01-09T19:37:41.8200000' AS DateTime2), 136, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (140, CAST(N'2021-01-09T19:37:41.9800000' AS DateTime2), CAST(N'2021-01-09T19:37:41.9800000' AS DateTime2), 137, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (141, CAST(N'2021-01-09T19:37:42.1900000' AS DateTime2), CAST(N'2021-01-09T19:37:42.1900000' AS DateTime2), 138, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (142, CAST(N'2021-01-09T19:37:42.3000000' AS DateTime2), CAST(N'2021-01-09T19:37:42.3000000' AS DateTime2), 139, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (143, CAST(N'2021-01-09T19:37:42.4900000' AS DateTime2), CAST(N'2021-01-09T19:37:42.4900000' AS DateTime2), 140, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (144, CAST(N'2021-01-09T19:37:42.6500000' AS DateTime2), CAST(N'2021-01-09T19:37:42.6500000' AS DateTime2), 141, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (145, CAST(N'2021-01-09T19:37:42.8200000' AS DateTime2), CAST(N'2021-01-09T19:37:42.8200000' AS DateTime2), 142, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (146, CAST(N'2021-01-09T19:37:43.0000000' AS DateTime2), CAST(N'2021-01-09T19:37:43.0000000' AS DateTime2), 143, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (147, CAST(N'2021-01-09T19:37:43.1700000' AS DateTime2), CAST(N'2021-01-09T19:37:43.1700000' AS DateTime2), 144, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (148, CAST(N'2021-01-09T19:37:43.3200000' AS DateTime2), CAST(N'2021-01-09T19:37:43.3200000' AS DateTime2), 145, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (149, CAST(N'2021-01-09T19:37:43.4900000' AS DateTime2), CAST(N'2021-01-09T19:37:43.4900000' AS DateTime2), 146, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (150, CAST(N'2021-01-09T19:37:43.6600000' AS DateTime2), CAST(N'2021-01-09T19:37:43.6600000' AS DateTime2), 147, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (151, CAST(N'2021-01-09T19:37:43.8400000' AS DateTime2), CAST(N'2021-01-09T19:37:43.8400000' AS DateTime2), 148, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (152, CAST(N'2021-01-09T19:37:44.0100000' AS DateTime2), CAST(N'2021-01-09T19:37:44.0100000' AS DateTime2), 149, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (153, CAST(N'2021-01-09T19:37:44.2200000' AS DateTime2), CAST(N'2021-01-09T19:37:44.2200000' AS DateTime2), 150, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (154, CAST(N'2021-01-09T19:37:44.4400000' AS DateTime2), CAST(N'2021-01-09T19:37:44.4400000' AS DateTime2), 151, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (155, CAST(N'2021-01-09T19:37:44.7200000' AS DateTime2), CAST(N'2021-01-09T19:37:44.7200000' AS DateTime2), 152, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (156, CAST(N'2021-01-09T19:37:45.1400000' AS DateTime2), CAST(N'2021-01-09T19:37:45.1400000' AS DateTime2), 153, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (157, CAST(N'2021-01-09T19:37:45.5200000' AS DateTime2), CAST(N'2021-01-09T19:37:45.5200000' AS DateTime2), 154, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (158, CAST(N'2021-01-09T19:37:45.9600000' AS DateTime2), CAST(N'2021-01-09T19:37:45.9600000' AS DateTime2), 155, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (159, CAST(N'2021-01-09T19:37:46.6600000' AS DateTime2), CAST(N'2021-01-09T19:37:46.6600000' AS DateTime2), 156, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (160, CAST(N'2021-01-09T20:07:20.8400000' AS DateTime2), CAST(N'2021-01-09T20:07:20.8400000' AS DateTime2), 157, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (161, CAST(N'2021-01-09T20:07:27.9600000' AS DateTime2), CAST(N'2021-01-09T20:07:27.9600000' AS DateTime2), 158, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (162, CAST(N'2021-01-09T20:07:28.4200000' AS DateTime2), CAST(N'2021-01-09T20:07:28.4200000' AS DateTime2), 159, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (163, CAST(N'2021-01-09T20:07:28.9000000' AS DateTime2), CAST(N'2021-01-09T20:07:28.9000000' AS DateTime2), 160, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (164, CAST(N'2021-01-09T20:07:29.3300000' AS DateTime2), CAST(N'2021-01-09T20:07:29.3300000' AS DateTime2), 161, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (165, CAST(N'2021-01-09T20:07:29.7300000' AS DateTime2), CAST(N'2021-01-09T20:07:29.7300000' AS DateTime2), 162, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (166, CAST(N'2021-01-09T20:07:30.0500000' AS DateTime2), CAST(N'2021-01-09T20:07:30.0500000' AS DateTime2), 163, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (167, CAST(N'2021-01-09T20:07:30.3300000' AS DateTime2), CAST(N'2021-01-09T20:07:30.3300000' AS DateTime2), 164, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (168, CAST(N'2021-01-09T20:07:30.5000000' AS DateTime2), CAST(N'2021-01-09T20:07:30.5000000' AS DateTime2), 165, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (169, CAST(N'2021-01-09T20:07:30.6500000' AS DateTime2), CAST(N'2021-01-09T20:07:30.6500000' AS DateTime2), 166, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (170, CAST(N'2021-01-09T20:07:30.8400000' AS DateTime2), CAST(N'2021-01-09T20:07:30.8400000' AS DateTime2), 167, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (171, CAST(N'2021-01-09T20:07:31.0000000' AS DateTime2), CAST(N'2021-01-09T20:07:31.0000000' AS DateTime2), 168, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (172, CAST(N'2021-01-09T20:07:31.1200000' AS DateTime2), CAST(N'2021-01-09T20:07:31.1200000' AS DateTime2), 169, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (173, CAST(N'2021-01-09T20:07:31.2700000' AS DateTime2), CAST(N'2021-01-09T20:07:31.2700000' AS DateTime2), 170, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (174, CAST(N'2021-01-09T20:07:31.4300000' AS DateTime2), CAST(N'2021-01-09T20:07:31.4300000' AS DateTime2), 171, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (175, CAST(N'2021-01-09T20:07:31.5700000' AS DateTime2), CAST(N'2021-01-09T20:07:31.5700000' AS DateTime2), 172, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (176, CAST(N'2021-01-09T20:07:31.7200000' AS DateTime2), CAST(N'2021-01-09T20:07:31.7200000' AS DateTime2), 173, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (177, CAST(N'2021-01-09T20:07:31.8600000' AS DateTime2), CAST(N'2021-01-09T20:07:31.8600000' AS DateTime2), 174, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (178, CAST(N'2021-01-09T20:07:32.0100000' AS DateTime2), CAST(N'2021-01-09T20:07:32.0100000' AS DateTime2), 175, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (179, CAST(N'2021-01-09T20:07:32.1800000' AS DateTime2), CAST(N'2021-01-09T20:07:32.1800000' AS DateTime2), 176, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (180, CAST(N'2021-01-09T20:07:32.5000000' AS DateTime2), CAST(N'2021-01-09T20:07:32.5000000' AS DateTime2), 177, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (181, CAST(N'2021-01-09T20:07:32.6700000' AS DateTime2), CAST(N'2021-01-09T20:07:32.6700000' AS DateTime2), 178, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (182, CAST(N'2021-01-09T23:39:09.9600000' AS DateTime2), CAST(N'2021-01-09T23:39:09.9600000' AS DateTime2), 179, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (183, CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), 180, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (184, CAST(N'2021-01-09T23:39:28.3500000' AS DateTime2), CAST(N'2021-01-09T23:39:28.3500000' AS DateTime2), 181, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (185, CAST(N'2021-01-09T23:46:30.8100000' AS DateTime2), CAST(N'2021-01-09T23:46:30.8100000' AS DateTime2), 182, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (186, CAST(N'2021-01-10T00:05:38.1800000' AS DateTime2), CAST(N'2021-01-10T00:05:38.1800000' AS DateTime2), 183, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (187, CAST(N'2021-01-10T00:37:01.8200000' AS DateTime2), CAST(N'2021-01-10T00:37:01.8200000' AS DateTime2), 184, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (188, CAST(N'2021-01-10T00:38:41.5900000' AS DateTime2), CAST(N'2021-01-10T00:38:41.5900000' AS DateTime2), 185, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (189, CAST(N'2021-01-10T00:49:53.7600000' AS DateTime2), CAST(N'2021-01-10T00:49:53.7600000' AS DateTime2), 186, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (190, CAST(N'2021-01-10T00:55:32.3800000' AS DateTime2), CAST(N'2021-01-10T00:55:32.3800000' AS DateTime2), 187, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (191, CAST(N'2021-01-10T01:03:15.6900000' AS DateTime2), CAST(N'2021-01-10T01:03:15.6900000' AS DateTime2), 188, 20, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (192, CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), 189, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (193, CAST(N'2021-01-10T01:08:23.2700000' AS DateTime2), CAST(N'2021-01-10T01:08:23.2700000' AS DateTime2), 190, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (194, CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), 191, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (195, CAST(N'2021-01-10T01:09:37.3900000' AS DateTime2), CAST(N'2021-01-10T01:09:37.3900000' AS DateTime2), 192, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (196, CAST(N'2021-01-10T01:11:04.5400000' AS DateTime2), CAST(N'2021-01-10T01:11:04.5400000' AS DateTime2), 193, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (197, CAST(N'2021-01-10T01:13:01.3300000' AS DateTime2), CAST(N'2021-01-10T01:13:01.3300000' AS DateTime2), 194, 20, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (198, CAST(N'2021-01-10T01:14:10.8800000' AS DateTime2), CAST(N'2021-01-10T01:14:10.8800000' AS DateTime2), 195, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (199, CAST(N'2021-01-10T01:18:06.8500000' AS DateTime2), CAST(N'2021-01-10T01:18:06.8500000' AS DateTime2), 196, 20, 20)
GO
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (200, CAST(N'2021-01-10T01:21:26.3600000' AS DateTime2), CAST(N'2021-01-10T01:21:26.3600000' AS DateTime2), 197, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (201, CAST(N'2021-01-10T01:21:50.9300000' AS DateTime2), CAST(N'2021-01-10T01:21:50.9300000' AS DateTime2), 198, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (202, CAST(N'2021-01-10T01:25:59.9900000' AS DateTime2), CAST(N'2021-01-10T01:25:59.9900000' AS DateTime2), 199, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (203, CAST(N'2021-01-10T01:57:32.4000000' AS DateTime2), CAST(N'2021-01-10T01:57:32.4000000' AS DateTime2), 200, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (204, CAST(N'2021-01-10T02:13:00.6400000' AS DateTime2), CAST(N'2021-01-10T02:13:00.6400000' AS DateTime2), 201, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (205, CAST(N'2021-01-10T16:44:37.4200000' AS DateTime2), CAST(N'2021-01-10T16:44:37.4200000' AS DateTime2), 202, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (206, CAST(N'2021-01-10T16:45:19.2000000' AS DateTime2), CAST(N'2021-01-10T16:45:19.2000000' AS DateTime2), 203, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (207, CAST(N'2021-01-11T23:43:05.6100000' AS DateTime2), CAST(N'2021-01-11T23:43:05.6100000' AS DateTime2), 204, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (208, CAST(N'2021-01-11T23:44:10.9700000' AS DateTime2), CAST(N'2021-01-11T23:44:10.9700000' AS DateTime2), 205, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (209, CAST(N'2021-01-16T00:16:47.3600000' AS DateTime2), CAST(N'2021-01-16T00:16:47.3600000' AS DateTime2), 206, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (210, CAST(N'2021-01-16T00:37:56.8500000' AS DateTime2), CAST(N'2021-01-16T00:37:56.8500000' AS DateTime2), 207, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (211, CAST(N'2021-01-16T00:38:18.4200000' AS DateTime2), CAST(N'2021-01-16T00:38:18.4200000' AS DateTime2), 208, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (212, CAST(N'2021-01-16T00:39:39.5800000' AS DateTime2), CAST(N'2021-01-16T00:39:39.5800000' AS DateTime2), 209, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (213, CAST(N'2021-01-16T15:14:43.3400000' AS DateTime2), CAST(N'2021-01-16T15:14:43.3400000' AS DateTime2), 210, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (214, CAST(N'2021-01-16T15:21:36.3700000' AS DateTime2), CAST(N'2021-01-16T15:21:36.3700000' AS DateTime2), 211, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (215, CAST(N'2021-01-16T15:23:16.1500000' AS DateTime2), CAST(N'2021-01-16T15:23:16.1500000' AS DateTime2), 212, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (216, CAST(N'2021-01-16T15:24:26.2700000' AS DateTime2), CAST(N'2021-01-16T15:24:26.2700000' AS DateTime2), 213, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (217, CAST(N'2021-01-16T15:29:33.2500000' AS DateTime2), CAST(N'2021-01-16T15:29:33.2500000' AS DateTime2), 214, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (218, CAST(N'2021-01-16T15:29:42.4700000' AS DateTime2), CAST(N'2021-01-16T15:29:42.4700000' AS DateTime2), 215, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (219, CAST(N'2021-01-16T15:43:59.2300000' AS DateTime2), CAST(N'2021-01-16T15:43:59.2300000' AS DateTime2), 216, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (220, CAST(N'2021-01-16T15:44:05.4600000' AS DateTime2), CAST(N'2021-01-16T15:44:05.4600000' AS DateTime2), 217, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (221, CAST(N'2021-01-16T15:44:14.5700000' AS DateTime2), CAST(N'2021-01-16T15:44:14.5700000' AS DateTime2), 218, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (222, CAST(N'2021-01-16T15:44:24.9600000' AS DateTime2), CAST(N'2021-01-16T15:44:24.9600000' AS DateTime2), 219, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (223, CAST(N'2021-01-16T15:44:25.3800000' AS DateTime2), CAST(N'2021-01-16T15:44:25.3800000' AS DateTime2), 220, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (224, CAST(N'2021-01-16T15:44:26.0300000' AS DateTime2), CAST(N'2021-01-16T15:44:26.0300000' AS DateTime2), 221, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (225, CAST(N'2021-01-16T15:44:29.2400000' AS DateTime2), CAST(N'2021-01-16T15:44:29.2400000' AS DateTime2), 222, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (226, CAST(N'2021-01-16T15:44:29.6800000' AS DateTime2), CAST(N'2021-01-16T15:44:29.6800000' AS DateTime2), 223, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (227, CAST(N'2021-01-16T15:44:30.2200000' AS DateTime2), CAST(N'2021-01-16T15:44:30.2200000' AS DateTime2), 224, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (228, CAST(N'2021-01-16T15:44:30.9600000' AS DateTime2), CAST(N'2021-01-16T15:44:30.9600000' AS DateTime2), 225, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (229, CAST(N'2021-01-16T15:44:31.3500000' AS DateTime2), CAST(N'2021-01-16T15:44:31.3500000' AS DateTime2), 226, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (230, CAST(N'2021-01-16T15:44:31.7500000' AS DateTime2), CAST(N'2021-01-16T15:44:31.7500000' AS DateTime2), 227, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (231, CAST(N'2021-01-16T15:44:33.2300000' AS DateTime2), CAST(N'2021-01-16T15:44:33.2300000' AS DateTime2), 228, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (232, CAST(N'2021-01-16T15:58:11.3300000' AS DateTime2), CAST(N'2021-01-16T15:58:11.3300000' AS DateTime2), 229, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (233, CAST(N'2021-01-16T15:58:12.1100000' AS DateTime2), CAST(N'2021-01-16T15:58:12.1100000' AS DateTime2), 230, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (234, CAST(N'2021-01-16T15:58:14.8800000' AS DateTime2), CAST(N'2021-01-16T15:58:14.8800000' AS DateTime2), 231, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (235, CAST(N'2021-01-16T22:45:22.7200000' AS DateTime2), CAST(N'2021-01-16T22:45:22.7200000' AS DateTime2), 232, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (236, CAST(N'2021-01-16T22:45:23.2200000' AS DateTime2), CAST(N'2021-01-16T22:45:23.2200000' AS DateTime2), 233, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (237, CAST(N'2021-01-16T22:45:23.7300000' AS DateTime2), CAST(N'2021-01-16T22:45:23.7300000' AS DateTime2), 234, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (238, CAST(N'2021-01-16T22:45:24.2000000' AS DateTime2), CAST(N'2021-01-16T22:45:24.2000000' AS DateTime2), 235, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (239, CAST(N'2021-01-16T22:45:24.6200000' AS DateTime2), CAST(N'2021-01-16T22:45:24.6200000' AS DateTime2), 236, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (240, CAST(N'2021-01-16T22:45:25.1800000' AS DateTime2), CAST(N'2021-01-16T22:45:25.1800000' AS DateTime2), 237, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (241, CAST(N'2021-01-16T22:45:25.4400000' AS DateTime2), CAST(N'2021-01-16T22:45:25.4400000' AS DateTime2), 238, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (242, CAST(N'2021-01-16T22:45:25.6400000' AS DateTime2), CAST(N'2021-01-16T22:45:25.6400000' AS DateTime2), 239, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (243, CAST(N'2021-01-16T22:45:25.8000000' AS DateTime2), CAST(N'2021-01-16T22:45:25.8000000' AS DateTime2), 240, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (244, CAST(N'2021-01-16T22:45:25.9600000' AS DateTime2), CAST(N'2021-01-16T22:45:25.9600000' AS DateTime2), 241, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (245, CAST(N'2021-01-16T22:45:26.1500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.1500000' AS DateTime2), 242, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (246, CAST(N'2021-01-16T22:45:26.2900000' AS DateTime2), CAST(N'2021-01-16T22:45:26.2900000' AS DateTime2), 243, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (247, CAST(N'2021-01-16T22:45:26.4500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.4500000' AS DateTime2), 244, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (248, CAST(N'2021-01-16T22:45:26.6100000' AS DateTime2), CAST(N'2021-01-16T22:45:26.6100000' AS DateTime2), 245, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (249, CAST(N'2021-01-16T22:45:26.7500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.7500000' AS DateTime2), 246, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (250, CAST(N'2021-01-16T22:45:26.9100000' AS DateTime2), CAST(N'2021-01-16T22:45:26.9100000' AS DateTime2), 247, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (251, CAST(N'2021-01-16T23:01:05.5900000' AS DateTime2), CAST(N'2021-01-16T23:01:05.5900000' AS DateTime2), 248, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (252, CAST(N'2021-01-16T23:01:07.1800000' AS DateTime2), CAST(N'2021-01-16T23:01:07.1800000' AS DateTime2), 249, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (253, CAST(N'2021-01-16T23:01:08.7800000' AS DateTime2), CAST(N'2021-01-16T23:01:08.7800000' AS DateTime2), 250, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (254, CAST(N'2021-01-16T23:01:12.0900000' AS DateTime2), CAST(N'2021-01-16T23:01:12.0900000' AS DateTime2), 251, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (255, CAST(N'2021-01-16T23:01:14.0400000' AS DateTime2), CAST(N'2021-01-16T23:01:14.0400000' AS DateTime2), 252, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (256, CAST(N'2021-01-16T23:01:14.6000000' AS DateTime2), CAST(N'2021-01-16T23:01:14.6000000' AS DateTime2), 253, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (257, CAST(N'2021-01-16T23:01:16.1900000' AS DateTime2), CAST(N'2021-01-16T23:01:16.1900000' AS DateTime2), 254, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (258, CAST(N'2021-01-16T23:01:18.2900000' AS DateTime2), CAST(N'2021-01-16T23:01:18.2900000' AS DateTime2), 255, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (259, CAST(N'2021-01-16T23:17:15.6600000' AS DateTime2), CAST(N'2021-01-16T23:17:15.6600000' AS DateTime2), 256, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (260, CAST(N'2021-01-16T23:17:26.8100000' AS DateTime2), CAST(N'2021-01-16T23:17:26.8100000' AS DateTime2), 257, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (261, CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), 258, 20, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (262, CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), 259, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (263, CAST(N'2021-01-16T23:18:47.2100000' AS DateTime2), CAST(N'2021-01-16T23:18:47.2100000' AS DateTime2), 260, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (264, CAST(N'2021-01-16T23:18:49.9100000' AS DateTime2), CAST(N'2021-01-16T23:18:49.9100000' AS DateTime2), 261, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (265, CAST(N'2021-01-16T23:35:06.8700000' AS DateTime2), CAST(N'2021-01-16T23:35:06.8700000' AS DateTime2), 262, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (266, CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), 263, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (267, CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), 264, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (268, CAST(N'2021-01-16T23:36:53.9500000' AS DateTime2), CAST(N'2021-01-16T23:36:53.9500000' AS DateTime2), 265, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (269, CAST(N'2021-01-16T23:40:08.1100000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1100000' AS DateTime2), 266, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (270, CAST(N'2021-01-16T23:40:08.1200000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1200000' AS DateTime2), 267, 10, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (271, CAST(N'2021-01-16T23:41:39.2100000' AS DateTime2), CAST(N'2021-01-16T23:41:39.2100000' AS DateTime2), 268, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (272, CAST(N'2021-01-16T23:43:07.6800000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6800000' AS DateTime2), 269, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (273, CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), 270, 10, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (274, CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), 271, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (275, CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), 272, 10, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (276, CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), 273, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (277, CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), 274, 10, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (278, CAST(N'2021-01-16T23:50:31.3300000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3300000' AS DateTime2), 275, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (279, CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), 276, 10, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (280, CAST(N'2021-01-17T00:12:36.6200000' AS DateTime2), CAST(N'2021-01-17T00:12:36.6200000' AS DateTime2), 277, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (281, CAST(N'2021-01-17T00:12:36.6300000' AS DateTime2), CAST(N'2021-01-17T00:12:36.6300000' AS DateTime2), 278, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (282, CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), 279, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (283, CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), 280, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (284, CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), 281, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (285, CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), 282, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (286, CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), 283, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (287, CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), 284, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (288, CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), 285, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (289, CAST(N'2021-01-17T00:13:03.7500000' AS DateTime2), CAST(N'2021-01-17T00:13:03.7500000' AS DateTime2), 286, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (290, CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), 287, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (291, CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), 288, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (292, CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), 289, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (293, CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), 290, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (294, CAST(N'2021-01-17T00:13:44.8700000' AS DateTime2), CAST(N'2021-01-17T00:13:44.8700000' AS DateTime2), 291, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (295, CAST(N'2021-01-17T00:13:44.8800000' AS DateTime2), CAST(N'2021-01-17T00:13:44.8800000' AS DateTime2), 292, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (296, CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), 293, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (297, CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), 294, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (298, CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), 295, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (299, CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), 296, 6, 1)
GO
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (300, CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), 297, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (301, CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), 298, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (302, CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), 299, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (303, CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), 300, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (304, CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), 301, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (305, CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), 302, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (306, CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), 303, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (307, CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), 304, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (308, CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), 305, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (309, CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), 306, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (310, CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), 307, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (311, CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), 308, 6, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (312, CAST(N'2021-01-17T00:26:56.1300000' AS DateTime2), CAST(N'2021-01-17T00:26:56.1300000' AS DateTime2), 309, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (313, CAST(N'2021-01-17T00:28:51.9100000' AS DateTime2), CAST(N'2021-01-17T00:28:51.9100000' AS DateTime2), 310, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (314, CAST(N'2021-01-17T00:29:06.9200000' AS DateTime2), CAST(N'2021-01-17T00:29:06.9200000' AS DateTime2), 311, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (315, CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), 312, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (316, CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), 313, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (317, CAST(N'2021-01-17T00:33:36.8900000' AS DateTime2), CAST(N'2021-01-17T00:33:36.8900000' AS DateTime2), 314, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (318, CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), 315, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (319, CAST(N'2021-01-17T00:33:56.8800000' AS DateTime2), CAST(N'2021-01-17T00:33:56.8800000' AS DateTime2), 316, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (320, CAST(N'2021-01-17T00:42:29.1700000' AS DateTime2), CAST(N'2021-01-17T00:42:29.1700000' AS DateTime2), 317, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (321, CAST(N'2021-01-17T00:48:08.8600000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8600000' AS DateTime2), 318, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (322, CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), 319, 10, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (323, CAST(N'2021-01-17T00:48:47.4700000' AS DateTime2), CAST(N'2021-01-17T00:48:47.4700000' AS DateTime2), 320, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (324, CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), 321, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (325, CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), 322, 10, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (326, CAST(N'2021-01-17T00:53:05.2700000' AS DateTime2), CAST(N'2021-01-17T00:53:05.2700000' AS DateTime2), 323, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (327, CAST(N'2021-01-17T00:56:20.6700000' AS DateTime2), CAST(N'2021-01-17T00:56:20.6700000' AS DateTime2), 324, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (328, CAST(N'2021-01-17T01:00:27.4300000' AS DateTime2), CAST(N'2021-01-17T01:00:27.4300000' AS DateTime2), 325, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (329, CAST(N'2021-01-17T01:05:21.8500000' AS DateTime2), CAST(N'2021-01-17T01:05:21.8500000' AS DateTime2), 326, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (330, CAST(N'2021-01-17T01:10:25.6900000' AS DateTime2), CAST(N'2021-01-17T01:10:25.6900000' AS DateTime2), 327, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (331, CAST(N'2021-01-17T01:12:20.5400000' AS DateTime2), CAST(N'2021-01-17T01:12:20.5400000' AS DateTime2), 328, 20, 11)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (332, CAST(N'2021-01-17T01:30:08.1000000' AS DateTime2), CAST(N'2021-01-17T01:30:08.1000000' AS DateTime2), 329, 20, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (333, CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), 330, 8, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (334, CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), 330, 8, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (335, CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), 331, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (336, CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), 332, 10, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (337, CAST(N'2021-01-17T01:35:27.6700000' AS DateTime2), CAST(N'2021-01-17T01:35:27.6700000' AS DateTime2), 333, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (338, CAST(N'2021-01-17T01:39:52.3800000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3800000' AS DateTime2), 334, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (339, CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), 335, 10, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (340, CAST(N'2021-01-17T01:42:59.4700000' AS DateTime2), CAST(N'2021-01-17T01:42:59.4700000' AS DateTime2), 336, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (341, CAST(N'2021-01-17T01:44:15.3100000' AS DateTime2), CAST(N'2021-01-17T01:44:15.3100000' AS DateTime2), 337, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (342, CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), 338, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (343, CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), 339, 4, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (344, CAST(N'2021-01-17T01:45:51.2800000' AS DateTime2), CAST(N'2021-01-17T01:45:51.2800000' AS DateTime2), 340, 20, 8)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (345, CAST(N'2021-01-17T01:47:08.6500000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6500000' AS DateTime2), 341, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (346, CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), 342, 4, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (347, CAST(N'2021-01-17T01:53:45.4900000' AS DateTime2), CAST(N'2021-01-17T01:53:45.4900000' AS DateTime2), 343, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (348, CAST(N'2021-01-17T01:54:56.1500000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1500000' AS DateTime2), 344, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (349, CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), 345, 4, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (350, CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), 346, 20, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (351, CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), 347, 10, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (352, CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), 348, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (353, CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), 349, 4, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (354, CAST(N'2021-01-17T02:06:30.6000000' AS DateTime2), CAST(N'2021-01-17T02:06:30.6000000' AS DateTime2), 350, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (355, CAST(N'2021-01-17T02:12:25.2100000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2100000' AS DateTime2), 351, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (356, CAST(N'2021-01-17T02:12:25.2200000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2200000' AS DateTime2), 352, 10, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (357, CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), 353, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (358, CAST(N'2021-01-17T02:13:19.3600000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3600000' AS DateTime2), 354, 4, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (359, CAST(N'2021-01-17T02:20:24.0700000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0700000' AS DateTime2), 355, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (360, CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), 356, 10, 8)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (361, CAST(N'2021-01-17T02:26:33.6900000' AS DateTime2), CAST(N'2021-01-17T02:26:33.6900000' AS DateTime2), 357, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (362, CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), 358, 10, 8)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (363, CAST(N'2021-01-17T02:31:36.7600000' AS DateTime2), CAST(N'2021-01-17T02:31:36.7600000' AS DateTime2), 359, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (364, CAST(N'2021-01-23T23:30:04.4200000' AS DateTime2), CAST(N'2021-01-23T23:30:04.4200000' AS DateTime2), 360, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (365, CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), 361, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (366, CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), 362, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (367, CAST(N'2021-01-23T23:38:26.8000000' AS DateTime2), CAST(N'2021-01-23T23:38:26.8000000' AS DateTime2), 363, 20, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (368, CAST(N'2021-01-23T23:39:08.7000000' AS DateTime2), CAST(N'2021-01-23T23:39:08.7000000' AS DateTime2), 364, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (369, CAST(N'2021-01-23T23:41:30.5200000' AS DateTime2), CAST(N'2021-01-23T23:41:30.5200000' AS DateTime2), 365, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (370, CAST(N'2021-01-23T23:41:44.8000000' AS DateTime2), CAST(N'2021-01-23T23:41:44.8000000' AS DateTime2), 366, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (371, CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), 367, 20, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (372, CAST(N'2021-01-23T23:45:57.2900000' AS DateTime2), CAST(N'2021-01-23T23:45:57.2900000' AS DateTime2), 368, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (373, CAST(N'2021-01-23T23:50:22.8800000' AS DateTime2), CAST(N'2021-01-23T23:50:22.8800000' AS DateTime2), 369, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (374, CAST(N'2021-01-23T23:52:36.5700000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5700000' AS DateTime2), 370, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (375, CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), 371, 10, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (376, CAST(N'2021-01-23T23:54:32.1700000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1700000' AS DateTime2), 372, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (377, CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), 373, 4, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (378, CAST(N'2021-01-23T23:59:42.1800000' AS DateTime2), CAST(N'2021-01-23T23:59:42.1800000' AS DateTime2), 374, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (379, CAST(N'2021-01-23T23:59:53.8800000' AS DateTime2), CAST(N'2021-01-23T23:59:53.8800000' AS DateTime2), 375, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (380, CAST(N'2021-01-24T00:05:45.7400000' AS DateTime2), CAST(N'2021-01-24T00:05:45.7400000' AS DateTime2), 376, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (381, CAST(N'2021-01-24T00:05:54.9800000' AS DateTime2), CAST(N'2021-01-24T00:05:54.9800000' AS DateTime2), 377, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (382, CAST(N'2021-01-24T00:06:07.6700000' AS DateTime2), CAST(N'2021-01-24T00:06:07.6700000' AS DateTime2), 378, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (383, CAST(N'2021-01-24T00:10:48.1900000' AS DateTime2), CAST(N'2021-01-24T00:10:48.1900000' AS DateTime2), 379, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (384, CAST(N'2021-01-24T00:10:48.2300000' AS DateTime2), CAST(N'2021-01-24T00:10:48.2300000' AS DateTime2), 380, 10, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (385, CAST(N'2021-01-24T00:11:30.1100000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1100000' AS DateTime2), 381, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (386, CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), 382, 4, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (387, CAST(N'2021-01-24T00:12:28.0600000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0600000' AS DateTime2), 383, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (388, CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), 384, 10, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (389, CAST(N'2021-01-24T00:14:37.5800000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5800000' AS DateTime2), 385, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (390, CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), 386, 4, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (391, CAST(N'2021-01-24T00:16:28.1700000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1700000' AS DateTime2), 387, 20, 11)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (392, CAST(N'2021-01-24T00:16:28.1800000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1800000' AS DateTime2), 388, 10, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (393, CAST(N'2021-01-24T00:17:00.0800000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0800000' AS DateTime2), 389, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (394, CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), 390, 4, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (395, CAST(N'2021-01-24T00:17:48.1600000' AS DateTime2), CAST(N'2021-01-24T00:17:48.1600000' AS DateTime2), 391, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (396, CAST(N'2021-01-24T00:19:25.5900000' AS DateTime2), CAST(N'2021-01-24T00:19:25.5900000' AS DateTime2), 392, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (397, CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), 393, 4, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (398, CAST(N'2021-01-24T00:20:25.5400000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5400000' AS DateTime2), 394, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (399, CAST(N'2021-01-24T00:20:25.5600000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5600000' AS DateTime2), 395, 10, 6)
GO
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (400, CAST(N'2021-01-24T00:21:09.4700000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4700000' AS DateTime2), 396, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (401, CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), 397, 4, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (402, CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), 397, 4, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (403, CAST(N'2021-01-24T00:21:59.8300000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8300000' AS DateTime2), 398, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (404, CAST(N'2021-01-24T00:21:59.8400000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8400000' AS DateTime2), 399, 10, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (405, CAST(N'2021-01-24T00:23:04.0900000' AS DateTime2), CAST(N'2021-01-24T00:23:04.0900000' AS DateTime2), 400, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (406, CAST(N'2021-01-24T00:23:53.8100000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8100000' AS DateTime2), 401, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (407, CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), 402, 10, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (408, CAST(N'2021-01-24T00:24:30.6400000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6400000' AS DateTime2), 403, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (409, CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), 404, 4, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (410, CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), 405, 20, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (411, CAST(N'2021-01-24T00:26:09.5600000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5600000' AS DateTime2), 406, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (412, CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), 407, 4, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (413, CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), 407, 4, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (414, CAST(N'2021-01-24T00:31:12.3700000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3700000' AS DateTime2), 408, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (415, CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), 409, 4, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (416, CAST(N'2021-01-24T00:39:47.1200000' AS DateTime2), CAST(N'2021-01-24T00:39:47.1200000' AS DateTime2), 410, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (417, CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), 411, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (418, CAST(N'2021-01-24T00:40:16.8100000' AS DateTime2), CAST(N'2021-01-24T00:40:16.8100000' AS DateTime2), 412, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (419, CAST(N'2021-01-24T00:40:36.4700000' AS DateTime2), CAST(N'2021-01-24T00:40:36.4700000' AS DateTime2), 413, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (420, CAST(N'2021-01-24T00:41:05.3700000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3700000' AS DateTime2), 414, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (421, CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), 415, 10, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (422, CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), 416, 20, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (423, CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), 417, 4, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (424, CAST(N'2021-01-24T00:43:06.7700000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7700000' AS DateTime2), 418, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (425, CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), 419, 10, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (426, CAST(N'2021-01-24T00:47:33.9800000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9800000' AS DateTime2), 420, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (427, CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), 421, 8, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (428, CAST(N'2021-01-24T00:48:36.8200000' AS DateTime2), CAST(N'2021-01-24T00:48:36.8200000' AS DateTime2), 422, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (429, CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), 423, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (430, CAST(N'2021-01-24T00:50:42.6300000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6300000' AS DateTime2), 424, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (431, CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), 425, 10, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (432, CAST(N'2021-01-24T00:52:57.5900000' AS DateTime2), CAST(N'2021-01-24T00:52:57.5900000' AS DateTime2), 426, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (433, CAST(N'2021-01-24T00:52:57.6300000' AS DateTime2), CAST(N'2021-01-24T00:52:57.6300000' AS DateTime2), 427, 8, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (434, CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), 428, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (435, CAST(N'2021-01-24T00:54:45.4000000' AS DateTime2), CAST(N'2021-01-24T00:54:45.4000000' AS DateTime2), 429, 10, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (436, CAST(N'2021-01-24T00:55:23.2400000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2400000' AS DateTime2), 430, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (437, CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), 431, 10, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (438, CAST(N'2021-01-24T00:56:42.4200000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4200000' AS DateTime2), 432, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (439, CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), 433, 8, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (440, CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), 434, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (441, CAST(N'2021-01-24T00:57:30.0000000' AS DateTime2), CAST(N'2021-01-24T00:57:30.0000000' AS DateTime2), 435, 10, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (442, CAST(N'2021-01-24T00:58:48.3700000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3700000' AS DateTime2), 436, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (443, CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), 437, 10, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (444, CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), 437, 10, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (445, CAST(N'2021-01-24T00:59:18.3700000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3700000' AS DateTime2), 438, 20, 8)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (446, CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), 439, 8, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (447, CAST(N'2021-01-24T00:59:50.0500000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0500000' AS DateTime2), 440, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (448, CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), 441, 10, 8)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (449, CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), 442, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (450, CAST(N'2021-01-24T01:00:24.8800000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8800000' AS DateTime2), 443, 8, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (451, CAST(N'2021-01-24T01:01:30.6600000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6600000' AS DateTime2), 444, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (452, CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), 445, 8, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (453, CAST(N'2021-01-24T01:02:14.1500000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1500000' AS DateTime2), 446, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (454, CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), 447, 10, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (455, CAST(N'2021-01-24T01:19:32.2200000' AS DateTime2), CAST(N'2021-01-24T01:19:32.2200000' AS DateTime2), 448, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (456, CAST(N'2021-01-24T01:35:51.6400000' AS DateTime2), CAST(N'2021-01-24T01:35:51.6400000' AS DateTime2), 449, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (457, CAST(N'2021-01-24T01:40:36.9900000' AS DateTime2), CAST(N'2021-01-24T01:40:36.9900000' AS DateTime2), 450, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (458, CAST(N'2021-01-24T01:42:28.4500000' AS DateTime2), CAST(N'2021-01-24T01:42:28.4500000' AS DateTime2), 451, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (459, CAST(N'2021-01-24T01:43:19.1800000' AS DateTime2), CAST(N'2021-01-24T01:43:19.1800000' AS DateTime2), 452, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (460, CAST(N'2021-01-24T01:43:49.1300000' AS DateTime2), CAST(N'2021-01-24T01:43:49.1300000' AS DateTime2), 453, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (461, CAST(N'2021-01-24T01:44:04.4700000' AS DateTime2), CAST(N'2021-01-24T01:44:04.4700000' AS DateTime2), 454, 20, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (462, CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), 455, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (463, CAST(N'2021-01-24T02:10:45.7200000' AS DateTime2), CAST(N'2021-01-24T02:10:45.7200000' AS DateTime2), 456, 20, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (464, CAST(N'2021-01-24T02:20:54.7700000' AS DateTime2), CAST(N'2021-01-24T02:20:54.7700000' AS DateTime2), 457, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (10364, CAST(N'2021-01-30T23:31:15.1800000' AS DateTime2), CAST(N'2021-01-30T23:31:15.1800000' AS DateTime2), 1360, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (10365, CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), 1361, 20, 8)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (10366, CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), 1362, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (10367, CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), 1363, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (10368, CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), 1364, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (10369, CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), 1365, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (10370, CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), 1366, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (10371, CAST(N'2021-01-31T01:32:19.3800000' AS DateTime2), CAST(N'2021-01-31T01:32:19.3800000' AS DateTime2), 1367, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (10372, CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), 1368, 20, 11)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (10373, CAST(N'2021-01-31T01:42:46.3900000' AS DateTime2), CAST(N'2021-01-31T01:42:46.3900000' AS DateTime2), 1369, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20364, CAST(N'2021-02-07T00:20:52.0300000' AS DateTime2), CAST(N'2021-02-07T00:20:52.0300000' AS DateTime2), 2360, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20365, CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), 2361, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20366, CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), 2362, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20367, CAST(N'2021-02-07T00:24:45.5700000' AS DateTime2), CAST(N'2021-02-07T00:24:45.5700000' AS DateTime2), 2363, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20368, CAST(N'2021-02-07T00:34:31.3100000' AS DateTime2), CAST(N'2021-02-07T00:34:31.3100000' AS DateTime2), 2364, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20369, CAST(N'2021-02-07T00:34:36.0200000' AS DateTime2), CAST(N'2021-02-07T00:34:36.0200000' AS DateTime2), 2365, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20370, CAST(N'2021-02-07T00:35:19.5600000' AS DateTime2), CAST(N'2021-02-07T00:35:19.5600000' AS DateTime2), 2366, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20371, CAST(N'2021-02-07T00:44:30.7200000' AS DateTime2), CAST(N'2021-02-07T00:44:30.7200000' AS DateTime2), 2367, 20, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20372, CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), 2368, 20, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20373, CAST(N'2021-02-07T00:44:50.1400000' AS DateTime2), CAST(N'2021-02-07T00:44:50.1400000' AS DateTime2), 2369, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20374, CAST(N'2021-02-07T00:44:51.9100000' AS DateTime2), CAST(N'2021-02-07T00:44:51.9100000' AS DateTime2), 2370, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20375, CAST(N'2021-02-07T00:47:24.9100000' AS DateTime2), CAST(N'2021-02-07T00:47:24.9100000' AS DateTime2), 2371, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20376, CAST(N'2021-02-07T00:53:08.9500000' AS DateTime2), CAST(N'2021-02-07T00:53:08.9500000' AS DateTime2), 2372, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20377, CAST(N'2021-02-07T00:58:29.7000000' AS DateTime2), CAST(N'2021-02-07T00:58:29.7000000' AS DateTime2), 2373, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20378, CAST(N'2021-02-07T01:08:40.2600000' AS DateTime2), CAST(N'2021-02-07T01:08:40.2600000' AS DateTime2), 2374, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20379, CAST(N'2021-02-07T01:10:15.8800000' AS DateTime2), CAST(N'2021-02-07T01:10:15.8800000' AS DateTime2), 2375, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20380, CAST(N'2021-02-07T01:11:03.3000000' AS DateTime2), CAST(N'2021-02-07T01:11:03.3000000' AS DateTime2), 2376, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20381, CAST(N'2021-02-07T01:23:03.8000000' AS DateTime2), CAST(N'2021-02-07T01:23:03.8000000' AS DateTime2), 2377, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20382, CAST(N'2021-02-07T01:34:28.0500000' AS DateTime2), CAST(N'2021-02-07T01:34:28.0500000' AS DateTime2), 2378, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20383, CAST(N'2021-02-07T01:37:49.9800000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9800000' AS DateTime2), 2379, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20384, CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), 2380, 8, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20385, CAST(N'2021-02-07T01:39:15.4600000' AS DateTime2), CAST(N'2021-02-07T01:39:15.4600000' AS DateTime2), 2381, 20, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20386, CAST(N'2021-02-07T01:44:59.2700000' AS DateTime2), CAST(N'2021-02-07T01:44:59.2700000' AS DateTime2), 2382, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20387, CAST(N'2021-02-07T01:50:33.4600000' AS DateTime2), CAST(N'2021-02-07T01:50:33.4600000' AS DateTime2), 2383, 20, 8)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20388, CAST(N'2021-02-07T01:55:14.2300000' AS DateTime2), CAST(N'2021-02-07T01:55:14.2300000' AS DateTime2), 2384, 20, 7)
GO
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20389, CAST(N'2021-02-07T02:08:00.2800000' AS DateTime2), CAST(N'2021-02-07T02:08:00.2800000' AS DateTime2), 2385, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20390, CAST(N'2021-02-07T02:09:10.3300000' AS DateTime2), CAST(N'2021-02-07T02:09:10.3300000' AS DateTime2), 2386, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20391, CAST(N'2021-02-07T02:13:21.3600000' AS DateTime2), CAST(N'2021-02-07T02:13:21.3600000' AS DateTime2), 2387, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20392, CAST(N'2021-02-07T02:17:24.0000000' AS DateTime2), CAST(N'2021-02-07T02:17:24.0000000' AS DateTime2), 2388, 20, 10)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20393, CAST(N'2021-02-07T02:25:00.5600000' AS DateTime2), CAST(N'2021-02-07T02:25:00.5600000' AS DateTime2), 2389, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20394, CAST(N'2021-02-07T02:26:35.7100000' AS DateTime2), CAST(N'2021-02-07T02:26:35.7100000' AS DateTime2), 2390, 20, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20395, CAST(N'2021-02-13T23:24:31.4700000' AS DateTime2), CAST(N'2021-02-13T23:24:31.4700000' AS DateTime2), 2391, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20396, CAST(N'2021-02-13T23:25:02.3700000' AS DateTime2), CAST(N'2021-02-13T23:25:02.3700000' AS DateTime2), 2392, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20397, CAST(N'2021-02-13T23:38:59.3400000' AS DateTime2), CAST(N'2021-02-13T23:38:59.3400000' AS DateTime2), 2393, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20398, CAST(N'2021-02-14T00:02:15.2900000' AS DateTime2), CAST(N'2021-02-14T00:02:15.2900000' AS DateTime2), 2394, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20399, CAST(N'2021-02-14T00:02:59.3300000' AS DateTime2), CAST(N'2021-02-14T00:02:59.3300000' AS DateTime2), 2395, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20400, CAST(N'2021-02-14T00:20:43.2900000' AS DateTime2), CAST(N'2021-02-14T00:20:43.2900000' AS DateTime2), 2396, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20401, CAST(N'2021-02-14T00:22:09.2600000' AS DateTime2), CAST(N'2021-02-14T00:22:09.2600000' AS DateTime2), 2397, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20402, CAST(N'2021-02-14T00:31:00.1100000' AS DateTime2), CAST(N'2021-02-14T00:31:00.1100000' AS DateTime2), 2398, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20403, CAST(N'2021-02-14T00:32:52.4800000' AS DateTime2), CAST(N'2021-02-14T00:32:52.4800000' AS DateTime2), 2399, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20404, CAST(N'2021-02-14T00:45:17.7700000' AS DateTime2), CAST(N'2021-02-14T00:45:17.7700000' AS DateTime2), 2400, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20405, CAST(N'2021-02-14T00:50:01.6700000' AS DateTime2), CAST(N'2021-02-14T00:50:01.6700000' AS DateTime2), 2401, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20406, CAST(N'2021-02-14T00:54:25.0900000' AS DateTime2), CAST(N'2021-02-14T00:54:25.0900000' AS DateTime2), 2402, 20, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20407, CAST(N'2021-02-14T00:55:38.6200000' AS DateTime2), CAST(N'2021-02-14T00:55:38.6200000' AS DateTime2), 2403, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20408, CAST(N'2021-02-14T00:57:01.7400000' AS DateTime2), CAST(N'2021-02-14T00:57:01.7400000' AS DateTime2), 2404, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20409, CAST(N'2021-02-14T01:01:39.9700000' AS DateTime2), CAST(N'2021-02-14T01:01:39.9700000' AS DateTime2), 2405, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20410, CAST(N'2021-02-14T01:01:49.8300000' AS DateTime2), CAST(N'2021-02-14T01:01:49.8300000' AS DateTime2), 2406, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20411, CAST(N'2021-02-14T01:02:01.8900000' AS DateTime2), CAST(N'2021-02-14T01:02:01.8900000' AS DateTime2), 2407, 20, 11)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20412, CAST(N'2021-02-14T01:03:46.3400000' AS DateTime2), CAST(N'2021-02-14T01:03:46.3400000' AS DateTime2), 2408, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20413, CAST(N'2021-02-14T01:10:43.4500000' AS DateTime2), CAST(N'2021-02-14T01:10:43.4500000' AS DateTime2), 2409, 20, 18)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20414, CAST(N'2021-02-14T01:15:15.6800000' AS DateTime2), CAST(N'2021-02-14T01:15:15.6800000' AS DateTime2), 2410, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20415, CAST(N'2021-02-14T01:15:25.9500000' AS DateTime2), CAST(N'2021-02-14T01:15:25.9500000' AS DateTime2), 2411, 20, 8)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20416, CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), 2412, 20, 15)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20417, CAST(N'2021-02-14T01:20:54.7200000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7200000' AS DateTime2), 2413, 20, 17)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20418, CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), 2414, 10, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20419, CAST(N'2021-02-14T01:24:39.7300000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7300000' AS DateTime2), 2415, 20, 11)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20420, CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), 2416, 10, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20421, CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), 2416, 8, 8)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20422, CAST(N'2021-02-14T01:27:44.4800000' AS DateTime2), CAST(N'2021-02-14T01:27:44.4800000' AS DateTime2), 2417, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20423, CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), 2418, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20424, CAST(N'2021-02-14T01:33:59.8600000' AS DateTime2), CAST(N'2021-02-14T01:33:59.8600000' AS DateTime2), 2419, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20425, CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), 2420, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20426, CAST(N'2021-02-14T01:36:19.2800000' AS DateTime2), CAST(N'2021-02-14T01:36:19.2800000' AS DateTime2), 2421, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20427, CAST(N'2021-02-14T01:36:28.1800000' AS DateTime2), CAST(N'2021-02-14T01:36:28.1800000' AS DateTime2), 2422, 20, 2)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20428, CAST(N'2021-02-14T01:40:17.2600000' AS DateTime2), CAST(N'2021-02-14T01:40:17.2600000' AS DateTime2), 2423, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20429, CAST(N'2021-02-14T01:41:29.2300000' AS DateTime2), CAST(N'2021-02-14T01:41:29.2300000' AS DateTime2), 2424, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20430, CAST(N'2021-02-14T01:44:57.0400000' AS DateTime2), CAST(N'2021-02-14T01:44:57.0400000' AS DateTime2), 2425, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20431, CAST(N'2021-02-14T01:46:32.0500000' AS DateTime2), CAST(N'2021-02-14T01:46:32.0500000' AS DateTime2), 2426, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20432, CAST(N'2021-02-14T01:48:36.0500000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0500000' AS DateTime2), 2427, 20, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20433, CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), 2428, 10, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20434, CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), 2428, 8, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20435, CAST(N'2021-02-14T01:49:53.8300000' AS DateTime2), CAST(N'2021-02-14T01:49:53.8300000' AS DateTime2), 2429, 20, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20436, CAST(N'2021-02-14T01:54:03.1500000' AS DateTime2), CAST(N'2021-02-14T01:54:03.1500000' AS DateTime2), 2430, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20437, CAST(N'2021-02-14T01:58:04.4000000' AS DateTime2), CAST(N'2021-02-14T01:58:04.4000000' AS DateTime2), 2431, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20438, CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), 2432, 8, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20439, CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), 2432, 8, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20440, CAST(N'2021-02-14T02:01:59.6100000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6100000' AS DateTime2), 2433, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20441, CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), 2434, 10, 9)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20442, CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), 2434, 8, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20443, CAST(N'2021-02-14T02:03:04.3100000' AS DateTime2), CAST(N'2021-02-14T02:03:04.3100000' AS DateTime2), 2435, 20, 6)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20444, CAST(N'2021-02-14T02:05:30.1800000' AS DateTime2), CAST(N'2021-02-14T02:05:30.1800000' AS DateTime2), 2436, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20445, CAST(N'2021-02-14T02:07:42.4900000' AS DateTime2), CAST(N'2021-02-14T02:07:42.4900000' AS DateTime2), 2437, 20, 11)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20446, CAST(N'2021-02-14T02:07:57.5900000' AS DateTime2), CAST(N'2021-02-14T02:07:57.5900000' AS DateTime2), 2438, 20, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20447, CAST(N'2021-02-14T02:16:48.9300000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9300000' AS DateTime2), 2439, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20448, CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), 2440, 12, 5)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20449, CAST(N'2021-02-14T02:17:45.7000000' AS DateTime2), CAST(N'2021-02-14T02:17:45.7000000' AS DateTime2), 2441, 20, 13)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20450, CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), 2442, 10, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20451, CAST(N'2021-02-14T02:18:30.8600000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8600000' AS DateTime2), 2443, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20452, CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), 2444, 4, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20453, CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), 2444, 4, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20454, CAST(N'2021-02-14T02:21:03.0900000' AS DateTime2), CAST(N'2021-02-14T02:21:03.0900000' AS DateTime2), 2445, 20, 14)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20455, CAST(N'2021-02-14T02:23:50.5800000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5800000' AS DateTime2), 2446, 20, 19)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20456, CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), 2447, 10, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20457, CAST(N'2021-02-14T02:24:56.6100000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6100000' AS DateTime2), 2448, 20, 20)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20458, CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), 2449, 10, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20459, CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), 2449, 10, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20460, CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), 2450, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20461, CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), 2451, 4, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20462, CAST(N'2021-02-14T02:26:50.7900000' AS DateTime2), CAST(N'2021-02-14T02:26:50.7900000' AS DateTime2), 2452, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20463, CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), 2453, 20, 12)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20464, CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), 2454, 10, 3)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20465, CAST(N'2021-02-14T02:29:51.2900000' AS DateTime2), CAST(N'2021-02-14T02:29:51.2900000' AS DateTime2), 2455, 20, 7)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20466, CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), 2456, 20, 16)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20467, CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), 2457, 4, 4)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20468, CAST(N'2021-02-14T02:39:44.9700000' AS DateTime2), CAST(N'2021-02-14T02:39:44.9700000' AS DateTime2), 2458, 20, 1)
INSERT [Rolls].[IndividualRolls] ([IndividualRollId], [DateCreated], [DateModified], [RollId], [DieTypeId], [Value]) VALUES (20469, CAST(N'2021-02-14T02:40:06.9300000' AS DateTime2), CAST(N'2021-02-14T02:40:06.9300000' AS DateTime2), 2459, 20, 13)
SET IDENTITY_INSERT [Rolls].[IndividualRolls] OFF
SET IDENTITY_INSERT [Rolls].[InitiativeRolls] ON

INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (1, CAST(N'2021-01-09T20:07:20.8500000' AS DateTime2), CAST(N'2021-01-09T20:07:20.8500000' AS DateTime2), 157, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (2, CAST(N'2021-01-09T20:07:27.9600000' AS DateTime2), CAST(N'2021-01-09T20:07:27.9600000' AS DateTime2), 158, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (3, CAST(N'2021-01-09T20:07:28.4200000' AS DateTime2), CAST(N'2021-01-09T20:07:28.4200000' AS DateTime2), 159, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (4, CAST(N'2021-01-09T20:07:28.9000000' AS DateTime2), CAST(N'2021-01-09T20:07:28.9000000' AS DateTime2), 160, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (5, CAST(N'2021-01-09T20:07:29.3300000' AS DateTime2), CAST(N'2021-01-09T20:07:29.3300000' AS DateTime2), 161, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (6, CAST(N'2021-01-09T20:07:29.7300000' AS DateTime2), CAST(N'2021-01-09T20:07:29.7300000' AS DateTime2), 162, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (7, CAST(N'2021-01-09T20:07:30.0500000' AS DateTime2), CAST(N'2021-01-09T20:07:30.0500000' AS DateTime2), 163, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (8, CAST(N'2021-01-09T20:07:30.3300000' AS DateTime2), CAST(N'2021-01-09T20:07:30.3300000' AS DateTime2), 164, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (9, CAST(N'2021-01-09T20:07:30.5000000' AS DateTime2), CAST(N'2021-01-09T20:07:30.5000000' AS DateTime2), 165, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (10, CAST(N'2021-01-09T20:07:30.6500000' AS DateTime2), CAST(N'2021-01-09T20:07:30.6500000' AS DateTime2), 166, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (11, CAST(N'2021-01-09T20:07:30.8400000' AS DateTime2), CAST(N'2021-01-09T20:07:30.8400000' AS DateTime2), 167, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (12, CAST(N'2021-01-09T20:07:31.0000000' AS DateTime2), CAST(N'2021-01-09T20:07:31.0000000' AS DateTime2), 168, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (13, CAST(N'2021-01-09T20:07:31.1200000' AS DateTime2), CAST(N'2021-01-09T20:07:31.1200000' AS DateTime2), 169, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (14, CAST(N'2021-01-09T20:07:31.2700000' AS DateTime2), CAST(N'2021-01-09T20:07:31.2700000' AS DateTime2), 170, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (15, CAST(N'2021-01-09T20:07:31.4300000' AS DateTime2), CAST(N'2021-01-09T20:07:31.4300000' AS DateTime2), 171, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (16, CAST(N'2021-01-09T20:07:31.5700000' AS DateTime2), CAST(N'2021-01-09T20:07:31.5700000' AS DateTime2), 172, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (17, CAST(N'2021-01-09T20:07:31.7200000' AS DateTime2), CAST(N'2021-01-09T20:07:31.7200000' AS DateTime2), 173, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (18, CAST(N'2021-01-09T20:07:31.8600000' AS DateTime2), CAST(N'2021-01-09T20:07:31.8600000' AS DateTime2), 174, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (19, CAST(N'2021-01-09T20:07:32.0100000' AS DateTime2), CAST(N'2021-01-09T20:07:32.0100000' AS DateTime2), 175, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (20, CAST(N'2021-01-09T20:07:32.1800000' AS DateTime2), CAST(N'2021-01-09T20:07:32.1800000' AS DateTime2), 176, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (21, CAST(N'2021-01-09T20:07:32.5000000' AS DateTime2), CAST(N'2021-01-09T20:07:32.5000000' AS DateTime2), 177, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (22, CAST(N'2021-01-09T20:07:32.6700000' AS DateTime2), CAST(N'2021-01-09T20:07:32.6700000' AS DateTime2), 178, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (23, CAST(N'2021-01-10T16:44:37.4200000' AS DateTime2), CAST(N'2021-01-10T16:44:37.4200000' AS DateTime2), 202, 3)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (24, CAST(N'2021-01-10T16:45:19.2000000' AS DateTime2), CAST(N'2021-01-10T16:45:19.2000000' AS DateTime2), 203, 3)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (25, CAST(N'2021-01-16T23:35:06.8700000' AS DateTime2), CAST(N'2021-01-16T23:35:06.8700000' AS DateTime2), 262, 2)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (26, CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), 263, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (27, CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), 264, 3)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (28, CAST(N'2021-01-17T00:33:36.9000000' AS DateTime2), CAST(N'2021-01-17T00:33:36.9000000' AS DateTime2), 314, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (29, CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), 315, 2)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (30, CAST(N'2021-01-17T00:33:56.8900000' AS DateTime2), CAST(N'2021-01-17T00:33:56.8900000' AS DateTime2), 316, 3)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (31, CAST(N'2021-01-23T23:41:30.5200000' AS DateTime2), CAST(N'2021-01-23T23:41:30.5200000' AS DateTime2), 365, 3)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (32, CAST(N'2021-01-23T23:41:44.8000000' AS DateTime2), CAST(N'2021-01-23T23:41:44.8000000' AS DateTime2), 366, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (33, CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), 367, 2)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (34, CAST(N'2021-01-24T00:05:45.7500000' AS DateTime2), CAST(N'2021-01-24T00:05:45.7500000' AS DateTime2), 376, 2)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (35, CAST(N'2021-01-24T00:05:54.9900000' AS DateTime2), CAST(N'2021-01-24T00:05:54.9900000' AS DateTime2), 377, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (36, CAST(N'2021-01-24T00:06:07.6700000' AS DateTime2), CAST(N'2021-01-24T00:06:07.6700000' AS DateTime2), 378, 3)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (37, CAST(N'2021-01-24T00:39:47.1300000' AS DateTime2), CAST(N'2021-01-24T00:39:47.1300000' AS DateTime2), 410, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (38, CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), 411, 2)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (39, CAST(N'2021-01-24T00:40:16.8100000' AS DateTime2), CAST(N'2021-01-24T00:40:16.8100000' AS DateTime2), 412, 3)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (40, CAST(N'2021-01-24T01:43:49.1400000' AS DateTime2), CAST(N'2021-01-24T01:43:49.1400000' AS DateTime2), 453, 3)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (41, CAST(N'2021-01-24T01:44:04.4800000' AS DateTime2), CAST(N'2021-01-24T01:44:04.4800000' AS DateTime2), 454, 1)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (42, CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), 455, 2)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (1031, CAST(N'2021-02-14T01:15:15.6800000' AS DateTime2), CAST(N'2021-02-14T01:15:15.6800000' AS DateTime2), 2410, 3)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (1032, CAST(N'2021-02-14T01:15:25.9500000' AS DateTime2), CAST(N'2021-02-14T01:15:25.9500000' AS DateTime2), 2411, 2)
INSERT [Rolls].[InitiativeRolls] ([InitiativeRollId], [DateCreated], [DateModified], [RollId], [Rank]) VALUES (1033, CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), 2412, 1)
SET IDENTITY_INSERT [Rolls].[InitiativeRolls] OFF
SET IDENTITY_INSERT [Rolls].[RollComments] ON

INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (1, CAST(N'2021-01-02T23:03:17.5000000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5000000' AS DateTime2), 1, N'Test Comment')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (2, CAST(N'2021-01-02T23:47:43.2600000' AS DateTime2), CAST(N'2021-01-02T23:47:43.2600000' AS DateTime2), 3, N'Intiative')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (3, CAST(N'2021-01-02T23:47:55.0800000' AS DateTime2), CAST(N'2021-01-02T23:47:55.0800000' AS DateTime2), 4, N'Initiative')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (4, CAST(N'2021-01-02T23:48:23.1500000' AS DateTime2), CAST(N'2021-01-02T23:48:23.1500000' AS DateTime2), 5, N'Initiative')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (5, CAST(N'2021-01-02T23:53:09.1700000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1700000' AS DateTime2), 6, N'At the middle bird. Zing into the shoulder')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (6, CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), 8, N'Opportunity attack')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (7, CAST(N'2021-01-03T00:03:28.0500000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0500000' AS DateTime2), 12, N'Drive dagger through bird on ground.')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (8, CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), 14, N'Firebolt, crisps the rat.')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (9, CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), 16, N'Treating Leah''s wound')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (10, CAST(N'2021-01-03T00:10:34.6000000' AS DateTime2), CAST(N'2021-01-03T00:10:34.6000000' AS DateTime2), 17, N'Checking rat-pigeon food. Got some.')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (11, CAST(N'2021-01-03T00:36:08.4300000' AS DateTime2), CAST(N'2021-01-03T00:36:08.4300000' AS DateTime2), 22, N'Initiative')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (12, CAST(N'2021-01-03T00:44:25.0500000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0500000' AS DateTime2), 29, N'Singe the feathers')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (13, CAST(N'2021-01-03T00:54:40.1400000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1400000' AS DateTime2), 35, N'fireball')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (14, CAST(N'2021-01-03T01:27:36.8800000' AS DateTime2), CAST(N'2021-01-03T01:27:36.8800000' AS DateTime2), 46, N'T-Rex check if it''s not dead.')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (15, CAST(N'2021-01-03T01:46:42.2900000' AS DateTime2), CAST(N'2021-01-03T01:46:42.2900000' AS DateTime2), 49, N'Investigating the T-Rex')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (16, CAST(N'2021-01-03T02:53:27.6000000' AS DateTime2), CAST(N'2021-01-03T02:53:27.6000000' AS DateTime2), 56, N'Drinking +3')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (17, CAST(N'2021-01-10T00:37:01.8200000' AS DateTime2), CAST(N'2021-01-10T00:37:01.8200000' AS DateTime2), 184, N'Failed a seduction check.')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (18, CAST(N'2021-01-16T23:36:53.9500000' AS DateTime2), CAST(N'2021-01-16T23:36:53.9500000' AS DateTime2), 265, N'Cockroach fail squish')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (19, CAST(N'2021-01-17T00:53:05.2600000' AS DateTime2), CAST(N'2021-01-17T00:53:05.2600000' AS DateTime2), 323, N'Trip attack.')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (20, CAST(N'2021-01-17T00:56:20.6600000' AS DateTime2), CAST(N'2021-01-17T00:56:20.6600000' AS DateTime2), 324, N'Not getting disarmed')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (21, CAST(N'2021-01-17T01:00:27.4200000' AS DateTime2), CAST(N'2021-01-17T01:00:27.4200000' AS DateTime2), 325, N'Temporary hit points')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (22, CAST(N'2021-01-17T01:44:15.3100000' AS DateTime2), CAST(N'2021-01-17T01:44:15.3100000' AS DateTime2), 337, N'Saving Roll')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (23, CAST(N'2021-01-24T02:10:45.7200000' AS DateTime2), CAST(N'2021-01-24T02:10:45.7200000' AS DateTime2), 456, N'Control hundreds of rats! Got 22 out of 25 swarms!')
INSERT [Rolls].[RollComments] ([RollCommentId], [DateCreated], [DateModified], [RollId], [Comment]) VALUES (1023, CAST(N'2021-02-14T00:50:01.6700000' AS DateTime2), CAST(N'2021-02-14T00:50:01.6700000' AS DateTime2), 2401, N'Spear fishing')
SET IDENTITY_INSERT [Rolls].[RollComments] OFF
SET IDENTITY_INSERT [Rolls].[RollModifiers] ON

INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (1, CAST(N'2021-01-09T16:23:23.6400000' AS DateTime2), CAST(N'2021-01-09T16:23:23.6400000' AS DateTime2), 68, 0)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2, CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), 69, 0)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (3, CAST(N'2021-01-09T16:38:56.9000000' AS DateTime2), CAST(N'2021-01-09T16:38:56.9000000' AS DateTime2), 70, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (4, CAST(N'2021-01-09T16:42:21.3100000' AS DateTime2), CAST(N'2021-01-09T16:42:21.3100000' AS DateTime2), 71, 0)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (5, CAST(N'2021-01-09T16:45:31.4500000' AS DateTime2), CAST(N'2021-01-09T16:45:31.4500000' AS DateTime2), 72, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (6, CAST(N'2021-01-09T16:45:59.4000000' AS DateTime2), CAST(N'2021-01-09T16:45:59.4000000' AS DateTime2), 73, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (7, CAST(N'2021-01-09T16:46:02.6600000' AS DateTime2), CAST(N'2021-01-09T16:46:02.6600000' AS DateTime2), 74, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (8, CAST(N'2021-01-09T16:46:04.1500000' AS DateTime2), CAST(N'2021-01-09T16:46:04.1500000' AS DateTime2), 75, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (9, CAST(N'2021-01-09T16:46:42.8700000' AS DateTime2), CAST(N'2021-01-09T16:46:42.8700000' AS DateTime2), 76, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (10, CAST(N'2021-01-09T16:48:36.4000000' AS DateTime2), CAST(N'2021-01-09T16:48:36.4000000' AS DateTime2), 77, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (11, CAST(N'2021-01-09T16:48:39.1100000' AS DateTime2), CAST(N'2021-01-09T16:48:39.1100000' AS DateTime2), 78, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (12, CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), 79, 0)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (13, CAST(N'2021-01-09T16:52:52.1700000' AS DateTime2), CAST(N'2021-01-09T16:52:52.1700000' AS DateTime2), 80, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (14, CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), 83, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (15, CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), 85, 99)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (16, CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), 87, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (17, CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), 180, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (18, CAST(N'2021-01-09T23:39:28.3500000' AS DateTime2), CAST(N'2021-01-09T23:39:28.3500000' AS DateTime2), 181, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (19, CAST(N'2021-01-10T00:37:01.8300000' AS DateTime2), CAST(N'2021-01-10T00:37:01.8300000' AS DateTime2), 184, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (20, CAST(N'2021-01-10T00:38:41.5900000' AS DateTime2), CAST(N'2021-01-10T00:38:41.5900000' AS DateTime2), 185, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (21, CAST(N'2021-01-10T00:49:53.7600000' AS DateTime2), CAST(N'2021-01-10T00:49:53.7600000' AS DateTime2), 186, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (22, CAST(N'2021-01-10T00:55:32.3800000' AS DateTime2), CAST(N'2021-01-10T00:55:32.3800000' AS DateTime2), 187, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (23, CAST(N'2021-01-10T01:03:15.6900000' AS DateTime2), CAST(N'2021-01-10T01:03:15.6900000' AS DateTime2), 188, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (24, CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), 189, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (25, CAST(N'2021-01-10T01:08:23.2700000' AS DateTime2), CAST(N'2021-01-10T01:08:23.2700000' AS DateTime2), 190, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (26, CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), 191, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (27, CAST(N'2021-01-10T01:09:37.3900000' AS DateTime2), CAST(N'2021-01-10T01:09:37.3900000' AS DateTime2), 192, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (28, CAST(N'2021-01-10T01:11:04.5500000' AS DateTime2), CAST(N'2021-01-10T01:11:04.5500000' AS DateTime2), 193, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (29, CAST(N'2021-01-10T01:13:01.3300000' AS DateTime2), CAST(N'2021-01-10T01:13:01.3300000' AS DateTime2), 194, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (30, CAST(N'2021-01-10T01:14:10.8900000' AS DateTime2), CAST(N'2021-01-10T01:14:10.8900000' AS DateTime2), 195, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (31, CAST(N'2021-01-10T01:18:06.8500000' AS DateTime2), CAST(N'2021-01-10T01:18:06.8500000' AS DateTime2), 196, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (32, CAST(N'2021-01-10T01:26:00.0000000' AS DateTime2), CAST(N'2021-01-10T01:26:00.0000000' AS DateTime2), 199, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (33, CAST(N'2021-01-10T01:57:32.4100000' AS DateTime2), CAST(N'2021-01-10T01:57:32.4100000' AS DateTime2), 200, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (34, CAST(N'2021-01-10T02:13:00.6400000' AS DateTime2), CAST(N'2021-01-10T02:13:00.6400000' AS DateTime2), 201, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (35, CAST(N'2021-01-16T00:16:47.3600000' AS DateTime2), CAST(N'2021-01-16T00:16:47.3600000' AS DateTime2), 206, 15)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (36, CAST(N'2021-01-16T15:44:14.5700000' AS DateTime2), CAST(N'2021-01-16T15:44:14.5700000' AS DateTime2), 218, 15)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (37, CAST(N'2021-01-16T15:44:24.9600000' AS DateTime2), CAST(N'2021-01-16T15:44:24.9600000' AS DateTime2), 219, 15)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (38, CAST(N'2021-01-16T15:44:25.3800000' AS DateTime2), CAST(N'2021-01-16T15:44:25.3800000' AS DateTime2), 220, 15)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (39, CAST(N'2021-01-16T15:44:26.0400000' AS DateTime2), CAST(N'2021-01-16T15:44:26.0400000' AS DateTime2), 221, 15)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (40, CAST(N'2021-01-16T15:44:29.2400000' AS DateTime2), CAST(N'2021-01-16T15:44:29.2400000' AS DateTime2), 222, 15)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (41, CAST(N'2021-01-16T15:44:29.6800000' AS DateTime2), CAST(N'2021-01-16T15:44:29.6800000' AS DateTime2), 223, 15)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (42, CAST(N'2021-01-16T15:44:30.2200000' AS DateTime2), CAST(N'2021-01-16T15:44:30.2200000' AS DateTime2), 224, 15)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (43, CAST(N'2021-01-16T15:44:30.9700000' AS DateTime2), CAST(N'2021-01-16T15:44:30.9700000' AS DateTime2), 225, 15)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (44, CAST(N'2021-01-16T15:44:31.3500000' AS DateTime2), CAST(N'2021-01-16T15:44:31.3500000' AS DateTime2), 226, 15)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (45, CAST(N'2021-01-16T15:44:31.7600000' AS DateTime2), CAST(N'2021-01-16T15:44:31.7600000' AS DateTime2), 227, 15)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (46, CAST(N'2021-01-16T15:44:33.2300000' AS DateTime2), CAST(N'2021-01-16T15:44:33.2300000' AS DateTime2), 228, 15)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (47, CAST(N'2021-01-16T15:58:14.8800000' AS DateTime2), CAST(N'2021-01-16T15:58:14.8800000' AS DateTime2), 231, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (48, CAST(N'2021-01-16T23:01:08.7800000' AS DateTime2), CAST(N'2021-01-16T23:01:08.7800000' AS DateTime2), 250, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (49, CAST(N'2021-01-16T23:01:12.0900000' AS DateTime2), CAST(N'2021-01-16T23:01:12.0900000' AS DateTime2), 251, 32)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (50, CAST(N'2021-01-16T23:01:14.0400000' AS DateTime2), CAST(N'2021-01-16T23:01:14.0400000' AS DateTime2), 252, 32)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (51, CAST(N'2021-01-16T23:01:14.6000000' AS DateTime2), CAST(N'2021-01-16T23:01:14.6000000' AS DateTime2), 253, 32)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (52, CAST(N'2021-01-16T23:01:16.1900000' AS DateTime2), CAST(N'2021-01-16T23:01:16.1900000' AS DateTime2), 254, 32)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (53, CAST(N'2021-01-16T23:01:18.2900000' AS DateTime2), CAST(N'2021-01-16T23:01:18.2900000' AS DateTime2), 255, 32)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (54, CAST(N'2021-01-16T23:17:15.6700000' AS DateTime2), CAST(N'2021-01-16T23:17:15.6700000' AS DateTime2), 256, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (55, CAST(N'2021-01-16T23:17:26.8100000' AS DateTime2), CAST(N'2021-01-16T23:17:26.8100000' AS DateTime2), 257, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (56, CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), 258, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (57, CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), 259, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (58, CAST(N'2021-01-16T23:35:06.8700000' AS DateTime2), CAST(N'2021-01-16T23:35:06.8700000' AS DateTime2), 262, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (59, CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), 263, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (60, CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), 264, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (61, CAST(N'2021-01-16T23:36:53.9500000' AS DateTime2), CAST(N'2021-01-16T23:36:53.9500000' AS DateTime2), 265, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (62, CAST(N'2021-01-16T23:40:08.1100000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1100000' AS DateTime2), 266, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (63, CAST(N'2021-01-16T23:41:39.2200000' AS DateTime2), CAST(N'2021-01-16T23:41:39.2200000' AS DateTime2), 268, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (64, CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), 269, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (65, CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), 271, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (66, CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), 272, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (67, CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), 273, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (68, CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), 275, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (69, CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), 276, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (70, CAST(N'2021-01-17T00:26:56.1400000' AS DateTime2), CAST(N'2021-01-17T00:26:56.1400000' AS DateTime2), 309, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (71, CAST(N'2021-01-17T00:28:51.9200000' AS DateTime2), CAST(N'2021-01-17T00:28:51.9200000' AS DateTime2), 310, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (72, CAST(N'2021-01-17T00:29:06.9200000' AS DateTime2), CAST(N'2021-01-17T00:29:06.9200000' AS DateTime2), 311, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (73, CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), 312, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (74, CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), 313, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (75, CAST(N'2021-01-17T00:33:36.9000000' AS DateTime2), CAST(N'2021-01-17T00:33:36.9000000' AS DateTime2), 314, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (76, CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), 315, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (77, CAST(N'2021-01-17T00:33:56.8900000' AS DateTime2), CAST(N'2021-01-17T00:33:56.8900000' AS DateTime2), 316, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (78, CAST(N'2021-01-17T00:42:29.1700000' AS DateTime2), CAST(N'2021-01-17T00:42:29.1700000' AS DateTime2), 317, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (79, CAST(N'2021-01-17T00:48:08.8600000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8600000' AS DateTime2), 318, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (80, CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), 319, 12)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (81, CAST(N'2021-01-17T00:48:47.4700000' AS DateTime2), CAST(N'2021-01-17T00:48:47.4700000' AS DateTime2), 320, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (82, CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), 321, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (83, CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), 322, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (84, CAST(N'2021-01-17T00:53:05.2700000' AS DateTime2), CAST(N'2021-01-17T00:53:05.2700000' AS DateTime2), 323, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (85, CAST(N'2021-01-17T00:56:20.6700000' AS DateTime2), CAST(N'2021-01-17T00:56:20.6700000' AS DateTime2), 324, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (86, CAST(N'2021-01-17T01:00:27.4300000' AS DateTime2), CAST(N'2021-01-17T01:00:27.4300000' AS DateTime2), 325, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (87, CAST(N'2021-01-17T01:05:21.8600000' AS DateTime2), CAST(N'2021-01-17T01:05:21.8600000' AS DateTime2), 326, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (88, CAST(N'2021-01-17T01:10:25.6900000' AS DateTime2), CAST(N'2021-01-17T01:10:25.6900000' AS DateTime2), 327, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (89, CAST(N'2021-01-17T01:12:20.5500000' AS DateTime2), CAST(N'2021-01-17T01:12:20.5500000' AS DateTime2), 328, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (90, CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), 331, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (91, CAST(N'2021-01-17T01:33:32.7100000' AS DateTime2), CAST(N'2021-01-17T01:33:32.7100000' AS DateTime2), 332, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (92, CAST(N'2021-01-17T01:35:27.6800000' AS DateTime2), CAST(N'2021-01-17T01:35:27.6800000' AS DateTime2), 333, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (93, CAST(N'2021-01-17T01:39:52.3800000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3800000' AS DateTime2), 334, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (94, CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), 335, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (95, CAST(N'2021-01-17T01:42:59.4700000' AS DateTime2), CAST(N'2021-01-17T01:42:59.4700000' AS DateTime2), 336, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (96, CAST(N'2021-01-17T01:44:15.3200000' AS DateTime2), CAST(N'2021-01-17T01:44:15.3200000' AS DateTime2), 337, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (97, CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), 338, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (98, CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), 339, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (99, CAST(N'2021-01-17T01:45:51.2800000' AS DateTime2), CAST(N'2021-01-17T01:45:51.2800000' AS DateTime2), 340, 5)
GO
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (100, CAST(N'2021-01-17T01:47:08.6500000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6500000' AS DateTime2), 341, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (101, CAST(N'2021-01-17T01:53:45.4900000' AS DateTime2), CAST(N'2021-01-17T01:53:45.4900000' AS DateTime2), 343, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (102, CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), 344, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (103, CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), 345, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (104, CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), 346, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (105, CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), 347, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (106, CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), 348, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (107, CAST(N'2021-01-17T02:06:30.6100000' AS DateTime2), CAST(N'2021-01-17T02:06:30.6100000' AS DateTime2), 350, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (108, CAST(N'2021-01-17T02:12:25.2100000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2100000' AS DateTime2), 351, 9)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (109, CAST(N'2021-01-17T02:12:25.2200000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2200000' AS DateTime2), 352, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (110, CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), 353, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (111, CAST(N'2021-01-17T02:13:19.3600000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3600000' AS DateTime2), 354, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (112, CAST(N'2021-01-17T02:20:24.0700000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0700000' AS DateTime2), 355, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (113, CAST(N'2021-01-17T02:26:33.6900000' AS DateTime2), CAST(N'2021-01-17T02:26:33.6900000' AS DateTime2), 357, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (114, CAST(N'2021-01-17T02:31:36.7600000' AS DateTime2), CAST(N'2021-01-17T02:31:36.7600000' AS DateTime2), 359, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (115, CAST(N'2021-01-23T23:30:04.4300000' AS DateTime2), CAST(N'2021-01-23T23:30:04.4300000' AS DateTime2), 360, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (116, CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), 361, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (117, CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), 362, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (118, CAST(N'2021-01-23T23:38:26.8100000' AS DateTime2), CAST(N'2021-01-23T23:38:26.8100000' AS DateTime2), 363, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (119, CAST(N'2021-01-23T23:39:08.7100000' AS DateTime2), CAST(N'2021-01-23T23:39:08.7100000' AS DateTime2), 364, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (120, CAST(N'2021-01-23T23:41:30.5200000' AS DateTime2), CAST(N'2021-01-23T23:41:30.5200000' AS DateTime2), 365, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (121, CAST(N'2021-01-23T23:41:44.8000000' AS DateTime2), CAST(N'2021-01-23T23:41:44.8000000' AS DateTime2), 366, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (122, CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), 367, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (123, CAST(N'2021-01-23T23:45:57.2900000' AS DateTime2), CAST(N'2021-01-23T23:45:57.2900000' AS DateTime2), 368, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (124, CAST(N'2021-01-23T23:50:22.8800000' AS DateTime2), CAST(N'2021-01-23T23:50:22.8800000' AS DateTime2), 369, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (125, CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), 370, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (126, CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), 371, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (127, CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), 372, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (128, CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), 373, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (129, CAST(N'2021-01-23T23:59:42.1900000' AS DateTime2), CAST(N'2021-01-23T23:59:42.1900000' AS DateTime2), 374, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (130, CAST(N'2021-01-23T23:59:53.8900000' AS DateTime2), CAST(N'2021-01-23T23:59:53.8900000' AS DateTime2), 375, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (131, CAST(N'2021-01-24T00:05:45.7500000' AS DateTime2), CAST(N'2021-01-24T00:05:45.7500000' AS DateTime2), 376, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (132, CAST(N'2021-01-24T00:05:54.9900000' AS DateTime2), CAST(N'2021-01-24T00:05:54.9900000' AS DateTime2), 377, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (133, CAST(N'2021-01-24T00:06:07.6700000' AS DateTime2), CAST(N'2021-01-24T00:06:07.6700000' AS DateTime2), 378, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (134, CAST(N'2021-01-24T00:10:48.2000000' AS DateTime2), CAST(N'2021-01-24T00:10:48.2000000' AS DateTime2), 379, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (135, CAST(N'2021-01-24T00:10:48.2400000' AS DateTime2), CAST(N'2021-01-24T00:10:48.2400000' AS DateTime2), 380, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (136, CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), 381, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (137, CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), 383, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (138, CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), 385, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (139, CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), 386, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (140, CAST(N'2021-01-24T00:16:28.1700000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1700000' AS DateTime2), 387, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (141, CAST(N'2021-01-24T00:16:28.1800000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1800000' AS DateTime2), 388, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (142, CAST(N'2021-01-24T00:17:00.0800000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0800000' AS DateTime2), 389, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (143, CAST(N'2021-01-24T00:17:48.1700000' AS DateTime2), CAST(N'2021-01-24T00:17:48.1700000' AS DateTime2), 391, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (144, CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), 392, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (145, CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), 393, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (146, CAST(N'2021-01-24T00:20:25.5500000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5500000' AS DateTime2), 394, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (147, CAST(N'2021-01-24T00:20:25.5600000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5600000' AS DateTime2), 395, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (148, CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), 396, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (149, CAST(N'2021-01-24T00:21:59.8300000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8300000' AS DateTime2), 398, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (150, CAST(N'2021-01-24T00:23:04.1000000' AS DateTime2), CAST(N'2021-01-24T00:23:04.1000000' AS DateTime2), 400, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (151, CAST(N'2021-01-24T00:23:53.8100000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8100000' AS DateTime2), 401, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (152, CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), 402, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (153, CAST(N'2021-01-24T00:24:30.6400000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6400000' AS DateTime2), 403, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (154, CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), 405, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (155, CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), 406, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (156, CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), 407, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (157, CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), 408, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (158, CAST(N'2021-01-24T00:39:47.1300000' AS DateTime2), CAST(N'2021-01-24T00:39:47.1300000' AS DateTime2), 410, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (159, CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), 411, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (160, CAST(N'2021-01-24T00:40:16.8100000' AS DateTime2), CAST(N'2021-01-24T00:40:16.8100000' AS DateTime2), 412, 13)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (161, CAST(N'2021-01-24T00:40:36.4700000' AS DateTime2), CAST(N'2021-01-24T00:40:36.4700000' AS DateTime2), 413, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (162, CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), 414, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (163, CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), 415, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (164, CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), 416, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (165, CAST(N'2021-01-24T00:43:06.7700000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7700000' AS DateTime2), 418, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (166, CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), 419, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (167, CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), 420, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (168, CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), 421, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (169, CAST(N'2021-01-24T00:48:36.8200000' AS DateTime2), CAST(N'2021-01-24T00:48:36.8200000' AS DateTime2), 422, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (170, CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), 423, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (171, CAST(N'2021-01-24T00:50:42.6300000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6300000' AS DateTime2), 424, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (172, CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), 425, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (173, CAST(N'2021-01-24T00:52:57.6000000' AS DateTime2), CAST(N'2021-01-24T00:52:57.6000000' AS DateTime2), 426, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (174, CAST(N'2021-01-24T00:52:57.6300000' AS DateTime2), CAST(N'2021-01-24T00:52:57.6300000' AS DateTime2), 427, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (175, CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), 428, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (176, CAST(N'2021-01-24T00:54:45.4000000' AS DateTime2), CAST(N'2021-01-24T00:54:45.4000000' AS DateTime2), 429, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (177, CAST(N'2021-01-24T00:55:23.2400000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2400000' AS DateTime2), 430, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (178, CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), 431, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (179, CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), 432, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (180, CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), 433, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (181, CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), 434, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (182, CAST(N'2021-01-24T00:57:30.0000000' AS DateTime2), CAST(N'2021-01-24T00:57:30.0000000' AS DateTime2), 435, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (183, CAST(N'2021-01-24T00:58:48.3700000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3700000' AS DateTime2), 436, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (184, CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), 438, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (185, CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), 439, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (186, CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), 440, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (187, CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), 441, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (188, CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), 442, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (189, CAST(N'2021-01-24T01:00:24.8800000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8800000' AS DateTime2), 443, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (190, CAST(N'2021-01-24T01:01:30.6600000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6600000' AS DateTime2), 444, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (191, CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), 445, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (192, CAST(N'2021-01-24T01:02:14.1500000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1500000' AS DateTime2), 446, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (193, CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), 447, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (194, CAST(N'2021-01-24T01:19:32.2300000' AS DateTime2), CAST(N'2021-01-24T01:19:32.2300000' AS DateTime2), 448, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (195, CAST(N'2021-01-24T01:35:51.6400000' AS DateTime2), CAST(N'2021-01-24T01:35:51.6400000' AS DateTime2), 449, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (196, CAST(N'2021-01-24T01:40:36.9900000' AS DateTime2), CAST(N'2021-01-24T01:40:36.9900000' AS DateTime2), 450, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (197, CAST(N'2021-01-24T01:42:28.4500000' AS DateTime2), CAST(N'2021-01-24T01:42:28.4500000' AS DateTime2), 451, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (198, CAST(N'2021-01-24T01:43:19.1900000' AS DateTime2), CAST(N'2021-01-24T01:43:19.1900000' AS DateTime2), 452, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (199, CAST(N'2021-01-24T01:43:49.1400000' AS DateTime2), CAST(N'2021-01-24T01:43:49.1400000' AS DateTime2), 453, 2)
GO
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (200, CAST(N'2021-01-24T01:44:04.4800000' AS DateTime2), CAST(N'2021-01-24T01:44:04.4800000' AS DateTime2), 454, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (201, CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), 455, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (202, CAST(N'2021-01-24T02:10:45.7300000' AS DateTime2), CAST(N'2021-01-24T02:10:45.7300000' AS DateTime2), 456, 8)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (203, CAST(N'2021-01-24T02:20:54.7800000' AS DateTime2), CAST(N'2021-01-24T02:20:54.7800000' AS DateTime2), 457, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (1115, CAST(N'2021-01-30T23:31:15.1800000' AS DateTime2), CAST(N'2021-01-30T23:31:15.1800000' AS DateTime2), 1360, -1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (1116, CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), 1361, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (1117, CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), 1362, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (1118, CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), 1363, 7)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (1119, CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), 1364, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (1120, CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), 1365, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (1121, CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), 1366, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (1122, CAST(N'2021-01-31T01:32:19.3800000' AS DateTime2), CAST(N'2021-01-31T01:32:19.3800000' AS DateTime2), 1367, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (1123, CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), 1368, 7)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (1124, CAST(N'2021-01-31T01:42:46.3900000' AS DateTime2), CAST(N'2021-01-31T01:42:46.3900000' AS DateTime2), 1369, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2115, CAST(N'2021-02-07T00:20:52.0400000' AS DateTime2), CAST(N'2021-02-07T00:20:52.0400000' AS DateTime2), 2360, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2116, CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), 2361, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2117, CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), 2362, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2118, CAST(N'2021-02-07T00:24:45.5700000' AS DateTime2), CAST(N'2021-02-07T00:24:45.5700000' AS DateTime2), 2363, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2119, CAST(N'2021-02-07T00:34:31.3100000' AS DateTime2), CAST(N'2021-02-07T00:34:31.3100000' AS DateTime2), 2364, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2120, CAST(N'2021-02-07T00:34:36.0200000' AS DateTime2), CAST(N'2021-02-07T00:34:36.0200000' AS DateTime2), 2365, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2121, CAST(N'2021-02-07T00:35:19.5700000' AS DateTime2), CAST(N'2021-02-07T00:35:19.5700000' AS DateTime2), 2366, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2122, CAST(N'2021-02-07T00:44:30.7300000' AS DateTime2), CAST(N'2021-02-07T00:44:30.7300000' AS DateTime2), 2367, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2123, CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), 2368, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2124, CAST(N'2021-02-07T00:44:50.1400000' AS DateTime2), CAST(N'2021-02-07T00:44:50.1400000' AS DateTime2), 2369, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2125, CAST(N'2021-02-07T00:44:51.9200000' AS DateTime2), CAST(N'2021-02-07T00:44:51.9200000' AS DateTime2), 2370, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2126, CAST(N'2021-02-07T00:47:24.9100000' AS DateTime2), CAST(N'2021-02-07T00:47:24.9100000' AS DateTime2), 2371, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2127, CAST(N'2021-02-07T00:53:08.9600000' AS DateTime2), CAST(N'2021-02-07T00:53:08.9600000' AS DateTime2), 2372, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2128, CAST(N'2021-02-07T00:58:29.7100000' AS DateTime2), CAST(N'2021-02-07T00:58:29.7100000' AS DateTime2), 2373, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2129, CAST(N'2021-02-07T01:08:40.2600000' AS DateTime2), CAST(N'2021-02-07T01:08:40.2600000' AS DateTime2), 2374, 7)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2130, CAST(N'2021-02-07T01:10:15.8800000' AS DateTime2), CAST(N'2021-02-07T01:10:15.8800000' AS DateTime2), 2375, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2131, CAST(N'2021-02-07T01:11:03.3000000' AS DateTime2), CAST(N'2021-02-07T01:11:03.3000000' AS DateTime2), 2376, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2132, CAST(N'2021-02-07T01:23:03.8100000' AS DateTime2), CAST(N'2021-02-07T01:23:03.8100000' AS DateTime2), 2377, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2133, CAST(N'2021-02-07T01:34:28.0600000' AS DateTime2), CAST(N'2021-02-07T01:34:28.0600000' AS DateTime2), 2378, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2134, CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), 2379, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2135, CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), 2380, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2136, CAST(N'2021-02-07T01:39:15.4700000' AS DateTime2), CAST(N'2021-02-07T01:39:15.4700000' AS DateTime2), 2381, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2137, CAST(N'2021-02-07T01:44:59.2800000' AS DateTime2), CAST(N'2021-02-07T01:44:59.2800000' AS DateTime2), 2382, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2138, CAST(N'2021-02-07T01:50:33.4600000' AS DateTime2), CAST(N'2021-02-07T01:50:33.4600000' AS DateTime2), 2383, 7)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2139, CAST(N'2021-02-07T01:55:14.2400000' AS DateTime2), CAST(N'2021-02-07T01:55:14.2400000' AS DateTime2), 2384, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2140, CAST(N'2021-02-07T02:08:00.2800000' AS DateTime2), CAST(N'2021-02-07T02:08:00.2800000' AS DateTime2), 2385, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2141, CAST(N'2021-02-07T02:09:10.3400000' AS DateTime2), CAST(N'2021-02-07T02:09:10.3400000' AS DateTime2), 2386, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2142, CAST(N'2021-02-07T02:13:21.3600000' AS DateTime2), CAST(N'2021-02-07T02:13:21.3600000' AS DateTime2), 2387, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2143, CAST(N'2021-02-07T02:17:24.0100000' AS DateTime2), CAST(N'2021-02-07T02:17:24.0100000' AS DateTime2), 2388, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2144, CAST(N'2021-02-07T02:25:00.5700000' AS DateTime2), CAST(N'2021-02-07T02:25:00.5700000' AS DateTime2), 2389, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2145, CAST(N'2021-02-07T02:26:35.7200000' AS DateTime2), CAST(N'2021-02-07T02:26:35.7200000' AS DateTime2), 2390, 7)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2146, CAST(N'2021-02-13T23:24:31.4700000' AS DateTime2), CAST(N'2021-02-13T23:24:31.4700000' AS DateTime2), 2391, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2147, CAST(N'2021-02-13T23:38:59.3500000' AS DateTime2), CAST(N'2021-02-13T23:38:59.3500000' AS DateTime2), 2393, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2148, CAST(N'2021-02-14T00:02:15.3000000' AS DateTime2), CAST(N'2021-02-14T00:02:15.3000000' AS DateTime2), 2394, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2149, CAST(N'2021-02-14T00:02:59.3400000' AS DateTime2), CAST(N'2021-02-14T00:02:59.3400000' AS DateTime2), 2395, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2150, CAST(N'2021-02-14T00:20:43.2900000' AS DateTime2), CAST(N'2021-02-14T00:20:43.2900000' AS DateTime2), 2396, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2151, CAST(N'2021-02-14T00:22:09.2600000' AS DateTime2), CAST(N'2021-02-14T00:22:09.2600000' AS DateTime2), 2397, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2152, CAST(N'2021-02-14T00:31:00.1200000' AS DateTime2), CAST(N'2021-02-14T00:31:00.1200000' AS DateTime2), 2398, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2153, CAST(N'2021-02-14T00:32:52.4900000' AS DateTime2), CAST(N'2021-02-14T00:32:52.4900000' AS DateTime2), 2399, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2154, CAST(N'2021-02-14T00:45:17.7800000' AS DateTime2), CAST(N'2021-02-14T00:45:17.7800000' AS DateTime2), 2400, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2155, CAST(N'2021-02-14T00:50:01.6800000' AS DateTime2), CAST(N'2021-02-14T00:50:01.6800000' AS DateTime2), 2401, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2156, CAST(N'2021-02-14T00:54:25.1000000' AS DateTime2), CAST(N'2021-02-14T00:54:25.1000000' AS DateTime2), 2402, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2157, CAST(N'2021-02-14T00:57:01.7500000' AS DateTime2), CAST(N'2021-02-14T00:57:01.7500000' AS DateTime2), 2404, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2158, CAST(N'2021-02-14T01:01:39.9800000' AS DateTime2), CAST(N'2021-02-14T01:01:39.9800000' AS DateTime2), 2405, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2159, CAST(N'2021-02-14T01:03:46.3500000' AS DateTime2), CAST(N'2021-02-14T01:03:46.3500000' AS DateTime2), 2408, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2160, CAST(N'2021-02-14T01:10:43.4500000' AS DateTime2), CAST(N'2021-02-14T01:10:43.4500000' AS DateTime2), 2409, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2161, CAST(N'2021-02-14T01:15:15.6800000' AS DateTime2), CAST(N'2021-02-14T01:15:15.6800000' AS DateTime2), 2410, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2162, CAST(N'2021-02-14T01:15:25.9500000' AS DateTime2), CAST(N'2021-02-14T01:15:25.9500000' AS DateTime2), 2411, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2163, CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), 2412, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2164, CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), 2413, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2165, CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), 2414, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2166, CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), 2415, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2167, CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), 2416, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2168, CAST(N'2021-02-14T01:27:44.4800000' AS DateTime2), CAST(N'2021-02-14T01:27:44.4800000' AS DateTime2), 2417, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2169, CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), 2418, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2170, CAST(N'2021-02-14T01:33:59.8600000' AS DateTime2), CAST(N'2021-02-14T01:33:59.8600000' AS DateTime2), 2419, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2171, CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), 2420, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2172, CAST(N'2021-02-14T01:36:19.2900000' AS DateTime2), CAST(N'2021-02-14T01:36:19.2900000' AS DateTime2), 2421, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2173, CAST(N'2021-02-14T01:36:28.1800000' AS DateTime2), CAST(N'2021-02-14T01:36:28.1800000' AS DateTime2), 2422, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2174, CAST(N'2021-02-14T01:40:17.2700000' AS DateTime2), CAST(N'2021-02-14T01:40:17.2700000' AS DateTime2), 2423, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2175, CAST(N'2021-02-14T01:41:29.2400000' AS DateTime2), CAST(N'2021-02-14T01:41:29.2400000' AS DateTime2), 2424, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2176, CAST(N'2021-02-14T01:44:57.0500000' AS DateTime2), CAST(N'2021-02-14T01:44:57.0500000' AS DateTime2), 2425, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2177, CAST(N'2021-02-14T01:46:32.0600000' AS DateTime2), CAST(N'2021-02-14T01:46:32.0600000' AS DateTime2), 2426, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2178, CAST(N'2021-02-14T01:48:36.0500000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0500000' AS DateTime2), 2427, 7)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2179, CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), 2428, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2180, CAST(N'2021-02-14T01:49:53.8300000' AS DateTime2), CAST(N'2021-02-14T01:49:53.8300000' AS DateTime2), 2429, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2181, CAST(N'2021-02-14T01:54:03.1600000' AS DateTime2), CAST(N'2021-02-14T01:54:03.1600000' AS DateTime2), 2430, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2182, CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), 2431, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2183, CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), 2432, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2184, CAST(N'2021-02-14T02:01:59.6100000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6100000' AS DateTime2), 2433, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2185, CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), 2434, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2186, CAST(N'2021-02-14T02:03:04.3200000' AS DateTime2), CAST(N'2021-02-14T02:03:04.3200000' AS DateTime2), 2435, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2187, CAST(N'2021-02-14T02:05:30.1800000' AS DateTime2), CAST(N'2021-02-14T02:05:30.1800000' AS DateTime2), 2436, -1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2188, CAST(N'2021-02-14T02:07:42.4900000' AS DateTime2), CAST(N'2021-02-14T02:07:42.4900000' AS DateTime2), 2437, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2189, CAST(N'2021-02-14T02:07:57.6000000' AS DateTime2), CAST(N'2021-02-14T02:07:57.6000000' AS DateTime2), 2438, 1)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2190, CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), 2439, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2191, CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), 2440, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2192, CAST(N'2021-02-14T02:17:45.7000000' AS DateTime2), CAST(N'2021-02-14T02:17:45.7000000' AS DateTime2), 2441, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2193, CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), 2442, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2194, CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), 2443, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2195, CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), 2444, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2196, CAST(N'2021-02-14T02:21:03.1000000' AS DateTime2), CAST(N'2021-02-14T02:21:03.1000000' AS DateTime2), 2445, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2197, CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), 2446, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2198, CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), 2447, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2199, CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), 2448, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2200, CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), 2449, 3)
GO
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2201, CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), 2450, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2202, CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), 2451, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2203, CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), 2453, 4)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2204, CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), 2454, 2)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2205, CAST(N'2021-02-14T02:29:51.3000000' AS DateTime2), CAST(N'2021-02-14T02:29:51.3000000' AS DateTime2), 2455, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2206, CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), 2456, 5)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2207, CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), 2457, 3)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2208, CAST(N'2021-02-14T02:39:44.9700000' AS DateTime2), CAST(N'2021-02-14T02:39:44.9700000' AS DateTime2), 2458, 6)
INSERT [Rolls].[RollModifiers] ([RollModifierId], [DateCreated], [DateModified], [RollId], [Value]) VALUES (2209, CAST(N'2021-02-14T02:40:06.9300000' AS DateTime2), CAST(N'2021-02-14T02:40:06.9300000' AS DateTime2), 2459, 4)
SET IDENTITY_INSERT [Rolls].[RollModifiers] OFF
SET IDENTITY_INSERT [Rolls].[Rolls] ON

INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (1, 2, CAST(N'2021-01-02T23:03:17.5000000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2, 11, CAST(N'2021-01-02T23:37:41.7900000' AS DateTime2), CAST(N'2021-01-02T23:37:41.7900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (3, 12, CAST(N'2021-01-02T23:47:43.2500000' AS DateTime2), CAST(N'2021-01-02T23:47:43.2500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (4, 13, CAST(N'2021-01-02T23:47:55.0700000' AS DateTime2), CAST(N'2021-01-02T23:47:55.0700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (5, 14, CAST(N'2021-01-02T23:48:23.1400000' AS DateTime2), CAST(N'2021-01-02T23:48:23.1400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (6, 15, CAST(N'2021-01-02T23:53:09.1700000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (7, 16, CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (8, 17, CAST(N'2021-01-02T23:56:24.7400000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (9, 18, CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (10, 19, CAST(N'2021-01-03T00:01:23.0700000' AS DateTime2), CAST(N'2021-01-03T00:01:23.0700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (11, 20, CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (12, 21, CAST(N'2021-01-03T00:03:28.0500000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (13, 22, CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (14, 23, CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (15, 24, CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (16, 25, CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (17, 26, CAST(N'2021-01-03T00:10:34.6000000' AS DateTime2), CAST(N'2021-01-03T00:10:34.6000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (18, 27, CAST(N'2021-01-03T00:32:24.9500000' AS DateTime2), CAST(N'2021-01-03T00:32:24.9500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (19, 28, CAST(N'2021-01-03T00:34:19.1100000' AS DateTime2), CAST(N'2021-01-03T00:34:19.1100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (20, 29, CAST(N'2021-01-03T00:35:06.6800000' AS DateTime2), CAST(N'2021-01-03T00:35:06.6800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (21, 30, CAST(N'2021-01-03T00:35:14.7400000' AS DateTime2), CAST(N'2021-01-03T00:35:14.7400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (22, 31, CAST(N'2021-01-03T00:36:08.4200000' AS DateTime2), CAST(N'2021-01-03T00:36:08.4200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (23, 32, CAST(N'2021-01-03T00:36:15.3400000' AS DateTime2), CAST(N'2021-01-03T00:36:15.3400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (24, 33, CAST(N'2021-01-03T00:36:25.3300000' AS DateTime2), CAST(N'2021-01-03T00:36:25.3300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (25, 34, CAST(N'2021-01-03T00:39:52.7800000' AS DateTime2), CAST(N'2021-01-03T00:39:52.7800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (26, 35, CAST(N'2021-01-03T00:41:06.7300000' AS DateTime2), CAST(N'2021-01-03T00:41:06.7300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (27, 36, CAST(N'2021-01-03T00:42:05.9200000' AS DateTime2), CAST(N'2021-01-03T00:42:05.9200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (28, 37, CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (29, 38, CAST(N'2021-01-03T00:44:25.0500000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (30, 39, CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (31, 40, CAST(N'2021-01-03T00:47:21.0500000' AS DateTime2), CAST(N'2021-01-03T00:47:21.0500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (32, 41, CAST(N'2021-01-03T00:49:07.0400000' AS DateTime2), CAST(N'2021-01-03T00:49:07.0400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (33, 42, CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (34, 43, CAST(N'2021-01-03T00:53:24.9100000' AS DateTime2), CAST(N'2021-01-03T00:53:24.9100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (35, 44, CAST(N'2021-01-03T00:54:40.1400000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (36, 45, CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (37, 46, CAST(N'2021-01-03T00:55:01.2200000' AS DateTime2), CAST(N'2021-01-03T00:55:01.2200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (38, 47, CAST(N'2021-01-03T00:59:20.2200000' AS DateTime2), CAST(N'2021-01-03T00:59:20.2200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (39, 48, CAST(N'2021-01-03T01:00:03.4000000' AS DateTime2), CAST(N'2021-01-03T01:00:03.4000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (40, 49, CAST(N'2021-01-03T01:01:44.9900000' AS DateTime2), CAST(N'2021-01-03T01:01:44.9900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (41, 50, CAST(N'2021-01-03T01:02:55.3900000' AS DateTime2), CAST(N'2021-01-03T01:02:55.3900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (42, 51, CAST(N'2021-01-03T01:04:37.5900000' AS DateTime2), CAST(N'2021-01-03T01:04:37.5900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (43, 52, CAST(N'2021-01-03T01:04:53.0300000' AS DateTime2), CAST(N'2021-01-03T01:04:53.0300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (44, 53, CAST(N'2021-01-03T01:04:59.7000000' AS DateTime2), CAST(N'2021-01-03T01:04:59.7000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (45, 54, CAST(N'2021-01-03T01:22:24.2800000' AS DateTime2), CAST(N'2021-01-03T01:22:24.2800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (46, 55, CAST(N'2021-01-03T01:27:36.8700000' AS DateTime2), CAST(N'2021-01-03T01:27:36.8700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (47, 56, CAST(N'2021-01-03T01:43:57.1900000' AS DateTime2), CAST(N'2021-01-03T01:43:57.1900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (48, 57, CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (49, 58, CAST(N'2021-01-03T01:46:42.2800000' AS DateTime2), CAST(N'2021-01-03T01:46:42.2800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (50, 59, CAST(N'2021-01-03T01:49:06.7500000' AS DateTime2), CAST(N'2021-01-03T01:49:06.7500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (51, 60, CAST(N'2021-01-03T01:53:35.9000000' AS DateTime2), CAST(N'2021-01-03T01:53:35.9000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (52, 61, CAST(N'2021-01-03T01:59:19.1500000' AS DateTime2), CAST(N'2021-01-03T01:59:19.1500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (53, 62, CAST(N'2021-01-03T01:59:23.4700000' AS DateTime2), CAST(N'2021-01-03T01:59:23.4700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (54, 63, CAST(N'2021-01-03T02:00:14.9200000' AS DateTime2), CAST(N'2021-01-03T02:00:14.9200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (55, 64, CAST(N'2021-01-03T02:24:56.8700000' AS DateTime2), CAST(N'2021-01-03T02:24:56.8700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (56, 65, CAST(N'2021-01-03T02:53:27.6000000' AS DateTime2), CAST(N'2021-01-03T02:53:27.6000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (57, 66, CAST(N'2021-01-03T02:54:22.1500000' AS DateTime2), CAST(N'2021-01-03T02:54:22.1500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (58, 67, CAST(N'2021-01-03T02:54:24.6100000' AS DateTime2), CAST(N'2021-01-03T02:54:24.6100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (59, 68, CAST(N'2021-01-03T02:54:33.1800000' AS DateTime2), CAST(N'2021-01-03T02:54:33.1800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (60, 69, CAST(N'2021-01-03T02:54:39.1300000' AS DateTime2), CAST(N'2021-01-03T02:54:39.1300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (61, 70, CAST(N'2021-01-03T02:55:26.3000000' AS DateTime2), CAST(N'2021-01-03T02:55:26.3000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (62, 71, CAST(N'2021-01-03T02:55:37.8600000' AS DateTime2), CAST(N'2021-01-03T02:55:37.8600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (63, 72, CAST(N'2021-01-03T02:56:25.8400000' AS DateTime2), CAST(N'2021-01-03T02:56:25.8400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (64, 73, CAST(N'2021-01-03T02:56:40.4400000' AS DateTime2), CAST(N'2021-01-03T02:56:40.4400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (65, 74, CAST(N'2021-01-03T03:00:25.2800000' AS DateTime2), CAST(N'2021-01-03T03:00:25.2800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (66, 75, CAST(N'2021-01-03T03:00:33.6200000' AS DateTime2), CAST(N'2021-01-03T03:00:33.6200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (67, 76, CAST(N'2021-01-09T16:22:17.0000000' AS DateTime2), CAST(N'2021-01-09T16:22:17.0000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (68, 77, CAST(N'2021-01-09T16:23:23.6300000' AS DateTime2), CAST(N'2021-01-09T16:23:23.6300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (69, 78, CAST(N'2021-01-09T16:35:23.3000000' AS DateTime2), CAST(N'2021-01-09T16:35:23.3000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (70, 79, CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (71, 80, CAST(N'2021-01-09T16:42:21.3000000' AS DateTime2), CAST(N'2021-01-09T16:42:21.3000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (72, 81, CAST(N'2021-01-09T16:45:31.4400000' AS DateTime2), CAST(N'2021-01-09T16:45:31.4400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (73, 82, CAST(N'2021-01-09T16:45:59.4000000' AS DateTime2), CAST(N'2021-01-09T16:45:59.4000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (74, 83, CAST(N'2021-01-09T16:46:02.6500000' AS DateTime2), CAST(N'2021-01-09T16:46:02.6500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (75, 84, CAST(N'2021-01-09T16:46:04.1400000' AS DateTime2), CAST(N'2021-01-09T16:46:04.1400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (76, 85, CAST(N'2021-01-09T16:46:42.8600000' AS DateTime2), CAST(N'2021-01-09T16:46:42.8600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (77, 86, CAST(N'2021-01-09T16:48:36.4000000' AS DateTime2), CAST(N'2021-01-09T16:48:36.4000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (78, 87, CAST(N'2021-01-09T16:48:39.1100000' AS DateTime2), CAST(N'2021-01-09T16:48:39.1100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (79, 88, CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (80, 89, CAST(N'2021-01-09T16:52:52.1600000' AS DateTime2), CAST(N'2021-01-09T16:52:52.1600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (81, 90, CAST(N'2021-01-09T17:50:13.2700000' AS DateTime2), CAST(N'2021-01-09T17:50:13.2700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (82, 91, CAST(N'2021-01-09T18:38:29.7000000' AS DateTime2), CAST(N'2021-01-09T18:38:29.7000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (83, 92, CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (84, 93, CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (85, 94, CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (86, 95, CAST(N'2021-01-09T18:45:12.8300000' AS DateTime2), CAST(N'2021-01-09T18:45:12.8300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (87, 96, CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (88, 97, CAST(N'2021-01-09T19:35:06.7600000' AS DateTime2), CAST(N'2021-01-09T19:35:06.7600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (89, 98, CAST(N'2021-01-09T19:35:10.3500000' AS DateTime2), CAST(N'2021-01-09T19:35:10.3500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (90, 99, CAST(N'2021-01-09T19:35:11.0200000' AS DateTime2), CAST(N'2021-01-09T19:35:11.0200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (91, 100, CAST(N'2021-01-09T19:35:11.5400000' AS DateTime2), CAST(N'2021-01-09T19:35:11.5400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (92, 101, CAST(N'2021-01-09T19:35:12.0100000' AS DateTime2), CAST(N'2021-01-09T19:35:12.0100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (93, 102, CAST(N'2021-01-09T19:35:12.6300000' AS DateTime2), CAST(N'2021-01-09T19:35:12.6300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (94, 103, CAST(N'2021-01-09T19:35:12.9500000' AS DateTime2), CAST(N'2021-01-09T19:35:12.9500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (95, 104, CAST(N'2021-01-09T19:35:13.1600000' AS DateTime2), CAST(N'2021-01-09T19:35:13.1600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (96, 105, CAST(N'2021-01-09T19:35:13.3400000' AS DateTime2), CAST(N'2021-01-09T19:35:13.3400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (97, 106, CAST(N'2021-01-09T19:35:13.5200000' AS DateTime2), CAST(N'2021-01-09T19:35:13.5200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (98, 107, CAST(N'2021-01-09T19:35:13.6700000' AS DateTime2), CAST(N'2021-01-09T19:35:13.6700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (99, 108, CAST(N'2021-01-09T19:35:13.8300000' AS DateTime2), CAST(N'2021-01-09T19:35:13.8300000' AS DateTime2))
GO
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (100, 109, CAST(N'2021-01-09T19:35:13.9800000' AS DateTime2), CAST(N'2021-01-09T19:35:13.9800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (101, 110, CAST(N'2021-01-09T19:35:14.2600000' AS DateTime2), CAST(N'2021-01-09T19:35:14.2600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (102, 111, CAST(N'2021-01-09T19:35:14.3900000' AS DateTime2), CAST(N'2021-01-09T19:35:14.3900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (103, 112, CAST(N'2021-01-09T19:35:14.5500000' AS DateTime2), CAST(N'2021-01-09T19:35:14.5500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (104, 113, CAST(N'2021-01-09T19:35:14.7000000' AS DateTime2), CAST(N'2021-01-09T19:35:14.7000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (105, 114, CAST(N'2021-01-09T19:35:14.8700000' AS DateTime2), CAST(N'2021-01-09T19:35:14.8700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (106, 115, CAST(N'2021-01-09T19:35:15.0400000' AS DateTime2), CAST(N'2021-01-09T19:35:15.0400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (107, 116, CAST(N'2021-01-09T19:35:15.2000000' AS DateTime2), CAST(N'2021-01-09T19:35:15.2000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (108, 117, CAST(N'2021-01-09T19:35:15.3800000' AS DateTime2), CAST(N'2021-01-09T19:35:15.3800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (109, 118, CAST(N'2021-01-09T19:35:15.5600000' AS DateTime2), CAST(N'2021-01-09T19:35:15.5600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (110, 119, CAST(N'2021-01-09T19:35:15.7300000' AS DateTime2), CAST(N'2021-01-09T19:35:15.7300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (111, 120, CAST(N'2021-01-09T19:35:15.9000000' AS DateTime2), CAST(N'2021-01-09T19:35:15.9000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (112, 121, CAST(N'2021-01-09T19:35:16.0600000' AS DateTime2), CAST(N'2021-01-09T19:35:16.0600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (113, 122, CAST(N'2021-01-09T19:35:16.2200000' AS DateTime2), CAST(N'2021-01-09T19:35:16.2200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (114, 123, CAST(N'2021-01-09T19:35:16.3900000' AS DateTime2), CAST(N'2021-01-09T19:35:16.3900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (115, 124, CAST(N'2021-01-09T19:35:16.5500000' AS DateTime2), CAST(N'2021-01-09T19:35:16.5500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (116, 125, CAST(N'2021-01-09T19:35:16.7000000' AS DateTime2), CAST(N'2021-01-09T19:35:16.7000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (117, 126, CAST(N'2021-01-09T19:35:16.8500000' AS DateTime2), CAST(N'2021-01-09T19:35:16.8500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (118, 127, CAST(N'2021-01-09T19:35:16.9800000' AS DateTime2), CAST(N'2021-01-09T19:35:16.9800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (119, 128, CAST(N'2021-01-09T19:35:56.2500000' AS DateTime2), CAST(N'2021-01-09T19:35:56.2500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (120, 129, CAST(N'2021-01-09T19:35:56.4200000' AS DateTime2), CAST(N'2021-01-09T19:35:56.4200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (121, 130, CAST(N'2021-01-09T19:35:56.9500000' AS DateTime2), CAST(N'2021-01-09T19:35:56.9500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (122, 131, CAST(N'2021-01-09T19:35:57.1400000' AS DateTime2), CAST(N'2021-01-09T19:35:57.1400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (123, 132, CAST(N'2021-01-09T19:35:57.5700000' AS DateTime2), CAST(N'2021-01-09T19:35:57.5700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (124, 133, CAST(N'2021-01-09T19:37:39.2200000' AS DateTime2), CAST(N'2021-01-09T19:37:39.2200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (125, 134, CAST(N'2021-01-09T19:37:39.4800000' AS DateTime2), CAST(N'2021-01-09T19:37:39.4800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (126, 135, CAST(N'2021-01-09T19:37:39.8700000' AS DateTime2), CAST(N'2021-01-09T19:37:39.8700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (127, 136, CAST(N'2021-01-09T19:37:40.2100000' AS DateTime2), CAST(N'2021-01-09T19:37:40.2100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (128, 137, CAST(N'2021-01-09T19:37:40.4600000' AS DateTime2), CAST(N'2021-01-09T19:37:40.4600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (129, 138, CAST(N'2021-01-09T19:37:40.6300000' AS DateTime2), CAST(N'2021-01-09T19:37:40.6300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (130, 139, CAST(N'2021-01-09T19:37:40.8000000' AS DateTime2), CAST(N'2021-01-09T19:37:40.8000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (131, 140, CAST(N'2021-01-09T19:37:40.9900000' AS DateTime2), CAST(N'2021-01-09T19:37:40.9900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (132, 141, CAST(N'2021-01-09T19:37:41.1500000' AS DateTime2), CAST(N'2021-01-09T19:37:41.1500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (133, 142, CAST(N'2021-01-09T19:37:41.3200000' AS DateTime2), CAST(N'2021-01-09T19:37:41.3200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (134, 143, CAST(N'2021-01-09T19:37:41.4700000' AS DateTime2), CAST(N'2021-01-09T19:37:41.4700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (135, 144, CAST(N'2021-01-09T19:37:41.6400000' AS DateTime2), CAST(N'2021-01-09T19:37:41.6400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (136, 145, CAST(N'2021-01-09T19:37:41.8100000' AS DateTime2), CAST(N'2021-01-09T19:37:41.8100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (137, 146, CAST(N'2021-01-09T19:37:41.9700000' AS DateTime2), CAST(N'2021-01-09T19:37:41.9700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (138, 147, CAST(N'2021-01-09T19:37:42.1900000' AS DateTime2), CAST(N'2021-01-09T19:37:42.1900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (139, 148, CAST(N'2021-01-09T19:37:42.3000000' AS DateTime2), CAST(N'2021-01-09T19:37:42.3000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (140, 149, CAST(N'2021-01-09T19:37:42.4800000' AS DateTime2), CAST(N'2021-01-09T19:37:42.4800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (141, 150, CAST(N'2021-01-09T19:37:42.6400000' AS DateTime2), CAST(N'2021-01-09T19:37:42.6400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (142, 151, CAST(N'2021-01-09T19:37:42.8100000' AS DateTime2), CAST(N'2021-01-09T19:37:42.8100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (143, 152, CAST(N'2021-01-09T19:37:42.9900000' AS DateTime2), CAST(N'2021-01-09T19:37:42.9900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (144, 153, CAST(N'2021-01-09T19:37:43.1600000' AS DateTime2), CAST(N'2021-01-09T19:37:43.1600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (145, 154, CAST(N'2021-01-09T19:37:43.3200000' AS DateTime2), CAST(N'2021-01-09T19:37:43.3200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (146, 155, CAST(N'2021-01-09T19:37:43.4900000' AS DateTime2), CAST(N'2021-01-09T19:37:43.4900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (147, 156, CAST(N'2021-01-09T19:37:43.6500000' AS DateTime2), CAST(N'2021-01-09T19:37:43.6500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (148, 157, CAST(N'2021-01-09T19:37:43.8400000' AS DateTime2), CAST(N'2021-01-09T19:37:43.8400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (149, 158, CAST(N'2021-01-09T19:37:44.0100000' AS DateTime2), CAST(N'2021-01-09T19:37:44.0100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (150, 159, CAST(N'2021-01-09T19:37:44.2100000' AS DateTime2), CAST(N'2021-01-09T19:37:44.2100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (151, 160, CAST(N'2021-01-09T19:37:44.4400000' AS DateTime2), CAST(N'2021-01-09T19:37:44.4400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (152, 161, CAST(N'2021-01-09T19:37:44.7200000' AS DateTime2), CAST(N'2021-01-09T19:37:44.7200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (153, 162, CAST(N'2021-01-09T19:37:45.1300000' AS DateTime2), CAST(N'2021-01-09T19:37:45.1300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (154, 163, CAST(N'2021-01-09T19:37:45.5200000' AS DateTime2), CAST(N'2021-01-09T19:37:45.5200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (155, 164, CAST(N'2021-01-09T19:37:45.9600000' AS DateTime2), CAST(N'2021-01-09T19:37:45.9600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (156, 165, CAST(N'2021-01-09T19:37:46.6600000' AS DateTime2), CAST(N'2021-01-09T19:37:46.6600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (157, 166, CAST(N'2021-01-09T20:07:20.8400000' AS DateTime2), CAST(N'2021-01-09T20:07:20.8400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (158, 167, CAST(N'2021-01-09T20:07:27.9500000' AS DateTime2), CAST(N'2021-01-09T20:07:27.9500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (159, 168, CAST(N'2021-01-09T20:07:28.4200000' AS DateTime2), CAST(N'2021-01-09T20:07:28.4200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (160, 169, CAST(N'2021-01-09T20:07:28.9000000' AS DateTime2), CAST(N'2021-01-09T20:07:28.9000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (161, 170, CAST(N'2021-01-09T20:07:29.3300000' AS DateTime2), CAST(N'2021-01-09T20:07:29.3300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (162, 171, CAST(N'2021-01-09T20:07:29.7300000' AS DateTime2), CAST(N'2021-01-09T20:07:29.7300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (163, 172, CAST(N'2021-01-09T20:07:30.0400000' AS DateTime2), CAST(N'2021-01-09T20:07:30.0400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (164, 173, CAST(N'2021-01-09T20:07:30.3300000' AS DateTime2), CAST(N'2021-01-09T20:07:30.3300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (165, 174, CAST(N'2021-01-09T20:07:30.5000000' AS DateTime2), CAST(N'2021-01-09T20:07:30.5000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (166, 175, CAST(N'2021-01-09T20:07:30.6500000' AS DateTime2), CAST(N'2021-01-09T20:07:30.6500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (167, 176, CAST(N'2021-01-09T20:07:30.8400000' AS DateTime2), CAST(N'2021-01-09T20:07:30.8400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (168, 177, CAST(N'2021-01-09T20:07:31.0000000' AS DateTime2), CAST(N'2021-01-09T20:07:31.0000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (169, 178, CAST(N'2021-01-09T20:07:31.1200000' AS DateTime2), CAST(N'2021-01-09T20:07:31.1200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (170, 179, CAST(N'2021-01-09T20:07:31.2700000' AS DateTime2), CAST(N'2021-01-09T20:07:31.2700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (171, 180, CAST(N'2021-01-09T20:07:31.4300000' AS DateTime2), CAST(N'2021-01-09T20:07:31.4300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (172, 181, CAST(N'2021-01-09T20:07:31.5700000' AS DateTime2), CAST(N'2021-01-09T20:07:31.5700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (173, 182, CAST(N'2021-01-09T20:07:31.7200000' AS DateTime2), CAST(N'2021-01-09T20:07:31.7200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (174, 183, CAST(N'2021-01-09T20:07:31.8600000' AS DateTime2), CAST(N'2021-01-09T20:07:31.8600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (175, 184, CAST(N'2021-01-09T20:07:32.0100000' AS DateTime2), CAST(N'2021-01-09T20:07:32.0100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (176, 185, CAST(N'2021-01-09T20:07:32.1800000' AS DateTime2), CAST(N'2021-01-09T20:07:32.1800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (177, 186, CAST(N'2021-01-09T20:07:32.5000000' AS DateTime2), CAST(N'2021-01-09T20:07:32.5000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (178, 187, CAST(N'2021-01-09T20:07:32.6700000' AS DateTime2), CAST(N'2021-01-09T20:07:32.6700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (179, 188, CAST(N'2021-01-09T23:39:09.9500000' AS DateTime2), CAST(N'2021-01-09T23:39:09.9500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (180, 189, CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (181, 190, CAST(N'2021-01-09T23:39:28.3400000' AS DateTime2), CAST(N'2021-01-09T23:39:28.3400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (182, 191, CAST(N'2021-01-09T23:46:30.8000000' AS DateTime2), CAST(N'2021-01-09T23:46:30.8000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (183, 192, CAST(N'2021-01-10T00:05:38.1800000' AS DateTime2), CAST(N'2021-01-10T00:05:38.1800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (184, 193, CAST(N'2021-01-10T00:37:01.8100000' AS DateTime2), CAST(N'2021-01-10T00:37:01.8100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (185, 194, CAST(N'2021-01-10T00:38:41.5800000' AS DateTime2), CAST(N'2021-01-10T00:38:41.5800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (186, 195, CAST(N'2021-01-10T00:49:53.7500000' AS DateTime2), CAST(N'2021-01-10T00:49:53.7500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (187, 196, CAST(N'2021-01-10T00:55:32.3700000' AS DateTime2), CAST(N'2021-01-10T00:55:32.3700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (188, 197, CAST(N'2021-01-10T01:03:15.6800000' AS DateTime2), CAST(N'2021-01-10T01:03:15.6800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (189, 198, CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (190, 199, CAST(N'2021-01-10T01:08:23.2600000' AS DateTime2), CAST(N'2021-01-10T01:08:23.2600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (191, 200, CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (192, 201, CAST(N'2021-01-10T01:09:37.3800000' AS DateTime2), CAST(N'2021-01-10T01:09:37.3800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (193, 202, CAST(N'2021-01-10T01:11:04.5400000' AS DateTime2), CAST(N'2021-01-10T01:11:04.5400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (194, 203, CAST(N'2021-01-10T01:13:01.3200000' AS DateTime2), CAST(N'2021-01-10T01:13:01.3200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (195, 204, CAST(N'2021-01-10T01:14:10.8700000' AS DateTime2), CAST(N'2021-01-10T01:14:10.8700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (196, 205, CAST(N'2021-01-10T01:18:06.8400000' AS DateTime2), CAST(N'2021-01-10T01:18:06.8400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (197, 206, CAST(N'2021-01-10T01:21:26.3500000' AS DateTime2), CAST(N'2021-01-10T01:21:26.3500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (198, 207, CAST(N'2021-01-10T01:21:50.9300000' AS DateTime2), CAST(N'2021-01-10T01:21:50.9300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (199, 208, CAST(N'2021-01-10T01:25:59.9900000' AS DateTime2), CAST(N'2021-01-10T01:25:59.9900000' AS DateTime2))
GO
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (200, 209, CAST(N'2021-01-10T01:57:32.4000000' AS DateTime2), CAST(N'2021-01-10T01:57:32.4000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (201, 210, CAST(N'2021-01-10T02:13:00.6300000' AS DateTime2), CAST(N'2021-01-10T02:13:00.6300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (202, 211, CAST(N'2021-01-10T16:44:37.4100000' AS DateTime2), CAST(N'2021-01-10T16:44:37.4100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (203, 212, CAST(N'2021-01-10T16:45:19.1900000' AS DateTime2), CAST(N'2021-01-10T16:45:19.1900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (204, 213, CAST(N'2021-01-11T23:43:05.6000000' AS DateTime2), CAST(N'2021-01-11T23:43:05.6000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (205, 214, CAST(N'2021-01-11T23:44:10.9600000' AS DateTime2), CAST(N'2021-01-11T23:44:10.9600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (206, 215, CAST(N'2021-01-16T00:16:47.3500000' AS DateTime2), CAST(N'2021-01-16T00:16:47.3500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (207, 216, CAST(N'2021-01-16T00:37:56.8400000' AS DateTime2), CAST(N'2021-01-16T00:37:56.8400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (208, 217, CAST(N'2021-01-16T00:38:18.4100000' AS DateTime2), CAST(N'2021-01-16T00:38:18.4100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (209, 218, CAST(N'2021-01-16T00:39:39.5700000' AS DateTime2), CAST(N'2021-01-16T00:39:39.5700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (210, 219, CAST(N'2021-01-16T15:14:43.3300000' AS DateTime2), CAST(N'2021-01-16T15:14:43.3300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (211, 220, CAST(N'2021-01-16T15:21:36.3600000' AS DateTime2), CAST(N'2021-01-16T15:21:36.3600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (212, 221, CAST(N'2021-01-16T15:23:16.1400000' AS DateTime2), CAST(N'2021-01-16T15:23:16.1400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (213, 222, CAST(N'2021-01-16T15:24:26.2600000' AS DateTime2), CAST(N'2021-01-16T15:24:26.2600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (214, 223, CAST(N'2021-01-16T15:29:33.2500000' AS DateTime2), CAST(N'2021-01-16T15:29:33.2500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (215, 224, CAST(N'2021-01-16T15:29:42.4700000' AS DateTime2), CAST(N'2021-01-16T15:29:42.4700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (216, 225, CAST(N'2021-01-16T15:43:59.2200000' AS DateTime2), CAST(N'2021-01-16T15:43:59.2200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (217, 226, CAST(N'2021-01-16T15:44:05.4600000' AS DateTime2), CAST(N'2021-01-16T15:44:05.4600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (218, 227, CAST(N'2021-01-16T15:44:14.5700000' AS DateTime2), CAST(N'2021-01-16T15:44:14.5700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (219, 228, CAST(N'2021-01-16T15:44:24.9600000' AS DateTime2), CAST(N'2021-01-16T15:44:24.9600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (220, 229, CAST(N'2021-01-16T15:44:25.3800000' AS DateTime2), CAST(N'2021-01-16T15:44:25.3800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (221, 230, CAST(N'2021-01-16T15:44:26.0300000' AS DateTime2), CAST(N'2021-01-16T15:44:26.0300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (222, 231, CAST(N'2021-01-16T15:44:29.2400000' AS DateTime2), CAST(N'2021-01-16T15:44:29.2400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (223, 232, CAST(N'2021-01-16T15:44:29.6800000' AS DateTime2), CAST(N'2021-01-16T15:44:29.6800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (224, 233, CAST(N'2021-01-16T15:44:30.2200000' AS DateTime2), CAST(N'2021-01-16T15:44:30.2200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (225, 234, CAST(N'2021-01-16T15:44:30.9500000' AS DateTime2), CAST(N'2021-01-16T15:44:30.9500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (226, 235, CAST(N'2021-01-16T15:44:31.3400000' AS DateTime2), CAST(N'2021-01-16T15:44:31.3400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (227, 236, CAST(N'2021-01-16T15:44:31.7400000' AS DateTime2), CAST(N'2021-01-16T15:44:31.7400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (228, 237, CAST(N'2021-01-16T15:44:33.2200000' AS DateTime2), CAST(N'2021-01-16T15:44:33.2200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (229, 238, CAST(N'2021-01-16T15:58:11.3200000' AS DateTime2), CAST(N'2021-01-16T15:58:11.3200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (230, 239, CAST(N'2021-01-16T15:58:12.1100000' AS DateTime2), CAST(N'2021-01-16T15:58:12.1100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (231, 240, CAST(N'2021-01-16T15:58:14.8800000' AS DateTime2), CAST(N'2021-01-16T15:58:14.8800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (232, 241, CAST(N'2021-01-16T22:45:22.7200000' AS DateTime2), CAST(N'2021-01-16T22:45:22.7200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (233, 242, CAST(N'2021-01-16T22:45:23.2200000' AS DateTime2), CAST(N'2021-01-16T22:45:23.2200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (234, 243, CAST(N'2021-01-16T22:45:23.7300000' AS DateTime2), CAST(N'2021-01-16T22:45:23.7300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (235, 244, CAST(N'2021-01-16T22:45:24.2000000' AS DateTime2), CAST(N'2021-01-16T22:45:24.2000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (236, 245, CAST(N'2021-01-16T22:45:24.6200000' AS DateTime2), CAST(N'2021-01-16T22:45:24.6200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (237, 246, CAST(N'2021-01-16T22:45:25.1800000' AS DateTime2), CAST(N'2021-01-16T22:45:25.1800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (238, 247, CAST(N'2021-01-16T22:45:25.4400000' AS DateTime2), CAST(N'2021-01-16T22:45:25.4400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (239, 248, CAST(N'2021-01-16T22:45:25.6400000' AS DateTime2), CAST(N'2021-01-16T22:45:25.6400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (240, 249, CAST(N'2021-01-16T22:45:25.8000000' AS DateTime2), CAST(N'2021-01-16T22:45:25.8000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (241, 250, CAST(N'2021-01-16T22:45:25.9600000' AS DateTime2), CAST(N'2021-01-16T22:45:25.9600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (242, 251, CAST(N'2021-01-16T22:45:26.1500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.1500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (243, 252, CAST(N'2021-01-16T22:45:26.2900000' AS DateTime2), CAST(N'2021-01-16T22:45:26.2900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (244, 253, CAST(N'2021-01-16T22:45:26.4500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.4500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (245, 254, CAST(N'2021-01-16T22:45:26.6100000' AS DateTime2), CAST(N'2021-01-16T22:45:26.6100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (246, 255, CAST(N'2021-01-16T22:45:26.7500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.7500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (247, 256, CAST(N'2021-01-16T22:45:26.9100000' AS DateTime2), CAST(N'2021-01-16T22:45:26.9100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (248, 257, CAST(N'2021-01-16T23:01:05.5800000' AS DateTime2), CAST(N'2021-01-16T23:01:05.5800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (249, 258, CAST(N'2021-01-16T23:01:07.1800000' AS DateTime2), CAST(N'2021-01-16T23:01:07.1800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (250, 259, CAST(N'2021-01-16T23:01:08.7700000' AS DateTime2), CAST(N'2021-01-16T23:01:08.7700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (251, 260, CAST(N'2021-01-16T23:01:12.0900000' AS DateTime2), CAST(N'2021-01-16T23:01:12.0900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (252, 261, CAST(N'2021-01-16T23:01:14.0400000' AS DateTime2), CAST(N'2021-01-16T23:01:14.0400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (253, 262, CAST(N'2021-01-16T23:01:14.6000000' AS DateTime2), CAST(N'2021-01-16T23:01:14.6000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (254, 263, CAST(N'2021-01-16T23:01:16.1900000' AS DateTime2), CAST(N'2021-01-16T23:01:16.1900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (255, 264, CAST(N'2021-01-16T23:01:18.2900000' AS DateTime2), CAST(N'2021-01-16T23:01:18.2900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (256, 265, CAST(N'2021-01-16T23:17:15.6600000' AS DateTime2), CAST(N'2021-01-16T23:17:15.6600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (257, 266, CAST(N'2021-01-16T23:17:26.8100000' AS DateTime2), CAST(N'2021-01-16T23:17:26.8100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (258, 267, CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (259, 268, CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (260, 269, CAST(N'2021-01-16T23:18:47.2000000' AS DateTime2), CAST(N'2021-01-16T23:18:47.2000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (261, 270, CAST(N'2021-01-16T23:18:49.9100000' AS DateTime2), CAST(N'2021-01-16T23:18:49.9100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (262, 271, CAST(N'2021-01-16T23:35:06.8600000' AS DateTime2), CAST(N'2021-01-16T23:35:06.8600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (263, 272, CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (264, 273, CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (265, 274, CAST(N'2021-01-16T23:36:53.9400000' AS DateTime2), CAST(N'2021-01-16T23:36:53.9400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (266, 275, CAST(N'2021-01-16T23:40:08.1000000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (267, 276, CAST(N'2021-01-16T23:40:08.1100000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (268, 277, CAST(N'2021-01-16T23:41:39.2100000' AS DateTime2), CAST(N'2021-01-16T23:41:39.2100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (269, 278, CAST(N'2021-01-16T23:43:07.6700000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (270, 279, CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (271, 280, CAST(N'2021-01-16T23:47:35.2400000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (272, 281, CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (273, 282, CAST(N'2021-01-16T23:48:25.2500000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (274, 283, CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (275, 284, CAST(N'2021-01-16T23:50:31.3300000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (276, 285, CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (277, 286, CAST(N'2021-01-17T00:12:36.6200000' AS DateTime2), CAST(N'2021-01-17T00:12:36.6200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (278, 287, CAST(N'2021-01-17T00:12:36.6300000' AS DateTime2), CAST(N'2021-01-17T00:12:36.6300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (279, 288, CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (280, 289, CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (281, 290, CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (282, 291, CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (283, 292, CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (284, 293, CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (285, 294, CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (286, 295, CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (287, 296, CAST(N'2021-01-17T00:13:34.0200000' AS DateTime2), CAST(N'2021-01-17T00:13:34.0200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (288, 297, CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (289, 298, CAST(N'2021-01-17T00:13:36.6600000' AS DateTime2), CAST(N'2021-01-17T00:13:36.6600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (290, 299, CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (291, 300, CAST(N'2021-01-17T00:13:44.8700000' AS DateTime2), CAST(N'2021-01-17T00:13:44.8700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (292, 301, CAST(N'2021-01-17T00:13:44.8800000' AS DateTime2), CAST(N'2021-01-17T00:13:44.8800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (293, 302, CAST(N'2021-01-17T00:14:36.7700000' AS DateTime2), CAST(N'2021-01-17T00:14:36.7700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (294, 303, CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (295, 304, CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (296, 305, CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (297, 306, CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (298, 307, CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (299, 308, CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2))
GO
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (300, 309, CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (301, 310, CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (302, 311, CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (303, 312, CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (304, 313, CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (305, 314, CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (306, 315, CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (307, 316, CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (308, 317, CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (309, 318, CAST(N'2021-01-17T00:26:56.1300000' AS DateTime2), CAST(N'2021-01-17T00:26:56.1300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (310, 319, CAST(N'2021-01-17T00:28:51.9100000' AS DateTime2), CAST(N'2021-01-17T00:28:51.9100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (311, 320, CAST(N'2021-01-17T00:29:06.9100000' AS DateTime2), CAST(N'2021-01-17T00:29:06.9100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (312, 321, CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (313, 322, CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (314, 323, CAST(N'2021-01-17T00:33:36.8900000' AS DateTime2), CAST(N'2021-01-17T00:33:36.8900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (315, 324, CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (316, 325, CAST(N'2021-01-17T00:33:56.8800000' AS DateTime2), CAST(N'2021-01-17T00:33:56.8800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (317, 326, CAST(N'2021-01-17T00:42:29.1600000' AS DateTime2), CAST(N'2021-01-17T00:42:29.1600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (318, 327, CAST(N'2021-01-17T00:48:08.8600000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (319, 328, CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (320, 329, CAST(N'2021-01-17T00:48:47.4600000' AS DateTime2), CAST(N'2021-01-17T00:48:47.4600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (321, 330, CAST(N'2021-01-17T00:50:20.1400000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (322, 331, CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (323, 332, CAST(N'2021-01-17T00:53:05.2600000' AS DateTime2), CAST(N'2021-01-17T00:53:05.2600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (324, 333, CAST(N'2021-01-17T00:56:20.6600000' AS DateTime2), CAST(N'2021-01-17T00:56:20.6600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (325, 334, CAST(N'2021-01-17T01:00:27.4200000' AS DateTime2), CAST(N'2021-01-17T01:00:27.4200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (326, 335, CAST(N'2021-01-17T01:05:21.8500000' AS DateTime2), CAST(N'2021-01-17T01:05:21.8500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (327, 336, CAST(N'2021-01-17T01:10:25.6800000' AS DateTime2), CAST(N'2021-01-17T01:10:25.6800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (328, 337, CAST(N'2021-01-17T01:12:20.5400000' AS DateTime2), CAST(N'2021-01-17T01:12:20.5400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (329, 338, CAST(N'2021-01-17T01:30:08.0900000' AS DateTime2), CAST(N'2021-01-17T01:30:08.0900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (330, 339, CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (331, 340, CAST(N'2021-01-17T01:33:32.6900000' AS DateTime2), CAST(N'2021-01-17T01:33:32.6900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (332, 341, CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (333, 342, CAST(N'2021-01-17T01:35:27.6700000' AS DateTime2), CAST(N'2021-01-17T01:35:27.6700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (334, 343, CAST(N'2021-01-17T01:39:52.3700000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (335, 344, CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (336, 345, CAST(N'2021-01-17T01:42:59.4600000' AS DateTime2), CAST(N'2021-01-17T01:42:59.4600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (337, 346, CAST(N'2021-01-17T01:44:15.3100000' AS DateTime2), CAST(N'2021-01-17T01:44:15.3100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (338, 347, CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (339, 348, CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (340, 349, CAST(N'2021-01-17T01:45:51.2700000' AS DateTime2), CAST(N'2021-01-17T01:45:51.2700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (341, 350, CAST(N'2021-01-17T01:47:08.6400000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (342, 351, CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (343, 352, CAST(N'2021-01-17T01:53:45.4800000' AS DateTime2), CAST(N'2021-01-17T01:53:45.4800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (344, 353, CAST(N'2021-01-17T01:54:56.1500000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (345, 354, CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (346, 355, CAST(N'2021-01-17T01:56:01.0900000' AS DateTime2), CAST(N'2021-01-17T01:56:01.0900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (347, 356, CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (348, 357, CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (349, 358, CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (350, 359, CAST(N'2021-01-17T02:06:30.6000000' AS DateTime2), CAST(N'2021-01-17T02:06:30.6000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (351, 360, CAST(N'2021-01-17T02:12:25.2000000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (352, 361, CAST(N'2021-01-17T02:12:25.2100000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (353, 362, CAST(N'2021-01-17T02:13:19.3400000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (354, 363, CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (355, 364, CAST(N'2021-01-17T02:20:24.0700000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (356, 365, CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (357, 366, CAST(N'2021-01-17T02:26:33.6800000' AS DateTime2), CAST(N'2021-01-17T02:26:33.6800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (358, 367, CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (359, 368, CAST(N'2021-01-17T02:31:36.7500000' AS DateTime2), CAST(N'2021-01-17T02:31:36.7500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (360, 369, CAST(N'2021-01-23T23:30:04.4100000' AS DateTime2), CAST(N'2021-01-23T23:30:04.4100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (361, 370, CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (362, 371, CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (363, 372, CAST(N'2021-01-23T23:38:26.7900000' AS DateTime2), CAST(N'2021-01-23T23:38:26.7900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (364, 373, CAST(N'2021-01-23T23:39:08.6900000' AS DateTime2), CAST(N'2021-01-23T23:39:08.6900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (365, 374, CAST(N'2021-01-23T23:41:30.5000000' AS DateTime2), CAST(N'2021-01-23T23:41:30.5000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (366, 375, CAST(N'2021-01-23T23:41:44.7900000' AS DateTime2), CAST(N'2021-01-23T23:41:44.7900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (367, 376, CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (368, 377, CAST(N'2021-01-23T23:45:57.2800000' AS DateTime2), CAST(N'2021-01-23T23:45:57.2800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (369, 378, CAST(N'2021-01-23T23:50:22.8700000' AS DateTime2), CAST(N'2021-01-23T23:50:22.8700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (370, 379, CAST(N'2021-01-23T23:52:36.5600000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (371, 380, CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (372, 381, CAST(N'2021-01-23T23:54:32.1600000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (373, 382, CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (374, 383, CAST(N'2021-01-23T23:59:42.1700000' AS DateTime2), CAST(N'2021-01-23T23:59:42.1700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (375, 384, CAST(N'2021-01-23T23:59:53.8700000' AS DateTime2), CAST(N'2021-01-23T23:59:53.8700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (376, 385, CAST(N'2021-01-24T00:05:45.7300000' AS DateTime2), CAST(N'2021-01-24T00:05:45.7300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (377, 386, CAST(N'2021-01-24T00:05:54.9700000' AS DateTime2), CAST(N'2021-01-24T00:05:54.9700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (378, 387, CAST(N'2021-01-24T00:06:07.6600000' AS DateTime2), CAST(N'2021-01-24T00:06:07.6600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (379, 388, CAST(N'2021-01-24T00:10:48.1800000' AS DateTime2), CAST(N'2021-01-24T00:10:48.1800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (380, 389, CAST(N'2021-01-24T00:10:48.2200000' AS DateTime2), CAST(N'2021-01-24T00:10:48.2200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (381, 390, CAST(N'2021-01-24T00:11:30.1000000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (382, 391, CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (383, 392, CAST(N'2021-01-24T00:12:28.0500000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (384, 393, CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (385, 394, CAST(N'2021-01-24T00:14:37.5800000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (386, 395, CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (387, 396, CAST(N'2021-01-24T00:16:28.1600000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (388, 397, CAST(N'2021-01-24T00:16:28.1800000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (389, 398, CAST(N'2021-01-24T00:17:00.0700000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (390, 399, CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (391, 400, CAST(N'2021-01-24T00:17:48.1500000' AS DateTime2), CAST(N'2021-01-24T00:17:48.1500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (392, 401, CAST(N'2021-01-24T00:19:25.5900000' AS DateTime2), CAST(N'2021-01-24T00:19:25.5900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (393, 402, CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (394, 403, CAST(N'2021-01-24T00:20:25.5300000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (395, 404, CAST(N'2021-01-24T00:20:25.5500000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (396, 405, CAST(N'2021-01-24T00:21:09.4600000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (397, 406, CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (398, 407, CAST(N'2021-01-24T00:21:59.8200000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (399, 408, CAST(N'2021-01-24T00:21:59.8400000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8400000' AS DateTime2))
GO
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (400, 409, CAST(N'2021-01-24T00:23:04.0800000' AS DateTime2), CAST(N'2021-01-24T00:23:04.0800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (401, 410, CAST(N'2021-01-24T00:23:53.8000000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (402, 411, CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (403, 412, CAST(N'2021-01-24T00:24:30.6300000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (404, 413, CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (405, 414, CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (406, 415, CAST(N'2021-01-24T00:26:09.5500000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (407, 416, CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (408, 417, CAST(N'2021-01-24T00:31:12.3600000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (409, 418, CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (410, 419, CAST(N'2021-01-24T00:39:47.1100000' AS DateTime2), CAST(N'2021-01-24T00:39:47.1100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (411, 420, CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (412, 421, CAST(N'2021-01-24T00:40:16.7900000' AS DateTime2), CAST(N'2021-01-24T00:40:16.7900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (413, 422, CAST(N'2021-01-24T00:40:36.4600000' AS DateTime2), CAST(N'2021-01-24T00:40:36.4600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (414, 423, CAST(N'2021-01-24T00:41:05.3600000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (415, 424, CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (416, 425, CAST(N'2021-01-24T00:41:26.9300000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (417, 426, CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (418, 427, CAST(N'2021-01-24T00:43:06.7600000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (419, 428, CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (420, 429, CAST(N'2021-01-24T00:47:33.9700000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (421, 430, CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (422, 431, CAST(N'2021-01-24T00:48:36.8100000' AS DateTime2), CAST(N'2021-01-24T00:48:36.8100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (423, 432, CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (424, 433, CAST(N'2021-01-24T00:50:42.6200000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (425, 434, CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (426, 435, CAST(N'2021-01-24T00:52:57.5800000' AS DateTime2), CAST(N'2021-01-24T00:52:57.5800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (427, 436, CAST(N'2021-01-24T00:52:57.6200000' AS DateTime2), CAST(N'2021-01-24T00:52:57.6200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (428, 437, CAST(N'2021-01-24T00:54:45.3700000' AS DateTime2), CAST(N'2021-01-24T00:54:45.3700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (429, 438, CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (430, 439, CAST(N'2021-01-24T00:55:23.2300000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (431, 440, CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (432, 441, CAST(N'2021-01-24T00:56:42.4100000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (433, 442, CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (434, 443, CAST(N'2021-01-24T00:57:29.9700000' AS DateTime2), CAST(N'2021-01-24T00:57:29.9700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (435, 444, CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (436, 445, CAST(N'2021-01-24T00:58:48.3600000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (437, 446, CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (438, 447, CAST(N'2021-01-24T00:59:18.3600000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (439, 448, CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (440, 449, CAST(N'2021-01-24T00:59:50.0400000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (441, 450, CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (442, 451, CAST(N'2021-01-24T01:00:24.8600000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (443, 452, CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (444, 453, CAST(N'2021-01-24T01:01:30.6500000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (445, 454, CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (446, 455, CAST(N'2021-01-24T01:02:14.1400000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (447, 456, CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (448, 457, CAST(N'2021-01-24T01:19:32.2200000' AS DateTime2), CAST(N'2021-01-24T01:19:32.2200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (449, 458, CAST(N'2021-01-24T01:35:51.6300000' AS DateTime2), CAST(N'2021-01-24T01:35:51.6300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (450, 459, CAST(N'2021-01-24T01:40:36.9800000' AS DateTime2), CAST(N'2021-01-24T01:40:36.9800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (451, 460, CAST(N'2021-01-24T01:42:28.4400000' AS DateTime2), CAST(N'2021-01-24T01:42:28.4400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (452, 461, CAST(N'2021-01-24T01:43:19.1700000' AS DateTime2), CAST(N'2021-01-24T01:43:19.1700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (453, 462, CAST(N'2021-01-24T01:43:49.1200000' AS DateTime2), CAST(N'2021-01-24T01:43:49.1200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (454, 463, CAST(N'2021-01-24T01:44:04.4600000' AS DateTime2), CAST(N'2021-01-24T01:44:04.4600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (455, 464, CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (456, 465, CAST(N'2021-01-24T02:10:45.7100000' AS DateTime2), CAST(N'2021-01-24T02:10:45.7100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (457, 466, CAST(N'2021-01-24T02:20:54.7600000' AS DateTime2), CAST(N'2021-01-24T02:20:54.7600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (1360, 10369, CAST(N'2021-01-30T23:31:15.1700000' AS DateTime2), CAST(N'2021-01-30T23:31:15.1700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (1361, 10370, CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (1362, 10371, CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (1363, 10372, CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (1364, 10373, CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (1365, 10374, CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (1366, 10375, CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (1367, 10376, CAST(N'2021-01-31T01:32:19.3700000' AS DateTime2), CAST(N'2021-01-31T01:32:19.3700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (1368, 10377, CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (1369, 10378, CAST(N'2021-01-31T01:42:46.3900000' AS DateTime2), CAST(N'2021-01-31T01:42:46.3900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2360, 20369, CAST(N'2021-02-07T00:20:52.0200000' AS DateTime2), CAST(N'2021-02-07T00:20:52.0200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2361, 20370, CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2362, 20371, CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2363, 20372, CAST(N'2021-02-07T00:24:45.5600000' AS DateTime2), CAST(N'2021-02-07T00:24:45.5600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2364, 20373, CAST(N'2021-02-07T00:34:31.3000000' AS DateTime2), CAST(N'2021-02-07T00:34:31.3000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2365, 20374, CAST(N'2021-02-07T00:34:36.0100000' AS DateTime2), CAST(N'2021-02-07T00:34:36.0100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2366, 20375, CAST(N'2021-02-07T00:35:19.5500000' AS DateTime2), CAST(N'2021-02-07T00:35:19.5500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2367, 20376, CAST(N'2021-02-07T00:44:30.7100000' AS DateTime2), CAST(N'2021-02-07T00:44:30.7100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2368, 20377, CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2369, 20378, CAST(N'2021-02-07T00:44:50.1300000' AS DateTime2), CAST(N'2021-02-07T00:44:50.1300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2370, 20379, CAST(N'2021-02-07T00:44:51.9000000' AS DateTime2), CAST(N'2021-02-07T00:44:51.9000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2371, 20380, CAST(N'2021-02-07T00:47:24.9000000' AS DateTime2), CAST(N'2021-02-07T00:47:24.9000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2372, 20381, CAST(N'2021-02-07T00:53:08.9400000' AS DateTime2), CAST(N'2021-02-07T00:53:08.9400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2373, 20382, CAST(N'2021-02-07T00:58:29.7000000' AS DateTime2), CAST(N'2021-02-07T00:58:29.7000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2374, 20383, CAST(N'2021-02-07T01:08:40.2500000' AS DateTime2), CAST(N'2021-02-07T01:08:40.2500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2375, 20384, CAST(N'2021-02-07T01:10:15.8700000' AS DateTime2), CAST(N'2021-02-07T01:10:15.8700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2376, 20385, CAST(N'2021-02-07T01:11:03.2900000' AS DateTime2), CAST(N'2021-02-07T01:11:03.2900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2377, 20386, CAST(N'2021-02-07T01:23:03.7900000' AS DateTime2), CAST(N'2021-02-07T01:23:03.7900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2378, 20387, CAST(N'2021-02-07T01:34:28.0400000' AS DateTime2), CAST(N'2021-02-07T01:34:28.0400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2379, 20388, CAST(N'2021-02-07T01:37:49.9700000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2380, 20389, CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2381, 20390, CAST(N'2021-02-07T01:39:15.4500000' AS DateTime2), CAST(N'2021-02-07T01:39:15.4500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2382, 20391, CAST(N'2021-02-07T01:44:59.2600000' AS DateTime2), CAST(N'2021-02-07T01:44:59.2600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2383, 20392, CAST(N'2021-02-07T01:50:33.4500000' AS DateTime2), CAST(N'2021-02-07T01:50:33.4500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2384, 20393, CAST(N'2021-02-07T01:55:14.2300000' AS DateTime2), CAST(N'2021-02-07T01:55:14.2300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2385, 20394, CAST(N'2021-02-07T02:08:00.2700000' AS DateTime2), CAST(N'2021-02-07T02:08:00.2700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2386, 20395, CAST(N'2021-02-07T02:09:10.3200000' AS DateTime2), CAST(N'2021-02-07T02:09:10.3200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2387, 20396, CAST(N'2021-02-07T02:13:21.3500000' AS DateTime2), CAST(N'2021-02-07T02:13:21.3500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2388, 20397, CAST(N'2021-02-07T02:17:23.9900000' AS DateTime2), CAST(N'2021-02-07T02:17:23.9900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2389, 20398, CAST(N'2021-02-07T02:25:00.5600000' AS DateTime2), CAST(N'2021-02-07T02:25:00.5600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2390, 20399, CAST(N'2021-02-07T02:26:35.7000000' AS DateTime2), CAST(N'2021-02-07T02:26:35.7000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2391, 20400, CAST(N'2021-02-13T23:24:31.4500000' AS DateTime2), CAST(N'2021-02-13T23:24:31.4500000' AS DateTime2))
GO
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2392, 20401, CAST(N'2021-02-13T23:25:02.3600000' AS DateTime2), CAST(N'2021-02-13T23:25:02.3600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2393, 20402, CAST(N'2021-02-13T23:38:59.3300000' AS DateTime2), CAST(N'2021-02-13T23:38:59.3300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2394, 20403, CAST(N'2021-02-14T00:02:15.2800000' AS DateTime2), CAST(N'2021-02-14T00:02:15.2800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2395, 20404, CAST(N'2021-02-14T00:02:59.3300000' AS DateTime2), CAST(N'2021-02-14T00:02:59.3300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2396, 20405, CAST(N'2021-02-14T00:20:43.2800000' AS DateTime2), CAST(N'2021-02-14T00:20:43.2800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2397, 20406, CAST(N'2021-02-14T00:22:09.2500000' AS DateTime2), CAST(N'2021-02-14T00:22:09.2500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2398, 20407, CAST(N'2021-02-14T00:31:00.1000000' AS DateTime2), CAST(N'2021-02-14T00:31:00.1000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2399, 20408, CAST(N'2021-02-14T00:32:52.4700000' AS DateTime2), CAST(N'2021-02-14T00:32:52.4700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2400, 20409, CAST(N'2021-02-14T00:45:17.7600000' AS DateTime2), CAST(N'2021-02-14T00:45:17.7600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2401, 20410, CAST(N'2021-02-14T00:50:01.6600000' AS DateTime2), CAST(N'2021-02-14T00:50:01.6600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2402, 20411, CAST(N'2021-02-14T00:54:25.0800000' AS DateTime2), CAST(N'2021-02-14T00:54:25.0800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2403, 20412, CAST(N'2021-02-14T00:55:38.6100000' AS DateTime2), CAST(N'2021-02-14T00:55:38.6100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2404, 20413, CAST(N'2021-02-14T00:57:01.7300000' AS DateTime2), CAST(N'2021-02-14T00:57:01.7300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2405, 20414, CAST(N'2021-02-14T01:01:39.9600000' AS DateTime2), CAST(N'2021-02-14T01:01:39.9600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2406, 20415, CAST(N'2021-02-14T01:01:49.8200000' AS DateTime2), CAST(N'2021-02-14T01:01:49.8200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2407, 20416, CAST(N'2021-02-14T01:02:01.8800000' AS DateTime2), CAST(N'2021-02-14T01:02:01.8800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2408, 20417, CAST(N'2021-02-14T01:03:46.3300000' AS DateTime2), CAST(N'2021-02-14T01:03:46.3300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2409, 20418, CAST(N'2021-02-14T01:10:43.4400000' AS DateTime2), CAST(N'2021-02-14T01:10:43.4400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2410, 20419, CAST(N'2021-02-14T01:15:15.6700000' AS DateTime2), CAST(N'2021-02-14T01:15:15.6700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2411, 20420, CAST(N'2021-02-14T01:15:25.9400000' AS DateTime2), CAST(N'2021-02-14T01:15:25.9400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2412, 20421, CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2413, 20422, CAST(N'2021-02-14T01:20:54.7100000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2414, 20423, CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2415, 20424, CAST(N'2021-02-14T01:24:39.7300000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2416, 20425, CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2417, 20426, CAST(N'2021-02-14T01:27:44.4700000' AS DateTime2), CAST(N'2021-02-14T01:27:44.4700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2418, 20427, CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2419, 20428, CAST(N'2021-02-14T01:33:59.8500000' AS DateTime2), CAST(N'2021-02-14T01:33:59.8500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2420, 20429, CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2421, 20430, CAST(N'2021-02-14T01:36:19.2700000' AS DateTime2), CAST(N'2021-02-14T01:36:19.2700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2422, 20431, CAST(N'2021-02-14T01:36:28.1700000' AS DateTime2), CAST(N'2021-02-14T01:36:28.1700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2423, 20432, CAST(N'2021-02-14T01:40:17.2500000' AS DateTime2), CAST(N'2021-02-14T01:40:17.2500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2424, 20433, CAST(N'2021-02-14T01:41:29.2200000' AS DateTime2), CAST(N'2021-02-14T01:41:29.2200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2425, 20434, CAST(N'2021-02-14T01:44:57.0300000' AS DateTime2), CAST(N'2021-02-14T01:44:57.0300000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2426, 20435, CAST(N'2021-02-14T01:46:32.0400000' AS DateTime2), CAST(N'2021-02-14T01:46:32.0400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2427, 20436, CAST(N'2021-02-14T01:48:36.0400000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2428, 20437, CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2429, 20438, CAST(N'2021-02-14T01:49:53.8200000' AS DateTime2), CAST(N'2021-02-14T01:49:53.8200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2430, 20439, CAST(N'2021-02-14T01:54:03.1400000' AS DateTime2), CAST(N'2021-02-14T01:54:03.1400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2431, 20440, CAST(N'2021-02-14T01:58:04.3900000' AS DateTime2), CAST(N'2021-02-14T01:58:04.3900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2432, 20441, CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2433, 20442, CAST(N'2021-02-14T02:01:59.6000000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2434, 20443, CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2435, 20444, CAST(N'2021-02-14T02:03:04.3000000' AS DateTime2), CAST(N'2021-02-14T02:03:04.3000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2436, 20445, CAST(N'2021-02-14T02:05:30.1700000' AS DateTime2), CAST(N'2021-02-14T02:05:30.1700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2437, 20446, CAST(N'2021-02-14T02:07:42.4800000' AS DateTime2), CAST(N'2021-02-14T02:07:42.4800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2438, 20447, CAST(N'2021-02-14T02:07:57.5800000' AS DateTime2), CAST(N'2021-02-14T02:07:57.5800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2439, 20448, CAST(N'2021-02-14T02:16:48.9200000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2440, 20449, CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2441, 20450, CAST(N'2021-02-14T02:17:45.6900000' AS DateTime2), CAST(N'2021-02-14T02:17:45.6900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2442, 20451, CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2443, 20452, CAST(N'2021-02-14T02:18:30.8500000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2444, 20453, CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2445, 20454, CAST(N'2021-02-14T02:21:03.0800000' AS DateTime2), CAST(N'2021-02-14T02:21:03.0800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2446, 20455, CAST(N'2021-02-14T02:23:50.5700000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5700000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2447, 20456, CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2448, 20457, CAST(N'2021-02-14T02:24:56.6000000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6000000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2449, 20458, CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2450, 20459, CAST(N'2021-02-14T02:25:20.0400000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2451, 20460, CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2452, 20461, CAST(N'2021-02-14T02:26:50.7800000' AS DateTime2), CAST(N'2021-02-14T02:26:50.7800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2453, 20462, CAST(N'2021-02-14T02:28:50.3400000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3400000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2454, 20463, CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2455, 20464, CAST(N'2021-02-14T02:29:51.2800000' AS DateTime2), CAST(N'2021-02-14T02:29:51.2800000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2456, 20465, CAST(N'2021-02-14T02:30:18.6100000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6100000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2457, 20466, CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2458, 20467, CAST(N'2021-02-14T02:39:44.9600000' AS DateTime2), CAST(N'2021-02-14T02:39:44.9600000' AS DateTime2))
INSERT [Rolls].[Rolls] ([RollId], [EntityId], [DateCreated], [DateModified]) VALUES (2459, 20468, CAST(N'2021-02-14T02:40:06.9200000' AS DateTime2), CAST(N'2021-02-14T02:40:06.9200000' AS DateTime2))
SET IDENTITY_INSERT [Rolls].[Rolls] OFF
SET IDENTITY_INSERT [Rolls].[RollsToEntities] ON

INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1, CAST(N'2021-01-02T23:03:17.5000000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5000000' AS DateTime2), 1, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2, CAST(N'2021-01-02T23:37:41.7900000' AS DateTime2), CAST(N'2021-01-02T23:37:41.7900000' AS DateTime2), 2, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (3, CAST(N'2021-01-02T23:37:41.7900000' AS DateTime2), CAST(N'2021-01-02T23:37:41.7900000' AS DateTime2), 2, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (4, CAST(N'2021-01-02T23:47:43.2600000' AS DateTime2), CAST(N'2021-01-02T23:47:43.2600000' AS DateTime2), 3, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (5, CAST(N'2021-01-02T23:47:43.2600000' AS DateTime2), CAST(N'2021-01-02T23:47:43.2600000' AS DateTime2), 3, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (6, CAST(N'2021-01-02T23:47:55.0800000' AS DateTime2), CAST(N'2021-01-02T23:47:55.0800000' AS DateTime2), 4, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (7, CAST(N'2021-01-02T23:47:55.0800000' AS DateTime2), CAST(N'2021-01-02T23:47:55.0800000' AS DateTime2), 4, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (8, CAST(N'2021-01-02T23:48:23.1400000' AS DateTime2), CAST(N'2021-01-02T23:48:23.1400000' AS DateTime2), 5, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (9, CAST(N'2021-01-02T23:48:23.1400000' AS DateTime2), CAST(N'2021-01-02T23:48:23.1400000' AS DateTime2), 5, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (10, CAST(N'2021-01-02T23:53:09.1700000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1700000' AS DateTime2), 6, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (11, CAST(N'2021-01-02T23:53:09.1700000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1700000' AS DateTime2), 6, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (12, CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), 7, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (13, CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), 7, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (14, CAST(N'2021-01-02T23:56:24.7400000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7400000' AS DateTime2), 8, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (15, CAST(N'2021-01-02T23:56:24.7400000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7400000' AS DateTime2), 8, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (16, CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), 9, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (17, CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), 9, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (18, CAST(N'2021-01-03T00:01:23.0700000' AS DateTime2), CAST(N'2021-01-03T00:01:23.0700000' AS DateTime2), 10, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (19, CAST(N'2021-01-03T00:01:23.0700000' AS DateTime2), CAST(N'2021-01-03T00:01:23.0700000' AS DateTime2), 10, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (20, CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), 11, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (21, CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), 11, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (22, CAST(N'2021-01-03T00:03:28.0500000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0500000' AS DateTime2), 12, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (23, CAST(N'2021-01-03T00:03:28.0500000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0500000' AS DateTime2), 12, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (24, CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), 13, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (25, CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), 13, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (26, CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), 14, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (27, CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), 14, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (28, CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), 15, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (29, CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), 15, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (30, CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), 16, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (31, CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), 16, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (32, CAST(N'2021-01-03T00:10:34.6000000' AS DateTime2), CAST(N'2021-01-03T00:10:34.6000000' AS DateTime2), 17, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (33, CAST(N'2021-01-03T00:10:34.6000000' AS DateTime2), CAST(N'2021-01-03T00:10:34.6000000' AS DateTime2), 17, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (34, CAST(N'2021-01-03T00:32:24.9500000' AS DateTime2), CAST(N'2021-01-03T00:32:24.9500000' AS DateTime2), 18, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (35, CAST(N'2021-01-03T00:32:24.9500000' AS DateTime2), CAST(N'2021-01-03T00:32:24.9500000' AS DateTime2), 18, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (36, CAST(N'2021-01-03T00:34:19.1100000' AS DateTime2), CAST(N'2021-01-03T00:34:19.1100000' AS DateTime2), 19, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (37, CAST(N'2021-01-03T00:34:19.1100000' AS DateTime2), CAST(N'2021-01-03T00:34:19.1100000' AS DateTime2), 19, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (38, CAST(N'2021-01-03T00:35:06.6800000' AS DateTime2), CAST(N'2021-01-03T00:35:06.6800000' AS DateTime2), 20, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (39, CAST(N'2021-01-03T00:35:06.6800000' AS DateTime2), CAST(N'2021-01-03T00:35:06.6800000' AS DateTime2), 20, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (40, CAST(N'2021-01-03T00:35:14.7400000' AS DateTime2), CAST(N'2021-01-03T00:35:14.7400000' AS DateTime2), 21, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (41, CAST(N'2021-01-03T00:35:14.7400000' AS DateTime2), CAST(N'2021-01-03T00:35:14.7400000' AS DateTime2), 21, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (42, CAST(N'2021-01-03T00:36:08.4200000' AS DateTime2), CAST(N'2021-01-03T00:36:08.4200000' AS DateTime2), 22, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (43, CAST(N'2021-01-03T00:36:08.4200000' AS DateTime2), CAST(N'2021-01-03T00:36:08.4200000' AS DateTime2), 22, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (44, CAST(N'2021-01-03T00:36:15.3400000' AS DateTime2), CAST(N'2021-01-03T00:36:15.3400000' AS DateTime2), 23, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (45, CAST(N'2021-01-03T00:36:15.3400000' AS DateTime2), CAST(N'2021-01-03T00:36:15.3400000' AS DateTime2), 23, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (46, CAST(N'2021-01-03T00:36:25.3300000' AS DateTime2), CAST(N'2021-01-03T00:36:25.3300000' AS DateTime2), 24, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (47, CAST(N'2021-01-03T00:36:25.3300000' AS DateTime2), CAST(N'2021-01-03T00:36:25.3300000' AS DateTime2), 24, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (48, CAST(N'2021-01-03T00:39:52.7800000' AS DateTime2), CAST(N'2021-01-03T00:39:52.7800000' AS DateTime2), 25, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (49, CAST(N'2021-01-03T00:39:52.7800000' AS DateTime2), CAST(N'2021-01-03T00:39:52.7800000' AS DateTime2), 25, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (50, CAST(N'2021-01-03T00:41:06.7300000' AS DateTime2), CAST(N'2021-01-03T00:41:06.7300000' AS DateTime2), 26, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (51, CAST(N'2021-01-03T00:41:06.7300000' AS DateTime2), CAST(N'2021-01-03T00:41:06.7300000' AS DateTime2), 26, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (52, CAST(N'2021-01-03T00:42:05.9200000' AS DateTime2), CAST(N'2021-01-03T00:42:05.9200000' AS DateTime2), 27, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (53, CAST(N'2021-01-03T00:42:05.9200000' AS DateTime2), CAST(N'2021-01-03T00:42:05.9200000' AS DateTime2), 27, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (54, CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), 28, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (55, CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), 28, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (56, CAST(N'2021-01-03T00:44:25.0500000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0500000' AS DateTime2), 29, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (57, CAST(N'2021-01-03T00:44:25.0500000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0500000' AS DateTime2), 29, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (58, CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), 30, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (59, CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), 30, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (60, CAST(N'2021-01-03T00:47:21.0500000' AS DateTime2), CAST(N'2021-01-03T00:47:21.0500000' AS DateTime2), 31, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (61, CAST(N'2021-01-03T00:47:21.0500000' AS DateTime2), CAST(N'2021-01-03T00:47:21.0500000' AS DateTime2), 31, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (62, CAST(N'2021-01-03T00:49:07.0400000' AS DateTime2), CAST(N'2021-01-03T00:49:07.0400000' AS DateTime2), 32, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (63, CAST(N'2021-01-03T00:49:07.0400000' AS DateTime2), CAST(N'2021-01-03T00:49:07.0400000' AS DateTime2), 32, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (64, CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), 33, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (65, CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), 33, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (66, CAST(N'2021-01-03T00:53:24.9100000' AS DateTime2), CAST(N'2021-01-03T00:53:24.9100000' AS DateTime2), 34, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (67, CAST(N'2021-01-03T00:53:24.9100000' AS DateTime2), CAST(N'2021-01-03T00:53:24.9100000' AS DateTime2), 34, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (68, CAST(N'2021-01-03T00:54:40.1400000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1400000' AS DateTime2), 35, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (69, CAST(N'2021-01-03T00:54:40.1400000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1400000' AS DateTime2), 35, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (70, CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), 36, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (71, CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), 36, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (72, CAST(N'2021-01-03T00:55:01.2300000' AS DateTime2), CAST(N'2021-01-03T00:55:01.2300000' AS DateTime2), 37, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (73, CAST(N'2021-01-03T00:55:01.2300000' AS DateTime2), CAST(N'2021-01-03T00:55:01.2300000' AS DateTime2), 37, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (74, CAST(N'2021-01-03T00:59:20.2200000' AS DateTime2), CAST(N'2021-01-03T00:59:20.2200000' AS DateTime2), 38, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (75, CAST(N'2021-01-03T00:59:20.2200000' AS DateTime2), CAST(N'2021-01-03T00:59:20.2200000' AS DateTime2), 38, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (76, CAST(N'2021-01-03T01:00:03.4000000' AS DateTime2), CAST(N'2021-01-03T01:00:03.4000000' AS DateTime2), 39, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (77, CAST(N'2021-01-03T01:00:03.4000000' AS DateTime2), CAST(N'2021-01-03T01:00:03.4000000' AS DateTime2), 39, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (78, CAST(N'2021-01-03T01:01:44.9900000' AS DateTime2), CAST(N'2021-01-03T01:01:44.9900000' AS DateTime2), 40, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (79, CAST(N'2021-01-03T01:01:44.9900000' AS DateTime2), CAST(N'2021-01-03T01:01:44.9900000' AS DateTime2), 40, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (80, CAST(N'2021-01-03T01:02:55.3900000' AS DateTime2), CAST(N'2021-01-03T01:02:55.3900000' AS DateTime2), 41, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (81, CAST(N'2021-01-03T01:02:55.3900000' AS DateTime2), CAST(N'2021-01-03T01:02:55.3900000' AS DateTime2), 41, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (82, CAST(N'2021-01-03T01:04:37.5900000' AS DateTime2), CAST(N'2021-01-03T01:04:37.5900000' AS DateTime2), 42, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (83, CAST(N'2021-01-03T01:04:37.5900000' AS DateTime2), CAST(N'2021-01-03T01:04:37.5900000' AS DateTime2), 42, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (84, CAST(N'2021-01-03T01:04:53.0300000' AS DateTime2), CAST(N'2021-01-03T01:04:53.0300000' AS DateTime2), 43, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (85, CAST(N'2021-01-03T01:04:53.0300000' AS DateTime2), CAST(N'2021-01-03T01:04:53.0300000' AS DateTime2), 43, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (86, CAST(N'2021-01-03T01:04:59.7000000' AS DateTime2), CAST(N'2021-01-03T01:04:59.7000000' AS DateTime2), 44, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (87, CAST(N'2021-01-03T01:04:59.7000000' AS DateTime2), CAST(N'2021-01-03T01:04:59.7000000' AS DateTime2), 44, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (88, CAST(N'2021-01-03T01:22:24.2800000' AS DateTime2), CAST(N'2021-01-03T01:22:24.2800000' AS DateTime2), 45, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (89, CAST(N'2021-01-03T01:27:36.8700000' AS DateTime2), CAST(N'2021-01-03T01:27:36.8700000' AS DateTime2), 46, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (90, CAST(N'2021-01-03T01:27:36.8700000' AS DateTime2), CAST(N'2021-01-03T01:27:36.8700000' AS DateTime2), 46, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (91, CAST(N'2021-01-03T01:43:57.1900000' AS DateTime2), CAST(N'2021-01-03T01:43:57.1900000' AS DateTime2), 47, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (92, CAST(N'2021-01-03T01:43:57.1900000' AS DateTime2), CAST(N'2021-01-03T01:43:57.1900000' AS DateTime2), 47, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (93, CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), 48, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (94, CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), 48, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (95, CAST(N'2021-01-03T01:46:42.2800000' AS DateTime2), CAST(N'2021-01-03T01:46:42.2800000' AS DateTime2), 49, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (96, CAST(N'2021-01-03T01:46:42.2800000' AS DateTime2), CAST(N'2021-01-03T01:46:42.2800000' AS DateTime2), 49, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (97, CAST(N'2021-01-03T01:49:06.7500000' AS DateTime2), CAST(N'2021-01-03T01:49:06.7500000' AS DateTime2), 50, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (98, CAST(N'2021-01-03T01:49:06.7500000' AS DateTime2), CAST(N'2021-01-03T01:49:06.7500000' AS DateTime2), 50, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (99, CAST(N'2021-01-03T01:53:35.9000000' AS DateTime2), CAST(N'2021-01-03T01:53:35.9000000' AS DateTime2), 51, 7)
GO
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (100, CAST(N'2021-01-03T01:53:35.9000000' AS DateTime2), CAST(N'2021-01-03T01:53:35.9000000' AS DateTime2), 51, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (101, CAST(N'2021-01-03T01:59:19.1500000' AS DateTime2), CAST(N'2021-01-03T01:59:19.1500000' AS DateTime2), 52, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (102, CAST(N'2021-01-03T01:59:19.1500000' AS DateTime2), CAST(N'2021-01-03T01:59:19.1500000' AS DateTime2), 52, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (103, CAST(N'2021-01-03T01:59:23.4700000' AS DateTime2), CAST(N'2021-01-03T01:59:23.4700000' AS DateTime2), 53, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (104, CAST(N'2021-01-03T01:59:23.4700000' AS DateTime2), CAST(N'2021-01-03T01:59:23.4700000' AS DateTime2), 53, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (105, CAST(N'2021-01-03T02:00:14.9200000' AS DateTime2), CAST(N'2021-01-03T02:00:14.9200000' AS DateTime2), 54, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (106, CAST(N'2021-01-03T02:00:14.9200000' AS DateTime2), CAST(N'2021-01-03T02:00:14.9200000' AS DateTime2), 54, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (107, CAST(N'2021-01-03T02:24:56.8700000' AS DateTime2), CAST(N'2021-01-03T02:24:56.8700000' AS DateTime2), 55, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (108, CAST(N'2021-01-03T02:24:56.8700000' AS DateTime2), CAST(N'2021-01-03T02:24:56.8700000' AS DateTime2), 55, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (109, CAST(N'2021-01-03T02:53:27.6000000' AS DateTime2), CAST(N'2021-01-03T02:53:27.6000000' AS DateTime2), 56, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (110, CAST(N'2021-01-03T02:53:27.6000000' AS DateTime2), CAST(N'2021-01-03T02:53:27.6000000' AS DateTime2), 56, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (111, CAST(N'2021-01-03T02:54:22.1500000' AS DateTime2), CAST(N'2021-01-03T02:54:22.1500000' AS DateTime2), 57, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (112, CAST(N'2021-01-03T02:54:22.1500000' AS DateTime2), CAST(N'2021-01-03T02:54:22.1500000' AS DateTime2), 57, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (113, CAST(N'2021-01-03T02:54:24.6100000' AS DateTime2), CAST(N'2021-01-03T02:54:24.6100000' AS DateTime2), 58, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (114, CAST(N'2021-01-03T02:54:24.6100000' AS DateTime2), CAST(N'2021-01-03T02:54:24.6100000' AS DateTime2), 58, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (115, CAST(N'2021-01-03T02:54:33.1800000' AS DateTime2), CAST(N'2021-01-03T02:54:33.1800000' AS DateTime2), 59, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (116, CAST(N'2021-01-03T02:54:33.1800000' AS DateTime2), CAST(N'2021-01-03T02:54:33.1800000' AS DateTime2), 59, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (117, CAST(N'2021-01-03T02:54:39.1300000' AS DateTime2), CAST(N'2021-01-03T02:54:39.1300000' AS DateTime2), 60, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (118, CAST(N'2021-01-03T02:54:39.1300000' AS DateTime2), CAST(N'2021-01-03T02:54:39.1300000' AS DateTime2), 60, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (119, CAST(N'2021-01-03T02:55:26.3000000' AS DateTime2), CAST(N'2021-01-03T02:55:26.3000000' AS DateTime2), 61, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (120, CAST(N'2021-01-03T02:55:26.3000000' AS DateTime2), CAST(N'2021-01-03T02:55:26.3000000' AS DateTime2), 61, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (121, CAST(N'2021-01-03T02:55:37.8600000' AS DateTime2), CAST(N'2021-01-03T02:55:37.8600000' AS DateTime2), 62, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (122, CAST(N'2021-01-03T02:55:37.8600000' AS DateTime2), CAST(N'2021-01-03T02:55:37.8600000' AS DateTime2), 62, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (123, CAST(N'2021-01-03T02:56:25.8400000' AS DateTime2), CAST(N'2021-01-03T02:56:25.8400000' AS DateTime2), 63, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (124, CAST(N'2021-01-03T02:56:25.8400000' AS DateTime2), CAST(N'2021-01-03T02:56:25.8400000' AS DateTime2), 63, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (125, CAST(N'2021-01-03T02:56:40.4400000' AS DateTime2), CAST(N'2021-01-03T02:56:40.4400000' AS DateTime2), 64, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (126, CAST(N'2021-01-03T02:56:40.4400000' AS DateTime2), CAST(N'2021-01-03T02:56:40.4400000' AS DateTime2), 64, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (127, CAST(N'2021-01-03T03:00:25.2800000' AS DateTime2), CAST(N'2021-01-03T03:00:25.2800000' AS DateTime2), 65, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (128, CAST(N'2021-01-03T03:00:25.2800000' AS DateTime2), CAST(N'2021-01-03T03:00:25.2800000' AS DateTime2), 65, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (129, CAST(N'2021-01-03T03:00:33.6200000' AS DateTime2), CAST(N'2021-01-03T03:00:33.6200000' AS DateTime2), 66, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (130, CAST(N'2021-01-03T03:00:33.6200000' AS DateTime2), CAST(N'2021-01-03T03:00:33.6200000' AS DateTime2), 66, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (131, CAST(N'2021-01-09T16:22:17.0000000' AS DateTime2), CAST(N'2021-01-09T16:22:17.0000000' AS DateTime2), 67, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (132, CAST(N'2021-01-09T16:23:23.6300000' AS DateTime2), CAST(N'2021-01-09T16:23:23.6300000' AS DateTime2), 68, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (133, CAST(N'2021-01-09T16:35:23.3000000' AS DateTime2), CAST(N'2021-01-09T16:35:23.3000000' AS DateTime2), 69, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (134, CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), 70, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (135, CAST(N'2021-01-09T16:42:21.3000000' AS DateTime2), CAST(N'2021-01-09T16:42:21.3000000' AS DateTime2), 71, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (136, CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), 79, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (137, CAST(N'2021-01-09T16:52:52.1600000' AS DateTime2), CAST(N'2021-01-09T16:52:52.1600000' AS DateTime2), 80, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (138, CAST(N'2021-01-09T17:50:13.2700000' AS DateTime2), CAST(N'2021-01-09T17:50:13.2700000' AS DateTime2), 81, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (139, CAST(N'2021-01-09T17:50:13.2700000' AS DateTime2), CAST(N'2021-01-09T17:50:13.2700000' AS DateTime2), 81, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (140, CAST(N'2021-01-09T18:38:29.7000000' AS DateTime2), CAST(N'2021-01-09T18:38:29.7000000' AS DateTime2), 82, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (141, CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), 83, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (142, CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), 84, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (143, CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), 85, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (144, CAST(N'2021-01-09T18:45:12.8300000' AS DateTime2), CAST(N'2021-01-09T18:45:12.8300000' AS DateTime2), 86, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (145, CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), 87, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (146, CAST(N'2021-01-09T19:35:06.7600000' AS DateTime2), CAST(N'2021-01-09T19:35:06.7600000' AS DateTime2), 88, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (147, CAST(N'2021-01-09T19:35:10.3500000' AS DateTime2), CAST(N'2021-01-09T19:35:10.3500000' AS DateTime2), 89, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (148, CAST(N'2021-01-09T19:35:11.0200000' AS DateTime2), CAST(N'2021-01-09T19:35:11.0200000' AS DateTime2), 90, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (149, CAST(N'2021-01-09T19:35:11.5400000' AS DateTime2), CAST(N'2021-01-09T19:35:11.5400000' AS DateTime2), 91, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (150, CAST(N'2021-01-09T19:35:12.0100000' AS DateTime2), CAST(N'2021-01-09T19:35:12.0100000' AS DateTime2), 92, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (151, CAST(N'2021-01-09T19:35:12.6300000' AS DateTime2), CAST(N'2021-01-09T19:35:12.6300000' AS DateTime2), 93, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (152, CAST(N'2021-01-09T19:35:12.9500000' AS DateTime2), CAST(N'2021-01-09T19:35:12.9500000' AS DateTime2), 94, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (153, CAST(N'2021-01-09T19:35:13.1600000' AS DateTime2), CAST(N'2021-01-09T19:35:13.1600000' AS DateTime2), 95, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (154, CAST(N'2021-01-09T19:35:13.3400000' AS DateTime2), CAST(N'2021-01-09T19:35:13.3400000' AS DateTime2), 96, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (155, CAST(N'2021-01-09T19:35:13.5200000' AS DateTime2), CAST(N'2021-01-09T19:35:13.5200000' AS DateTime2), 97, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (156, CAST(N'2021-01-09T19:35:13.6700000' AS DateTime2), CAST(N'2021-01-09T19:35:13.6700000' AS DateTime2), 98, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (157, CAST(N'2021-01-09T19:35:13.8300000' AS DateTime2), CAST(N'2021-01-09T19:35:13.8300000' AS DateTime2), 99, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (158, CAST(N'2021-01-09T19:35:13.9800000' AS DateTime2), CAST(N'2021-01-09T19:35:13.9800000' AS DateTime2), 100, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (159, CAST(N'2021-01-09T19:35:14.2600000' AS DateTime2), CAST(N'2021-01-09T19:35:14.2600000' AS DateTime2), 101, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (160, CAST(N'2021-01-09T19:35:14.3900000' AS DateTime2), CAST(N'2021-01-09T19:35:14.3900000' AS DateTime2), 102, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (161, CAST(N'2021-01-09T19:35:14.5500000' AS DateTime2), CAST(N'2021-01-09T19:35:14.5500000' AS DateTime2), 103, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (162, CAST(N'2021-01-09T19:35:14.7000000' AS DateTime2), CAST(N'2021-01-09T19:35:14.7000000' AS DateTime2), 104, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (163, CAST(N'2021-01-09T19:35:14.8700000' AS DateTime2), CAST(N'2021-01-09T19:35:14.8700000' AS DateTime2), 105, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (164, CAST(N'2021-01-09T19:35:15.0400000' AS DateTime2), CAST(N'2021-01-09T19:35:15.0400000' AS DateTime2), 106, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (165, CAST(N'2021-01-09T19:35:15.2000000' AS DateTime2), CAST(N'2021-01-09T19:35:15.2000000' AS DateTime2), 107, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (166, CAST(N'2021-01-09T19:35:15.3800000' AS DateTime2), CAST(N'2021-01-09T19:35:15.3800000' AS DateTime2), 108, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (167, CAST(N'2021-01-09T19:35:15.5600000' AS DateTime2), CAST(N'2021-01-09T19:35:15.5600000' AS DateTime2), 109, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (168, CAST(N'2021-01-09T19:35:15.7300000' AS DateTime2), CAST(N'2021-01-09T19:35:15.7300000' AS DateTime2), 110, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (169, CAST(N'2021-01-09T19:35:15.9000000' AS DateTime2), CAST(N'2021-01-09T19:35:15.9000000' AS DateTime2), 111, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (170, CAST(N'2021-01-09T19:35:16.0600000' AS DateTime2), CAST(N'2021-01-09T19:35:16.0600000' AS DateTime2), 112, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (171, CAST(N'2021-01-09T19:35:16.2200000' AS DateTime2), CAST(N'2021-01-09T19:35:16.2200000' AS DateTime2), 113, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (172, CAST(N'2021-01-09T19:35:16.3900000' AS DateTime2), CAST(N'2021-01-09T19:35:16.3900000' AS DateTime2), 114, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (173, CAST(N'2021-01-09T19:35:16.5500000' AS DateTime2), CAST(N'2021-01-09T19:35:16.5500000' AS DateTime2), 115, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (174, CAST(N'2021-01-09T19:35:16.7000000' AS DateTime2), CAST(N'2021-01-09T19:35:16.7000000' AS DateTime2), 116, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (175, CAST(N'2021-01-09T19:35:16.8500000' AS DateTime2), CAST(N'2021-01-09T19:35:16.8500000' AS DateTime2), 117, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (176, CAST(N'2021-01-09T19:35:16.9800000' AS DateTime2), CAST(N'2021-01-09T19:35:16.9800000' AS DateTime2), 118, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (177, CAST(N'2021-01-09T19:35:56.2500000' AS DateTime2), CAST(N'2021-01-09T19:35:56.2500000' AS DateTime2), 119, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (178, CAST(N'2021-01-09T19:35:56.4200000' AS DateTime2), CAST(N'2021-01-09T19:35:56.4200000' AS DateTime2), 120, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (179, CAST(N'2021-01-09T19:35:56.9500000' AS DateTime2), CAST(N'2021-01-09T19:35:56.9500000' AS DateTime2), 121, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (180, CAST(N'2021-01-09T19:35:57.1400000' AS DateTime2), CAST(N'2021-01-09T19:35:57.1400000' AS DateTime2), 122, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (181, CAST(N'2021-01-09T19:35:57.5700000' AS DateTime2), CAST(N'2021-01-09T19:35:57.5700000' AS DateTime2), 123, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (182, CAST(N'2021-01-09T19:37:39.2200000' AS DateTime2), CAST(N'2021-01-09T19:37:39.2200000' AS DateTime2), 124, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (183, CAST(N'2021-01-09T19:37:39.4800000' AS DateTime2), CAST(N'2021-01-09T19:37:39.4800000' AS DateTime2), 125, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (184, CAST(N'2021-01-09T19:37:39.8700000' AS DateTime2), CAST(N'2021-01-09T19:37:39.8700000' AS DateTime2), 126, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (185, CAST(N'2021-01-09T19:37:40.2200000' AS DateTime2), CAST(N'2021-01-09T19:37:40.2200000' AS DateTime2), 127, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (186, CAST(N'2021-01-09T19:37:40.4600000' AS DateTime2), CAST(N'2021-01-09T19:37:40.4600000' AS DateTime2), 128, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (187, CAST(N'2021-01-09T19:37:40.6300000' AS DateTime2), CAST(N'2021-01-09T19:37:40.6300000' AS DateTime2), 129, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (188, CAST(N'2021-01-09T19:37:40.8000000' AS DateTime2), CAST(N'2021-01-09T19:37:40.8000000' AS DateTime2), 130, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (189, CAST(N'2021-01-09T19:37:40.9900000' AS DateTime2), CAST(N'2021-01-09T19:37:40.9900000' AS DateTime2), 131, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (190, CAST(N'2021-01-09T19:37:41.1500000' AS DateTime2), CAST(N'2021-01-09T19:37:41.1500000' AS DateTime2), 132, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (191, CAST(N'2021-01-09T19:37:41.3200000' AS DateTime2), CAST(N'2021-01-09T19:37:41.3200000' AS DateTime2), 133, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (192, CAST(N'2021-01-09T19:37:41.4700000' AS DateTime2), CAST(N'2021-01-09T19:37:41.4700000' AS DateTime2), 134, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (193, CAST(N'2021-01-09T19:37:41.6400000' AS DateTime2), CAST(N'2021-01-09T19:37:41.6400000' AS DateTime2), 135, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (194, CAST(N'2021-01-09T19:37:41.8100000' AS DateTime2), CAST(N'2021-01-09T19:37:41.8100000' AS DateTime2), 136, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (195, CAST(N'2021-01-09T19:37:41.9700000' AS DateTime2), CAST(N'2021-01-09T19:37:41.9700000' AS DateTime2), 137, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (196, CAST(N'2021-01-09T19:37:42.1900000' AS DateTime2), CAST(N'2021-01-09T19:37:42.1900000' AS DateTime2), 138, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (197, CAST(N'2021-01-09T19:37:42.3000000' AS DateTime2), CAST(N'2021-01-09T19:37:42.3000000' AS DateTime2), 139, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (198, CAST(N'2021-01-09T19:37:42.4800000' AS DateTime2), CAST(N'2021-01-09T19:37:42.4800000' AS DateTime2), 140, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (199, CAST(N'2021-01-09T19:37:42.6500000' AS DateTime2), CAST(N'2021-01-09T19:37:42.6500000' AS DateTime2), 141, 1)
GO
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (200, CAST(N'2021-01-09T19:37:42.8100000' AS DateTime2), CAST(N'2021-01-09T19:37:42.8100000' AS DateTime2), 142, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (201, CAST(N'2021-01-09T19:37:42.9900000' AS DateTime2), CAST(N'2021-01-09T19:37:42.9900000' AS DateTime2), 143, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (202, CAST(N'2021-01-09T19:37:43.1600000' AS DateTime2), CAST(N'2021-01-09T19:37:43.1600000' AS DateTime2), 144, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (203, CAST(N'2021-01-09T19:37:43.3200000' AS DateTime2), CAST(N'2021-01-09T19:37:43.3200000' AS DateTime2), 145, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (204, CAST(N'2021-01-09T19:37:43.4900000' AS DateTime2), CAST(N'2021-01-09T19:37:43.4900000' AS DateTime2), 146, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (205, CAST(N'2021-01-09T19:37:43.6500000' AS DateTime2), CAST(N'2021-01-09T19:37:43.6500000' AS DateTime2), 147, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (206, CAST(N'2021-01-09T19:37:43.8400000' AS DateTime2), CAST(N'2021-01-09T19:37:43.8400000' AS DateTime2), 148, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (207, CAST(N'2021-01-09T19:37:44.0100000' AS DateTime2), CAST(N'2021-01-09T19:37:44.0100000' AS DateTime2), 149, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (208, CAST(N'2021-01-09T19:37:44.2100000' AS DateTime2), CAST(N'2021-01-09T19:37:44.2100000' AS DateTime2), 150, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (209, CAST(N'2021-01-09T19:37:44.4400000' AS DateTime2), CAST(N'2021-01-09T19:37:44.4400000' AS DateTime2), 151, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (210, CAST(N'2021-01-09T19:37:44.7200000' AS DateTime2), CAST(N'2021-01-09T19:37:44.7200000' AS DateTime2), 152, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (211, CAST(N'2021-01-09T19:37:45.1400000' AS DateTime2), CAST(N'2021-01-09T19:37:45.1400000' AS DateTime2), 153, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (212, CAST(N'2021-01-09T19:37:45.5200000' AS DateTime2), CAST(N'2021-01-09T19:37:45.5200000' AS DateTime2), 154, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (213, CAST(N'2021-01-09T19:37:45.9600000' AS DateTime2), CAST(N'2021-01-09T19:37:45.9600000' AS DateTime2), 155, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (214, CAST(N'2021-01-09T19:37:46.6600000' AS DateTime2), CAST(N'2021-01-09T19:37:46.6600000' AS DateTime2), 156, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (215, CAST(N'2021-01-09T20:07:20.8400000' AS DateTime2), CAST(N'2021-01-09T20:07:20.8400000' AS DateTime2), 157, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (216, CAST(N'2021-01-09T20:07:27.9500000' AS DateTime2), CAST(N'2021-01-09T20:07:27.9500000' AS DateTime2), 158, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (217, CAST(N'2021-01-09T20:07:28.4200000' AS DateTime2), CAST(N'2021-01-09T20:07:28.4200000' AS DateTime2), 159, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (218, CAST(N'2021-01-09T20:07:28.9000000' AS DateTime2), CAST(N'2021-01-09T20:07:28.9000000' AS DateTime2), 160, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (219, CAST(N'2021-01-09T20:07:29.3300000' AS DateTime2), CAST(N'2021-01-09T20:07:29.3300000' AS DateTime2), 161, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (220, CAST(N'2021-01-09T20:07:29.7300000' AS DateTime2), CAST(N'2021-01-09T20:07:29.7300000' AS DateTime2), 162, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (221, CAST(N'2021-01-09T20:07:30.0400000' AS DateTime2), CAST(N'2021-01-09T20:07:30.0400000' AS DateTime2), 163, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (222, CAST(N'2021-01-09T20:07:30.3300000' AS DateTime2), CAST(N'2021-01-09T20:07:30.3300000' AS DateTime2), 164, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (223, CAST(N'2021-01-09T20:07:30.5000000' AS DateTime2), CAST(N'2021-01-09T20:07:30.5000000' AS DateTime2), 165, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (224, CAST(N'2021-01-09T20:07:30.6500000' AS DateTime2), CAST(N'2021-01-09T20:07:30.6500000' AS DateTime2), 166, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (225, CAST(N'2021-01-09T20:07:30.8400000' AS DateTime2), CAST(N'2021-01-09T20:07:30.8400000' AS DateTime2), 167, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (226, CAST(N'2021-01-09T20:07:31.0000000' AS DateTime2), CAST(N'2021-01-09T20:07:31.0000000' AS DateTime2), 168, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (227, CAST(N'2021-01-09T20:07:31.1200000' AS DateTime2), CAST(N'2021-01-09T20:07:31.1200000' AS DateTime2), 169, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (228, CAST(N'2021-01-09T20:07:31.2700000' AS DateTime2), CAST(N'2021-01-09T20:07:31.2700000' AS DateTime2), 170, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (229, CAST(N'2021-01-09T20:07:31.4300000' AS DateTime2), CAST(N'2021-01-09T20:07:31.4300000' AS DateTime2), 171, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (230, CAST(N'2021-01-09T20:07:31.5700000' AS DateTime2), CAST(N'2021-01-09T20:07:31.5700000' AS DateTime2), 172, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (231, CAST(N'2021-01-09T20:07:31.7200000' AS DateTime2), CAST(N'2021-01-09T20:07:31.7200000' AS DateTime2), 173, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (232, CAST(N'2021-01-09T20:07:31.8600000' AS DateTime2), CAST(N'2021-01-09T20:07:31.8600000' AS DateTime2), 174, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (233, CAST(N'2021-01-09T20:07:32.0100000' AS DateTime2), CAST(N'2021-01-09T20:07:32.0100000' AS DateTime2), 175, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (234, CAST(N'2021-01-09T20:07:32.1800000' AS DateTime2), CAST(N'2021-01-09T20:07:32.1800000' AS DateTime2), 176, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (235, CAST(N'2021-01-09T20:07:32.5000000' AS DateTime2), CAST(N'2021-01-09T20:07:32.5000000' AS DateTime2), 177, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (236, CAST(N'2021-01-09T20:07:32.6700000' AS DateTime2), CAST(N'2021-01-09T20:07:32.6700000' AS DateTime2), 178, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (237, CAST(N'2021-01-09T23:39:09.9500000' AS DateTime2), CAST(N'2021-01-09T23:39:09.9500000' AS DateTime2), 179, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (238, CAST(N'2021-01-09T23:39:09.9500000' AS DateTime2), CAST(N'2021-01-09T23:39:09.9500000' AS DateTime2), 179, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (239, CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), 180, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (240, CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), 180, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (241, CAST(N'2021-01-09T23:39:28.3400000' AS DateTime2), CAST(N'2021-01-09T23:39:28.3400000' AS DateTime2), 181, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (242, CAST(N'2021-01-09T23:39:28.3400000' AS DateTime2), CAST(N'2021-01-09T23:39:28.3400000' AS DateTime2), 181, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (243, CAST(N'2021-01-09T23:46:30.8000000' AS DateTime2), CAST(N'2021-01-09T23:46:30.8000000' AS DateTime2), 182, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (244, CAST(N'2021-01-09T23:46:30.8000000' AS DateTime2), CAST(N'2021-01-09T23:46:30.8000000' AS DateTime2), 182, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (245, CAST(N'2021-01-10T00:05:38.1800000' AS DateTime2), CAST(N'2021-01-10T00:05:38.1800000' AS DateTime2), 183, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (246, CAST(N'2021-01-10T00:05:38.1800000' AS DateTime2), CAST(N'2021-01-10T00:05:38.1800000' AS DateTime2), 183, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (247, CAST(N'2021-01-10T00:37:01.8100000' AS DateTime2), CAST(N'2021-01-10T00:37:01.8100000' AS DateTime2), 184, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (248, CAST(N'2021-01-10T00:37:01.8100000' AS DateTime2), CAST(N'2021-01-10T00:37:01.8100000' AS DateTime2), 184, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (249, CAST(N'2021-01-10T00:38:41.5800000' AS DateTime2), CAST(N'2021-01-10T00:38:41.5800000' AS DateTime2), 185, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (250, CAST(N'2021-01-10T00:38:41.5800000' AS DateTime2), CAST(N'2021-01-10T00:38:41.5800000' AS DateTime2), 185, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (251, CAST(N'2021-01-10T00:49:53.7500000' AS DateTime2), CAST(N'2021-01-10T00:49:53.7500000' AS DateTime2), 186, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (252, CAST(N'2021-01-10T00:49:53.7500000' AS DateTime2), CAST(N'2021-01-10T00:49:53.7500000' AS DateTime2), 186, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (253, CAST(N'2021-01-10T00:55:32.3700000' AS DateTime2), CAST(N'2021-01-10T00:55:32.3700000' AS DateTime2), 187, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (254, CAST(N'2021-01-10T00:55:32.3700000' AS DateTime2), CAST(N'2021-01-10T00:55:32.3700000' AS DateTime2), 187, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (255, CAST(N'2021-01-10T01:03:15.6800000' AS DateTime2), CAST(N'2021-01-10T01:03:15.6800000' AS DateTime2), 188, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (256, CAST(N'2021-01-10T01:03:15.6800000' AS DateTime2), CAST(N'2021-01-10T01:03:15.6800000' AS DateTime2), 188, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (257, CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), 189, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (258, CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), 189, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (259, CAST(N'2021-01-10T01:08:23.2600000' AS DateTime2), CAST(N'2021-01-10T01:08:23.2600000' AS DateTime2), 190, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (260, CAST(N'2021-01-10T01:08:23.2600000' AS DateTime2), CAST(N'2021-01-10T01:08:23.2600000' AS DateTime2), 190, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (261, CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), 191, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (262, CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), 191, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (263, CAST(N'2021-01-10T01:09:37.3800000' AS DateTime2), CAST(N'2021-01-10T01:09:37.3800000' AS DateTime2), 192, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (264, CAST(N'2021-01-10T01:09:37.3800000' AS DateTime2), CAST(N'2021-01-10T01:09:37.3800000' AS DateTime2), 192, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (265, CAST(N'2021-01-10T01:11:04.5400000' AS DateTime2), CAST(N'2021-01-10T01:11:04.5400000' AS DateTime2), 193, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (266, CAST(N'2021-01-10T01:11:04.5400000' AS DateTime2), CAST(N'2021-01-10T01:11:04.5400000' AS DateTime2), 193, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (267, CAST(N'2021-01-10T01:13:01.3200000' AS DateTime2), CAST(N'2021-01-10T01:13:01.3200000' AS DateTime2), 194, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (268, CAST(N'2021-01-10T01:13:01.3200000' AS DateTime2), CAST(N'2021-01-10T01:13:01.3200000' AS DateTime2), 194, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (269, CAST(N'2021-01-10T01:14:10.8700000' AS DateTime2), CAST(N'2021-01-10T01:14:10.8700000' AS DateTime2), 195, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (270, CAST(N'2021-01-10T01:14:10.8700000' AS DateTime2), CAST(N'2021-01-10T01:14:10.8700000' AS DateTime2), 195, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (271, CAST(N'2021-01-10T01:18:06.8400000' AS DateTime2), CAST(N'2021-01-10T01:18:06.8400000' AS DateTime2), 196, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (272, CAST(N'2021-01-10T01:18:06.8400000' AS DateTime2), CAST(N'2021-01-10T01:18:06.8400000' AS DateTime2), 196, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (273, CAST(N'2021-01-10T01:21:26.3500000' AS DateTime2), CAST(N'2021-01-10T01:21:26.3500000' AS DateTime2), 197, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (274, CAST(N'2021-01-10T01:21:26.3500000' AS DateTime2), CAST(N'2021-01-10T01:21:26.3500000' AS DateTime2), 197, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (275, CAST(N'2021-01-10T01:21:50.9300000' AS DateTime2), CAST(N'2021-01-10T01:21:50.9300000' AS DateTime2), 198, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (276, CAST(N'2021-01-10T01:21:50.9300000' AS DateTime2), CAST(N'2021-01-10T01:21:50.9300000' AS DateTime2), 198, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (277, CAST(N'2021-01-10T01:25:59.9900000' AS DateTime2), CAST(N'2021-01-10T01:25:59.9900000' AS DateTime2), 199, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (278, CAST(N'2021-01-10T01:25:59.9900000' AS DateTime2), CAST(N'2021-01-10T01:25:59.9900000' AS DateTime2), 199, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (279, CAST(N'2021-01-10T01:57:32.4000000' AS DateTime2), CAST(N'2021-01-10T01:57:32.4000000' AS DateTime2), 200, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (280, CAST(N'2021-01-10T01:57:32.4000000' AS DateTime2), CAST(N'2021-01-10T01:57:32.4000000' AS DateTime2), 200, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (281, CAST(N'2021-01-10T02:13:00.6300000' AS DateTime2), CAST(N'2021-01-10T02:13:00.6300000' AS DateTime2), 201, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (282, CAST(N'2021-01-10T02:13:00.6300000' AS DateTime2), CAST(N'2021-01-10T02:13:00.6300000' AS DateTime2), 201, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (283, CAST(N'2021-01-10T16:44:37.4100000' AS DateTime2), CAST(N'2021-01-10T16:44:37.4100000' AS DateTime2), 202, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (284, CAST(N'2021-01-10T16:45:19.1900000' AS DateTime2), CAST(N'2021-01-10T16:45:19.1900000' AS DateTime2), 203, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (285, CAST(N'2021-01-11T23:43:05.6000000' AS DateTime2), CAST(N'2021-01-11T23:43:05.6000000' AS DateTime2), 204, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (286, CAST(N'2021-01-11T23:44:10.9700000' AS DateTime2), CAST(N'2021-01-11T23:44:10.9700000' AS DateTime2), 205, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (287, CAST(N'2021-01-16T00:16:47.3500000' AS DateTime2), CAST(N'2021-01-16T00:16:47.3500000' AS DateTime2), 206, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (288, CAST(N'2021-01-16T00:37:56.8400000' AS DateTime2), CAST(N'2021-01-16T00:37:56.8400000' AS DateTime2), 207, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (289, CAST(N'2021-01-16T00:38:18.4100000' AS DateTime2), CAST(N'2021-01-16T00:38:18.4100000' AS DateTime2), 208, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (290, CAST(N'2021-01-16T00:39:39.5700000' AS DateTime2), CAST(N'2021-01-16T00:39:39.5700000' AS DateTime2), 209, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (291, CAST(N'2021-01-16T15:14:43.3300000' AS DateTime2), CAST(N'2021-01-16T15:14:43.3300000' AS DateTime2), 210, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (292, CAST(N'2021-01-16T15:21:36.3600000' AS DateTime2), CAST(N'2021-01-16T15:21:36.3600000' AS DateTime2), 211, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (293, CAST(N'2021-01-16T15:23:16.1400000' AS DateTime2), CAST(N'2021-01-16T15:23:16.1400000' AS DateTime2), 212, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (294, CAST(N'2021-01-16T15:24:26.2700000' AS DateTime2), CAST(N'2021-01-16T15:24:26.2700000' AS DateTime2), 213, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (295, CAST(N'2021-01-16T15:29:33.2500000' AS DateTime2), CAST(N'2021-01-16T15:29:33.2500000' AS DateTime2), 214, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (296, CAST(N'2021-01-16T15:29:42.4700000' AS DateTime2), CAST(N'2021-01-16T15:29:42.4700000' AS DateTime2), 215, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (297, CAST(N'2021-01-16T15:43:59.2200000' AS DateTime2), CAST(N'2021-01-16T15:43:59.2200000' AS DateTime2), 216, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (298, CAST(N'2021-01-16T15:44:05.4600000' AS DateTime2), CAST(N'2021-01-16T15:44:05.4600000' AS DateTime2), 217, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (299, CAST(N'2021-01-16T15:44:14.5700000' AS DateTime2), CAST(N'2021-01-16T15:44:14.5700000' AS DateTime2), 218, 1)
GO
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (300, CAST(N'2021-01-16T15:44:24.9600000' AS DateTime2), CAST(N'2021-01-16T15:44:24.9600000' AS DateTime2), 219, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (301, CAST(N'2021-01-16T15:44:25.3800000' AS DateTime2), CAST(N'2021-01-16T15:44:25.3800000' AS DateTime2), 220, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (302, CAST(N'2021-01-16T15:44:26.0300000' AS DateTime2), CAST(N'2021-01-16T15:44:26.0300000' AS DateTime2), 221, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (303, CAST(N'2021-01-16T15:44:29.2400000' AS DateTime2), CAST(N'2021-01-16T15:44:29.2400000' AS DateTime2), 222, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (304, CAST(N'2021-01-16T15:44:29.6800000' AS DateTime2), CAST(N'2021-01-16T15:44:29.6800000' AS DateTime2), 223, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (305, CAST(N'2021-01-16T15:44:30.2200000' AS DateTime2), CAST(N'2021-01-16T15:44:30.2200000' AS DateTime2), 224, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (306, CAST(N'2021-01-16T15:44:30.9500000' AS DateTime2), CAST(N'2021-01-16T15:44:30.9500000' AS DateTime2), 225, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (307, CAST(N'2021-01-16T15:44:31.3400000' AS DateTime2), CAST(N'2021-01-16T15:44:31.3400000' AS DateTime2), 226, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (308, CAST(N'2021-01-16T15:44:31.7400000' AS DateTime2), CAST(N'2021-01-16T15:44:31.7400000' AS DateTime2), 227, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (309, CAST(N'2021-01-16T15:44:33.2200000' AS DateTime2), CAST(N'2021-01-16T15:44:33.2200000' AS DateTime2), 228, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (310, CAST(N'2021-01-16T15:58:11.3200000' AS DateTime2), CAST(N'2021-01-16T15:58:11.3200000' AS DateTime2), 229, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (311, CAST(N'2021-01-16T15:58:12.1100000' AS DateTime2), CAST(N'2021-01-16T15:58:12.1100000' AS DateTime2), 230, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (312, CAST(N'2021-01-16T15:58:14.8800000' AS DateTime2), CAST(N'2021-01-16T15:58:14.8800000' AS DateTime2), 231, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (313, CAST(N'2021-01-16T22:45:22.7200000' AS DateTime2), CAST(N'2021-01-16T22:45:22.7200000' AS DateTime2), 232, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (314, CAST(N'2021-01-16T22:45:23.2200000' AS DateTime2), CAST(N'2021-01-16T22:45:23.2200000' AS DateTime2), 233, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (315, CAST(N'2021-01-16T22:45:23.7300000' AS DateTime2), CAST(N'2021-01-16T22:45:23.7300000' AS DateTime2), 234, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (316, CAST(N'2021-01-16T22:45:24.2000000' AS DateTime2), CAST(N'2021-01-16T22:45:24.2000000' AS DateTime2), 235, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (317, CAST(N'2021-01-16T22:45:24.6200000' AS DateTime2), CAST(N'2021-01-16T22:45:24.6200000' AS DateTime2), 236, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (318, CAST(N'2021-01-16T22:45:25.1800000' AS DateTime2), CAST(N'2021-01-16T22:45:25.1800000' AS DateTime2), 237, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (319, CAST(N'2021-01-16T22:45:25.4400000' AS DateTime2), CAST(N'2021-01-16T22:45:25.4400000' AS DateTime2), 238, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (320, CAST(N'2021-01-16T22:45:25.6400000' AS DateTime2), CAST(N'2021-01-16T22:45:25.6400000' AS DateTime2), 239, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (321, CAST(N'2021-01-16T22:45:25.8000000' AS DateTime2), CAST(N'2021-01-16T22:45:25.8000000' AS DateTime2), 240, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (322, CAST(N'2021-01-16T22:45:25.9600000' AS DateTime2), CAST(N'2021-01-16T22:45:25.9600000' AS DateTime2), 241, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (323, CAST(N'2021-01-16T22:45:26.1500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.1500000' AS DateTime2), 242, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (324, CAST(N'2021-01-16T22:45:26.2900000' AS DateTime2), CAST(N'2021-01-16T22:45:26.2900000' AS DateTime2), 243, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (325, CAST(N'2021-01-16T22:45:26.4500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.4500000' AS DateTime2), 244, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (326, CAST(N'2021-01-16T22:45:26.6100000' AS DateTime2), CAST(N'2021-01-16T22:45:26.6100000' AS DateTime2), 245, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (327, CAST(N'2021-01-16T22:45:26.7500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.7500000' AS DateTime2), 246, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (328, CAST(N'2021-01-16T22:45:26.9100000' AS DateTime2), CAST(N'2021-01-16T22:45:26.9100000' AS DateTime2), 247, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (329, CAST(N'2021-01-16T23:01:05.5800000' AS DateTime2), CAST(N'2021-01-16T23:01:05.5800000' AS DateTime2), 248, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (330, CAST(N'2021-01-16T23:01:07.1800000' AS DateTime2), CAST(N'2021-01-16T23:01:07.1800000' AS DateTime2), 249, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (331, CAST(N'2021-01-16T23:01:08.7800000' AS DateTime2), CAST(N'2021-01-16T23:01:08.7800000' AS DateTime2), 250, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (332, CAST(N'2021-01-16T23:01:12.0900000' AS DateTime2), CAST(N'2021-01-16T23:01:12.0900000' AS DateTime2), 251, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (333, CAST(N'2021-01-16T23:01:14.0400000' AS DateTime2), CAST(N'2021-01-16T23:01:14.0400000' AS DateTime2), 252, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (334, CAST(N'2021-01-16T23:01:14.6000000' AS DateTime2), CAST(N'2021-01-16T23:01:14.6000000' AS DateTime2), 253, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (335, CAST(N'2021-01-16T23:01:16.1900000' AS DateTime2), CAST(N'2021-01-16T23:01:16.1900000' AS DateTime2), 254, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (336, CAST(N'2021-01-16T23:01:18.2900000' AS DateTime2), CAST(N'2021-01-16T23:01:18.2900000' AS DateTime2), 255, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (337, CAST(N'2021-01-16T23:17:15.6600000' AS DateTime2), CAST(N'2021-01-16T23:17:15.6600000' AS DateTime2), 256, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (338, CAST(N'2021-01-16T23:17:15.6600000' AS DateTime2), CAST(N'2021-01-16T23:17:15.6600000' AS DateTime2), 256, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (339, CAST(N'2021-01-16T23:17:26.8100000' AS DateTime2), CAST(N'2021-01-16T23:17:26.8100000' AS DateTime2), 257, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (340, CAST(N'2021-01-16T23:17:26.8100000' AS DateTime2), CAST(N'2021-01-16T23:17:26.8100000' AS DateTime2), 257, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (341, CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), 258, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (342, CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), 258, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (343, CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), 259, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (344, CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), 259, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (345, CAST(N'2021-01-16T23:18:47.2000000' AS DateTime2), CAST(N'2021-01-16T23:18:47.2000000' AS DateTime2), 260, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (346, CAST(N'2021-01-16T23:18:47.2000000' AS DateTime2), CAST(N'2021-01-16T23:18:47.2000000' AS DateTime2), 260, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (347, CAST(N'2021-01-16T23:18:49.9100000' AS DateTime2), CAST(N'2021-01-16T23:18:49.9100000' AS DateTime2), 261, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (348, CAST(N'2021-01-16T23:18:49.9100000' AS DateTime2), CAST(N'2021-01-16T23:18:49.9100000' AS DateTime2), 261, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (349, CAST(N'2021-01-16T23:35:06.8600000' AS DateTime2), CAST(N'2021-01-16T23:35:06.8600000' AS DateTime2), 262, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (350, CAST(N'2021-01-16T23:35:06.8600000' AS DateTime2), CAST(N'2021-01-16T23:35:06.8600000' AS DateTime2), 262, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (351, CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), 263, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (352, CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), CAST(N'2021-01-16T23:35:18.3800000' AS DateTime2), 263, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (353, CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), 264, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (354, CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), CAST(N'2021-01-16T23:35:31.0200000' AS DateTime2), 264, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (355, CAST(N'2021-01-16T23:36:53.9400000' AS DateTime2), CAST(N'2021-01-16T23:36:53.9400000' AS DateTime2), 265, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (356, CAST(N'2021-01-16T23:36:53.9400000' AS DateTime2), CAST(N'2021-01-16T23:36:53.9400000' AS DateTime2), 265, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (357, CAST(N'2021-01-16T23:40:08.1000000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1000000' AS DateTime2), 266, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (358, CAST(N'2021-01-16T23:40:08.1000000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1000000' AS DateTime2), 266, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (359, CAST(N'2021-01-16T23:40:08.1200000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1200000' AS DateTime2), 267, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (360, CAST(N'2021-01-16T23:40:08.1200000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1200000' AS DateTime2), 267, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (361, CAST(N'2021-01-16T23:41:39.2100000' AS DateTime2), CAST(N'2021-01-16T23:41:39.2100000' AS DateTime2), 268, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (362, CAST(N'2021-01-16T23:41:39.2100000' AS DateTime2), CAST(N'2021-01-16T23:41:39.2100000' AS DateTime2), 268, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (363, CAST(N'2021-01-16T23:43:07.6800000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6800000' AS DateTime2), 269, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (364, CAST(N'2021-01-16T23:43:07.6800000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6800000' AS DateTime2), 269, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (365, CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), 270, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (366, CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), 270, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (367, CAST(N'2021-01-16T23:47:35.2400000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2400000' AS DateTime2), 271, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (368, CAST(N'2021-01-16T23:47:35.2400000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2400000' AS DateTime2), 271, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (369, CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), 272, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (370, CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), 272, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (371, CAST(N'2021-01-16T23:48:25.2500000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2500000' AS DateTime2), 273, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (372, CAST(N'2021-01-16T23:48:25.2500000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2500000' AS DateTime2), 273, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (373, CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), 274, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (374, CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), 274, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (375, CAST(N'2021-01-16T23:50:31.3300000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3300000' AS DateTime2), 275, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (376, CAST(N'2021-01-16T23:50:31.3300000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3300000' AS DateTime2), 275, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (377, CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), 276, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (378, CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), 276, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (379, CAST(N'2021-01-17T00:12:36.6200000' AS DateTime2), CAST(N'2021-01-17T00:12:36.6200000' AS DateTime2), 277, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (380, CAST(N'2021-01-17T00:12:36.6300000' AS DateTime2), CAST(N'2021-01-17T00:12:36.6300000' AS DateTime2), 278, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (381, CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), 279, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (382, CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), 280, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (383, CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), 281, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (384, CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), 282, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (385, CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), 283, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (386, CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), 284, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (387, CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), 285, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (388, CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), 286, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (389, CAST(N'2021-01-17T00:13:34.0200000' AS DateTime2), CAST(N'2021-01-17T00:13:34.0200000' AS DateTime2), 287, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (390, CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), 288, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (391, CAST(N'2021-01-17T00:13:36.6600000' AS DateTime2), CAST(N'2021-01-17T00:13:36.6600000' AS DateTime2), 289, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (392, CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), 290, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (393, CAST(N'2021-01-17T00:13:44.8700000' AS DateTime2), CAST(N'2021-01-17T00:13:44.8700000' AS DateTime2), 291, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (394, CAST(N'2021-01-17T00:13:44.8800000' AS DateTime2), CAST(N'2021-01-17T00:13:44.8800000' AS DateTime2), 292, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (395, CAST(N'2021-01-17T00:14:36.7700000' AS DateTime2), CAST(N'2021-01-17T00:14:36.7700000' AS DateTime2), 293, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (396, CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), 294, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (397, CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), 295, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (398, CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), 296, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (399, CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), 297, 1)
GO
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (400, CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), 298, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (401, CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), 299, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (402, CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), 300, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (403, CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), 301, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (404, CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), 302, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (405, CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), 303, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (406, CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), 304, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (407, CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), 305, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (408, CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), 306, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (409, CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), 307, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (410, CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), 308, 1)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (411, CAST(N'2021-01-17T00:26:56.1300000' AS DateTime2), CAST(N'2021-01-17T00:26:56.1300000' AS DateTime2), 309, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (412, CAST(N'2021-01-17T00:26:56.1300000' AS DateTime2), CAST(N'2021-01-17T00:26:56.1300000' AS DateTime2), 309, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (413, CAST(N'2021-01-17T00:28:51.9100000' AS DateTime2), CAST(N'2021-01-17T00:28:51.9100000' AS DateTime2), 310, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (414, CAST(N'2021-01-17T00:28:51.9100000' AS DateTime2), CAST(N'2021-01-17T00:28:51.9100000' AS DateTime2), 310, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (415, CAST(N'2021-01-17T00:29:06.9100000' AS DateTime2), CAST(N'2021-01-17T00:29:06.9100000' AS DateTime2), 311, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (416, CAST(N'2021-01-17T00:29:06.9100000' AS DateTime2), CAST(N'2021-01-17T00:29:06.9100000' AS DateTime2), 311, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (417, CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), 312, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (418, CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), 312, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (419, CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), 313, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (420, CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), 313, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (421, CAST(N'2021-01-17T00:33:36.8900000' AS DateTime2), CAST(N'2021-01-17T00:33:36.8900000' AS DateTime2), 314, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (422, CAST(N'2021-01-17T00:33:36.8900000' AS DateTime2), CAST(N'2021-01-17T00:33:36.8900000' AS DateTime2), 314, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (423, CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), 315, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (424, CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), CAST(N'2021-01-17T00:33:47.3900000' AS DateTime2), 315, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (425, CAST(N'2021-01-17T00:33:56.8800000' AS DateTime2), CAST(N'2021-01-17T00:33:56.8800000' AS DateTime2), 316, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (426, CAST(N'2021-01-17T00:33:56.8800000' AS DateTime2), CAST(N'2021-01-17T00:33:56.8800000' AS DateTime2), 316, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (427, CAST(N'2021-01-17T00:42:29.1600000' AS DateTime2), CAST(N'2021-01-17T00:42:29.1600000' AS DateTime2), 317, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (428, CAST(N'2021-01-17T00:42:29.1600000' AS DateTime2), CAST(N'2021-01-17T00:42:29.1600000' AS DateTime2), 317, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (429, CAST(N'2021-01-17T00:48:08.8600000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8600000' AS DateTime2), 318, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (430, CAST(N'2021-01-17T00:48:08.8600000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8600000' AS DateTime2), 318, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (431, CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), 319, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (432, CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), 319, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (433, CAST(N'2021-01-17T00:48:47.4600000' AS DateTime2), CAST(N'2021-01-17T00:48:47.4600000' AS DateTime2), 320, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (434, CAST(N'2021-01-17T00:48:47.4600000' AS DateTime2), CAST(N'2021-01-17T00:48:47.4600000' AS DateTime2), 320, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (435, CAST(N'2021-01-17T00:50:20.1400000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1400000' AS DateTime2), 321, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (436, CAST(N'2021-01-17T00:50:20.1400000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1400000' AS DateTime2), 321, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (437, CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), 322, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (438, CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), 322, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (439, CAST(N'2021-01-17T00:53:05.2600000' AS DateTime2), CAST(N'2021-01-17T00:53:05.2600000' AS DateTime2), 323, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (440, CAST(N'2021-01-17T00:53:05.2600000' AS DateTime2), CAST(N'2021-01-17T00:53:05.2600000' AS DateTime2), 323, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (441, CAST(N'2021-01-17T00:56:20.6600000' AS DateTime2), CAST(N'2021-01-17T00:56:20.6600000' AS DateTime2), 324, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (442, CAST(N'2021-01-17T00:56:20.6600000' AS DateTime2), CAST(N'2021-01-17T00:56:20.6600000' AS DateTime2), 324, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (443, CAST(N'2021-01-17T01:00:27.4200000' AS DateTime2), CAST(N'2021-01-17T01:00:27.4200000' AS DateTime2), 325, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (444, CAST(N'2021-01-17T01:00:27.4200000' AS DateTime2), CAST(N'2021-01-17T01:00:27.4200000' AS DateTime2), 325, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (445, CAST(N'2021-01-17T01:05:21.8500000' AS DateTime2), CAST(N'2021-01-17T01:05:21.8500000' AS DateTime2), 326, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (446, CAST(N'2021-01-17T01:05:21.8500000' AS DateTime2), CAST(N'2021-01-17T01:05:21.8500000' AS DateTime2), 326, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (447, CAST(N'2021-01-17T01:10:25.6800000' AS DateTime2), CAST(N'2021-01-17T01:10:25.6800000' AS DateTime2), 327, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (448, CAST(N'2021-01-17T01:10:25.6800000' AS DateTime2), CAST(N'2021-01-17T01:10:25.6800000' AS DateTime2), 327, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (449, CAST(N'2021-01-17T01:12:20.5400000' AS DateTime2), CAST(N'2021-01-17T01:12:20.5400000' AS DateTime2), 328, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (450, CAST(N'2021-01-17T01:12:20.5400000' AS DateTime2), CAST(N'2021-01-17T01:12:20.5400000' AS DateTime2), 328, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (451, CAST(N'2021-01-17T01:30:08.0900000' AS DateTime2), CAST(N'2021-01-17T01:30:08.0900000' AS DateTime2), 329, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (452, CAST(N'2021-01-17T01:30:08.0900000' AS DateTime2), CAST(N'2021-01-17T01:30:08.0900000' AS DateTime2), 329, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (453, CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), 330, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (454, CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), 330, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (455, CAST(N'2021-01-17T01:33:32.6900000' AS DateTime2), CAST(N'2021-01-17T01:33:32.6900000' AS DateTime2), 331, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (456, CAST(N'2021-01-17T01:33:32.6900000' AS DateTime2), CAST(N'2021-01-17T01:33:32.6900000' AS DateTime2), 331, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (457, CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), 332, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (458, CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), 332, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (459, CAST(N'2021-01-17T01:35:27.6700000' AS DateTime2), CAST(N'2021-01-17T01:35:27.6700000' AS DateTime2), 333, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (460, CAST(N'2021-01-17T01:35:27.6700000' AS DateTime2), CAST(N'2021-01-17T01:35:27.6700000' AS DateTime2), 333, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (461, CAST(N'2021-01-17T01:39:52.3800000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3800000' AS DateTime2), 334, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (462, CAST(N'2021-01-17T01:39:52.3800000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3800000' AS DateTime2), 334, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (463, CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), 335, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (464, CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), 335, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (465, CAST(N'2021-01-17T01:42:59.4600000' AS DateTime2), CAST(N'2021-01-17T01:42:59.4600000' AS DateTime2), 336, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (466, CAST(N'2021-01-17T01:42:59.4600000' AS DateTime2), CAST(N'2021-01-17T01:42:59.4600000' AS DateTime2), 336, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (467, CAST(N'2021-01-17T01:44:15.3100000' AS DateTime2), CAST(N'2021-01-17T01:44:15.3100000' AS DateTime2), 337, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (468, CAST(N'2021-01-17T01:44:15.3100000' AS DateTime2), CAST(N'2021-01-17T01:44:15.3100000' AS DateTime2), 337, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (469, CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), 338, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (470, CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), 338, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (471, CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), 339, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (472, CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9500000' AS DateTime2), 339, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (473, CAST(N'2021-01-17T01:45:51.2700000' AS DateTime2), CAST(N'2021-01-17T01:45:51.2700000' AS DateTime2), 340, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (474, CAST(N'2021-01-17T01:45:51.2700000' AS DateTime2), CAST(N'2021-01-17T01:45:51.2700000' AS DateTime2), 340, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (475, CAST(N'2021-01-17T01:47:08.6400000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6400000' AS DateTime2), 341, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (476, CAST(N'2021-01-17T01:47:08.6400000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6400000' AS DateTime2), 341, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (477, CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), 342, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (478, CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), 342, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (479, CAST(N'2021-01-17T01:53:45.4800000' AS DateTime2), CAST(N'2021-01-17T01:53:45.4800000' AS DateTime2), 343, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (480, CAST(N'2021-01-17T01:53:45.4800000' AS DateTime2), CAST(N'2021-01-17T01:53:45.4800000' AS DateTime2), 343, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (481, CAST(N'2021-01-17T01:54:56.1500000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1500000' AS DateTime2), 344, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (482, CAST(N'2021-01-17T01:54:56.1500000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1500000' AS DateTime2), 344, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (483, CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), 345, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (484, CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), 345, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (485, CAST(N'2021-01-17T01:56:01.0900000' AS DateTime2), CAST(N'2021-01-17T01:56:01.0900000' AS DateTime2), 346, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (486, CAST(N'2021-01-17T01:56:01.0900000' AS DateTime2), CAST(N'2021-01-17T01:56:01.0900000' AS DateTime2), 346, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (487, CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), 347, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (488, CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), 347, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (489, CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), 348, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (490, CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), 348, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (491, CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), 349, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (492, CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), 349, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (493, CAST(N'2021-01-17T02:06:30.6000000' AS DateTime2), CAST(N'2021-01-17T02:06:30.6000000' AS DateTime2), 350, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (494, CAST(N'2021-01-17T02:06:30.6000000' AS DateTime2), CAST(N'2021-01-17T02:06:30.6000000' AS DateTime2), 350, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (495, CAST(N'2021-01-17T02:12:25.2000000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2000000' AS DateTime2), 351, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (496, CAST(N'2021-01-17T02:12:25.2000000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2000000' AS DateTime2), 351, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (497, CAST(N'2021-01-17T02:12:25.2200000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2200000' AS DateTime2), 352, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (498, CAST(N'2021-01-17T02:12:25.2200000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2200000' AS DateTime2), 352, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (499, CAST(N'2021-01-17T02:13:19.3400000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3400000' AS DateTime2), 353, 7)
GO
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (500, CAST(N'2021-01-17T02:13:19.3400000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3400000' AS DateTime2), 353, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (501, CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), 354, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (502, CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), 354, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (503, CAST(N'2021-01-17T02:20:24.0700000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0700000' AS DateTime2), 355, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (504, CAST(N'2021-01-17T02:20:24.0700000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0700000' AS DateTime2), 355, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (505, CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), 356, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (506, CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), 356, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (507, CAST(N'2021-01-17T02:26:33.6900000' AS DateTime2), CAST(N'2021-01-17T02:26:33.6900000' AS DateTime2), 357, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (508, CAST(N'2021-01-17T02:26:33.6900000' AS DateTime2), CAST(N'2021-01-17T02:26:33.6900000' AS DateTime2), 357, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (509, CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), 358, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (510, CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), 358, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (511, CAST(N'2021-01-17T02:31:36.7500000' AS DateTime2), CAST(N'2021-01-17T02:31:36.7500000' AS DateTime2), 359, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (512, CAST(N'2021-01-17T02:31:36.7500000' AS DateTime2), CAST(N'2021-01-17T02:31:36.7500000' AS DateTime2), 359, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (513, CAST(N'2021-01-23T23:30:04.4100000' AS DateTime2), CAST(N'2021-01-23T23:30:04.4100000' AS DateTime2), 360, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (514, CAST(N'2021-01-23T23:30:04.4100000' AS DateTime2), CAST(N'2021-01-23T23:30:04.4100000' AS DateTime2), 360, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (515, CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), 361, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (516, CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), 361, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (517, CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), 362, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (518, CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), 362, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (519, CAST(N'2021-01-23T23:38:26.7900000' AS DateTime2), CAST(N'2021-01-23T23:38:26.7900000' AS DateTime2), 363, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (520, CAST(N'2021-01-23T23:38:26.7900000' AS DateTime2), CAST(N'2021-01-23T23:38:26.7900000' AS DateTime2), 363, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (521, CAST(N'2021-01-23T23:39:08.6900000' AS DateTime2), CAST(N'2021-01-23T23:39:08.6900000' AS DateTime2), 364, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (522, CAST(N'2021-01-23T23:39:08.6900000' AS DateTime2), CAST(N'2021-01-23T23:39:08.6900000' AS DateTime2), 364, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (523, CAST(N'2021-01-23T23:41:30.5000000' AS DateTime2), CAST(N'2021-01-23T23:41:30.5000000' AS DateTime2), 365, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (524, CAST(N'2021-01-23T23:41:30.5000000' AS DateTime2), CAST(N'2021-01-23T23:41:30.5000000' AS DateTime2), 365, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (525, CAST(N'2021-01-23T23:41:44.7900000' AS DateTime2), CAST(N'2021-01-23T23:41:44.7900000' AS DateTime2), 366, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (526, CAST(N'2021-01-23T23:41:44.7900000' AS DateTime2), CAST(N'2021-01-23T23:41:44.7900000' AS DateTime2), 366, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (527, CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), 367, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (528, CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), CAST(N'2021-01-23T23:41:53.8100000' AS DateTime2), 367, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (529, CAST(N'2021-01-23T23:45:57.2800000' AS DateTime2), CAST(N'2021-01-23T23:45:57.2800000' AS DateTime2), 368, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (530, CAST(N'2021-01-23T23:45:57.2800000' AS DateTime2), CAST(N'2021-01-23T23:45:57.2800000' AS DateTime2), 368, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (531, CAST(N'2021-01-23T23:50:22.8700000' AS DateTime2), CAST(N'2021-01-23T23:50:22.8700000' AS DateTime2), 369, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (532, CAST(N'2021-01-23T23:50:22.8700000' AS DateTime2), CAST(N'2021-01-23T23:50:22.8700000' AS DateTime2), 369, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (533, CAST(N'2021-01-23T23:52:36.5600000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5600000' AS DateTime2), 370, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (534, CAST(N'2021-01-23T23:52:36.5600000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5600000' AS DateTime2), 370, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (535, CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), 371, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (536, CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), 371, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (537, CAST(N'2021-01-23T23:54:32.1600000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1600000' AS DateTime2), 372, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (538, CAST(N'2021-01-23T23:54:32.1600000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1600000' AS DateTime2), 372, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (539, CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), 373, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (540, CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), 373, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (541, CAST(N'2021-01-23T23:59:42.1800000' AS DateTime2), CAST(N'2021-01-23T23:59:42.1800000' AS DateTime2), 374, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (542, CAST(N'2021-01-23T23:59:42.1800000' AS DateTime2), CAST(N'2021-01-23T23:59:42.1800000' AS DateTime2), 374, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (543, CAST(N'2021-01-23T23:59:53.8700000' AS DateTime2), CAST(N'2021-01-23T23:59:53.8700000' AS DateTime2), 375, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (544, CAST(N'2021-01-23T23:59:53.8700000' AS DateTime2), CAST(N'2021-01-23T23:59:53.8700000' AS DateTime2), 375, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (545, CAST(N'2021-01-24T00:05:45.7300000' AS DateTime2), CAST(N'2021-01-24T00:05:45.7300000' AS DateTime2), 376, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (546, CAST(N'2021-01-24T00:05:45.7300000' AS DateTime2), CAST(N'2021-01-24T00:05:45.7300000' AS DateTime2), 376, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (547, CAST(N'2021-01-24T00:05:54.9800000' AS DateTime2), CAST(N'2021-01-24T00:05:54.9800000' AS DateTime2), 377, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (548, CAST(N'2021-01-24T00:05:54.9800000' AS DateTime2), CAST(N'2021-01-24T00:05:54.9800000' AS DateTime2), 377, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (549, CAST(N'2021-01-24T00:06:07.6600000' AS DateTime2), CAST(N'2021-01-24T00:06:07.6600000' AS DateTime2), 378, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (550, CAST(N'2021-01-24T00:06:07.6600000' AS DateTime2), CAST(N'2021-01-24T00:06:07.6600000' AS DateTime2), 378, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (551, CAST(N'2021-01-24T00:10:48.1800000' AS DateTime2), CAST(N'2021-01-24T00:10:48.1800000' AS DateTime2), 379, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (552, CAST(N'2021-01-24T00:10:48.1800000' AS DateTime2), CAST(N'2021-01-24T00:10:48.1800000' AS DateTime2), 379, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (553, CAST(N'2021-01-24T00:10:48.2200000' AS DateTime2), CAST(N'2021-01-24T00:10:48.2200000' AS DateTime2), 380, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (554, CAST(N'2021-01-24T00:10:48.2200000' AS DateTime2), CAST(N'2021-01-24T00:10:48.2200000' AS DateTime2), 380, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (555, CAST(N'2021-01-24T00:11:30.1000000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1000000' AS DateTime2), 381, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (556, CAST(N'2021-01-24T00:11:30.1000000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1000000' AS DateTime2), 381, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (557, CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), 382, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (558, CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), 382, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (559, CAST(N'2021-01-24T00:12:28.0500000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0500000' AS DateTime2), 383, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (560, CAST(N'2021-01-24T00:12:28.0500000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0500000' AS DateTime2), 383, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (561, CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), 384, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (562, CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), 384, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (563, CAST(N'2021-01-24T00:14:37.5800000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5800000' AS DateTime2), 385, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (564, CAST(N'2021-01-24T00:14:37.5800000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5800000' AS DateTime2), 385, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (565, CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), 386, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (566, CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), 386, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (567, CAST(N'2021-01-24T00:16:28.1600000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1600000' AS DateTime2), 387, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (568, CAST(N'2021-01-24T00:16:28.1600000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1600000' AS DateTime2), 387, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (569, CAST(N'2021-01-24T00:16:28.1800000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1800000' AS DateTime2), 388, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (570, CAST(N'2021-01-24T00:16:28.1800000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1800000' AS DateTime2), 388, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (571, CAST(N'2021-01-24T00:17:00.0700000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0700000' AS DateTime2), 389, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (572, CAST(N'2021-01-24T00:17:00.0700000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0700000' AS DateTime2), 389, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (573, CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), 390, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (574, CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), 390, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (575, CAST(N'2021-01-24T00:17:48.1500000' AS DateTime2), CAST(N'2021-01-24T00:17:48.1500000' AS DateTime2), 391, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (576, CAST(N'2021-01-24T00:17:48.1500000' AS DateTime2), CAST(N'2021-01-24T00:17:48.1500000' AS DateTime2), 391, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (577, CAST(N'2021-01-24T00:19:25.5900000' AS DateTime2), CAST(N'2021-01-24T00:19:25.5900000' AS DateTime2), 392, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (578, CAST(N'2021-01-24T00:19:25.5900000' AS DateTime2), CAST(N'2021-01-24T00:19:25.5900000' AS DateTime2), 392, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (579, CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), 393, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (580, CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), 393, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (581, CAST(N'2021-01-24T00:20:25.5300000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5300000' AS DateTime2), 394, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (582, CAST(N'2021-01-24T00:20:25.5300000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5300000' AS DateTime2), 394, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (583, CAST(N'2021-01-24T00:20:25.5500000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5500000' AS DateTime2), 395, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (584, CAST(N'2021-01-24T00:20:25.5500000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5500000' AS DateTime2), 395, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (585, CAST(N'2021-01-24T00:21:09.4600000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4600000' AS DateTime2), 396, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (586, CAST(N'2021-01-24T00:21:09.4600000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4600000' AS DateTime2), 396, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (587, CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), 397, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (588, CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), 397, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (589, CAST(N'2021-01-24T00:21:59.8200000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8200000' AS DateTime2), 398, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (590, CAST(N'2021-01-24T00:21:59.8200000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8200000' AS DateTime2), 398, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (591, CAST(N'2021-01-24T00:21:59.8400000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8400000' AS DateTime2), 399, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (592, CAST(N'2021-01-24T00:21:59.8400000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8400000' AS DateTime2), 399, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (593, CAST(N'2021-01-24T00:23:04.0800000' AS DateTime2), CAST(N'2021-01-24T00:23:04.0800000' AS DateTime2), 400, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (594, CAST(N'2021-01-24T00:23:04.0800000' AS DateTime2), CAST(N'2021-01-24T00:23:04.0800000' AS DateTime2), 400, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (595, CAST(N'2021-01-24T00:23:53.8000000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8000000' AS DateTime2), 401, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (596, CAST(N'2021-01-24T00:23:53.8000000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8000000' AS DateTime2), 401, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (597, CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), 402, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (598, CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), 402, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (599, CAST(N'2021-01-24T00:24:30.6300000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6300000' AS DateTime2), 403, 7)
GO
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (600, CAST(N'2021-01-24T00:24:30.6300000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6300000' AS DateTime2), 403, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (601, CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), 404, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (602, CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), 404, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (603, CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), 405, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (604, CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), 405, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (605, CAST(N'2021-01-24T00:26:09.5500000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5500000' AS DateTime2), 406, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (606, CAST(N'2021-01-24T00:26:09.5500000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5500000' AS DateTime2), 406, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (607, CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), 407, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (608, CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), 407, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (609, CAST(N'2021-01-24T00:31:12.3600000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3600000' AS DateTime2), 408, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (610, CAST(N'2021-01-24T00:31:12.3600000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3600000' AS DateTime2), 408, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (611, CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), 409, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (612, CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), 409, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (613, CAST(N'2021-01-24T00:39:47.1100000' AS DateTime2), CAST(N'2021-01-24T00:39:47.1100000' AS DateTime2), 410, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (614, CAST(N'2021-01-24T00:39:47.1100000' AS DateTime2), CAST(N'2021-01-24T00:39:47.1100000' AS DateTime2), 410, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (615, CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), 411, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (616, CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), CAST(N'2021-01-24T00:40:02.4600000' AS DateTime2), 411, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (617, CAST(N'2021-01-24T00:40:16.7900000' AS DateTime2), CAST(N'2021-01-24T00:40:16.7900000' AS DateTime2), 412, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (618, CAST(N'2021-01-24T00:40:16.7900000' AS DateTime2), CAST(N'2021-01-24T00:40:16.7900000' AS DateTime2), 412, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (619, CAST(N'2021-01-24T00:40:36.4600000' AS DateTime2), CAST(N'2021-01-24T00:40:36.4600000' AS DateTime2), 413, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (620, CAST(N'2021-01-24T00:40:36.4600000' AS DateTime2), CAST(N'2021-01-24T00:40:36.4600000' AS DateTime2), 413, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (621, CAST(N'2021-01-24T00:41:05.3600000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3600000' AS DateTime2), 414, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (622, CAST(N'2021-01-24T00:41:05.3600000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3600000' AS DateTime2), 414, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (623, CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), 415, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (624, CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), 415, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (625, CAST(N'2021-01-24T00:41:26.9300000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9300000' AS DateTime2), 416, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (626, CAST(N'2021-01-24T00:41:26.9300000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9300000' AS DateTime2), 416, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (627, CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), 417, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (628, CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), 417, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (629, CAST(N'2021-01-24T00:43:06.7600000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7600000' AS DateTime2), 418, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (630, CAST(N'2021-01-24T00:43:06.7600000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7600000' AS DateTime2), 418, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (631, CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), 419, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (632, CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), 419, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (633, CAST(N'2021-01-24T00:47:33.9700000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9700000' AS DateTime2), 420, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (634, CAST(N'2021-01-24T00:47:33.9700000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9700000' AS DateTime2), 420, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (635, CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), 421, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (636, CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), 421, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (637, CAST(N'2021-01-24T00:48:36.8100000' AS DateTime2), CAST(N'2021-01-24T00:48:36.8100000' AS DateTime2), 422, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (638, CAST(N'2021-01-24T00:48:36.8100000' AS DateTime2), CAST(N'2021-01-24T00:48:36.8100000' AS DateTime2), 422, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (639, CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), 423, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (640, CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), 423, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (641, CAST(N'2021-01-24T00:50:42.6200000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6200000' AS DateTime2), 424, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (642, CAST(N'2021-01-24T00:50:42.6200000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6200000' AS DateTime2), 424, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (643, CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), 425, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (644, CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), 425, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (645, CAST(N'2021-01-24T00:52:57.5800000' AS DateTime2), CAST(N'2021-01-24T00:52:57.5800000' AS DateTime2), 426, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (646, CAST(N'2021-01-24T00:52:57.5800000' AS DateTime2), CAST(N'2021-01-24T00:52:57.5800000' AS DateTime2), 426, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (647, CAST(N'2021-01-24T00:52:57.6200000' AS DateTime2), CAST(N'2021-01-24T00:52:57.6200000' AS DateTime2), 427, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (648, CAST(N'2021-01-24T00:52:57.6200000' AS DateTime2), CAST(N'2021-01-24T00:52:57.6200000' AS DateTime2), 427, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (649, CAST(N'2021-01-24T00:54:45.3700000' AS DateTime2), CAST(N'2021-01-24T00:54:45.3700000' AS DateTime2), 428, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (650, CAST(N'2021-01-24T00:54:45.3700000' AS DateTime2), CAST(N'2021-01-24T00:54:45.3700000' AS DateTime2), 428, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (651, CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), 429, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (652, CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), 429, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (653, CAST(N'2021-01-24T00:55:23.2300000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2300000' AS DateTime2), 430, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (654, CAST(N'2021-01-24T00:55:23.2300000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2300000' AS DateTime2), 430, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (655, CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), 431, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (656, CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), 431, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (657, CAST(N'2021-01-24T00:56:42.4100000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4100000' AS DateTime2), 432, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (658, CAST(N'2021-01-24T00:56:42.4100000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4100000' AS DateTime2), 432, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (659, CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), 433, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (660, CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), 433, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (661, CAST(N'2021-01-24T00:57:29.9700000' AS DateTime2), CAST(N'2021-01-24T00:57:29.9700000' AS DateTime2), 434, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (662, CAST(N'2021-01-24T00:57:29.9700000' AS DateTime2), CAST(N'2021-01-24T00:57:29.9700000' AS DateTime2), 434, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (663, CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), 435, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (664, CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), 435, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (665, CAST(N'2021-01-24T00:58:48.3600000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3600000' AS DateTime2), 436, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (666, CAST(N'2021-01-24T00:58:48.3600000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3600000' AS DateTime2), 436, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (667, CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), 437, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (668, CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), 437, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (669, CAST(N'2021-01-24T00:59:18.3600000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3600000' AS DateTime2), 438, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (670, CAST(N'2021-01-24T00:59:18.3600000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3600000' AS DateTime2), 438, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (671, CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), 439, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (672, CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), 439, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (673, CAST(N'2021-01-24T00:59:50.0400000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0400000' AS DateTime2), 440, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (674, CAST(N'2021-01-24T00:59:50.0400000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0400000' AS DateTime2), 440, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (675, CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), 441, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (676, CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), 441, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (677, CAST(N'2021-01-24T01:00:24.8600000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8600000' AS DateTime2), 442, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (678, CAST(N'2021-01-24T01:00:24.8600000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8600000' AS DateTime2), 442, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (679, CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), 443, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (680, CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), 443, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (681, CAST(N'2021-01-24T01:01:30.6500000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6500000' AS DateTime2), 444, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (682, CAST(N'2021-01-24T01:01:30.6500000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6500000' AS DateTime2), 444, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (683, CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), 445, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (684, CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), 445, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (685, CAST(N'2021-01-24T01:02:14.1400000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1400000' AS DateTime2), 446, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (686, CAST(N'2021-01-24T01:02:14.1400000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1400000' AS DateTime2), 446, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (687, CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), 447, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (688, CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), 447, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (689, CAST(N'2021-01-24T01:19:32.2200000' AS DateTime2), CAST(N'2021-01-24T01:19:32.2200000' AS DateTime2), 448, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (690, CAST(N'2021-01-24T01:19:32.2200000' AS DateTime2), CAST(N'2021-01-24T01:19:32.2200000' AS DateTime2), 448, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (691, CAST(N'2021-01-24T01:35:51.6300000' AS DateTime2), CAST(N'2021-01-24T01:35:51.6300000' AS DateTime2), 449, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (692, CAST(N'2021-01-24T01:35:51.6300000' AS DateTime2), CAST(N'2021-01-24T01:35:51.6300000' AS DateTime2), 449, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (693, CAST(N'2021-01-24T01:40:36.9800000' AS DateTime2), CAST(N'2021-01-24T01:40:36.9800000' AS DateTime2), 450, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (694, CAST(N'2021-01-24T01:40:36.9800000' AS DateTime2), CAST(N'2021-01-24T01:40:36.9800000' AS DateTime2), 450, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (695, CAST(N'2021-01-24T01:42:28.4400000' AS DateTime2), CAST(N'2021-01-24T01:42:28.4400000' AS DateTime2), 451, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (696, CAST(N'2021-01-24T01:42:28.4400000' AS DateTime2), CAST(N'2021-01-24T01:42:28.4400000' AS DateTime2), 451, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (697, CAST(N'2021-01-24T01:43:19.1700000' AS DateTime2), CAST(N'2021-01-24T01:43:19.1700000' AS DateTime2), 452, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (698, CAST(N'2021-01-24T01:43:19.1700000' AS DateTime2), CAST(N'2021-01-24T01:43:19.1700000' AS DateTime2), 452, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (699, CAST(N'2021-01-24T01:43:49.1200000' AS DateTime2), CAST(N'2021-01-24T01:43:49.1200000' AS DateTime2), 453, 7)
GO
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (700, CAST(N'2021-01-24T01:43:49.1200000' AS DateTime2), CAST(N'2021-01-24T01:43:49.1200000' AS DateTime2), 453, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (701, CAST(N'2021-01-24T01:44:04.4600000' AS DateTime2), CAST(N'2021-01-24T01:44:04.4600000' AS DateTime2), 454, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (702, CAST(N'2021-01-24T01:44:04.4600000' AS DateTime2), CAST(N'2021-01-24T01:44:04.4600000' AS DateTime2), 454, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (703, CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), 455, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (704, CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), CAST(N'2021-01-24T01:44:11.8100000' AS DateTime2), 455, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (705, CAST(N'2021-01-24T02:10:45.7100000' AS DateTime2), CAST(N'2021-01-24T02:10:45.7100000' AS DateTime2), 456, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (706, CAST(N'2021-01-24T02:10:45.7100000' AS DateTime2), CAST(N'2021-01-24T02:10:45.7100000' AS DateTime2), 456, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (707, CAST(N'2021-01-24T02:20:54.7600000' AS DateTime2), CAST(N'2021-01-24T02:20:54.7600000' AS DateTime2), 457, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (708, CAST(N'2021-01-24T02:20:54.7600000' AS DateTime2), CAST(N'2021-01-24T02:20:54.7600000' AS DateTime2), 457, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1513, CAST(N'2021-01-30T23:31:15.1700000' AS DateTime2), CAST(N'2021-01-30T23:31:15.1700000' AS DateTime2), 1360, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1514, CAST(N'2021-01-30T23:31:15.1700000' AS DateTime2), CAST(N'2021-01-30T23:31:15.1700000' AS DateTime2), 1360, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1515, CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), 1361, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1516, CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), 1361, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1517, CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), 1362, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1518, CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), 1362, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1519, CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), 1363, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1520, CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), 1363, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1521, CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), 1364, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1522, CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), 1364, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1523, CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), 1365, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1524, CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), 1365, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1525, CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), 1366, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1526, CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), 1366, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1527, CAST(N'2021-01-31T01:32:19.3800000' AS DateTime2), CAST(N'2021-01-31T01:32:19.3800000' AS DateTime2), 1367, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1528, CAST(N'2021-01-31T01:32:19.3800000' AS DateTime2), CAST(N'2021-01-31T01:32:19.3800000' AS DateTime2), 1367, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1529, CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), 1368, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1530, CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), 1368, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1531, CAST(N'2021-01-31T01:42:46.3900000' AS DateTime2), CAST(N'2021-01-31T01:42:46.3900000' AS DateTime2), 1369, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (1532, CAST(N'2021-01-31T01:42:46.3900000' AS DateTime2), CAST(N'2021-01-31T01:42:46.3900000' AS DateTime2), 1369, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2513, CAST(N'2021-02-07T00:20:52.0200000' AS DateTime2), CAST(N'2021-02-07T00:20:52.0200000' AS DateTime2), 2360, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2514, CAST(N'2021-02-07T00:20:52.0200000' AS DateTime2), CAST(N'2021-02-07T00:20:52.0200000' AS DateTime2), 2360, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2515, CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), 2361, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2516, CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), 2361, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2517, CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), 2362, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2518, CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), 2362, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2519, CAST(N'2021-02-07T00:24:45.5600000' AS DateTime2), CAST(N'2021-02-07T00:24:45.5600000' AS DateTime2), 2363, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2520, CAST(N'2021-02-07T00:24:45.5600000' AS DateTime2), CAST(N'2021-02-07T00:24:45.5600000' AS DateTime2), 2363, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2521, CAST(N'2021-02-07T00:34:31.3000000' AS DateTime2), CAST(N'2021-02-07T00:34:31.3000000' AS DateTime2), 2364, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2522, CAST(N'2021-02-07T00:34:31.3000000' AS DateTime2), CAST(N'2021-02-07T00:34:31.3000000' AS DateTime2), 2364, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2523, CAST(N'2021-02-07T00:34:36.0100000' AS DateTime2), CAST(N'2021-02-07T00:34:36.0100000' AS DateTime2), 2365, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2524, CAST(N'2021-02-07T00:34:36.0100000' AS DateTime2), CAST(N'2021-02-07T00:34:36.0100000' AS DateTime2), 2365, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2525, CAST(N'2021-02-07T00:35:19.5600000' AS DateTime2), CAST(N'2021-02-07T00:35:19.5600000' AS DateTime2), 2366, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2526, CAST(N'2021-02-07T00:35:19.5600000' AS DateTime2), CAST(N'2021-02-07T00:35:19.5600000' AS DateTime2), 2366, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2527, CAST(N'2021-02-07T00:44:30.7100000' AS DateTime2), CAST(N'2021-02-07T00:44:30.7100000' AS DateTime2), 2367, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2528, CAST(N'2021-02-07T00:44:30.7100000' AS DateTime2), CAST(N'2021-02-07T00:44:30.7100000' AS DateTime2), 2367, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2529, CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), 2368, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2530, CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), 2368, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2531, CAST(N'2021-02-07T00:44:50.1300000' AS DateTime2), CAST(N'2021-02-07T00:44:50.1300000' AS DateTime2), 2369, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2532, CAST(N'2021-02-07T00:44:50.1300000' AS DateTime2), CAST(N'2021-02-07T00:44:50.1300000' AS DateTime2), 2369, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2533, CAST(N'2021-02-07T00:44:51.9000000' AS DateTime2), CAST(N'2021-02-07T00:44:51.9000000' AS DateTime2), 2370, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2534, CAST(N'2021-02-07T00:44:51.9000000' AS DateTime2), CAST(N'2021-02-07T00:44:51.9000000' AS DateTime2), 2370, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2535, CAST(N'2021-02-07T00:47:24.9000000' AS DateTime2), CAST(N'2021-02-07T00:47:24.9000000' AS DateTime2), 2371, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2536, CAST(N'2021-02-07T00:47:24.9000000' AS DateTime2), CAST(N'2021-02-07T00:47:24.9000000' AS DateTime2), 2371, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2537, CAST(N'2021-02-07T00:53:08.9400000' AS DateTime2), CAST(N'2021-02-07T00:53:08.9400000' AS DateTime2), 2372, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2538, CAST(N'2021-02-07T00:53:08.9400000' AS DateTime2), CAST(N'2021-02-07T00:53:08.9400000' AS DateTime2), 2372, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2539, CAST(N'2021-02-07T00:58:29.7000000' AS DateTime2), CAST(N'2021-02-07T00:58:29.7000000' AS DateTime2), 2373, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2540, CAST(N'2021-02-07T00:58:29.7000000' AS DateTime2), CAST(N'2021-02-07T00:58:29.7000000' AS DateTime2), 2373, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2541, CAST(N'2021-02-07T01:08:40.2500000' AS DateTime2), CAST(N'2021-02-07T01:08:40.2500000' AS DateTime2), 2374, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2542, CAST(N'2021-02-07T01:08:40.2500000' AS DateTime2), CAST(N'2021-02-07T01:08:40.2500000' AS DateTime2), 2374, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2543, CAST(N'2021-02-07T01:10:15.8700000' AS DateTime2), CAST(N'2021-02-07T01:10:15.8700000' AS DateTime2), 2375, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2544, CAST(N'2021-02-07T01:10:15.8700000' AS DateTime2), CAST(N'2021-02-07T01:10:15.8700000' AS DateTime2), 2375, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2545, CAST(N'2021-02-07T01:11:03.2900000' AS DateTime2), CAST(N'2021-02-07T01:11:03.2900000' AS DateTime2), 2376, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2546, CAST(N'2021-02-07T01:11:03.2900000' AS DateTime2), CAST(N'2021-02-07T01:11:03.2900000' AS DateTime2), 2376, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2547, CAST(N'2021-02-07T01:23:03.7900000' AS DateTime2), CAST(N'2021-02-07T01:23:03.7900000' AS DateTime2), 2377, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2548, CAST(N'2021-02-07T01:23:03.7900000' AS DateTime2), CAST(N'2021-02-07T01:23:03.7900000' AS DateTime2), 2377, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2549, CAST(N'2021-02-07T01:34:28.0400000' AS DateTime2), CAST(N'2021-02-07T01:34:28.0400000' AS DateTime2), 2378, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2550, CAST(N'2021-02-07T01:34:28.0400000' AS DateTime2), CAST(N'2021-02-07T01:34:28.0400000' AS DateTime2), 2378, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2551, CAST(N'2021-02-07T01:37:49.9700000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9700000' AS DateTime2), 2379, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2552, CAST(N'2021-02-07T01:37:49.9700000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9700000' AS DateTime2), 2379, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2553, CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), 2380, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2554, CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), 2380, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2555, CAST(N'2021-02-07T01:39:15.4500000' AS DateTime2), CAST(N'2021-02-07T01:39:15.4500000' AS DateTime2), 2381, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2556, CAST(N'2021-02-07T01:39:15.4500000' AS DateTime2), CAST(N'2021-02-07T01:39:15.4500000' AS DateTime2), 2381, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2557, CAST(N'2021-02-07T01:44:59.2600000' AS DateTime2), CAST(N'2021-02-07T01:44:59.2600000' AS DateTime2), 2382, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2558, CAST(N'2021-02-07T01:44:59.2600000' AS DateTime2), CAST(N'2021-02-07T01:44:59.2600000' AS DateTime2), 2382, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2559, CAST(N'2021-02-07T01:50:33.4500000' AS DateTime2), CAST(N'2021-02-07T01:50:33.4500000' AS DateTime2), 2383, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2560, CAST(N'2021-02-07T01:50:33.4500000' AS DateTime2), CAST(N'2021-02-07T01:50:33.4500000' AS DateTime2), 2383, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2561, CAST(N'2021-02-07T01:55:14.2300000' AS DateTime2), CAST(N'2021-02-07T01:55:14.2300000' AS DateTime2), 2384, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2562, CAST(N'2021-02-07T01:55:14.2300000' AS DateTime2), CAST(N'2021-02-07T01:55:14.2300000' AS DateTime2), 2384, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2563, CAST(N'2021-02-07T02:08:00.2700000' AS DateTime2), CAST(N'2021-02-07T02:08:00.2700000' AS DateTime2), 2385, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2564, CAST(N'2021-02-07T02:08:00.2700000' AS DateTime2), CAST(N'2021-02-07T02:08:00.2700000' AS DateTime2), 2385, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2565, CAST(N'2021-02-07T02:09:10.3200000' AS DateTime2), CAST(N'2021-02-07T02:09:10.3200000' AS DateTime2), 2386, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2566, CAST(N'2021-02-07T02:09:10.3200000' AS DateTime2), CAST(N'2021-02-07T02:09:10.3200000' AS DateTime2), 2386, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2567, CAST(N'2021-02-07T02:13:21.3500000' AS DateTime2), CAST(N'2021-02-07T02:13:21.3500000' AS DateTime2), 2387, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2568, CAST(N'2021-02-07T02:13:21.3500000' AS DateTime2), CAST(N'2021-02-07T02:13:21.3500000' AS DateTime2), 2387, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2569, CAST(N'2021-02-07T02:17:23.9900000' AS DateTime2), CAST(N'2021-02-07T02:17:23.9900000' AS DateTime2), 2388, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2570, CAST(N'2021-02-07T02:17:23.9900000' AS DateTime2), CAST(N'2021-02-07T02:17:23.9900000' AS DateTime2), 2388, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2571, CAST(N'2021-02-07T02:25:00.5600000' AS DateTime2), CAST(N'2021-02-07T02:25:00.5600000' AS DateTime2), 2389, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2572, CAST(N'2021-02-07T02:25:00.5600000' AS DateTime2), CAST(N'2021-02-07T02:25:00.5600000' AS DateTime2), 2389, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2573, CAST(N'2021-02-07T02:26:35.7000000' AS DateTime2), CAST(N'2021-02-07T02:26:35.7000000' AS DateTime2), 2390, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2574, CAST(N'2021-02-07T02:26:35.7000000' AS DateTime2), CAST(N'2021-02-07T02:26:35.7000000' AS DateTime2), 2390, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2575, CAST(N'2021-02-13T23:24:31.4600000' AS DateTime2), CAST(N'2021-02-13T23:24:31.4600000' AS DateTime2), 2391, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2576, CAST(N'2021-02-13T23:24:31.4600000' AS DateTime2), CAST(N'2021-02-13T23:24:31.4600000' AS DateTime2), 2391, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2577, CAST(N'2021-02-13T23:25:02.3600000' AS DateTime2), CAST(N'2021-02-13T23:25:02.3600000' AS DateTime2), 2392, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2578, CAST(N'2021-02-13T23:25:02.3600000' AS DateTime2), CAST(N'2021-02-13T23:25:02.3600000' AS DateTime2), 2392, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2579, CAST(N'2021-02-13T23:38:59.3300000' AS DateTime2), CAST(N'2021-02-13T23:38:59.3300000' AS DateTime2), 2393, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2580, CAST(N'2021-02-13T23:38:59.3300000' AS DateTime2), CAST(N'2021-02-13T23:38:59.3300000' AS DateTime2), 2393, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2581, CAST(N'2021-02-14T00:02:15.2800000' AS DateTime2), CAST(N'2021-02-14T00:02:15.2800000' AS DateTime2), 2394, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2582, CAST(N'2021-02-14T00:02:15.2800000' AS DateTime2), CAST(N'2021-02-14T00:02:15.2800000' AS DateTime2), 2394, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2583, CAST(N'2021-02-14T00:02:59.3300000' AS DateTime2), CAST(N'2021-02-14T00:02:59.3300000' AS DateTime2), 2395, 7)
GO
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2584, CAST(N'2021-02-14T00:02:59.3300000' AS DateTime2), CAST(N'2021-02-14T00:02:59.3300000' AS DateTime2), 2395, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2585, CAST(N'2021-02-14T00:20:43.2800000' AS DateTime2), CAST(N'2021-02-14T00:20:43.2800000' AS DateTime2), 2396, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2586, CAST(N'2021-02-14T00:20:43.2800000' AS DateTime2), CAST(N'2021-02-14T00:20:43.2800000' AS DateTime2), 2396, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2587, CAST(N'2021-02-14T00:22:09.2500000' AS DateTime2), CAST(N'2021-02-14T00:22:09.2500000' AS DateTime2), 2397, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2588, CAST(N'2021-02-14T00:22:09.2500000' AS DateTime2), CAST(N'2021-02-14T00:22:09.2500000' AS DateTime2), 2397, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2589, CAST(N'2021-02-14T00:31:00.1000000' AS DateTime2), CAST(N'2021-02-14T00:31:00.1000000' AS DateTime2), 2398, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2590, CAST(N'2021-02-14T00:31:00.1000000' AS DateTime2), CAST(N'2021-02-14T00:31:00.1000000' AS DateTime2), 2398, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2591, CAST(N'2021-02-14T00:32:52.4800000' AS DateTime2), CAST(N'2021-02-14T00:32:52.4800000' AS DateTime2), 2399, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2592, CAST(N'2021-02-14T00:32:52.4800000' AS DateTime2), CAST(N'2021-02-14T00:32:52.4800000' AS DateTime2), 2399, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2593, CAST(N'2021-02-14T00:45:17.7600000' AS DateTime2), CAST(N'2021-02-14T00:45:17.7600000' AS DateTime2), 2400, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2594, CAST(N'2021-02-14T00:45:17.7600000' AS DateTime2), CAST(N'2021-02-14T00:45:17.7600000' AS DateTime2), 2400, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2595, CAST(N'2021-02-14T00:50:01.6600000' AS DateTime2), CAST(N'2021-02-14T00:50:01.6600000' AS DateTime2), 2401, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2596, CAST(N'2021-02-14T00:50:01.6600000' AS DateTime2), CAST(N'2021-02-14T00:50:01.6600000' AS DateTime2), 2401, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2597, CAST(N'2021-02-14T00:54:25.0800000' AS DateTime2), CAST(N'2021-02-14T00:54:25.0800000' AS DateTime2), 2402, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2598, CAST(N'2021-02-14T00:54:25.0800000' AS DateTime2), CAST(N'2021-02-14T00:54:25.0800000' AS DateTime2), 2402, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2599, CAST(N'2021-02-14T00:55:38.6100000' AS DateTime2), CAST(N'2021-02-14T00:55:38.6100000' AS DateTime2), 2403, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2600, CAST(N'2021-02-14T00:55:38.6100000' AS DateTime2), CAST(N'2021-02-14T00:55:38.6100000' AS DateTime2), 2403, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2601, CAST(N'2021-02-14T00:57:01.7300000' AS DateTime2), CAST(N'2021-02-14T00:57:01.7300000' AS DateTime2), 2404, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2602, CAST(N'2021-02-14T00:57:01.7300000' AS DateTime2), CAST(N'2021-02-14T00:57:01.7300000' AS DateTime2), 2404, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2603, CAST(N'2021-02-14T01:01:39.9600000' AS DateTime2), CAST(N'2021-02-14T01:01:39.9600000' AS DateTime2), 2405, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2604, CAST(N'2021-02-14T01:01:39.9600000' AS DateTime2), CAST(N'2021-02-14T01:01:39.9600000' AS DateTime2), 2405, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2605, CAST(N'2021-02-14T01:01:49.8200000' AS DateTime2), CAST(N'2021-02-14T01:01:49.8200000' AS DateTime2), 2406, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2606, CAST(N'2021-02-14T01:01:49.8200000' AS DateTime2), CAST(N'2021-02-14T01:01:49.8200000' AS DateTime2), 2406, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2607, CAST(N'2021-02-14T01:02:01.8800000' AS DateTime2), CAST(N'2021-02-14T01:02:01.8800000' AS DateTime2), 2407, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2608, CAST(N'2021-02-14T01:02:01.8800000' AS DateTime2), CAST(N'2021-02-14T01:02:01.8800000' AS DateTime2), 2407, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2609, CAST(N'2021-02-14T01:03:46.3300000' AS DateTime2), CAST(N'2021-02-14T01:03:46.3300000' AS DateTime2), 2408, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2610, CAST(N'2021-02-14T01:03:46.3300000' AS DateTime2), CAST(N'2021-02-14T01:03:46.3300000' AS DateTime2), 2408, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2611, CAST(N'2021-02-14T01:10:43.4400000' AS DateTime2), CAST(N'2021-02-14T01:10:43.4400000' AS DateTime2), 2409, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2612, CAST(N'2021-02-14T01:10:43.4400000' AS DateTime2), CAST(N'2021-02-14T01:10:43.4400000' AS DateTime2), 2409, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2613, CAST(N'2021-02-14T01:15:15.6700000' AS DateTime2), CAST(N'2021-02-14T01:15:15.6700000' AS DateTime2), 2410, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2614, CAST(N'2021-02-14T01:15:15.6700000' AS DateTime2), CAST(N'2021-02-14T01:15:15.6700000' AS DateTime2), 2410, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2615, CAST(N'2021-02-14T01:15:25.9400000' AS DateTime2), CAST(N'2021-02-14T01:15:25.9400000' AS DateTime2), 2411, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2616, CAST(N'2021-02-14T01:15:25.9400000' AS DateTime2), CAST(N'2021-02-14T01:15:25.9400000' AS DateTime2), 2411, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2617, CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), 2412, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2618, CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), CAST(N'2021-02-14T01:15:37.6000000' AS DateTime2), 2412, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2619, CAST(N'2021-02-14T01:20:54.7100000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7100000' AS DateTime2), 2413, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2620, CAST(N'2021-02-14T01:20:54.7100000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7100000' AS DateTime2), 2413, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2621, CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), 2414, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2622, CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), 2414, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2623, CAST(N'2021-02-14T01:24:39.7300000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7300000' AS DateTime2), 2415, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2624, CAST(N'2021-02-14T01:24:39.7300000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7300000' AS DateTime2), 2415, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2625, CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), 2416, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2626, CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), 2416, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2627, CAST(N'2021-02-14T01:27:44.4700000' AS DateTime2), CAST(N'2021-02-14T01:27:44.4700000' AS DateTime2), 2417, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2628, CAST(N'2021-02-14T01:27:44.4700000' AS DateTime2), CAST(N'2021-02-14T01:27:44.4700000' AS DateTime2), 2417, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2629, CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), 2418, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2630, CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), 2418, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2631, CAST(N'2021-02-14T01:33:59.8500000' AS DateTime2), CAST(N'2021-02-14T01:33:59.8500000' AS DateTime2), 2419, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2632, CAST(N'2021-02-14T01:33:59.8500000' AS DateTime2), CAST(N'2021-02-14T01:33:59.8500000' AS DateTime2), 2419, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2633, CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), 2420, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2634, CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), 2420, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2635, CAST(N'2021-02-14T01:36:19.2700000' AS DateTime2), CAST(N'2021-02-14T01:36:19.2700000' AS DateTime2), 2421, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2636, CAST(N'2021-02-14T01:36:19.2700000' AS DateTime2), CAST(N'2021-02-14T01:36:19.2700000' AS DateTime2), 2421, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2637, CAST(N'2021-02-14T01:36:28.1700000' AS DateTime2), CAST(N'2021-02-14T01:36:28.1700000' AS DateTime2), 2422, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2638, CAST(N'2021-02-14T01:36:28.1700000' AS DateTime2), CAST(N'2021-02-14T01:36:28.1700000' AS DateTime2), 2422, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2639, CAST(N'2021-02-14T01:40:17.2500000' AS DateTime2), CAST(N'2021-02-14T01:40:17.2500000' AS DateTime2), 2423, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2640, CAST(N'2021-02-14T01:40:17.2500000' AS DateTime2), CAST(N'2021-02-14T01:40:17.2500000' AS DateTime2), 2423, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2641, CAST(N'2021-02-14T01:41:29.2200000' AS DateTime2), CAST(N'2021-02-14T01:41:29.2200000' AS DateTime2), 2424, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2642, CAST(N'2021-02-14T01:41:29.2200000' AS DateTime2), CAST(N'2021-02-14T01:41:29.2200000' AS DateTime2), 2424, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2643, CAST(N'2021-02-14T01:44:57.0300000' AS DateTime2), CAST(N'2021-02-14T01:44:57.0300000' AS DateTime2), 2425, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2644, CAST(N'2021-02-14T01:44:57.0300000' AS DateTime2), CAST(N'2021-02-14T01:44:57.0300000' AS DateTime2), 2425, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2645, CAST(N'2021-02-14T01:46:32.0400000' AS DateTime2), CAST(N'2021-02-14T01:46:32.0400000' AS DateTime2), 2426, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2646, CAST(N'2021-02-14T01:46:32.0400000' AS DateTime2), CAST(N'2021-02-14T01:46:32.0400000' AS DateTime2), 2426, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2647, CAST(N'2021-02-14T01:48:36.0400000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0400000' AS DateTime2), 2427, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2648, CAST(N'2021-02-14T01:48:36.0400000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0400000' AS DateTime2), 2427, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2649, CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), 2428, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2650, CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), 2428, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2651, CAST(N'2021-02-14T01:49:53.8200000' AS DateTime2), CAST(N'2021-02-14T01:49:53.8200000' AS DateTime2), 2429, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2652, CAST(N'2021-02-14T01:49:53.8200000' AS DateTime2), CAST(N'2021-02-14T01:49:53.8200000' AS DateTime2), 2429, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2653, CAST(N'2021-02-14T01:54:03.1400000' AS DateTime2), CAST(N'2021-02-14T01:54:03.1400000' AS DateTime2), 2430, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2654, CAST(N'2021-02-14T01:54:03.1400000' AS DateTime2), CAST(N'2021-02-14T01:54:03.1400000' AS DateTime2), 2430, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2655, CAST(N'2021-02-14T01:58:04.3900000' AS DateTime2), CAST(N'2021-02-14T01:58:04.3900000' AS DateTime2), 2431, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2656, CAST(N'2021-02-14T01:58:04.3900000' AS DateTime2), CAST(N'2021-02-14T01:58:04.3900000' AS DateTime2), 2431, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2657, CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), 2432, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2658, CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), 2432, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2659, CAST(N'2021-02-14T02:01:59.6000000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6000000' AS DateTime2), 2433, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2660, CAST(N'2021-02-14T02:01:59.6000000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6000000' AS DateTime2), 2433, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2661, CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), 2434, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2662, CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), 2434, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2663, CAST(N'2021-02-14T02:03:04.3000000' AS DateTime2), CAST(N'2021-02-14T02:03:04.3000000' AS DateTime2), 2435, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2664, CAST(N'2021-02-14T02:03:04.3000000' AS DateTime2), CAST(N'2021-02-14T02:03:04.3000000' AS DateTime2), 2435, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2665, CAST(N'2021-02-14T02:05:30.1700000' AS DateTime2), CAST(N'2021-02-14T02:05:30.1700000' AS DateTime2), 2436, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2666, CAST(N'2021-02-14T02:05:30.1700000' AS DateTime2), CAST(N'2021-02-14T02:05:30.1700000' AS DateTime2), 2436, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2667, CAST(N'2021-02-14T02:07:42.4800000' AS DateTime2), CAST(N'2021-02-14T02:07:42.4800000' AS DateTime2), 2437, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2668, CAST(N'2021-02-14T02:07:42.4800000' AS DateTime2), CAST(N'2021-02-14T02:07:42.4800000' AS DateTime2), 2437, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2669, CAST(N'2021-02-14T02:07:57.5800000' AS DateTime2), CAST(N'2021-02-14T02:07:57.5800000' AS DateTime2), 2438, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2670, CAST(N'2021-02-14T02:07:57.5800000' AS DateTime2), CAST(N'2021-02-14T02:07:57.5800000' AS DateTime2), 2438, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2671, CAST(N'2021-02-14T02:16:48.9200000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9200000' AS DateTime2), 2439, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2672, CAST(N'2021-02-14T02:16:48.9200000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9200000' AS DateTime2), 2439, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2673, CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), 2440, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2674, CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), 2440, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2675, CAST(N'2021-02-14T02:17:45.6900000' AS DateTime2), CAST(N'2021-02-14T02:17:45.6900000' AS DateTime2), 2441, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2676, CAST(N'2021-02-14T02:17:45.6900000' AS DateTime2), CAST(N'2021-02-14T02:17:45.6900000' AS DateTime2), 2441, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2677, CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), 2442, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2678, CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), 2442, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2679, CAST(N'2021-02-14T02:18:30.8500000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8500000' AS DateTime2), 2443, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2680, CAST(N'2021-02-14T02:18:30.8500000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8500000' AS DateTime2), 2443, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2681, CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), 2444, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2682, CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), 2444, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2683, CAST(N'2021-02-14T02:21:03.0800000' AS DateTime2), CAST(N'2021-02-14T02:21:03.0800000' AS DateTime2), 2445, 7)
GO
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2684, CAST(N'2021-02-14T02:21:03.0800000' AS DateTime2), CAST(N'2021-02-14T02:21:03.0800000' AS DateTime2), 2445, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2685, CAST(N'2021-02-14T02:23:50.5700000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5700000' AS DateTime2), 2446, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2686, CAST(N'2021-02-14T02:23:50.5700000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5700000' AS DateTime2), 2446, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2687, CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), 2447, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2688, CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), 2447, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2689, CAST(N'2021-02-14T02:24:56.6000000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6000000' AS DateTime2), 2448, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2690, CAST(N'2021-02-14T02:24:56.6000000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6000000' AS DateTime2), 2448, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2691, CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), 2449, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2692, CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), 2449, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2693, CAST(N'2021-02-14T02:25:20.0400000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0400000' AS DateTime2), 2450, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2694, CAST(N'2021-02-14T02:25:20.0400000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0400000' AS DateTime2), 2450, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2695, CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), 2451, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2696, CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), 2451, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2697, CAST(N'2021-02-14T02:26:50.7800000' AS DateTime2), CAST(N'2021-02-14T02:26:50.7800000' AS DateTime2), 2452, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2698, CAST(N'2021-02-14T02:26:50.7800000' AS DateTime2), CAST(N'2021-02-14T02:26:50.7800000' AS DateTime2), 2452, 8)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2699, CAST(N'2021-02-14T02:28:50.3400000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3400000' AS DateTime2), 2453, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2700, CAST(N'2021-02-14T02:28:50.3400000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3400000' AS DateTime2), 2453, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2701, CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), 2454, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2702, CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), 2454, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2703, CAST(N'2021-02-14T02:29:51.2800000' AS DateTime2), CAST(N'2021-02-14T02:29:51.2800000' AS DateTime2), 2455, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2704, CAST(N'2021-02-14T02:29:51.2800000' AS DateTime2), CAST(N'2021-02-14T02:29:51.2800000' AS DateTime2), 2455, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2705, CAST(N'2021-02-14T02:30:18.6100000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6100000' AS DateTime2), 2456, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2706, CAST(N'2021-02-14T02:30:18.6100000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6100000' AS DateTime2), 2456, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2707, CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), 2457, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2708, CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), 2457, 10)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2709, CAST(N'2021-02-14T02:39:44.9600000' AS DateTime2), CAST(N'2021-02-14T02:39:44.9600000' AS DateTime2), 2458, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2710, CAST(N'2021-02-14T02:39:44.9600000' AS DateTime2), CAST(N'2021-02-14T02:39:44.9600000' AS DateTime2), 2458, 9)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2711, CAST(N'2021-02-14T02:40:06.9200000' AS DateTime2), CAST(N'2021-02-14T02:40:06.9200000' AS DateTime2), 2459, 7)
INSERT [Rolls].[RollsToEntities] ([RollToEntityId], [DateCreated], [DateModified], [RollId], [EntityId]) VALUES (2712, CAST(N'2021-02-14T02:40:06.9200000' AS DateTime2), CAST(N'2021-02-14T02:40:06.9200000' AS DateTime2), 2459, 10)
SET IDENTITY_INSERT [Rolls].[RollsToEntities] OFF
SET IDENTITY_INSERT [Rolls].[SkillRolls] ON

INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (1, CAST(N'2021-01-02T23:03:17.5100000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5100000' AS DateTime2), 1, 1, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2, CAST(N'2021-01-02T23:37:41.8000000' AS DateTime2), CAST(N'2021-01-02T23:37:41.8000000' AS DateTime2), 2, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (3, CAST(N'2021-01-02T23:47:43.2600000' AS DateTime2), CAST(N'2021-01-02T23:47:43.2600000' AS DateTime2), 3, 3, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (4, CAST(N'2021-01-02T23:47:55.0800000' AS DateTime2), CAST(N'2021-01-02T23:47:55.0800000' AS DateTime2), 4, 3, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (5, CAST(N'2021-01-02T23:48:23.1500000' AS DateTime2), CAST(N'2021-01-02T23:48:23.1500000' AS DateTime2), 5, 3, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (6, CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1800000' AS DateTime2), 6, 4, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (7, CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7500000' AS DateTime2), 8, 5, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (8, CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), CAST(N'2021-01-03T00:01:23.0800000' AS DateTime2), 10, 5, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (9, CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), CAST(N'2021-01-03T00:03:28.0600000' AS DateTime2), 12, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (10, CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4700000' AS DateTime2), 14, 6, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (11, CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), 16, 7, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (12, CAST(N'2021-01-03T00:10:34.6100000' AS DateTime2), CAST(N'2021-01-03T00:10:34.6100000' AS DateTime2), 17, 8, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (13, CAST(N'2021-01-03T00:32:24.9600000' AS DateTime2), CAST(N'2021-01-03T00:32:24.9600000' AS DateTime2), 18, 8, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (14, CAST(N'2021-01-03T00:34:19.1200000' AS DateTime2), CAST(N'2021-01-03T00:34:19.1200000' AS DateTime2), 19, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (15, CAST(N'2021-01-03T00:35:06.6900000' AS DateTime2), CAST(N'2021-01-03T00:35:06.6900000' AS DateTime2), 20, 10, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (16, CAST(N'2021-01-03T00:35:14.7400000' AS DateTime2), CAST(N'2021-01-03T00:35:14.7400000' AS DateTime2), 21, 10, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (17, CAST(N'2021-01-03T00:36:08.4300000' AS DateTime2), CAST(N'2021-01-03T00:36:08.4300000' AS DateTime2), 22, 3, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (18, CAST(N'2021-01-03T00:36:15.3400000' AS DateTime2), CAST(N'2021-01-03T00:36:15.3400000' AS DateTime2), 23, 3, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (19, CAST(N'2021-01-03T00:36:25.3300000' AS DateTime2), CAST(N'2021-01-03T00:36:25.3300000' AS DateTime2), 24, 3, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (20, CAST(N'2021-01-03T00:39:52.7900000' AS DateTime2), CAST(N'2021-01-03T00:39:52.7900000' AS DateTime2), 25, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (21, CAST(N'2021-01-03T00:41:06.7400000' AS DateTime2), CAST(N'2021-01-03T00:41:06.7400000' AS DateTime2), 26, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (22, CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), CAST(N'2021-01-03T00:42:05.9300000' AS DateTime2), 27, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (23, CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), CAST(N'2021-01-03T00:44:25.0600000' AS DateTime2), 29, 6, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (24, CAST(N'2021-01-03T00:47:21.0600000' AS DateTime2), CAST(N'2021-01-03T00:47:21.0600000' AS DateTime2), 31, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (25, CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), CAST(N'2021-01-03T00:49:07.0500000' AS DateTime2), 32, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (26, CAST(N'2021-01-03T00:53:24.9200000' AS DateTime2), CAST(N'2021-01-03T00:53:24.9200000' AS DateTime2), 34, 12, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (27, CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), CAST(N'2021-01-03T00:54:40.1500000' AS DateTime2), 35, 6, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (28, CAST(N'2021-01-03T00:55:01.2300000' AS DateTime2), CAST(N'2021-01-03T00:55:01.2300000' AS DateTime2), 37, 13, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (29, CAST(N'2021-01-03T00:59:20.2300000' AS DateTime2), CAST(N'2021-01-03T00:59:20.2300000' AS DateTime2), 38, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (30, CAST(N'2021-01-03T01:00:03.4100000' AS DateTime2), CAST(N'2021-01-03T01:00:03.4100000' AS DateTime2), 39, 13, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (31, CAST(N'2021-01-03T01:01:45.0000000' AS DateTime2), CAST(N'2021-01-03T01:01:45.0000000' AS DateTime2), 40, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (32, CAST(N'2021-01-03T01:02:55.4000000' AS DateTime2), CAST(N'2021-01-03T01:02:55.4000000' AS DateTime2), 41, 14, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (33, CAST(N'2021-01-03T01:04:37.6100000' AS DateTime2), CAST(N'2021-01-03T01:04:37.6100000' AS DateTime2), 42, 8, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (34, CAST(N'2021-01-03T01:04:53.0400000' AS DateTime2), CAST(N'2021-01-03T01:04:53.0400000' AS DateTime2), 43, 15, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (35, CAST(N'2021-01-03T01:04:59.7000000' AS DateTime2), CAST(N'2021-01-03T01:04:59.7000000' AS DateTime2), 44, 15, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (36, CAST(N'2021-01-03T01:22:24.2900000' AS DateTime2), CAST(N'2021-01-03T01:22:24.2900000' AS DateTime2), 45, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (37, CAST(N'2021-01-03T01:27:36.8800000' AS DateTime2), CAST(N'2021-01-03T01:27:36.8800000' AS DateTime2), 46, 7, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (38, CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), CAST(N'2021-01-03T01:43:57.2000000' AS DateTime2), 47, 17, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (39, CAST(N'2021-01-03T01:46:42.2900000' AS DateTime2), CAST(N'2021-01-03T01:46:42.2900000' AS DateTime2), 49, 13, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (40, CAST(N'2021-01-03T01:49:06.7600000' AS DateTime2), CAST(N'2021-01-03T01:49:06.7600000' AS DateTime2), 50, 13, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (41, CAST(N'2021-01-03T01:53:35.9100000' AS DateTime2), CAST(N'2021-01-03T01:53:35.9100000' AS DateTime2), 51, 14, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (42, CAST(N'2021-01-03T01:59:19.1700000' AS DateTime2), CAST(N'2021-01-03T01:59:19.1700000' AS DateTime2), 52, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (43, CAST(N'2021-01-03T01:59:23.4700000' AS DateTime2), CAST(N'2021-01-03T01:59:23.4700000' AS DateTime2), 53, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (44, CAST(N'2021-01-03T02:00:14.9400000' AS DateTime2), CAST(N'2021-01-03T02:00:14.9400000' AS DateTime2), 54, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (45, CAST(N'2021-01-03T02:24:56.8900000' AS DateTime2), CAST(N'2021-01-03T02:24:56.8900000' AS DateTime2), 55, 18, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (46, CAST(N'2021-01-03T02:53:27.6100000' AS DateTime2), CAST(N'2021-01-03T02:53:27.6100000' AS DateTime2), 56, 19, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (47, CAST(N'2021-01-03T02:54:22.1600000' AS DateTime2), CAST(N'2021-01-03T02:54:22.1600000' AS DateTime2), 57, 19, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (48, CAST(N'2021-01-03T02:54:24.6200000' AS DateTime2), CAST(N'2021-01-03T02:54:24.6200000' AS DateTime2), 58, 19, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (49, CAST(N'2021-01-03T02:54:33.2000000' AS DateTime2), CAST(N'2021-01-03T02:54:33.2000000' AS DateTime2), 59, 19, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (50, CAST(N'2021-01-03T02:54:39.1300000' AS DateTime2), CAST(N'2021-01-03T02:54:39.1300000' AS DateTime2), 60, 19, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (51, CAST(N'2021-01-03T02:55:26.3100000' AS DateTime2), CAST(N'2021-01-03T02:55:26.3100000' AS DateTime2), 61, 19, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (52, CAST(N'2021-01-03T02:55:37.8700000' AS DateTime2), CAST(N'2021-01-03T02:55:37.8700000' AS DateTime2), 62, 19, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (53, CAST(N'2021-01-03T02:56:25.8500000' AS DateTime2), CAST(N'2021-01-03T02:56:25.8500000' AS DateTime2), 63, 19, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (54, CAST(N'2021-01-03T02:56:40.4600000' AS DateTime2), CAST(N'2021-01-03T02:56:40.4600000' AS DateTime2), 64, 19, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (55, CAST(N'2021-01-03T03:00:25.3000000' AS DateTime2), CAST(N'2021-01-03T03:00:25.3000000' AS DateTime2), 65, 19, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (56, CAST(N'2021-01-03T03:00:33.6200000' AS DateTime2), CAST(N'2021-01-03T03:00:33.6200000' AS DateTime2), 66, 19, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (57, CAST(N'2021-01-09T16:22:17.0100000' AS DateTime2), CAST(N'2021-01-09T16:22:17.0100000' AS DateTime2), 67, 20, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (58, CAST(N'2021-01-09T16:23:23.6500000' AS DateTime2), CAST(N'2021-01-09T16:23:23.6500000' AS DateTime2), 68, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (59, CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), CAST(N'2021-01-09T16:35:23.3100000' AS DateTime2), 69, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (60, CAST(N'2021-01-09T16:42:21.3100000' AS DateTime2), CAST(N'2021-01-09T16:42:21.3100000' AS DateTime2), 71, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (61, CAST(N'2021-01-09T16:46:42.8700000' AS DateTime2), CAST(N'2021-01-09T16:46:42.8700000' AS DateTime2), 76, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (62, CAST(N'2021-01-09T16:48:36.4100000' AS DateTime2), CAST(N'2021-01-09T16:48:36.4100000' AS DateTime2), 77, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (63, CAST(N'2021-01-09T16:48:39.1100000' AS DateTime2), CAST(N'2021-01-09T16:48:39.1100000' AS DateTime2), 78, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (64, CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), CAST(N'2021-01-09T16:48:55.4000000' AS DateTime2), 79, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (65, CAST(N'2021-01-09T16:52:52.1700000' AS DateTime2), CAST(N'2021-01-09T16:52:52.1700000' AS DateTime2), 80, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (66, CAST(N'2021-01-09T17:50:13.2900000' AS DateTime2), CAST(N'2021-01-09T17:50:13.2900000' AS DateTime2), 81, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (67, CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), CAST(N'2021-01-09T18:38:29.7100000' AS DateTime2), 82, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (68, CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), CAST(N'2021-01-09T18:38:47.7600000' AS DateTime2), 84, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (69, CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), CAST(N'2021-01-09T18:45:12.8400000' AS DateTime2), 86, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (70, CAST(N'2021-01-09T19:35:06.7800000' AS DateTime2), CAST(N'2021-01-09T19:35:06.7800000' AS DateTime2), 88, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (71, CAST(N'2021-01-09T19:35:10.3500000' AS DateTime2), CAST(N'2021-01-09T19:35:10.3500000' AS DateTime2), 89, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (72, CAST(N'2021-01-09T19:35:11.0200000' AS DateTime2), CAST(N'2021-01-09T19:35:11.0200000' AS DateTime2), 90, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (73, CAST(N'2021-01-09T19:35:11.5400000' AS DateTime2), CAST(N'2021-01-09T19:35:11.5400000' AS DateTime2), 91, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (74, CAST(N'2021-01-09T19:35:12.0100000' AS DateTime2), CAST(N'2021-01-09T19:35:12.0100000' AS DateTime2), 92, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (75, CAST(N'2021-01-09T19:35:12.6300000' AS DateTime2), CAST(N'2021-01-09T19:35:12.6300000' AS DateTime2), 93, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (76, CAST(N'2021-01-09T19:35:12.9500000' AS DateTime2), CAST(N'2021-01-09T19:35:12.9500000' AS DateTime2), 94, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (77, CAST(N'2021-01-09T19:35:13.1600000' AS DateTime2), CAST(N'2021-01-09T19:35:13.1600000' AS DateTime2), 95, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (78, CAST(N'2021-01-09T19:35:13.3500000' AS DateTime2), CAST(N'2021-01-09T19:35:13.3500000' AS DateTime2), 96, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (79, CAST(N'2021-01-09T19:35:13.5200000' AS DateTime2), CAST(N'2021-01-09T19:35:13.5200000' AS DateTime2), 97, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (80, CAST(N'2021-01-09T19:35:13.6700000' AS DateTime2), CAST(N'2021-01-09T19:35:13.6700000' AS DateTime2), 98, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (81, CAST(N'2021-01-09T19:35:13.8300000' AS DateTime2), CAST(N'2021-01-09T19:35:13.8300000' AS DateTime2), 99, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (82, CAST(N'2021-01-09T19:35:13.9800000' AS DateTime2), CAST(N'2021-01-09T19:35:13.9800000' AS DateTime2), 100, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (83, CAST(N'2021-01-09T19:35:14.2600000' AS DateTime2), CAST(N'2021-01-09T19:35:14.2600000' AS DateTime2), 101, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (84, CAST(N'2021-01-09T19:35:14.3900000' AS DateTime2), CAST(N'2021-01-09T19:35:14.3900000' AS DateTime2), 102, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (85, CAST(N'2021-01-09T19:35:14.5500000' AS DateTime2), CAST(N'2021-01-09T19:35:14.5500000' AS DateTime2), 103, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (86, CAST(N'2021-01-09T19:35:14.7000000' AS DateTime2), CAST(N'2021-01-09T19:35:14.7000000' AS DateTime2), 104, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (87, CAST(N'2021-01-09T19:35:14.8700000' AS DateTime2), CAST(N'2021-01-09T19:35:14.8700000' AS DateTime2), 105, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (88, CAST(N'2021-01-09T19:35:15.0400000' AS DateTime2), CAST(N'2021-01-09T19:35:15.0400000' AS DateTime2), 106, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (89, CAST(N'2021-01-09T19:35:15.2000000' AS DateTime2), CAST(N'2021-01-09T19:35:15.2000000' AS DateTime2), 107, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (90, CAST(N'2021-01-09T19:35:15.3800000' AS DateTime2), CAST(N'2021-01-09T19:35:15.3800000' AS DateTime2), 108, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (91, CAST(N'2021-01-09T19:35:15.5600000' AS DateTime2), CAST(N'2021-01-09T19:35:15.5600000' AS DateTime2), 109, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (92, CAST(N'2021-01-09T19:35:15.7300000' AS DateTime2), CAST(N'2021-01-09T19:35:15.7300000' AS DateTime2), 110, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (93, CAST(N'2021-01-09T19:35:15.9000000' AS DateTime2), CAST(N'2021-01-09T19:35:15.9000000' AS DateTime2), 111, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (94, CAST(N'2021-01-09T19:35:16.0600000' AS DateTime2), CAST(N'2021-01-09T19:35:16.0600000' AS DateTime2), 112, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (95, CAST(N'2021-01-09T19:35:16.2200000' AS DateTime2), CAST(N'2021-01-09T19:35:16.2200000' AS DateTime2), 113, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (96, CAST(N'2021-01-09T19:35:16.3900000' AS DateTime2), CAST(N'2021-01-09T19:35:16.3900000' AS DateTime2), 114, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (97, CAST(N'2021-01-09T19:35:16.5500000' AS DateTime2), CAST(N'2021-01-09T19:35:16.5500000' AS DateTime2), 115, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (98, CAST(N'2021-01-09T19:35:16.7000000' AS DateTime2), CAST(N'2021-01-09T19:35:16.7000000' AS DateTime2), 116, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (99, CAST(N'2021-01-09T19:35:16.8500000' AS DateTime2), CAST(N'2021-01-09T19:35:16.8500000' AS DateTime2), 117, 16, 0)
GO
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (100, CAST(N'2021-01-09T19:35:16.9800000' AS DateTime2), CAST(N'2021-01-09T19:35:16.9800000' AS DateTime2), 118, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (101, CAST(N'2021-01-09T19:35:56.2700000' AS DateTime2), CAST(N'2021-01-09T19:35:56.2700000' AS DateTime2), 119, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (102, CAST(N'2021-01-09T19:35:56.4200000' AS DateTime2), CAST(N'2021-01-09T19:35:56.4200000' AS DateTime2), 120, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (103, CAST(N'2021-01-09T19:35:56.9500000' AS DateTime2), CAST(N'2021-01-09T19:35:56.9500000' AS DateTime2), 121, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (104, CAST(N'2021-01-09T19:35:57.1400000' AS DateTime2), CAST(N'2021-01-09T19:35:57.1400000' AS DateTime2), 122, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (105, CAST(N'2021-01-09T19:35:57.5700000' AS DateTime2), CAST(N'2021-01-09T19:35:57.5700000' AS DateTime2), 123, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (106, CAST(N'2021-01-09T19:37:39.2300000' AS DateTime2), CAST(N'2021-01-09T19:37:39.2300000' AS DateTime2), 124, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (107, CAST(N'2021-01-09T19:37:39.4900000' AS DateTime2), CAST(N'2021-01-09T19:37:39.4900000' AS DateTime2), 125, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (108, CAST(N'2021-01-09T19:37:39.8800000' AS DateTime2), CAST(N'2021-01-09T19:37:39.8800000' AS DateTime2), 126, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (109, CAST(N'2021-01-09T19:37:40.2300000' AS DateTime2), CAST(N'2021-01-09T19:37:40.2300000' AS DateTime2), 127, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (110, CAST(N'2021-01-09T19:37:40.4700000' AS DateTime2), CAST(N'2021-01-09T19:37:40.4700000' AS DateTime2), 128, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (111, CAST(N'2021-01-09T19:37:40.6400000' AS DateTime2), CAST(N'2021-01-09T19:37:40.6400000' AS DateTime2), 129, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (112, CAST(N'2021-01-09T19:37:40.8100000' AS DateTime2), CAST(N'2021-01-09T19:37:40.8100000' AS DateTime2), 130, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (113, CAST(N'2021-01-09T19:37:41.0000000' AS DateTime2), CAST(N'2021-01-09T19:37:41.0000000' AS DateTime2), 131, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (114, CAST(N'2021-01-09T19:37:41.1600000' AS DateTime2), CAST(N'2021-01-09T19:37:41.1600000' AS DateTime2), 132, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (115, CAST(N'2021-01-09T19:37:41.3300000' AS DateTime2), CAST(N'2021-01-09T19:37:41.3300000' AS DateTime2), 133, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (116, CAST(N'2021-01-09T19:37:41.4800000' AS DateTime2), CAST(N'2021-01-09T19:37:41.4800000' AS DateTime2), 134, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (117, CAST(N'2021-01-09T19:37:41.6500000' AS DateTime2), CAST(N'2021-01-09T19:37:41.6500000' AS DateTime2), 135, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (118, CAST(N'2021-01-09T19:37:41.8200000' AS DateTime2), CAST(N'2021-01-09T19:37:41.8200000' AS DateTime2), 136, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (119, CAST(N'2021-01-09T19:37:41.9800000' AS DateTime2), CAST(N'2021-01-09T19:37:41.9800000' AS DateTime2), 137, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (120, CAST(N'2021-01-09T19:37:42.2000000' AS DateTime2), CAST(N'2021-01-09T19:37:42.2000000' AS DateTime2), 138, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (121, CAST(N'2021-01-09T19:37:42.3100000' AS DateTime2), CAST(N'2021-01-09T19:37:42.3100000' AS DateTime2), 139, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (122, CAST(N'2021-01-09T19:37:42.4900000' AS DateTime2), CAST(N'2021-01-09T19:37:42.4900000' AS DateTime2), 140, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (123, CAST(N'2021-01-09T19:37:42.6600000' AS DateTime2), CAST(N'2021-01-09T19:37:42.6600000' AS DateTime2), 141, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (124, CAST(N'2021-01-09T19:37:42.8200000' AS DateTime2), CAST(N'2021-01-09T19:37:42.8200000' AS DateTime2), 142, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (125, CAST(N'2021-01-09T19:37:43.0000000' AS DateTime2), CAST(N'2021-01-09T19:37:43.0000000' AS DateTime2), 143, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (126, CAST(N'2021-01-09T19:37:43.1700000' AS DateTime2), CAST(N'2021-01-09T19:37:43.1700000' AS DateTime2), 144, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (127, CAST(N'2021-01-09T19:37:43.3200000' AS DateTime2), CAST(N'2021-01-09T19:37:43.3200000' AS DateTime2), 145, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (128, CAST(N'2021-01-09T19:37:43.4900000' AS DateTime2), CAST(N'2021-01-09T19:37:43.4900000' AS DateTime2), 146, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (129, CAST(N'2021-01-09T19:37:43.6600000' AS DateTime2), CAST(N'2021-01-09T19:37:43.6600000' AS DateTime2), 147, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (130, CAST(N'2021-01-09T19:37:43.8400000' AS DateTime2), CAST(N'2021-01-09T19:37:43.8400000' AS DateTime2), 148, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (131, CAST(N'2021-01-09T19:37:44.0100000' AS DateTime2), CAST(N'2021-01-09T19:37:44.0100000' AS DateTime2), 149, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (132, CAST(N'2021-01-09T19:37:44.2200000' AS DateTime2), CAST(N'2021-01-09T19:37:44.2200000' AS DateTime2), 150, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (133, CAST(N'2021-01-09T19:37:44.4400000' AS DateTime2), CAST(N'2021-01-09T19:37:44.4400000' AS DateTime2), 151, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (134, CAST(N'2021-01-09T19:37:44.7200000' AS DateTime2), CAST(N'2021-01-09T19:37:44.7200000' AS DateTime2), 152, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (135, CAST(N'2021-01-09T19:37:45.1400000' AS DateTime2), CAST(N'2021-01-09T19:37:45.1400000' AS DateTime2), 153, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (136, CAST(N'2021-01-09T19:37:45.5200000' AS DateTime2), CAST(N'2021-01-09T19:37:45.5200000' AS DateTime2), 154, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (137, CAST(N'2021-01-09T19:37:45.9600000' AS DateTime2), CAST(N'2021-01-09T19:37:45.9600000' AS DateTime2), 155, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (138, CAST(N'2021-01-09T19:37:46.6600000' AS DateTime2), CAST(N'2021-01-09T19:37:46.6600000' AS DateTime2), 156, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (139, CAST(N'2021-01-09T23:39:09.9600000' AS DateTime2), CAST(N'2021-01-09T23:39:09.9600000' AS DateTime2), 179, 9, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (140, CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), CAST(N'2021-01-09T23:39:18.5000000' AS DateTime2), 180, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (141, CAST(N'2021-01-09T23:39:28.3500000' AS DateTime2), CAST(N'2021-01-09T23:39:28.3500000' AS DateTime2), 181, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (142, CAST(N'2021-01-09T23:46:30.8100000' AS DateTime2), CAST(N'2021-01-09T23:46:30.8100000' AS DateTime2), 182, 21, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (143, CAST(N'2021-01-10T00:05:38.1900000' AS DateTime2), CAST(N'2021-01-10T00:05:38.1900000' AS DateTime2), 183, 22, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (144, CAST(N'2021-01-10T00:37:01.8300000' AS DateTime2), CAST(N'2021-01-10T00:37:01.8300000' AS DateTime2), 184, 23, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (145, CAST(N'2021-01-10T00:38:41.5900000' AS DateTime2), CAST(N'2021-01-10T00:38:41.5900000' AS DateTime2), 185, 24, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (146, CAST(N'2021-01-10T00:49:53.7700000' AS DateTime2), CAST(N'2021-01-10T00:49:53.7700000' AS DateTime2), 186, 24, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (147, CAST(N'2021-01-10T00:55:32.3800000' AS DateTime2), CAST(N'2021-01-10T00:55:32.3800000' AS DateTime2), 187, 25, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (148, CAST(N'2021-01-10T01:03:15.6900000' AS DateTime2), CAST(N'2021-01-10T01:03:15.6900000' AS DateTime2), 188, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (149, CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), CAST(N'2021-01-10T01:03:26.5900000' AS DateTime2), 189, 9, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (150, CAST(N'2021-01-10T01:08:23.2700000' AS DateTime2), CAST(N'2021-01-10T01:08:23.2700000' AS DateTime2), 190, 12, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (151, CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), 191, 26, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (152, CAST(N'2021-01-10T01:09:37.3900000' AS DateTime2), CAST(N'2021-01-10T01:09:37.3900000' AS DateTime2), 192, 23, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (153, CAST(N'2021-01-10T01:11:04.5500000' AS DateTime2), CAST(N'2021-01-10T01:11:04.5500000' AS DateTime2), 193, 23, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (154, CAST(N'2021-01-10T01:13:01.3300000' AS DateTime2), CAST(N'2021-01-10T01:13:01.3300000' AS DateTime2), 194, 14, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (155, CAST(N'2021-01-10T01:14:10.8900000' AS DateTime2), CAST(N'2021-01-10T01:14:10.8900000' AS DateTime2), 195, 27, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (156, CAST(N'2021-01-10T01:18:06.8600000' AS DateTime2), CAST(N'2021-01-10T01:18:06.8600000' AS DateTime2), 196, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (157, CAST(N'2021-01-10T01:21:26.3700000' AS DateTime2), CAST(N'2021-01-10T01:21:26.3700000' AS DateTime2), 197, 27, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (158, CAST(N'2021-01-10T01:21:50.9300000' AS DateTime2), CAST(N'2021-01-10T01:21:50.9300000' AS DateTime2), 198, 27, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (159, CAST(N'2021-01-10T01:26:00.0000000' AS DateTime2), CAST(N'2021-01-10T01:26:00.0000000' AS DateTime2), 199, 28, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (160, CAST(N'2021-01-10T01:57:32.4100000' AS DateTime2), CAST(N'2021-01-10T01:57:32.4100000' AS DateTime2), 200, 29, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (161, CAST(N'2021-01-10T02:13:00.6400000' AS DateTime2), CAST(N'2021-01-10T02:13:00.6400000' AS DateTime2), 201, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (162, CAST(N'2021-01-11T23:43:05.6200000' AS DateTime2), CAST(N'2021-01-11T23:43:05.6200000' AS DateTime2), 204, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (163, CAST(N'2021-01-11T23:44:10.9800000' AS DateTime2), CAST(N'2021-01-11T23:44:10.9800000' AS DateTime2), 205, 30, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (164, CAST(N'2021-01-16T00:16:47.3700000' AS DateTime2), CAST(N'2021-01-16T00:16:47.3700000' AS DateTime2), 206, 9, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (165, CAST(N'2021-01-16T00:37:56.8500000' AS DateTime2), CAST(N'2021-01-16T00:37:56.8500000' AS DateTime2), 207, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (166, CAST(N'2021-01-16T00:38:18.4200000' AS DateTime2), CAST(N'2021-01-16T00:38:18.4200000' AS DateTime2), 208, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (167, CAST(N'2021-01-16T00:39:39.5800000' AS DateTime2), CAST(N'2021-01-16T00:39:39.5800000' AS DateTime2), 209, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (168, CAST(N'2021-01-16T15:14:43.3500000' AS DateTime2), CAST(N'2021-01-16T15:14:43.3500000' AS DateTime2), 210, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (169, CAST(N'2021-01-16T15:21:36.3800000' AS DateTime2), CAST(N'2021-01-16T15:21:36.3800000' AS DateTime2), 211, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (170, CAST(N'2021-01-16T15:23:16.1600000' AS DateTime2), CAST(N'2021-01-16T15:23:16.1600000' AS DateTime2), 212, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (171, CAST(N'2021-01-16T15:24:26.2800000' AS DateTime2), CAST(N'2021-01-16T15:24:26.2800000' AS DateTime2), 213, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (172, CAST(N'2021-01-16T15:29:33.2600000' AS DateTime2), CAST(N'2021-01-16T15:29:33.2600000' AS DateTime2), 214, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (173, CAST(N'2021-01-16T15:29:42.4700000' AS DateTime2), CAST(N'2021-01-16T15:29:42.4700000' AS DateTime2), 215, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (174, CAST(N'2021-01-16T15:43:59.2400000' AS DateTime2), CAST(N'2021-01-16T15:43:59.2400000' AS DateTime2), 216, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (175, CAST(N'2021-01-16T15:44:05.4700000' AS DateTime2), CAST(N'2021-01-16T15:44:05.4700000' AS DateTime2), 217, 31, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (176, CAST(N'2021-01-16T15:44:14.5700000' AS DateTime2), CAST(N'2021-01-16T15:44:14.5700000' AS DateTime2), 218, 31, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (177, CAST(N'2021-01-16T15:44:24.9600000' AS DateTime2), CAST(N'2021-01-16T15:44:24.9600000' AS DateTime2), 219, 31, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (178, CAST(N'2021-01-16T15:44:25.3800000' AS DateTime2), CAST(N'2021-01-16T15:44:25.3800000' AS DateTime2), 220, 31, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (179, CAST(N'2021-01-16T15:44:26.0400000' AS DateTime2), CAST(N'2021-01-16T15:44:26.0400000' AS DateTime2), 221, 31, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (180, CAST(N'2021-01-16T15:44:29.2400000' AS DateTime2), CAST(N'2021-01-16T15:44:29.2400000' AS DateTime2), 222, 31, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (181, CAST(N'2021-01-16T15:44:29.6800000' AS DateTime2), CAST(N'2021-01-16T15:44:29.6800000' AS DateTime2), 223, 31, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (182, CAST(N'2021-01-16T15:44:30.2300000' AS DateTime2), CAST(N'2021-01-16T15:44:30.2300000' AS DateTime2), 224, 31, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (183, CAST(N'2021-01-16T15:44:30.9700000' AS DateTime2), CAST(N'2021-01-16T15:44:30.9700000' AS DateTime2), 225, 31, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (184, CAST(N'2021-01-16T15:44:31.3600000' AS DateTime2), CAST(N'2021-01-16T15:44:31.3600000' AS DateTime2), 226, 31, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (185, CAST(N'2021-01-16T15:44:31.7600000' AS DateTime2), CAST(N'2021-01-16T15:44:31.7600000' AS DateTime2), 227, 31, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (186, CAST(N'2021-01-16T15:44:33.2400000' AS DateTime2), CAST(N'2021-01-16T15:44:33.2400000' AS DateTime2), 228, 31, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (187, CAST(N'2021-01-16T15:58:11.3400000' AS DateTime2), CAST(N'2021-01-16T15:58:11.3400000' AS DateTime2), 229, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (188, CAST(N'2021-01-16T15:58:12.1100000' AS DateTime2), CAST(N'2021-01-16T15:58:12.1100000' AS DateTime2), 230, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (189, CAST(N'2021-01-16T15:58:14.8800000' AS DateTime2), CAST(N'2021-01-16T15:58:14.8800000' AS DateTime2), 231, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (190, CAST(N'2021-01-16T22:45:22.7300000' AS DateTime2), CAST(N'2021-01-16T22:45:22.7300000' AS DateTime2), 232, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (191, CAST(N'2021-01-16T22:45:23.2200000' AS DateTime2), CAST(N'2021-01-16T22:45:23.2200000' AS DateTime2), 233, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (192, CAST(N'2021-01-16T22:45:23.7300000' AS DateTime2), CAST(N'2021-01-16T22:45:23.7300000' AS DateTime2), 234, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (193, CAST(N'2021-01-16T22:45:24.2000000' AS DateTime2), CAST(N'2021-01-16T22:45:24.2000000' AS DateTime2), 235, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (194, CAST(N'2021-01-16T22:45:24.6200000' AS DateTime2), CAST(N'2021-01-16T22:45:24.6200000' AS DateTime2), 236, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (195, CAST(N'2021-01-16T22:45:25.1800000' AS DateTime2), CAST(N'2021-01-16T22:45:25.1800000' AS DateTime2), 237, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (196, CAST(N'2021-01-16T22:45:25.4400000' AS DateTime2), CAST(N'2021-01-16T22:45:25.4400000' AS DateTime2), 238, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (197, CAST(N'2021-01-16T22:45:25.6400000' AS DateTime2), CAST(N'2021-01-16T22:45:25.6400000' AS DateTime2), 239, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (198, CAST(N'2021-01-16T22:45:25.8000000' AS DateTime2), CAST(N'2021-01-16T22:45:25.8000000' AS DateTime2), 240, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (199, CAST(N'2021-01-16T22:45:25.9600000' AS DateTime2), CAST(N'2021-01-16T22:45:25.9600000' AS DateTime2), 241, 16, 0)
GO
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (200, CAST(N'2021-01-16T22:45:26.1500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.1500000' AS DateTime2), 242, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (201, CAST(N'2021-01-16T22:45:26.2900000' AS DateTime2), CAST(N'2021-01-16T22:45:26.2900000' AS DateTime2), 243, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (202, CAST(N'2021-01-16T22:45:26.4500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.4500000' AS DateTime2), 244, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (203, CAST(N'2021-01-16T22:45:26.6100000' AS DateTime2), CAST(N'2021-01-16T22:45:26.6100000' AS DateTime2), 245, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (204, CAST(N'2021-01-16T22:45:26.7500000' AS DateTime2), CAST(N'2021-01-16T22:45:26.7500000' AS DateTime2), 246, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (205, CAST(N'2021-01-16T22:45:26.9100000' AS DateTime2), CAST(N'2021-01-16T22:45:26.9100000' AS DateTime2), 247, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (206, CAST(N'2021-01-16T23:01:05.6000000' AS DateTime2), CAST(N'2021-01-16T23:01:05.6000000' AS DateTime2), 248, 9, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (207, CAST(N'2021-01-16T23:01:07.1800000' AS DateTime2), CAST(N'2021-01-16T23:01:07.1800000' AS DateTime2), 249, 9, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (208, CAST(N'2021-01-16T23:01:08.7800000' AS DateTime2), CAST(N'2021-01-16T23:01:08.7800000' AS DateTime2), 250, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (209, CAST(N'2021-01-16T23:01:12.0900000' AS DateTime2), CAST(N'2021-01-16T23:01:12.0900000' AS DateTime2), 251, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (210, CAST(N'2021-01-16T23:01:14.0400000' AS DateTime2), CAST(N'2021-01-16T23:01:14.0400000' AS DateTime2), 252, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (211, CAST(N'2021-01-16T23:01:14.6000000' AS DateTime2), CAST(N'2021-01-16T23:01:14.6000000' AS DateTime2), 253, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (212, CAST(N'2021-01-16T23:01:16.1900000' AS DateTime2), CAST(N'2021-01-16T23:01:16.1900000' AS DateTime2), 254, 9, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (213, CAST(N'2021-01-16T23:01:18.2900000' AS DateTime2), CAST(N'2021-01-16T23:01:18.2900000' AS DateTime2), 255, 9, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (214, CAST(N'2021-01-16T23:17:15.6700000' AS DateTime2), CAST(N'2021-01-16T23:17:15.6700000' AS DateTime2), 256, 28, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (215, CAST(N'2021-01-16T23:17:26.8200000' AS DateTime2), CAST(N'2021-01-16T23:17:26.8200000' AS DateTime2), 257, 28, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (216, CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), CAST(N'2021-01-16T23:18:06.9700000' AS DateTime2), 258, 28, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (217, CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), CAST(N'2021-01-16T23:18:20.3100000' AS DateTime2), 259, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (218, CAST(N'2021-01-16T23:18:47.2100000' AS DateTime2), CAST(N'2021-01-16T23:18:47.2100000' AS DateTime2), 260, 27, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (219, CAST(N'2021-01-16T23:18:49.9100000' AS DateTime2), CAST(N'2021-01-16T23:18:49.9100000' AS DateTime2), 261, 27, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (220, CAST(N'2021-01-16T23:36:53.9500000' AS DateTime2), CAST(N'2021-01-16T23:36:53.9500000' AS DateTime2), 265, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (221, CAST(N'2021-01-16T23:40:08.1100000' AS DateTime2), CAST(N'2021-01-16T23:40:08.1100000' AS DateTime2), 266, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (222, CAST(N'2021-01-16T23:41:39.2200000' AS DateTime2), CAST(N'2021-01-16T23:41:39.2200000' AS DateTime2), 268, 25, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (223, CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), CAST(N'2021-01-16T23:43:07.6900000' AS DateTime2), 269, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (224, CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), CAST(N'2021-01-16T23:47:35.2500000' AS DateTime2), 271, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (225, CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), CAST(N'2021-01-16T23:48:25.2600000' AS DateTime2), 273, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (226, CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), CAST(N'2021-01-16T23:50:31.3400000' AS DateTime2), 275, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (227, CAST(N'2021-01-17T00:12:36.6300000' AS DateTime2), CAST(N'2021-01-17T00:12:36.6300000' AS DateTime2), 277, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (228, CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), CAST(N'2021-01-17T00:12:44.2600000' AS DateTime2), 279, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (229, CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), CAST(N'2021-01-17T00:12:51.4400000' AS DateTime2), 281, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (230, CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), CAST(N'2021-01-17T00:13:01.0000000' AS DateTime2), 283, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (231, CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), CAST(N'2021-01-17T00:13:03.7400000' AS DateTime2), 285, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (232, CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), CAST(N'2021-01-17T00:13:34.0300000' AS DateTime2), 287, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (233, CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), CAST(N'2021-01-17T00:13:36.6700000' AS DateTime2), 289, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (234, CAST(N'2021-01-17T00:13:44.8700000' AS DateTime2), CAST(N'2021-01-17T00:13:44.8700000' AS DateTime2), 291, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (235, CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), CAST(N'2021-01-17T00:14:36.7800000' AS DateTime2), 293, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (236, CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), CAST(N'2021-01-17T00:14:39.0700000' AS DateTime2), 295, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (237, CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), CAST(N'2021-01-17T00:14:41.1700000' AS DateTime2), 297, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (238, CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), CAST(N'2021-01-17T00:14:45.4600000' AS DateTime2), 299, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (239, CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), CAST(N'2021-01-17T00:15:06.3500000' AS DateTime2), 301, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (240, CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), CAST(N'2021-01-17T00:15:08.4700000' AS DateTime2), 303, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (241, CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), CAST(N'2021-01-17T00:15:10.4300000' AS DateTime2), 305, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (242, CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), CAST(N'2021-01-17T00:15:12.3000000' AS DateTime2), 307, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (243, CAST(N'2021-01-17T00:26:56.1400000' AS DateTime2), CAST(N'2021-01-17T00:26:56.1400000' AS DateTime2), 309, 12, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (244, CAST(N'2021-01-17T00:28:51.9200000' AS DateTime2), CAST(N'2021-01-17T00:28:51.9200000' AS DateTime2), 310, 32, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (245, CAST(N'2021-01-17T00:29:06.9200000' AS DateTime2), CAST(N'2021-01-17T00:29:06.9200000' AS DateTime2), 311, 32, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (246, CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), CAST(N'2021-01-17T00:29:15.1700000' AS DateTime2), 312, 32, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (247, CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), 313, 33, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (248, CAST(N'2021-01-17T00:42:29.1800000' AS DateTime2), CAST(N'2021-01-17T00:42:29.1800000' AS DateTime2), 317, 12, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (249, CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), CAST(N'2021-01-17T00:48:08.8700000' AS DateTime2), 318, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (250, CAST(N'2021-01-17T00:48:47.4700000' AS DateTime2), CAST(N'2021-01-17T00:48:47.4700000' AS DateTime2), 320, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (251, CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), CAST(N'2021-01-17T00:50:20.1500000' AS DateTime2), 321, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (252, CAST(N'2021-01-17T00:53:05.2700000' AS DateTime2), CAST(N'2021-01-17T00:53:05.2700000' AS DateTime2), 323, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (253, CAST(N'2021-01-17T00:56:20.6700000' AS DateTime2), CAST(N'2021-01-17T00:56:20.6700000' AS DateTime2), 324, 33, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (254, CAST(N'2021-01-17T01:00:27.4300000' AS DateTime2), CAST(N'2021-01-17T01:00:27.4300000' AS DateTime2), 325, 16, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (255, CAST(N'2021-01-17T01:05:21.8600000' AS DateTime2), CAST(N'2021-01-17T01:05:21.8600000' AS DateTime2), 326, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (256, CAST(N'2021-01-17T01:10:25.6900000' AS DateTime2), CAST(N'2021-01-17T01:10:25.6900000' AS DateTime2), 327, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (257, CAST(N'2021-01-17T01:12:20.5500000' AS DateTime2), CAST(N'2021-01-17T01:12:20.5500000' AS DateTime2), 328, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (258, CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), CAST(N'2021-01-17T01:30:08.1100000' AS DateTime2), 329, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (259, CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), CAST(N'2021-01-17T01:33:32.7000000' AS DateTime2), 331, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (260, CAST(N'2021-01-17T01:35:27.6800000' AS DateTime2), CAST(N'2021-01-17T01:35:27.6800000' AS DateTime2), 333, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (261, CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), CAST(N'2021-01-17T01:39:52.3900000' AS DateTime2), 334, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (262, CAST(N'2021-01-17T01:42:59.4800000' AS DateTime2), CAST(N'2021-01-17T01:42:59.4800000' AS DateTime2), 336, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (263, CAST(N'2021-01-17T01:44:15.3200000' AS DateTime2), CAST(N'2021-01-17T01:44:15.3200000' AS DateTime2), 337, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (264, CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), CAST(N'2021-01-17T01:44:32.9400000' AS DateTime2), 338, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (265, CAST(N'2021-01-17T01:45:51.2800000' AS DateTime2), CAST(N'2021-01-17T01:45:51.2800000' AS DateTime2), 340, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (266, CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), CAST(N'2021-01-17T01:47:08.6600000' AS DateTime2), 341, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (267, CAST(N'2021-01-17T01:53:45.4900000' AS DateTime2), CAST(N'2021-01-17T01:53:45.4900000' AS DateTime2), 343, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (268, CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), CAST(N'2021-01-17T01:54:56.1600000' AS DateTime2), 344, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (269, CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), CAST(N'2021-01-17T01:56:01.1000000' AS DateTime2), 346, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (270, CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), CAST(N'2021-01-17T01:56:23.5900000' AS DateTime2), 348, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (271, CAST(N'2021-01-17T02:06:30.6100000' AS DateTime2), CAST(N'2021-01-17T02:06:30.6100000' AS DateTime2), 350, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (272, CAST(N'2021-01-17T02:12:25.2100000' AS DateTime2), CAST(N'2021-01-17T02:12:25.2100000' AS DateTime2), 351, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (273, CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), CAST(N'2021-01-17T02:13:19.3500000' AS DateTime2), 353, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (274, CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), CAST(N'2021-01-17T02:20:24.0800000' AS DateTime2), 355, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (275, CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), CAST(N'2021-01-17T02:26:33.7000000' AS DateTime2), 357, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (276, CAST(N'2021-01-17T02:31:36.7600000' AS DateTime2), CAST(N'2021-01-17T02:31:36.7600000' AS DateTime2), 359, 33, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (277, CAST(N'2021-01-23T23:30:04.4300000' AS DateTime2), CAST(N'2021-01-23T23:30:04.4300000' AS DateTime2), 360, 28, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (278, CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), CAST(N'2021-01-23T23:30:12.6200000' AS DateTime2), 361, 28, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (279, CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), CAST(N'2021-01-23T23:30:16.5700000' AS DateTime2), 362, 28, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (280, CAST(N'2021-01-23T23:38:26.8100000' AS DateTime2), CAST(N'2021-01-23T23:38:26.8100000' AS DateTime2), 363, 7, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (281, CAST(N'2021-01-23T23:39:08.7100000' AS DateTime2), CAST(N'2021-01-23T23:39:08.7100000' AS DateTime2), 364, 14, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (282, CAST(N'2021-01-23T23:45:57.3000000' AS DateTime2), CAST(N'2021-01-23T23:45:57.3000000' AS DateTime2), 368, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (283, CAST(N'2021-01-23T23:50:22.8900000' AS DateTime2), CAST(N'2021-01-23T23:50:22.8900000' AS DateTime2), 369, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (284, CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), CAST(N'2021-01-23T23:52:36.5800000' AS DateTime2), 370, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (285, CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), CAST(N'2021-01-23T23:54:32.1800000' AS DateTime2), 372, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (286, CAST(N'2021-01-23T23:59:42.1900000' AS DateTime2), CAST(N'2021-01-23T23:59:42.1900000' AS DateTime2), 374, 13, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (287, CAST(N'2021-01-23T23:59:53.8900000' AS DateTime2), CAST(N'2021-01-23T23:59:53.8900000' AS DateTime2), 375, 13, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (288, CAST(N'2021-01-24T00:10:48.2000000' AS DateTime2), CAST(N'2021-01-24T00:10:48.2000000' AS DateTime2), 379, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (289, CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), CAST(N'2021-01-24T00:11:30.1200000' AS DateTime2), 381, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (290, CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), CAST(N'2021-01-24T00:12:28.0700000' AS DateTime2), 383, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (291, CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), CAST(N'2021-01-24T00:14:37.5900000' AS DateTime2), 385, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (292, CAST(N'2021-01-24T00:16:28.1700000' AS DateTime2), CAST(N'2021-01-24T00:16:28.1700000' AS DateTime2), 387, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (293, CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), CAST(N'2021-01-24T00:17:00.0900000' AS DateTime2), 389, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (294, CAST(N'2021-01-24T00:17:48.1700000' AS DateTime2), CAST(N'2021-01-24T00:17:48.1700000' AS DateTime2), 391, 27, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (295, CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), CAST(N'2021-01-24T00:19:25.6000000' AS DateTime2), 392, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (296, CAST(N'2021-01-24T00:20:25.5500000' AS DateTime2), CAST(N'2021-01-24T00:20:25.5500000' AS DateTime2), 394, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (297, CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), CAST(N'2021-01-24T00:21:09.4800000' AS DateTime2), 396, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (298, CAST(N'2021-01-24T00:21:59.8300000' AS DateTime2), CAST(N'2021-01-24T00:21:59.8300000' AS DateTime2), 398, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (299, CAST(N'2021-01-24T00:23:04.1000000' AS DateTime2), CAST(N'2021-01-24T00:23:04.1000000' AS DateTime2), 400, 2, 0)
GO
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (300, CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), CAST(N'2021-01-24T00:23:53.8200000' AS DateTime2), 401, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (301, CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), CAST(N'2021-01-24T00:24:30.6500000' AS DateTime2), 403, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (302, CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), CAST(N'2021-01-24T00:24:41.6300000' AS DateTime2), 405, 27, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (303, CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), CAST(N'2021-01-24T00:26:09.5700000' AS DateTime2), 406, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (304, CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), CAST(N'2021-01-24T00:31:12.3800000' AS DateTime2), 408, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (305, CAST(N'2021-01-24T00:40:36.4800000' AS DateTime2), CAST(N'2021-01-24T00:40:36.4800000' AS DateTime2), 413, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (306, CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), CAST(N'2021-01-24T00:41:05.3800000' AS DateTime2), 414, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (307, CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), CAST(N'2021-01-24T00:41:26.9400000' AS DateTime2), 416, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (308, CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), CAST(N'2021-01-24T00:43:06.7800000' AS DateTime2), 418, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (309, CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), CAST(N'2021-01-24T00:47:33.9900000' AS DateTime2), 420, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (310, CAST(N'2021-01-24T00:48:36.8300000' AS DateTime2), CAST(N'2021-01-24T00:48:36.8300000' AS DateTime2), 422, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (311, CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), CAST(N'2021-01-24T00:48:49.0400000' AS DateTime2), 423, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (312, CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), CAST(N'2021-01-24T00:50:42.6400000' AS DateTime2), 424, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (313, CAST(N'2021-01-24T00:52:57.6000000' AS DateTime2), CAST(N'2021-01-24T00:52:57.6000000' AS DateTime2), 426, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (314, CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), CAST(N'2021-01-24T00:54:45.3900000' AS DateTime2), 428, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (315, CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), CAST(N'2021-01-24T00:55:23.2500000' AS DateTime2), 430, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (316, CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), CAST(N'2021-01-24T00:56:42.4300000' AS DateTime2), 432, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (317, CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), CAST(N'2021-01-24T00:57:29.9900000' AS DateTime2), 434, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (318, CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), CAST(N'2021-01-24T00:58:48.3800000' AS DateTime2), 436, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (319, CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), CAST(N'2021-01-24T00:59:18.3800000' AS DateTime2), 438, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (320, CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), CAST(N'2021-01-24T00:59:50.0600000' AS DateTime2), 440, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (321, CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), CAST(N'2021-01-24T01:00:24.8700000' AS DateTime2), 442, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (322, CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), CAST(N'2021-01-24T01:01:30.6700000' AS DateTime2), 444, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (323, CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), CAST(N'2021-01-24T01:02:14.1600000' AS DateTime2), 446, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (324, CAST(N'2021-01-24T01:19:32.2300000' AS DateTime2), CAST(N'2021-01-24T01:19:32.2300000' AS DateTime2), 448, 8, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (325, CAST(N'2021-01-24T01:35:51.6500000' AS DateTime2), CAST(N'2021-01-24T01:35:51.6500000' AS DateTime2), 449, 19, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (326, CAST(N'2021-01-24T01:40:37.0000000' AS DateTime2), CAST(N'2021-01-24T01:40:37.0000000' AS DateTime2), 450, 14, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (327, CAST(N'2021-01-24T01:42:28.4500000' AS DateTime2), CAST(N'2021-01-24T01:42:28.4500000' AS DateTime2), 451, 26, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (328, CAST(N'2021-01-24T01:43:19.1900000' AS DateTime2), CAST(N'2021-01-24T01:43:19.1900000' AS DateTime2), 452, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (329, CAST(N'2021-01-24T02:10:45.7300000' AS DateTime2), CAST(N'2021-01-24T02:10:45.7300000' AS DateTime2), 456, 34, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (330, CAST(N'2021-01-24T02:20:54.7800000' AS DateTime2), CAST(N'2021-01-24T02:20:54.7800000' AS DateTime2), 457, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (1277, CAST(N'2021-01-30T23:31:15.1800000' AS DateTime2), CAST(N'2021-01-30T23:31:15.1800000' AS DateTime2), 1360, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (1278, CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), CAST(N'2021-01-31T00:40:33.9200000' AS DateTime2), 1361, 7, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (1279, CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), CAST(N'2021-01-31T00:54:00.8200000' AS DateTime2), 1362, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (1280, CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), CAST(N'2021-01-31T01:19:33.5800000' AS DateTime2), 1363, 28, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (1281, CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), CAST(N'2021-01-31T01:21:08.7500000' AS DateTime2), 1364, 13, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (1282, CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), CAST(N'2021-01-31T01:28:44.0600000' AS DateTime2), 1365, 26, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (1283, CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), CAST(N'2021-01-31T01:31:15.1000000' AS DateTime2), 1366, 23, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (1284, CAST(N'2021-01-31T01:32:19.3800000' AS DateTime2), CAST(N'2021-01-31T01:32:19.3800000' AS DateTime2), 1367, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (1285, CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), CAST(N'2021-01-31T01:40:36.7000000' AS DateTime2), 1368, 28, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (1286, CAST(N'2021-01-31T01:42:46.4000000' AS DateTime2), CAST(N'2021-01-31T01:42:46.4000000' AS DateTime2), 1369, 32, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2277, CAST(N'2021-02-07T00:20:52.0400000' AS DateTime2), CAST(N'2021-02-07T00:20:52.0400000' AS DateTime2), 2360, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2278, CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), CAST(N'2021-02-07T00:21:08.1700000' AS DateTime2), 2361, 14, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2279, CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), CAST(N'2021-02-07T00:21:22.2100000' AS DateTime2), 2362, 27, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2280, CAST(N'2021-02-07T00:24:45.5800000' AS DateTime2), CAST(N'2021-02-07T00:24:45.5800000' AS DateTime2), 2363, 14, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2281, CAST(N'2021-02-07T00:34:31.3200000' AS DateTime2), CAST(N'2021-02-07T00:34:31.3200000' AS DateTime2), 2364, 25, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2282, CAST(N'2021-02-07T00:34:36.0200000' AS DateTime2), CAST(N'2021-02-07T00:34:36.0200000' AS DateTime2), 2365, 25, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2283, CAST(N'2021-02-07T00:35:19.5700000' AS DateTime2), CAST(N'2021-02-07T00:35:19.5700000' AS DateTime2), 2366, 25, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2284, CAST(N'2021-02-07T00:44:30.7300000' AS DateTime2), CAST(N'2021-02-07T00:44:30.7300000' AS DateTime2), 2367, 134, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2285, CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), CAST(N'2021-02-07T00:44:34.3000000' AS DateTime2), 2368, 134, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2286, CAST(N'2021-02-07T00:44:50.1400000' AS DateTime2), CAST(N'2021-02-07T00:44:50.1400000' AS DateTime2), 2369, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2287, CAST(N'2021-02-07T00:44:51.9200000' AS DateTime2), CAST(N'2021-02-07T00:44:51.9200000' AS DateTime2), 2370, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2288, CAST(N'2021-02-07T00:47:24.9200000' AS DateTime2), CAST(N'2021-02-07T00:47:24.9200000' AS DateTime2), 2371, 135, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2289, CAST(N'2021-02-07T00:53:08.9600000' AS DateTime2), CAST(N'2021-02-07T00:53:08.9600000' AS DateTime2), 2372, 8, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2290, CAST(N'2021-02-07T00:58:29.7100000' AS DateTime2), CAST(N'2021-02-07T00:58:29.7100000' AS DateTime2), 2373, 9, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2291, CAST(N'2021-02-07T01:08:40.2700000' AS DateTime2), CAST(N'2021-02-07T01:08:40.2700000' AS DateTime2), 2374, 28, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2292, CAST(N'2021-02-07T01:10:15.8900000' AS DateTime2), CAST(N'2021-02-07T01:10:15.8900000' AS DateTime2), 2375, 32, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2293, CAST(N'2021-02-07T01:11:03.3100000' AS DateTime2), CAST(N'2021-02-07T01:11:03.3100000' AS DateTime2), 2376, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2294, CAST(N'2021-02-07T01:23:03.8100000' AS DateTime2), CAST(N'2021-02-07T01:23:03.8100000' AS DateTime2), 2377, 9, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2295, CAST(N'2021-02-07T01:34:28.0600000' AS DateTime2), CAST(N'2021-02-07T01:34:28.0600000' AS DateTime2), 2378, 28, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2296, CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), CAST(N'2021-02-07T01:37:49.9900000' AS DateTime2), 2379, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2297, CAST(N'2021-02-07T01:39:15.4700000' AS DateTime2), CAST(N'2021-02-07T01:39:15.4700000' AS DateTime2), 2381, 26, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2298, CAST(N'2021-02-07T01:44:59.2800000' AS DateTime2), CAST(N'2021-02-07T01:44:59.2800000' AS DateTime2), 2382, 9, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2299, CAST(N'2021-02-07T01:50:33.4600000' AS DateTime2), CAST(N'2021-02-07T01:50:33.4600000' AS DateTime2), 2383, 33, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2300, CAST(N'2021-02-07T01:55:14.2400000' AS DateTime2), CAST(N'2021-02-07T01:55:14.2400000' AS DateTime2), 2384, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2301, CAST(N'2021-02-07T02:08:00.2900000' AS DateTime2), CAST(N'2021-02-07T02:08:00.2900000' AS DateTime2), 2385, 12, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2302, CAST(N'2021-02-07T02:09:10.3400000' AS DateTime2), CAST(N'2021-02-07T02:09:10.3400000' AS DateTime2), 2386, 12, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2303, CAST(N'2021-02-07T02:13:21.3600000' AS DateTime2), CAST(N'2021-02-07T02:13:21.3600000' AS DateTime2), 2387, 12, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2304, CAST(N'2021-02-07T02:17:24.0100000' AS DateTime2), CAST(N'2021-02-07T02:17:24.0100000' AS DateTime2), 2388, 12, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2305, CAST(N'2021-02-07T02:25:00.5700000' AS DateTime2), CAST(N'2021-02-07T02:25:00.5700000' AS DateTime2), 2389, 19, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2306, CAST(N'2021-02-07T02:26:35.7200000' AS DateTime2), CAST(N'2021-02-07T02:26:35.7200000' AS DateTime2), 2390, 18, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2307, CAST(N'2021-02-13T23:24:31.4700000' AS DateTime2), CAST(N'2021-02-13T23:24:31.4700000' AS DateTime2), 2391, 8, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2308, CAST(N'2021-02-13T23:25:02.3700000' AS DateTime2), CAST(N'2021-02-13T23:25:02.3700000' AS DateTime2), 2392, 27, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2309, CAST(N'2021-02-13T23:38:59.3500000' AS DateTime2), CAST(N'2021-02-13T23:38:59.3500000' AS DateTime2), 2393, 10, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2310, CAST(N'2021-02-14T00:02:15.3000000' AS DateTime2), CAST(N'2021-02-14T00:02:15.3000000' AS DateTime2), 2394, 8, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2311, CAST(N'2021-02-14T00:02:59.3400000' AS DateTime2), CAST(N'2021-02-14T00:02:59.3400000' AS DateTime2), 2395, 14, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2312, CAST(N'2021-02-14T00:20:43.2900000' AS DateTime2), CAST(N'2021-02-14T00:20:43.2900000' AS DateTime2), 2396, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2313, CAST(N'2021-02-14T00:22:09.2700000' AS DateTime2), CAST(N'2021-02-14T00:22:09.2700000' AS DateTime2), 2397, 13, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2314, CAST(N'2021-02-14T00:31:00.1200000' AS DateTime2), CAST(N'2021-02-14T00:31:00.1200000' AS DateTime2), 2398, 9, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2315, CAST(N'2021-02-14T00:32:52.4900000' AS DateTime2), CAST(N'2021-02-14T00:32:52.4900000' AS DateTime2), 2399, 14, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2316, CAST(N'2021-02-14T00:45:17.7800000' AS DateTime2), CAST(N'2021-02-14T00:45:17.7800000' AS DateTime2), 2400, 13, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2317, CAST(N'2021-02-14T00:50:01.6800000' AS DateTime2), CAST(N'2021-02-14T00:50:01.6800000' AS DateTime2), 2401, 8, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2318, CAST(N'2021-02-14T00:54:25.1000000' AS DateTime2), CAST(N'2021-02-14T00:54:25.1000000' AS DateTime2), 2402, 8, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2319, CAST(N'2021-02-14T00:55:38.6300000' AS DateTime2), CAST(N'2021-02-14T00:55:38.6300000' AS DateTime2), 2403, 13, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2320, CAST(N'2021-02-14T00:57:01.7500000' AS DateTime2), CAST(N'2021-02-14T00:57:01.7500000' AS DateTime2), 2404, 136, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2321, CAST(N'2021-02-14T01:01:39.9800000' AS DateTime2), CAST(N'2021-02-14T01:01:39.9800000' AS DateTime2), 2405, 33, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2322, CAST(N'2021-02-14T01:01:49.8400000' AS DateTime2), CAST(N'2021-02-14T01:01:49.8400000' AS DateTime2), 2406, 33, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2323, CAST(N'2021-02-14T01:02:01.8900000' AS DateTime2), CAST(N'2021-02-14T01:02:01.8900000' AS DateTime2), 2407, 33, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2324, CAST(N'2021-02-14T01:03:46.3500000' AS DateTime2), CAST(N'2021-02-14T01:03:46.3500000' AS DateTime2), 2408, 9, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2325, CAST(N'2021-02-14T01:10:43.4600000' AS DateTime2), CAST(N'2021-02-14T01:10:43.4600000' AS DateTime2), 2409, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2326, CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), CAST(N'2021-02-14T01:20:54.7300000' AS DateTime2), 2413, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2327, CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), CAST(N'2021-02-14T01:24:39.7400000' AS DateTime2), 2415, 16, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2328, CAST(N'2021-02-14T01:27:44.4900000' AS DateTime2), CAST(N'2021-02-14T01:27:44.4900000' AS DateTime2), 2417, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2329, CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), CAST(N'2021-02-14T01:27:52.1600000' AS DateTime2), 2418, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2330, CAST(N'2021-02-14T01:33:59.8600000' AS DateTime2), CAST(N'2021-02-14T01:33:59.8600000' AS DateTime2), 2419, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2331, CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), CAST(N'2021-02-14T01:34:12.2300000' AS DateTime2), 2420, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2332, CAST(N'2021-02-14T01:36:19.2900000' AS DateTime2), CAST(N'2021-02-14T01:36:19.2900000' AS DateTime2), 2421, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2333, CAST(N'2021-02-14T01:36:28.1800000' AS DateTime2), CAST(N'2021-02-14T01:36:28.1800000' AS DateTime2), 2422, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2334, CAST(N'2021-02-14T01:40:17.2700000' AS DateTime2), CAST(N'2021-02-14T01:40:17.2700000' AS DateTime2), 2423, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2335, CAST(N'2021-02-14T01:41:29.2400000' AS DateTime2), CAST(N'2021-02-14T01:41:29.2400000' AS DateTime2), 2424, 2, 0)
GO
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2336, CAST(N'2021-02-14T01:44:57.0500000' AS DateTime2), CAST(N'2021-02-14T01:44:57.0500000' AS DateTime2), 2425, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2337, CAST(N'2021-02-14T01:46:32.0600000' AS DateTime2), CAST(N'2021-02-14T01:46:32.0600000' AS DateTime2), 2426, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2338, CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), CAST(N'2021-02-14T01:48:36.0600000' AS DateTime2), 2427, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2339, CAST(N'2021-02-14T01:49:53.8400000' AS DateTime2), CAST(N'2021-02-14T01:49:53.8400000' AS DateTime2), 2429, 33, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2340, CAST(N'2021-02-14T01:54:03.1600000' AS DateTime2), CAST(N'2021-02-14T01:54:03.1600000' AS DateTime2), 2430, 19, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2341, CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), CAST(N'2021-02-14T01:58:04.4100000' AS DateTime2), 2431, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2342, CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), CAST(N'2021-02-14T02:01:59.6200000' AS DateTime2), 2433, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2343, CAST(N'2021-02-14T02:03:04.3200000' AS DateTime2), CAST(N'2021-02-14T02:03:04.3200000' AS DateTime2), 2435, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2344, CAST(N'2021-02-14T02:05:30.1900000' AS DateTime2), CAST(N'2021-02-14T02:05:30.1900000' AS DateTime2), 2436, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2345, CAST(N'2021-02-14T02:07:42.5000000' AS DateTime2), CAST(N'2021-02-14T02:07:42.5000000' AS DateTime2), 2437, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2346, CAST(N'2021-02-14T02:07:57.6000000' AS DateTime2), CAST(N'2021-02-14T02:07:57.6000000' AS DateTime2), 2438, 2, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2347, CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), CAST(N'2021-02-14T02:16:48.9400000' AS DateTime2), 2439, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2348, CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), CAST(N'2021-02-14T02:17:45.7100000' AS DateTime2), 2441, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2349, CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), CAST(N'2021-02-14T02:18:30.8700000' AS DateTime2), 2443, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2350, CAST(N'2021-02-14T02:21:03.1000000' AS DateTime2), CAST(N'2021-02-14T02:21:03.1000000' AS DateTime2), 2445, 19, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2351, CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), CAST(N'2021-02-14T02:23:50.5900000' AS DateTime2), 2446, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2352, CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), CAST(N'2021-02-14T02:24:56.6200000' AS DateTime2), 2448, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2353, CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), CAST(N'2021-02-14T02:25:20.0500000' AS DateTime2), 2450, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2354, CAST(N'2021-02-14T02:26:50.8000000' AS DateTime2), CAST(N'2021-02-14T02:26:50.8000000' AS DateTime2), 2452, 33, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2355, CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), CAST(N'2021-02-14T02:28:50.3500000' AS DateTime2), 2453, 2, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2356, CAST(N'2021-02-14T02:29:51.3000000' AS DateTime2), CAST(N'2021-02-14T02:29:51.3000000' AS DateTime2), 2455, 11, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2357, CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), CAST(N'2021-02-14T02:30:18.6200000' AS DateTime2), 2456, 11, 1)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2358, CAST(N'2021-02-14T02:39:44.9800000' AS DateTime2), CAST(N'2021-02-14T02:39:44.9800000' AS DateTime2), 2458, 14, 0)
INSERT [Rolls].[SkillRolls] ([SkillRollId], [DateCreated], [DateModified], [RollId], [SkillTypeId], [Success]) VALUES (2359, CAST(N'2021-02-14T02:40:06.9300000' AS DateTime2), CAST(N'2021-02-14T02:40:06.9300000' AS DateTime2), 2459, 8, 1)
SET IDENTITY_INSERT [Rolls].[SkillRolls] OFF
SET IDENTITY_INSERT [Rolls].[SkillTypes] ON

INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (1, CAST(N'2021-01-02T23:03:17.5000000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5000000' AS DateTime2), N'Test Skill 1')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (2, CAST(N'2021-01-02T23:37:41.7900000' AS DateTime2), CAST(N'2021-01-02T23:37:41.7900000' AS DateTime2), N'Dexterity')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (3, CAST(N'2021-01-02T23:47:43.2600000' AS DateTime2), CAST(N'2021-01-02T23:47:43.2600000' AS DateTime2), N'Initiative')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (4, CAST(N'2021-01-02T23:53:09.1700000' AS DateTime2), CAST(N'2021-01-02T23:53:09.1700000' AS DateTime2), N'Gun')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (5, CAST(N'2021-01-02T23:56:24.7400000' AS DateTime2), CAST(N'2021-01-02T23:56:24.7400000' AS DateTime2), N'Halberd')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (6, CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), CAST(N'2021-01-03T00:05:41.4600000' AS DateTime2), N'Spell')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (7, CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), CAST(N'2021-01-03T00:09:03.1500000' AS DateTime2), N'Medicine')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (8, CAST(N'2021-01-03T00:10:34.6000000' AS DateTime2), CAST(N'2021-01-03T00:10:34.6000000' AS DateTime2), N'Survival')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (9, CAST(N'2021-01-03T00:34:19.1100000' AS DateTime2), CAST(N'2021-01-03T00:34:19.1100000' AS DateTime2), N'Perception')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (10, CAST(N'2021-01-03T00:35:06.6800000' AS DateTime2), CAST(N'2021-01-03T00:35:06.6800000' AS DateTime2), N'Animal Handling')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (11, CAST(N'2021-01-03T00:39:52.7900000' AS DateTime2), CAST(N'2021-01-03T00:39:52.7900000' AS DateTime2), N'Strength')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (12, CAST(N'2021-01-03T00:53:24.9100000' AS DateTime2), CAST(N'2021-01-03T00:53:24.9100000' AS DateTime2), N'Intimidation')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (13, CAST(N'2021-01-03T00:55:01.2300000' AS DateTime2), CAST(N'2021-01-03T00:55:01.2300000' AS DateTime2), N'Investigation')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (14, CAST(N'2021-01-03T01:02:55.3900000' AS DateTime2), CAST(N'2021-01-03T01:02:55.3900000' AS DateTime2), N'Arcana')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (15, CAST(N'2021-01-03T01:04:53.0300000' AS DateTime2), CAST(N'2021-01-03T01:04:53.0300000' AS DateTime2), N'Stength')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (16, CAST(N'2021-01-03T01:22:24.2800000' AS DateTime2), CAST(N'2021-01-03T01:22:24.2800000' AS DateTime2), N'')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (17, CAST(N'2021-01-03T01:43:57.1900000' AS DateTime2), CAST(N'2021-01-03T01:43:57.1900000' AS DateTime2), N'Catapult')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (18, CAST(N'2021-01-03T02:24:56.8800000' AS DateTime2), CAST(N'2021-01-03T02:24:56.8800000' AS DateTime2), N'Insight')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (19, CAST(N'2021-01-03T02:53:27.6000000' AS DateTime2), CAST(N'2021-01-03T02:53:27.6000000' AS DateTime2), N'Constitution')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (20, CAST(N'2021-01-09T16:22:17.0000000' AS DateTime2), CAST(N'2021-01-09T16:22:17.0000000' AS DateTime2), N'My Skill Type')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (21, CAST(N'2021-01-09T23:46:30.8100000' AS DateTime2), CAST(N'2021-01-09T23:46:30.8100000' AS DateTime2), N'Surprise')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (22, CAST(N'2021-01-10T00:05:38.1900000' AS DateTime2), CAST(N'2021-01-10T00:05:38.1900000' AS DateTime2), N'Word Check')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (23, CAST(N'2021-01-10T00:37:01.8300000' AS DateTime2), CAST(N'2021-01-10T00:37:01.8300000' AS DateTime2), N'Deception')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (24, CAST(N'2021-01-10T00:38:41.5900000' AS DateTime2), CAST(N'2021-01-10T00:38:41.5900000' AS DateTime2), N'Wisdom')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (25, CAST(N'2021-01-10T00:55:32.3800000' AS DateTime2), CAST(N'2021-01-10T00:55:32.3800000' AS DateTime2), N'Sleight of Hand')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (26, CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), CAST(N'2021-01-10T01:09:11.0900000' AS DateTime2), N'Performance')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (27, CAST(N'2021-01-10T01:14:10.8900000' AS DateTime2), CAST(N'2021-01-10T01:14:10.8900000' AS DateTime2), N'Intelligence')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (28, CAST(N'2021-01-10T01:26:00.0000000' AS DateTime2), CAST(N'2021-01-10T01:26:00.0000000' AS DateTime2), N'Stealth')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (29, CAST(N'2021-01-10T01:57:32.4100000' AS DateTime2), CAST(N'2021-01-10T01:57:32.4100000' AS DateTime2), N'Acrobatic')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (30, CAST(N'2021-01-11T23:44:10.9800000' AS DateTime2), CAST(N'2021-01-11T23:44:10.9800000' AS DateTime2), N'My Type')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (31, CAST(N'2021-01-16T15:44:05.4600000' AS DateTime2), CAST(N'2021-01-16T15:44:05.4600000' AS DateTime2), N'afaf')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (32, CAST(N'2021-01-17T00:28:51.9200000' AS DateTime2), CAST(N'2021-01-17T00:28:51.9200000' AS DateTime2), N'Acrobatics')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (33, CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), CAST(N'2021-01-17T00:29:37.3800000' AS DateTime2), N'Athletics')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (34, CAST(N'2021-01-24T02:10:45.7300000' AS DateTime2), CAST(N'2021-01-24T02:10:45.7300000' AS DateTime2), N'Charisma')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (134, CAST(N'2021-02-07T00:44:30.7300000' AS DateTime2), CAST(N'2021-02-07T00:44:30.7300000' AS DateTime2), N'Perceptionof Hand')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (135, CAST(N'2021-02-07T00:47:24.9100000' AS DateTime2), CAST(N'2021-02-07T00:47:24.9100000' AS DateTime2), N'Persuasion')
INSERT [Rolls].[SkillTypes] ([SkillTypeId], [DateCreated], [DateModified], [Name]) VALUES (136, CAST(N'2021-02-14T00:57:01.7500000' AS DateTime2), CAST(N'2021-02-14T00:57:01.7500000' AS DateTime2), N'History')
SET IDENTITY_INSERT [Rolls].[SkillTypes] OFF
SET IDENTITY_INSERT [Users].[AccessLevels] ON

INSERT [Users].[AccessLevels] ([AccessLevelId], [DateCreated], [DateModified], [DisplayName], [CanRead], [CanWrite], [CanDelete]) VALUES (1, CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), N'Owner', 1, 1, 1)
INSERT [Users].[AccessLevels] ([AccessLevelId], [DateCreated], [DateModified], [DisplayName], [CanRead], [CanWrite], [CanDelete]) VALUES (2, CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), N'Administrator', 1, 1, 1)
INSERT [Users].[AccessLevels] ([AccessLevelId], [DateCreated], [DateModified], [DisplayName], [CanRead], [CanWrite], [CanDelete]) VALUES (3, CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), N'Writer', 1, 1, 0)
INSERT [Users].[AccessLevels] ([AccessLevelId], [DateCreated], [DateModified], [DisplayName], [CanRead], [CanWrite], [CanDelete]) VALUES (4, CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), CAST(N'2021-01-02T23:03:17.4700000' AS DateTime2), N'Reader', 1, 0, 0)
SET IDENTITY_INSERT [Users].[AccessLevels] OFF
SET IDENTITY_INSERT [Users].[UserNames] ON

INSERT [Users].[UserNames] ([UserNameId], [DateCreated], [DateModified], [Name]) VALUES (1, CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), N'Michael')
INSERT [Users].[UserNames] ([UserNameId], [DateCreated], [DateModified], [Name]) VALUES (2, CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), N'Scott')
INSERT [Users].[UserNames] ([UserNameId], [DateCreated], [DateModified], [Name]) VALUES (3, CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), N'Royster')
INSERT [Users].[UserNames] ([UserNameId], [DateCreated], [DateModified], [Name]) VALUES (4, CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), N'Matthew')
INSERT [Users].[UserNames] ([UserNameId], [DateCreated], [DateModified], [Name]) VALUES (5, CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), N'')
INSERT [Users].[UserNames] ([UserNameId], [DateCreated], [DateModified], [Name]) VALUES (6, CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), N'Barnes')
INSERT [Users].[UserNames] ([UserNameId], [DateCreated], [DateModified], [Name]) VALUES (7, CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), N'Edward')
INSERT [Users].[UserNames] ([UserNameId], [DateCreated], [DateModified], [Name]) VALUES (8, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), N'Quigley')
INSERT [Users].[UserNames] ([UserNameId], [DateCreated], [DateModified], [Name]) VALUES (9, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), N'Noah')
INSERT [Users].[UserNames] ([UserNameId], [DateCreated], [DateModified], [Name]) VALUES (10, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), N'Horn')
SET IDENTITY_INSERT [Users].[UserNames] OFF
SET IDENTITY_INSERT [Users].[Users] ON

INSERT [Users].[Users] ([UserId], [EntityId], [DateCreated], [DateModified], [Handle], [Email], [PasswordHash], [FirstNameId], [MiddleNameId], [LastNameId]) VALUES (1, 3, CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), N'Rauell', N'me@michaelroyster.org', 0x5AB76C23B341B601FBD1B2EB62FD179BD43000329268C4083DB8DDFA0AE88D838A3C503B0A327E2260E70CCFEE77F7BBA1943DE6E034D0D4AE17C2CC4F7D53B1, 1, 2, 3)
INSERT [Users].[Users] ([UserId], [EntityId], [DateCreated], [DateModified], [Handle], [Email], [PasswordHash], [FirstNameId], [MiddleNameId], [LastNameId]) VALUES (2, 4, CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5500000' AS DateTime2), N'mbarnes', N'mbarnes@michaelroyster.org', 0x149F58A9685169C0145258498A07795E271C5924E079F2A22F5FEA7B818C6FE8409C996707E312D0703158931C3CD83B7F61DF00414AC3A4BE2BA6D942B54272, 4, 5, 6)
INSERT [Users].[Users] ([UserId], [EntityId], [DateCreated], [DateModified], [Handle], [Email], [PasswordHash], [FirstNameId], [MiddleNameId], [LastNameId]) VALUES (3, 5, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), N'equigley', N'equigley@michaelroyster.org', 0x3E92C5787EA55D039B8CD9B56772F9C49A1924B5477FA5C5E03D7CFC51DC3BE7A5D8A343560D2CFE0E47A2DB4E9EA6792DB405EF1EA7ED6E6532CC78A0D5997B, 7, 5, 8)
INSERT [Users].[Users] ([UserId], [EntityId], [DateCreated], [DateModified], [Handle], [Email], [PasswordHash], [FirstNameId], [MiddleNameId], [LastNameId]) VALUES (4, 6, CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), CAST(N'2021-01-02T23:03:17.5600000' AS DateTime2), N'nhorn', N'nhorn@michaelroyster.org', 0x3243A2805DF2AE2647BC1ED0F74DB6B0412F4B2D1ACAFFDCA079DF4A174E1B871BAFCBE93A82EF25D4B300F2D071C803D9178120DA84B35D529B4848CFAC0E7F, 9, 5, 10)
SET IDENTITY_INSERT [Users].[Users] OFF
/****** Object:  Index [UC_Entities_Entities_PublicId]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Entities].[Entities] ADD  CONSTRAINT [UC_Entities_Entities_PublicId] UNIQUE NONCLUSTERED
(
	[PublicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Entities_Names_Name]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Entities].[Names] ADD  CONSTRAINT [UC_Entities_Names_Name] UNIQUE NONCLUSTERED
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Games_Campaigns_EntityId]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Games].[Campaigns] ADD  CONSTRAINT [UC_Games_Campaigns_EntityId] UNIQUE NONCLUSTERED
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Games_Characters_EntityId]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Games].[Characters] ADD  CONSTRAINT [UC_Games_Characters_EntityId] UNIQUE NONCLUSTERED
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Games_Encounters_EntityId]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Games].[Encounters] ADD  CONSTRAINT [UC_Games_Encounters_EntityId] UNIQUE NONCLUSTERED
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Games_Encounters_SessionId_SessionSortOrder]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Games].[Encounters] ADD  CONSTRAINT [UC_Games_Encounters_SessionId_SessionSortOrder] UNIQUE NONCLUSTERED
(
	[SessionId] ASC,
	[SessionSortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Games_Sessions_CampaignId_CampaignSortOrder]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Games].[Sessions] ADD  CONSTRAINT [UC_Games_Sessions_CampaignId_CampaignSortOrder] UNIQUE NONCLUSTERED
(
	[CampaignId] ASC,
	[CampaignSortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Games_Sessions_EntityId]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Games].[Sessions] ADD  CONSTRAINT [UC_Games_Sessions_EntityId] UNIQUE NONCLUSTERED
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Rolls_AttackRolls_HitRollId_DamageRollId]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Rolls].[AttackRolls] ADD  CONSTRAINT [UC_Rolls_AttackRolls_HitRollId_DamageRollId] UNIQUE NONCLUSTERED
(
	[HitRollId] ASC,
	[DamageRollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Rolls_DamageSources_Name]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Rolls].[DamageSources] ADD  CONSTRAINT [UC_Rolls_DamageSources_Name] UNIQUE NONCLUSTERED
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Rolls_DamageTypes_Name]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Rolls].[DamageTypes] ADD  CONSTRAINT [UC_Rolls_DamageTypes_Name] UNIQUE NONCLUSTERED
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Rolls_InitiativeRolls_RollId]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Rolls].[InitiativeRolls] ADD  CONSTRAINT [UC_Rolls_InitiativeRolls_RollId] UNIQUE NONCLUSTERED
(
	[RollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Rolls_Rolls_EntityId]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Rolls].[Rolls] ADD  CONSTRAINT [UC_Rolls_Rolls_EntityId] UNIQUE NONCLUSTERED
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [DF_Rolls_RollsToEntities_RollId_EntityId]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Rolls].[RollsToEntities] ADD  CONSTRAINT [DF_Rolls_RollsToEntities_RollId_EntityId] UNIQUE NONCLUSTERED
(
	[RollId] ASC,
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Rolls_SkillRolls_RollId]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Rolls].[SkillRolls] ADD  CONSTRAINT [UC_Rolls_SkillRolls_RollId] UNIQUE NONCLUSTERED
(
	[RollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Rolls_SkillTypes_Name]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Rolls].[SkillTypes] ADD  CONSTRAINT [UC_Rolls_SkillTypes_Name] UNIQUE NONCLUSTERED
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Users_AccessLevels_DisplayName]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Users].[AccessLevels] ADD  CONSTRAINT [UC_Users_AccessLevels_DisplayName] UNIQUE NONCLUSTERED
(
	[DisplayName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Users_UserNames_Name]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Users].[UserNames] ADD  CONSTRAINT [UC_Users_UserNames_Name] UNIQUE NONCLUSTERED
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Users_Users_Email]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Users].[Users] ADD  CONSTRAINT [UC_Users_Users_Email] UNIQUE NONCLUSTERED
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Users_Users_EntityId]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Users].[Users] ADD  CONSTRAINT [UC_Users_Users_EntityId] UNIQUE NONCLUSTERED
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Users_Users_Handle]    Script Date: 2/20/2021 5:01:14 PM ******/
ALTER TABLE [Users].[Users] ADD  CONSTRAINT [UC_Users_Users_Handle] UNIQUE NONCLUSTERED
(
	[Handle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Entities].[Entities] ADD  CONSTRAINT [DF_Entities_Entities_PublicId]  DEFAULT (newsequentialid()) FOR [PublicId]
GO
ALTER TABLE [Entities].[Entities] ADD  CONSTRAINT [DF_Entities_Entities_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Entities].[Entities] ADD  CONSTRAINT [DF_Entities_Entities_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Entities].[Entities] ADD  CONSTRAINT [DF_Entities_Entities_IsPublic]  DEFAULT ((1)) FOR [IsPublic]
GO
ALTER TABLE [Entities].[Entities] ADD  CONSTRAINT [DF_Entities_Entities_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [Entities].[Names] ADD  CONSTRAINT [DF_Entities_Names_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Entities].[Names] ADD  CONSTRAINT [DF_Entities_Names_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Games].[Campaigns] ADD  CONSTRAINT [DF_Games_Campaigns_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Games].[Campaigns] ADD  CONSTRAINT [DF_Games_Campaigns_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Games].[Characters] ADD  CONSTRAINT [DF_Games_Characters_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Games].[Characters] ADD  CONSTRAINT [DF_Games_Characters_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Games].[CharactersToCampaigns] ADD  CONSTRAINT [DF_Games_CharactersToCampaigns_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Games].[CharactersToCampaigns] ADD  CONSTRAINT [DF_Games_CharactersToCampaigns_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Games].[CharactersToUsers] ADD  CONSTRAINT [DF_Games_CharactersToUsers_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Games].[CharactersToUsers] ADD  CONSTRAINT [DF_Games_CharactersToUsers_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Games].[Encounters] ADD  CONSTRAINT [DF_Games_Encounters_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Games].[Encounters] ADD  CONSTRAINT [DF_Games_Encounters_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Games].[Encounters] ADD  CONSTRAINT [DF_Games_Encounters_SessionSortOrder]  DEFAULT ((0)) FOR [SessionSortOrder]
GO
ALTER TABLE [Games].[Sessions] ADD  CONSTRAINT [DF_Games_Sessions_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Games].[Sessions] ADD  CONSTRAINT [DF_Games_Sessions_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Games].[Sessions] ADD  CONSTRAINT [DF_Games_Sessions_CampaignSortOrder]  DEFAULT ((0)) FOR [CampaignSortOrder]
GO
ALTER TABLE [Rolls].[AttackRolls] ADD  CONSTRAINT [DF_Rolls_AttackRolls_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[AttackRolls] ADD  CONSTRAINT [DF_Rolls_AttackRolls_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[DamageSources] ADD  CONSTRAINT [DF_Rolls_DamageSources_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[DamageSources] ADD  CONSTRAINT [DF_Rolls_DamageSources_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[DamageTypes] ADD  CONSTRAINT [DF_Rolls_DamageTypes_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[DamageTypes] ADD  CONSTRAINT [DF_Rolls_DamageTypes_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[DieTypes] ADD  CONSTRAINT [DF_Rolls_DieTypes_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[DieTypes] ADD  CONSTRAINT [DF_Rolls_DieTypes_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[IndividualRolls] ADD  CONSTRAINT [DF_Rolls_IndividualRolls_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[IndividualRolls] ADD  CONSTRAINT [DF_Rolls_IndividualRolls_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[InitiativeRolls] ADD  CONSTRAINT [DF_Rolls_InitiativeRolls_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[InitiativeRolls] ADD  CONSTRAINT [DF_Rolls_InitiativeRolls_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[RollComments] ADD  CONSTRAINT [DF_Rolls_Comments_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[RollComments] ADD  CONSTRAINT [DF_Rolls_Comments_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[RollModifiers] ADD  CONSTRAINT [DF_Rolls_RollModifiers_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[RollModifiers] ADD  CONSTRAINT [DF_Rolls_RollModifiers_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[Rolls] ADD  CONSTRAINT [DF_Rolls_Rolls_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[Rolls] ADD  CONSTRAINT [DF_Rolls_Rolls_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[RollsToCharacters] ADD  CONSTRAINT [DF_Rolls_RollsToCharacters_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[RollsToCharacters] ADD  CONSTRAINT [DF_Rolls_RollsToCharacters_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[RollsToEntities] ADD  CONSTRAINT [DF_Dice_RollsToEntities_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[RollsToEntities] ADD  CONSTRAINT [DF_Dice_RollsToEntities_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[RollsToUsers] ADD  CONSTRAINT [DF_Rolls_RollsToUsers_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[RollsToUsers] ADD  CONSTRAINT [DF_Rolls_RollsToUsers_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[SkillRolls] ADD  CONSTRAINT [DF_Rolls_SkillRolls_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[SkillRolls] ADD  CONSTRAINT [DF_Rolls_SkillRolls_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Rolls].[SkillTypes] ADD  CONSTRAINT [DF_Rolls_SkillTypes_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Rolls].[SkillTypes] ADD  CONSTRAINT [DF_Rolls_SkillTypes_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Users].[AccessLevels] ADD  CONSTRAINT [DF_Users_AccessLevels_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Users].[AccessLevels] ADD  CONSTRAINT [DF_Users_AccessLevels_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Users].[AccessLevels] ADD  CONSTRAINT [DF_Users_AccessLevels_CanRead]  DEFAULT ((0)) FOR [CanRead]
GO
ALTER TABLE [Users].[AccessLevels] ADD  CONSTRAINT [DF_Users_AccessLevels_CanWrite]  DEFAULT ((0)) FOR [CanWrite]
GO
ALTER TABLE [Users].[AccessLevels] ADD  CONSTRAINT [DF_Users_AccessLevels_CanDelete]  DEFAULT ((0)) FOR [CanDelete]
GO
ALTER TABLE [Users].[UserNames] ADD  CONSTRAINT [DF_Users_UserNames_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Users].[UserNames] ADD  CONSTRAINT [DF_Users_UserNames_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Users].[Users] ADD  CONSTRAINT [DF_Users_Users_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [Users].[Users] ADD  CONSTRAINT [DF_Users_Users_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [Games].[Campaigns]  WITH CHECK ADD  CONSTRAINT [FK_Games_Campaigns_Entities_Entities] FOREIGN KEY([EntityId])
REFERENCES [Entities].[Entities] ([EntityId])
GO
ALTER TABLE [Games].[Campaigns] CHECK CONSTRAINT [FK_Games_Campaigns_Entities_Entities]
GO
ALTER TABLE [Games].[Campaigns]  WITH CHECK ADD  CONSTRAINT [FK_Games_Campaigns_Entities_Names] FOREIGN KEY([NameId])
REFERENCES [Entities].[Names] ([NameId])
GO
ALTER TABLE [Games].[Campaigns] CHECK CONSTRAINT [FK_Games_Campaigns_Entities_Names]
GO
ALTER TABLE [Games].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Games_Characters_Entities_Entities] FOREIGN KEY([EntityId])
REFERENCES [Entities].[Entities] ([EntityId])
GO
ALTER TABLE [Games].[Characters] CHECK CONSTRAINT [FK_Games_Characters_Entities_Entities]
GO
ALTER TABLE [Games].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Games_Characters_Entities_Names] FOREIGN KEY([NameId])
REFERENCES [Entities].[Names] ([NameId])
GO
ALTER TABLE [Games].[Characters] CHECK CONSTRAINT [FK_Games_Characters_Entities_Names]
GO
ALTER TABLE [Games].[CharactersToCampaigns]  WITH CHECK ADD  CONSTRAINT [FK_Games_CharactersToCampaigns_Games_Campaigns] FOREIGN KEY([CampaignId])
REFERENCES [Games].[Campaigns] ([CampaignId])
GO
ALTER TABLE [Games].[CharactersToCampaigns] CHECK CONSTRAINT [FK_Games_CharactersToCampaigns_Games_Campaigns]
GO
ALTER TABLE [Games].[CharactersToCampaigns]  WITH CHECK ADD  CONSTRAINT [FK_Games_CharactersToCampaigns_Games_Characters] FOREIGN KEY([CharacterId])
REFERENCES [Games].[Characters] ([CharacterId])
GO
ALTER TABLE [Games].[CharactersToCampaigns] CHECK CONSTRAINT [FK_Games_CharactersToCampaigns_Games_Characters]
GO
ALTER TABLE [Games].[CharactersToUsers]  WITH CHECK ADD  CONSTRAINT [FK_Games_CharactersToUsers_Games_Characters] FOREIGN KEY([CharacterId])
REFERENCES [Games].[Characters] ([CharacterId])
GO
ALTER TABLE [Games].[CharactersToUsers] CHECK CONSTRAINT [FK_Games_CharactersToUsers_Games_Characters]
GO
ALTER TABLE [Games].[CharactersToUsers]  WITH CHECK ADD  CONSTRAINT [FK_Games_CharactersToUsers_Users_AccessLevels] FOREIGN KEY([AccessLevelId])
REFERENCES [Users].[AccessLevels] ([AccessLevelId])
GO
ALTER TABLE [Games].[CharactersToUsers] CHECK CONSTRAINT [FK_Games_CharactersToUsers_Users_AccessLevels]
GO
ALTER TABLE [Games].[CharactersToUsers]  WITH CHECK ADD  CONSTRAINT [FK_Games_CharactersToUsers_Users_Users] FOREIGN KEY([UserId])
REFERENCES [Users].[Users] ([UserId])
GO
ALTER TABLE [Games].[CharactersToUsers] CHECK CONSTRAINT [FK_Games_CharactersToUsers_Users_Users]
GO
ALTER TABLE [Games].[Encounters]  WITH CHECK ADD  CONSTRAINT [FK_Games_Encounters_Entities_Entities] FOREIGN KEY([EntityId])
REFERENCES [Entities].[Entities] ([EntityId])
GO
ALTER TABLE [Games].[Encounters] CHECK CONSTRAINT [FK_Games_Encounters_Entities_Entities]
GO
ALTER TABLE [Games].[Encounters]  WITH CHECK ADD  CONSTRAINT [FK_Games_Encounters_Entities_Names] FOREIGN KEY([NameId])
REFERENCES [Entities].[Names] ([NameId])
GO
ALTER TABLE [Games].[Encounters] CHECK CONSTRAINT [FK_Games_Encounters_Entities_Names]
GO
ALTER TABLE [Games].[Encounters]  WITH CHECK ADD  CONSTRAINT [FK_Games_Encounters_Games_Sessions] FOREIGN KEY([SessionId])
REFERENCES [Games].[Sessions] ([SessionId])
GO
ALTER TABLE [Games].[Encounters] CHECK CONSTRAINT [FK_Games_Encounters_Games_Sessions]
GO
ALTER TABLE [Games].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Games_Sessions_Entities_Entities] FOREIGN KEY([EntityId])
REFERENCES [Entities].[Entities] ([EntityId])
GO
ALTER TABLE [Games].[Sessions] CHECK CONSTRAINT [FK_Games_Sessions_Entities_Entities]
GO
ALTER TABLE [Games].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Games_Sessions_Entities_Names] FOREIGN KEY([NameId])
REFERENCES [Entities].[Names] ([NameId])
GO
ALTER TABLE [Games].[Sessions] CHECK CONSTRAINT [FK_Games_Sessions_Entities_Names]
GO
ALTER TABLE [Games].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Games_Sessions_Games_Campaigns] FOREIGN KEY([CampaignId])
REFERENCES [Games].[Campaigns] ([CampaignId])
GO
ALTER TABLE [Games].[Sessions] CHECK CONSTRAINT [FK_Games_Sessions_Games_Campaigns]
GO
ALTER TABLE [Rolls].[AttackRolls]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_AttackRolls_DamageRoll_Rolls_Rolls] FOREIGN KEY([DamageRollId])
REFERENCES [Rolls].[Rolls] ([RollId])
GO
ALTER TABLE [Rolls].[AttackRolls] CHECK CONSTRAINT [FK_Rolls_AttackRolls_DamageRoll_Rolls_Rolls]
GO
ALTER TABLE [Rolls].[AttackRolls]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_AttackRolls_HitRoll_Rolls_Rolls] FOREIGN KEY([HitRollId])
REFERENCES [Rolls].[Rolls] ([RollId])
GO
ALTER TABLE [Rolls].[AttackRolls] CHECK CONSTRAINT [FK_Rolls_AttackRolls_HitRoll_Rolls_Rolls]
GO
ALTER TABLE [Rolls].[AttackRolls]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_AttackRolls_Rolls_DamageSources] FOREIGN KEY([DamageSourceId])
REFERENCES [Rolls].[DamageSources] ([DamageSourceId])
GO
ALTER TABLE [Rolls].[AttackRolls] CHECK CONSTRAINT [FK_Rolls_AttackRolls_Rolls_DamageSources]
GO
ALTER TABLE [Rolls].[DamageSources]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_DamageSources_Rolls_DamageTypes] FOREIGN KEY([DamageTypeId])
REFERENCES [Rolls].[DamageTypes] ([DamageTypeId])
GO
ALTER TABLE [Rolls].[DamageSources] CHECK CONSTRAINT [FK_Rolls_DamageSources_Rolls_DamageTypes]
GO
ALTER TABLE [Rolls].[IndividualRolls]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_IndividualRolls_Rolls_Rolls] FOREIGN KEY([RollId])
REFERENCES [Rolls].[Rolls] ([RollId])
GO
ALTER TABLE [Rolls].[IndividualRolls] CHECK CONSTRAINT [FK_Rolls_IndividualRolls_Rolls_Rolls]
GO
ALTER TABLE [Rolls].[IndividualRolls]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_IndividualRolls_Rolls_Types] FOREIGN KEY([DieTypeId])
REFERENCES [Rolls].[DieTypes] ([DieTypeId])
GO
ALTER TABLE [Rolls].[IndividualRolls] CHECK CONSTRAINT [FK_Rolls_IndividualRolls_Rolls_Types]
GO
ALTER TABLE [Rolls].[InitiativeRolls]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_InitiativeRolls_Rolls_Rolls] FOREIGN KEY([RollId])
REFERENCES [Rolls].[Rolls] ([RollId])
GO
ALTER TABLE [Rolls].[InitiativeRolls] CHECK CONSTRAINT [FK_Rolls_InitiativeRolls_Rolls_Rolls]
GO
ALTER TABLE [Rolls].[RollComments]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_RollComments_Rolls_Rolls] FOREIGN KEY([RollId])
REFERENCES [Rolls].[Rolls] ([RollId])
GO
ALTER TABLE [Rolls].[RollComments] CHECK CONSTRAINT [FK_Rolls_RollComments_Rolls_Rolls]
GO
ALTER TABLE [Rolls].[RollModifiers]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_RollModifiers_Rolls_Rolls] FOREIGN KEY([RollId])
REFERENCES [Rolls].[Rolls] ([RollId])
GO
ALTER TABLE [Rolls].[RollModifiers] CHECK CONSTRAINT [FK_Rolls_RollModifiers_Rolls_Rolls]
GO
ALTER TABLE [Rolls].[Rolls]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_Rolls_Entities_Entities] FOREIGN KEY([EntityId])
REFERENCES [Entities].[Entities] ([EntityId])
GO
ALTER TABLE [Rolls].[Rolls] CHECK CONSTRAINT [FK_Rolls_Rolls_Entities_Entities]
GO
ALTER TABLE [Rolls].[RollsToCharacters]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_RollsToCharacters_Games_Characters] FOREIGN KEY([CharacterId])
REFERENCES [Games].[Characters] ([CharacterId])
GO
ALTER TABLE [Rolls].[RollsToCharacters] CHECK CONSTRAINT [FK_Rolls_RollsToCharacters_Games_Characters]
GO
ALTER TABLE [Rolls].[RollsToCharacters]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_RollsToCharacters_Rolls_Rolls] FOREIGN KEY([RollId])
REFERENCES [Rolls].[Rolls] ([RollId])
GO
ALTER TABLE [Rolls].[RollsToCharacters] CHECK CONSTRAINT [FK_Rolls_RollsToCharacters_Rolls_Rolls]
GO
ALTER TABLE [Rolls].[RollsToEntities]  WITH CHECK ADD  CONSTRAINT [FK_Dice_RollsToEntities_Dice_Rolls] FOREIGN KEY([RollId])
REFERENCES [Rolls].[Rolls] ([RollId])
GO
ALTER TABLE [Rolls].[RollsToEntities] CHECK CONSTRAINT [FK_Dice_RollsToEntities_Dice_Rolls]
GO
ALTER TABLE [Rolls].[RollsToEntities]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_RollsToEntities_Entities_Entities] FOREIGN KEY([EntityId])
REFERENCES [Entities].[Entities] ([EntityId])
GO
ALTER TABLE [Rolls].[RollsToEntities] CHECK CONSTRAINT [FK_Rolls_RollsToEntities_Entities_Entities]
GO
ALTER TABLE [Rolls].[RollsToUsers]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_RollsToUsers_Rolls_Rolls] FOREIGN KEY([RollId])
REFERENCES [Rolls].[Rolls] ([RollId])
GO
ALTER TABLE [Rolls].[RollsToUsers] CHECK CONSTRAINT [FK_Rolls_RollsToUsers_Rolls_Rolls]
GO
ALTER TABLE [Rolls].[RollsToUsers]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_RollsToUsers_Users_Users] FOREIGN KEY([UserId])
REFERENCES [Users].[Users] ([UserId])
GO
ALTER TABLE [Rolls].[RollsToUsers] CHECK CONSTRAINT [FK_Rolls_RollsToUsers_Users_Users]
GO
ALTER TABLE [Rolls].[SkillRolls]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_SkillRolls_Rolls_Rolls] FOREIGN KEY([RollId])
REFERENCES [Rolls].[Rolls] ([RollId])
GO
ALTER TABLE [Rolls].[SkillRolls] CHECK CONSTRAINT [FK_Rolls_SkillRolls_Rolls_Rolls]
GO
ALTER TABLE [Rolls].[SkillRolls]  WITH CHECK ADD  CONSTRAINT [FK_Rolls_SkillRolls_Rolls_SkillTypes] FOREIGN KEY([SkillTypeId])
REFERENCES [Rolls].[SkillTypes] ([SkillTypeId])
GO
ALTER TABLE [Rolls].[SkillRolls] CHECK CONSTRAINT [FK_Rolls_SkillRolls_Rolls_SkillTypes]
GO
ALTER TABLE [Users].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users_Entities_Entities] FOREIGN KEY([EntityId])
REFERENCES [Entities].[Entities] ([EntityId])
GO
ALTER TABLE [Users].[Users] CHECK CONSTRAINT [FK_Users_Users_Entities_Entities]
GO
ALTER TABLE [Users].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users_FirstName_Entities_Names] FOREIGN KEY([FirstNameId])
REFERENCES [Users].[UserNames] ([UserNameId])
GO
ALTER TABLE [Users].[Users] CHECK CONSTRAINT [FK_Users_Users_FirstName_Entities_Names]
GO
ALTER TABLE [Users].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users_LastName_Users_UserNames] FOREIGN KEY([LastNameId])
REFERENCES [Users].[UserNames] ([UserNameId])
GO
ALTER TABLE [Users].[Users] CHECK CONSTRAINT [FK_Users_Users_LastName_Users_UserNames]
GO
ALTER TABLE [Users].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users_MiddleName_Users_UserNames] FOREIGN KEY([MiddleNameId])
REFERENCES [Users].[UserNames] ([UserNameId])
GO
ALTER TABLE [Users].[Users] CHECK CONSTRAINT [FK_Users_Users_MiddleName_Users_UserNames]
GO
ALTER TABLE [Rolls].[DieTypes]  WITH CHECK ADD  CONSTRAINT [CK_Rolls_DieTypes_DisplayName] CHECK  ((len([DisplayName])>=(2)))
GO
ALTER TABLE [Rolls].[DieTypes] CHECK CONSTRAINT [CK_Rolls_DieTypes_DisplayName]
GO
ALTER TABLE [Rolls].[IndividualRolls]  WITH CHECK ADD  CONSTRAINT [CK_Rolls_IndividualRolls_Value] CHECK  (([Rolls].[Sc_IsValidRoll]([Value],[DieTypeId])=(1)))
GO
ALTER TABLE [Rolls].[IndividualRolls] CHECK CONSTRAINT [CK_Rolls_IndividualRolls_Value]
GO
ALTER TABLE [Users].[AccessLevels]  WITH CHECK ADD  CONSTRAINT [CK_Users_AccessLevels_DisplayName] CHECK  ((len([DisplayName])>(3)))
GO
ALTER TABLE [Users].[AccessLevels] CHECK CONSTRAINT [CK_Users_AccessLevels_DisplayName]
GO
ALTER TABLE [Users].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_Users_Email] CHECK  (([Users].[Sc_IsValidEmail]([Email])=(1)))
GO
ALTER TABLE [Users].[Users] CHECK CONSTRAINT [CK_Users_Users_Email]
GO
ALTER TABLE [Users].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_Users_Handle] CHECK  ((len([Handle])>(3)))
GO
ALTER TABLE [Users].[Users] CHECK CONSTRAINT [CK_Users_Users_Handle]
GO
/****** Object:  StoredProcedure [Entities].[Sto_GetNameId]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Entities].[Sto_GetNameId]
	@Name	VARCHAR(200),
	@CreateIfMissing BIT = 1
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @NameId INT = (
		SELECT [NameId]
		FROM [Entities].[Names]
		WHERE [Name] = @Name
	);

	IF @CreateIfMissing = 1 AND @NameId IS NULL
	BEGIN
		INSERT INTO [Entities].[Names]([Name])
		VALUES (@Name)
		;
		SET @NameId = SCOPE_IDENTITY();
	END

	RETURN @NameId;
END
GO
/****** Object:  StoredProcedure [Entities].[Sto_InsertEntity]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Entities].[Sto_InsertEntity]
	@IsPublic	BIT = 1
AS
BEGIN
	INSERT INTO [Entities].[Entities]([IsPublic])
	VALUES (@IsPublic);

	RETURN SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [Games].[Sto_GetCampaignDetailsById]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Games].[Sto_GetCampaignDetailsById]
	@PublicId	UNIQUEIDENTIFIER
AS
BEGIN

	DECLARE @CampignId INT;
	SELECT @CampignId = GC.[CampaignId]
	FROM [Games].[Campaigns] AS GC
		INNER JOIN [Entities].[Entities] AS EE
			ON EE.[EntityId] = GC.[EntityId]
	WHERE EE.[PublicId] = @PublicId
	;

	SELECT
		EE.[PublicId],
		GC.[DateCreated],
		EN.[Name]
	FROM [Games].[Campaigns] AS GC
		INNER JOIN [Entities].[Entities] AS EE
			ON EE.[EntityId] = GC.[EntityId]
		INNER JOIN [Entities].[Names] EN
			ON EN.[NameId] = GC.[NameId]
	WHERE GC.[CampaignId] = @CampignId
	;

	SELECT
		EE.[PublicId],
		GC.[DateCreated],
		EN.[Name]
	FROM [Games].[Characters] AS GC
		INNER JOIN [Games].[CharactersToCampaigns] AS CH2CA
			ON CH2CA.[CharacterId] = GC.[CharacterId]
		INNER JOIN [Entities].[Entities] AS EE
			ON EE.[EntityId] = GC.[EntityId]
		INNER JOIN [Entities].[Names] EN
			ON EN.[NameId] = GC.[NameId]
	WHERE CH2CA.[CampaignId] = @CampignId
	;

	EXEC [Rolls].[Sto_GetRollStatsForEntity] @PublicId;

	EXEC [Rolls].[Sto_GetLastRollsForEntity] @PublicId;

END
GO
/****** Object:  StoredProcedure [Games].[Sto_GetCampaigns]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Games].[Sto_GetCampaigns]
AS
BEGIN
	SELECT
		EE.[PublicId],
		EN.[Name],
		GC.[DateCreated]
	FROM [Games].[Campaigns] GC
	INNER JOIN [Entities].[Entities] EE
		ON GC.[EntityId] = EE.[EntityId]
	INNER JOIN [Entities].[Names] EN
		ON GC.[NameId] = EN.[NameId]
END
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertCampaign]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Games].[Sto_InsertCampaign]
	@Name				VARCHAR(200)
AS
BEGIN
	DECLARE @NameId INT;
	EXEC @NameId = [Entities].[Sto_GetNameId] @Name, 1;

	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	INSERT INTO [Games].[Campaigns]([NameId], [EntityId])
	VALUES (@NameId, @EntityId)
	;

	DECLARE @CampaignId INT = SCOPE_IDENTITY();

	RETURN @CampaignId;
END
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertCharacter]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Games].[Sto_InsertCharacter]
	@Name				VARCHAR(200),
	@CreatedBy	INT,
	@CampaignId INT
AS
BEGIN
	DECLARE @NameId INT;
	EXEC @NameId = [Entities].[Sto_GetNameId] @Name, 1;

	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	INSERT INTO [Games].[Characters]([NameId], [EntityId])
	VALUES (@NameId, @EntityId);

	DECLARE @CharacterId INT = SCOPE_IDENTITY();

	IF @CreatedBy IS NOT NULL
	BEGIN
		EXEC [Games].[Sto_InsertCharacterToUser]
			@CharacterId,
			@CreatedBy,
			1-- [Users].[Sc_GetAccessLevelId]('Owner');
	END

	IF @CampaignId IS NOT NULL
	BEGIN
		EXEC [Games].[Sto_InsertCharacterToCampaign]
			@CharacterId,
			@CampaignId;
	END

	RETURN @CharacterId;
END
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertCharacterToCampaign]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Games].[Sto_InsertCharacterToCampaign]
	@CharacterId	INT,
	@CampaignId	INT
AS
BEGIN
	INSERT INTO [Games].[CharactersToCampaigns]([CharacterId], [CampaignId])
	VALUES (@CharacterId, @CampaignId)

	RETURN 0;
END
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertCharacterToUser]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Games].[Sto_InsertCharacterToUser]
	@CharacterId		INT,
	@UserId					INT,
	@AccessLevelId	TINYINT
AS
BEGIN
	DECLARE @UserIds VARCHAR(50) = CAST(@UserId AS VARCHAR(50));
	RETURN EXEC [Games].[Sto_InsertCharacterToUsers]
		@CharacterId,
		@UserIds,
		@AccessLevelId
	;
END
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertCharacterToUsers]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Games].[Sto_InsertCharacterToUsers]
	@CharacterId		INT,
	@UserIds				VARCHAR(MAX),
	@AccessLevelId	TINYINT
AS
BEGIN
	INSERT INTO [Games].[CharactersToUsers]([CharacterId], [UserId], [AccessLevelId])
	SELECT
		@CharacterId,
		CAST(@UserIds AS INT),
		@AccessLevelId
	FROM STRING_SPLIT(@UserIds, ',')
	;

	RETURN 0;
END
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertEncounter]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Games].[Sto_InsertEncounter]
	@Name				VARCHAR(200),
	@SessionId	INT
AS
BEGIN
	DECLARE @NameId INT;
	EXEC @NameId = [Entities].[Sto_GetNameId] @Name, 1;

	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	INSERT INTO [Games].[Encounters]([NameId], [EntityId], [SessionId])
	VALUES (@NameId, @EntityId, @SessionId);

	DECLARE @EncounterId INT = SCOPE_IDENTITY();

	RETURN @EncounterId;
END
GO
/****** Object:  StoredProcedure [Games].[Sto_InsertSession]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Games].[Sto_InsertSession]
	@Name				VARCHAR(200),
	@CampaignId INT
AS
BEGIN
	DECLARE @NameId INT;
	EXEC @NameId = [Entities].[Sto_GetNameId] @Name, 1;

	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	INSERT INTO [Games].[Sessions]([NameId], [EntityId], [CampaignId])
	VALUES (@NameId, @EntityId, @CampaignId);

	DECLARE @SessionId INT = SCOPE_IDENTITY();

	RETURN @SessionId;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_GetLastRollsForEntity]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [Rolls].[Sto_GetRollDetails]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_GetRollDetails]
	@PublicId UNIQUEIDENTIFIER
AS
BEGIN
	SELECT *
	FROM [Rolls].[Vw_RollDetails]
	WHERE [PublicId] = @PublicId
;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_GetRollStatsForEntities]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_GetRollStatsForEntities]
	@Entities [Entities].[EntitiesType] READONLY
AS
BEGIN
		CREATE TABLE #Stats
	(
		[EntityId]									INT,
		[D20SkillCount]							INT,
		[D20SkillCritSuccessCount]	INT,
		[D20SkillCritFailureCount]	INT,
		[D20SkillSuccessCount]			INT,
		-- [D20SkillMode]					INT,
		[D20SkillAverage]						FLOAT,
		-- [D20SkillTypeMode]			VARCHAR(50),
		[D20AttackCount]						INT,
		[D20AttackCritSuccessCount]	INT,
		[D20AttackCritFailureCount]	INT,
		[D20AttackSuccessCount]			INT,
		-- [D20AttackMode]					INT,
		[D20AttackAverage]					FLOAT,
		-- [DamageSourceMode]			VARCHAR(50)
		[DamageAverage]							FLOAT,
		[D20InitCount]							INT,
		[D20InitAverage]						FLOAT,
		[InitRankAverage]						FLOAT,
	);
	CREATE TABLE #Rolls (
		[RollId] INT,
		[EntityId] INT NOT NULL,
		[RawValue] INT NOT NULL,
		[Value] INT NOT NULL,
		[IsSingleD20] BIT NOT NULL,
		[IsDamage] BIT NOT NULL,
		[IsAttack] BIT NOT NULL,
		[IsInitiative] BIT NOT NULL,
		[IsSkill] BIT NOT NULL,
		[Success] BIT,
		[Rank] INT

		CONSTRAINT [RollId_EntityId] UNIQUE ([RollId], [EntityId])
	);

	INSERT INTO #Rolls
	SELECT
		R2E.[RollId],
		EE.[EntityId],
		SUM(IR.[Value]) AS [RawValue],
		(SUM(IR.[Value]) + SUM(ISNULL(RM.[Value], 0))) AS [Value],
		CAST(
			CASE
				WHEN COUNT(IR.[IndividualRollId]) <> 1 THEN 0
				WHEN MAX(DT.[NumberOfSides]) <> 20 THEN 0
				ELSE 1
			END
		AS BIT) AS IsSingleD20,
		CAST(
			CASE WHEN COUNT(DR.[AttackRollId]) > 0 THEN 1 ELSE 0 END
		AS BIT) AS [IsDamage],
		CAST(
			CASE WHEN COUNT(AR.[AttackRollId]) > 0 THEN 1 ELSE 0 END
		AS BIT) AS [IsAttack],
		CAST(
			CASE WHEN COUNT(InitR.[InitiativeRollId]) > 0 THEN 1 ELSE 0 END
		AS BIT) AS [IsInitiative],
		CAST(
			CASE WHEN COUNT(SR.[SkillRollId]) > 0 THEN 1 ELSE 0 END
		AS BIT) AS [IsSkill],
		SR.[Success],
		InitR.[Rank]
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
		LEFT JOIN [Rolls].[AttackRolls] AS AR
			ON AR.[HitRollId] = RR.[RollId]
		LEFT JOIN [Rolls].[AttackRolls] AS DR
			ON DR.[DamageRollId] = RR.[RollId]
		LEFT JOIN [Rolls].[SkillRolls] AS SR
			ON SR.[RollId] = RR.[RollId]
		LEFT JOIN [Rolls].[InitiativeRolls] AS InitR
			ON InitR.[RollId] = RR.[RollId]
	GROUP BY
		R2E.[RollId],
		EE.[EntityId],
		SR.[Success],
		InitR.[Rank]
	;

	INSERT INTO #Stats([EntityId])
	SELECT DISTINCT [EntityId] FROM @Entities E INNER JOIN Entities.Entities EE ON EE.PublicId = E.PublicId
	;

	-- Skill
	UPDATE #Stats
	SET
		[D20SkillCount] = ISNULL(NS.[D20SkillCount], 0),
		[D20SkillCritSuccessCount] = ISNULL(NS.[D20SkillCritSuccessCount], 0),
		[D20SkillCritFailureCount] = ISNULL(NS.[D20SkillCritFailureCount], 0),
		[D20SkillSuccessCount] = ISNULL(NS.[D20SkillSuccessCount], 0),
		[D20SkillAverage] = NS.[D20SkillAverage]
	FROM #Stats S
		LEFT JOIN (
			SELECT
				R.[EntityId],
				COUNT(R.[EntityId]) AS [D20SkillCount],
				COUNT(CASE WHEN R.[RawValue] = 20 THEN 1 ELSE NULL END) AS [D20SkillCritSuccessCount],
				COUNT(CASE WHEN R.[RawValue] = 1 THEN 1 ELSE NULL END) AS [D20SkillCritFailureCount],
				SUM(CAST(R.[Success] AS INT)) AS [D20SkillSuccessCount],
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
		[D20AttackAverage] = NS.[D20AttackAverage]
	FROM #Stats S
		LEFT JOIN (
			SELECT
				R.[EntityId],
				COUNT(R.[EntityId]) AS [D20AttackCount],
				COUNT(CASE WHEN R.[RawValue] = 20 THEN 1 ELSE NULL END) AS [D20AttackCritSuccessCount],
				COUNT(CASE WHEN R.[RawValue] = 1 THEN 1 ELSE NULL END) AS [D20AttackCritFailureCount] ,
				SUM(CAST(R.[Success] AS INT)) AS [D20AttackSuccessCount],
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

	SELECT EE.[PublicId], S.*
	FROM #Stats S
		INNER JOIN [Entities].[Entities] AS EE
			ON EE.[EntityId] = S.[EntityId]
	;

	DROP TABLE #Rolls, #Stats;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_GetRollStatsForEntity]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_GetRollStatsForEntity]
	@PublicId UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @Entities [Entities].[EntitiesType];

	INSERT INTO @Entities([PublicId])
	VALUES (@PublicId)
	;

	EXEC [Rolls].[Sto_GetRollStatsForEntities] @Entities;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_GetSkillTypeId]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_GetSkillTypeId]
	@Name VARCHAR(40),
	@CreateIfMissing BIT = 1
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @SkillTypeId SMALLINT = (
		SELECT [SkillTypeId]
		FROM [Rolls].[SkillTypes]
		WHERE [Name] = @Name
	);

	IF @CreateIfMissing = 1 AND @SkillTypeId IS NULL
	BEGIN
		INSERT INTO [Rolls].[SkillTypes]([Name])
		VALUES (@Name)
		;
		SET @SkillTypeId = SCOPE_IDENTITY();
	END

	RETURN @SkillTypeId;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertAttackRoll]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_InsertAttackRoll]
	@Dice								[Rolls].[DieRollType] READONLY,
	@Modifiers					[Rolls].[RollModifierType] READONLY,
	@DamageDice					[Rolls].[DieRollType] READONLY,
	@DamageModifiers		[Rolls].[RollModifierType] READONLY,
	@SkillType					VARCHAR(50),
	@DamageType					VARCHAR(50),
	@DamageSource				VARCHAR(50),
	@Success						BIT,
	@Comments 					[Rolls].[RollCommentType] READONLY,
	@AssociatedEntities	[Entities].[EntitiesType] READONLY
AS
BEGIN
	DECLARE @NumberOfHitDice INT;
	SELECT @NumberOfHitDice = COUNT(1)
	FROM @Dice
	;

	DECLARE @HitRollId INT;
	EXEC @HitRollId = [Rolls].[Sto_InsertSkillRoll]
		@Dice,
		@Modifiers,
		@SkillType,
		@Success,
		@Comments,
		@AssociatedEntities
	;
	DECLARE @DamageRollId INT = NULL;
	DECLARE @DamageSourceId INT = NULL;

	IF @Success = 1
	BEGIN
		DECLARE @DamageComments [Rolls].[RollCommentType];
		EXEC @DamageRollId = [Rolls].[Sto_InsertRoll]
			@DamageDice,
			@DamageModifiers,
			@DamageComments,
			@AssociatedEntities
		;

		EXEC @DamageSourceId = [Rolls].[Sto_InsertDamageSource] @DamageSource, @DamageType;
	END

	INSERT INTO [Rolls].[AttackRolls]
		([HitRollId], [DamageRollId], [DamageSourceId])
	VALUES(@HitRollId, @DamageRollId, @DamageSourceId)
	;

	DECLARE @AttackRollId INT = SCOPE_IDENTITY();

	RETURN @AttackRollId;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertDamageSource]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_InsertDamageSource]
	@Name VARCHAR(40),
	@DamageType VARCHAR(40)
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @DamageSourceId INT = (
		SELECT [DamageSourceId]
		FROM [Rolls].[DamageSources]
		WHERE [Name] = @Name
	);

	IF @DamageSourceId IS NULL
	BEGIN
		DECLARE @DamageTypeId SMALLINT;
		EXEC @DamageTypeId = [Rolls].[Sto_InsertDamageType] @DamageType;

		INSERT INTO [Rolls].[DamageSources]([Name], [DamageTypeId])
		VALUES (@Name, @DamageTypeId)
		;

		SET @DamageSourceId = SCOPE_IDENTITY();
	END

	RETURN @DamageSourceId;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertDamageType]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_InsertDamageType]
	@Name VARCHAR(40)
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @DamageTypeId INT = (
		SELECT [DamageTypeId]
		FROM [Rolls].[DamageTypes]
		WHERE [Name] = @Name
	);

	IF @DamageTypeId IS NULL
	BEGIN
		INSERT INTO [Rolls].[DamageTypes]([Name])
		VALUES (@Name)
		;

		SET @DamageTypeId = SCOPE_IDENTITY();
	END

	RETURN @DamageTypeId;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertDieType]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_InsertDieType]
	@Sides				TINYINT,
	@DisplayName	VARCHAR(10)
AS
BEGIN

	INSERT INTO [Rolls].[DieTypes]([DieTypeId], [DisplayName])
	VALUES (@Sides, @DisplayName)
	;

	RETURN @Sides;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertIndividualRolls]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_InsertIndividualRolls]
	@RollId	INT,
	@Dice		[Rolls].[DieRollType] READONLY
AS
BEGIN
	INSERT INTO [Rolls].[IndividualRolls]([RollId], [DieTypeId], [Value])
	OUTPUT INSERTED.[IndividualRollId]
	SELECT
		@RollId,
		DT.[DieTypeId],
		D.[Value]
	FROM @Dice D
	INNER JOIN [Rolls].[DieTypes] DT
		ON DT.[NumberOfSides] = D.[NumberOfSides]
	;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertInitaitveRoll]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_InsertInitaitveRoll]
	@Dice								[Rolls].[DieRollType] READONLY,
	@Modifiers					[Rolls].[RollModifierType] READONLY,
	@Comments 					[Rolls].[RollCommentType] READONLY,
	@AssociatedEntities	[Entities].[EntitiesType] READONLY,
	@Rank								TINYINT
AS
BEGIN
	DECLARE @NumberOfDice INT;
	SELECT @NumberOfDice = COUNT(1)
	FROM @Dice;

	IF (@NumberOfDice <> 1) THROW 51000, 'Initiative Rolls only accept a single die', 1;

	DECLARE @RollId INT;
	EXEC @RollId = [Rolls].[Sto_InsertRoll]
		@Dice,
		@Modifiers,
		@Comments,
		@AssociatedEntities
	;

	INSERT INTO [Rolls].[InitiativeRolls]
		([RollId], [Rank])
	VALUES
		(@RollId, @Rank)
	;

	DECLARE @InitiativeRollId INT = SCOPE_IDENTITY();

	RETURN @InitiativeRollId;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertInitiativeRoll]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_InsertInitiativeRoll]
	@Dice								[Rolls].[DieRollType] READONLY,
	@Modifiers					[Rolls].[RollModifierType] READONLY,
	@Comments 					[Rolls].[RollCommentType] READONLY,
	@AssociatedEntities	[Entities].[EntitiesType] READONLY,
	@Rank								TINYINT
AS
BEGIN
	DECLARE @NumberOfDice INT;
	SELECT @NumberOfDice = COUNT(1)
	FROM @Dice;

	IF (@NumberOfDice <> 1) THROW 51000, 'Initiative Rolls only accept a single die', 1;

	DECLARE @RollId INT;
	EXEC @RollId = [Rolls].[Sto_InsertRoll]
		@Dice,
		@Modifiers,
		@Comments,
		@AssociatedEntities
	;

	INSERT INTO [Rolls].[InitiativeRolls]
		([RollId], [Rank])
	VALUES
		(@RollId, @Rank)
	;

	DECLARE @InitiativeRollId INT = SCOPE_IDENTITY();

	RETURN @InitiativeRollId;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertRoll]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_InsertRoll]
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
/****** Object:  StoredProcedure [Rolls].[Sto_InsertRollComments]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_InsertRollComments]
	@RollId		INT,
	@Comments	[Rolls].[RollCommentType] READONLY
AS
BEGIN
	INSERT INTO [Rolls].[RollComments]([RollId], [Comment])
	OUTPUT INSERTED.[RollCommentId]
	SELECT
		@RollId,
		[Comment]
	FROM @Comments
	WHERE ISNULL([Comment], '') <> ''
	;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertRollModifiers]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_InsertRollModifiers]
	@RollId			INT,
	@Modifiers	[Rolls].[RollModifierType] READONLY
AS
BEGIN
	INSERT INTO [Rolls].[RollModifiers]
		([RollId], [Value])
	OUTPUT
	INSERTED.[RollModifierId]
	SELECT
		@RollId,
		[Value]
	FROM @Modifiers
	WHERE [Value] <> 0
;
END
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertSkillRoll]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Rolls].[Sto_InsertSkillRoll]
	@Dice								[Rolls].[DieRollType] READONLY,
	@Modifiers					[Rolls].[RollModifierType] READONLY,
	@SkillType					VARCHAR(50),
	@Success						BIT,
	@Comments 					[Rolls].[RollCommentType] READONLY,
	@AssociatedEntities	[Entities].[EntitiesType] READONLY
AS
BEGIN
	DECLARE @NumberOfDice INT;
	SELECT @NumberOfDice = COUNT(1)
	FROM @Dice;

	IF (@NumberOfDice <> 1) THROW 51000, 'Skill Rolls only accept a single die', 1;

	DECLARE @RollId INT;
	EXEC @RollId = [Rolls].[Sto_InsertRoll]
		@Dice,
		@Modifiers,
		@Comments,
		@AssociatedEntities
	;

	DECLARE @SkillTypeId SMALLINT;
	EXEC @SkillTypeId = [Rolls].[Sto_GetSkillTypeId] @SkillType;

	INSERT INTO [Rolls].[SkillRolls]
		([RollId], [SkillTypeId], [Success])
	VALUES
		(@RollId, @SkillTypeId, @Success)
	;

	DECLARE @SkillRollId INT = SCOPE_IDENTITY();

	RETURN @SkillRollId;
END
GO
/****** Object:  StoredProcedure [Users].[Sto_GetUserNameId]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Users].[Sto_GetUserNameId]
	@Name VARCHAR(100),
	@CreateIfMissing BIT = 1
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @UserNameId INT = (
		SELECT [UserNameId]
		FROM [Users].[UserNames]
		WHERE [Name] = @Name
	);

	IF @CreateIfMissing = 1 AND @UserNameId IS NULL
	BEGIN
		INSERT INTO [Users].[UserNames]([Name])
		VALUES (@Name)
		;
		SET @UserNameId = SCOPE_IDENTITY();
	END

	RETURN @UserNameId;
END
GO
/****** Object:  StoredProcedure [Users].[Sto_InsertUser]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Users].[Sto_InsertUser]
	@Handle			VARCHAR(50),
	@Email			VARCHAR(200),
	@Password		VARCHAR(200),
	@FirstName	VARCHAR(100),
	@MiddleName	VARCHAR(100),
	@LastName		VARCHAR(100)
AS
BEGIN
	DECLARE @EntityId BIGINT;
	EXEC @EntityId = [Entities].[Sto_InsertEntity];

	DECLARE @FirstNameId	INT,
					@MiddleNameId	INT,
					@LastNameId		INT
	;

	EXEC @FirstNameId		= [Users].[Sto_GetUserNameId] @FirstName;
	EXEC @MiddleNameId	= [Users].[Sto_GetUserNameId] @MiddleName;
	EXEC @LastNameId		= [Users].[Sto_GetUserNameId] @LastName;

	INSERT INTO [Users].[Users]([EntityId], [Handle], [Email], [PasswordHash], [FirstNameId], [MiddleNameId], [LastNameId])
	VALUES (
		@EntityId,
		@Handle,
		@Email,
		[Users].[Sc_GetUserPasswordHash](@Handle, @Password),
		@FirstNameId,
		@MiddleNameId,
		@LastNameId
	);

	RETURN SCOPE_IDENTITY();
END
GO
/****** Object:  Trigger [Entities].[TR_Names_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Entities].[TR_Names_DateModified]
	ON [Entities].[Names]
	AFTER UPDATE
	AS
		UPDATE [Entities].[Names]
		SET [DateModified] = getUtcDate()
		WHERE [NameId] in (SELECT DISTINCT [NameId] FROM Inserted)
;
GO
ALTER TABLE [Entities].[Names] ENABLE TRIGGER [TR_Names_DateModified]
GO
/****** Object:  Trigger [Games].[TR_Campaigns_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Games].[TR_Campaigns_DateModified]
	ON [Games].[Campaigns]
	AFTER UPDATE
	AS
		UPDATE [Games].[Campaigns]
		SET [DateModified] = getUtcDate()
		WHERE [CampaignId] IN ((SELECT DISTINCT [CampaignId] FROM Inserted))
;
GO
ALTER TABLE [Games].[Campaigns] ENABLE TRIGGER [TR_Campaigns_DateModified]
GO
/****** Object:  Trigger [Games].[TR_Characters_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Games].[TR_Characters_DateModified]
	ON [Games].[Characters]
	AFTER UPDATE
	AS
		UPDATE [Games].[Characters]
		SET [DateModified] = getUtcDate()
		WHERE [CharacterId] in (SELECT DISTINCT [CharacterId] FROM Inserted)
;
GO
ALTER TABLE [Games].[Characters] ENABLE TRIGGER [TR_Characters_DateModified]
GO
/****** Object:  Trigger [Games].[TR_CharactersToCampaigns_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Games].[TR_CharactersToCampaigns_DateModified]
	ON [Games].[CharactersToCampaigns]
	AFTER UPDATE
	AS
		UPDATE [Games].[CharactersToCampaigns]
		SET [DateModified] = getUtcDate()
		WHERE [CharactersToCampaignsId] in (SELECT DISTINCT [CharactersToCampaignsId] FROM Inserted)
;
GO
ALTER TABLE [Games].[CharactersToCampaigns] ENABLE TRIGGER [TR_CharactersToCampaigns_DateModified]
GO
/****** Object:  Trigger [Games].[TR_CharactersToUsers_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Games].[TR_CharactersToUsers_DateModified]
	ON [Games].[CharactersToUsers]
	AFTER UPDATE
	AS
		UPDATE [Games].[CharactersToUsers]
		SET [DateModified] = getUtcDate()
		WHERE [CharacterToUserId] in (SELECT DISTINCT [CharacterToUserId] FROM Inserted)
;
GO
ALTER TABLE [Games].[CharactersToUsers] ENABLE TRIGGER [TR_CharactersToUsers_DateModified]
GO
/****** Object:  Trigger [Games].[TR_Encounters_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Games].[TR_Encounters_DateModified]
	ON [Games].[Encounters]
	AFTER UPDATE
	AS
		UPDATE [Games].[Encounters]
		SET [DateModified] = getUtcDate()
		WHERE [EncounterId] in (SELECT DISTINCT [EncounterId] FROM Inserted)
;
GO
ALTER TABLE [Games].[Encounters] ENABLE TRIGGER [TR_Encounters_DateModified]
GO
/****** Object:  Trigger [Games].[TR_Encounters_DefaultSessionSortOrder]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Games].[TR_Encounters_DefaultSessionSortOrder]
	ON [Games].[Encounters]
	AFTER INSERT
	AS
		UPDATE [Games].[Encounters]
		SET [SessionSortOrder] = (
			SELECT MAX([SessionSortOrder]) + 1
			FROM [Games].[Encounters] AS [GE]
			WHERE [GE].[SessionId] = [Inserted].[SessionId]
		)
		FROM Inserted
		WHERE [Games].[Encounters].[EncounterId] = [Inserted].[EncounterId]
;
GO
ALTER TABLE [Games].[Encounters] ENABLE TRIGGER [TR_Encounters_DefaultSessionSortOrder]
GO
/****** Object:  Trigger [Games].[TR_Sessions_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Games].[TR_Sessions_DateModified]
	ON [Games].[Sessions]
	AFTER UPDATE
	AS
		UPDATE [Games].[Sessions]
		SET [DateModified] = getUtcDate()
		WHERE [SessionId] in (SELECT DISTINCT [SessionId] FROM Inserted)
;
GO
ALTER TABLE [Games].[Sessions] ENABLE TRIGGER [TR_Sessions_DateModified]
GO
/****** Object:  Trigger [Games].[TR_Sessions_DefaultCampaignSortOrder]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Games].[TR_Sessions_DefaultCampaignSortOrder]
	ON [Games].[Sessions]
	AFTER INSERT
	AS
		UPDATE [Games].[Sessions]
		SET [CampaignSortOrder] = (
			SELECT MAX([CampaignSortOrder]) + 1
			FROM [Games].[Sessions] AS [GS]
			WHERE [GS].[CampaignId] = [Inserted].[CampaignId]
		)
		FROM Inserted
		WHERE [Games].[Sessions].[SessionId] = [Inserted].[SessionId]
;
GO
ALTER TABLE [Games].[Sessions] ENABLE TRIGGER [TR_Sessions_DefaultCampaignSortOrder]
GO
/****** Object:  Trigger [Rolls].[TR_AttackRolls_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_AttackRolls_DateModified]
	ON [Rolls].[AttackRolls]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[AttackRolls]
		SET [DateModified] = getUtcDate()
		WHERE [AttackRollId] in (SELECT DISTINCT [AttackRollId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[AttackRolls] ENABLE TRIGGER [TR_AttackRolls_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_DamageSources_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_DamageSources_DateModified]
	ON [Rolls].[DamageSources]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[DamageSources]
		SET [DateModified] = getUtcDate()
		WHERE [DamageSourceId] in (SELECT DISTINCT [DamageSourceId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[DamageSources] ENABLE TRIGGER [TR_DamageSources_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_DamageTypes_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_DamageTypes_DateModified]
	ON [Rolls].[DamageTypes]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[DamageTypes]
		SET [DateModified] = getUtcDate()
		WHERE [DamageTypeId] in (SELECT DISTINCT [DamageTypeId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[DamageTypes] ENABLE TRIGGER [TR_DamageTypes_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_DieTypes_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_DieTypes_DateModified]
	ON [Rolls].[DieTypes]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[DieTypes]
		SET [DateModified] = getUtcDate()
		WHERE [DieTypeId] in (SELECT DISTINCT [DieTypeId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[DieTypes] ENABLE TRIGGER [TR_DieTypes_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_IndividualRolls_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_IndividualRolls_DateModified]
	ON [Rolls].[IndividualRolls]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[IndividualRolls]
		SET [DateModified] = getUtcDate()
		WHERE [IndividualRollId] in (SELECT DISTINCT [IndividualRollId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[IndividualRolls] ENABLE TRIGGER [TR_IndividualRolls_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_InitiativeRolls_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_InitiativeRolls_DateModified]
	ON [Rolls].[InitiativeRolls]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[InitiativeRolls]
		SET [DateModified] = getUtcDate()
		WHERE [InitiativeRollId] in (SELECT DISTINCT [InitiativeRollId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[InitiativeRolls] ENABLE TRIGGER [TR_InitiativeRolls_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_RollComments_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_RollComments_DateModified]
	ON [Rolls].[RollComments]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[RollComments]
		SET [DateModified] = getUtcDate()
		WHERE [RollCommentId] in (SELECT DISTINCT [RollCommentId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[RollComments] ENABLE TRIGGER [TR_RollComments_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_RollModifiers_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_RollModifiers_DateModified]
	ON [Rolls].[RollModifiers]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[RollModifiers]
		SET [DateModified] = getUtcDate()
		WHERE [RollModifierId] in (SELECT DISTINCT [RollModifierId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[RollModifiers] ENABLE TRIGGER [TR_RollModifiers_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_Rolls_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_Rolls_DateModified]
	ON [Rolls].[Rolls]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[Rolls]
		SET [DateModified] = getUtcDate()
		WHERE [RollId] in (SELECT DISTINCT [RollId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[Rolls] ENABLE TRIGGER [TR_Rolls_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_RollsToCharacters_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_RollsToCharacters_DateModified]
	ON [Rolls].[RollsToCharacters]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[RollsToCharacters]
		SET [DateModified] = getUtcDate()
		WHERE [RollsToCharactersId] in (SELECT DISTINCT [RollsToCharactersId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[RollsToCharacters] ENABLE TRIGGER [TR_RollsToCharacters_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_RollsToEntities_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_RollsToEntities_DateModified]
	ON [Rolls].[RollsToEntities]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[RollsToEntities]
		SET [DateModified] = getUtcDate()
		WHERE [RollToEntityId] IN (SELECT DISTINCT [RollToEntityId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[RollsToEntities] ENABLE TRIGGER [TR_RollsToEntities_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_RollsToUsers_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_RollsToUsers_DateModified]
	ON [Rolls].[RollsToUsers]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[RollsToUsers]
		SET [DateModified] = getUtcDate()
		WHERE [RollsToUsersId] in (SELECT DISTINCT [RollsToUsersId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[RollsToUsers] ENABLE TRIGGER [TR_RollsToUsers_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_SkillRolls_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_SkillRolls_DateModified]
	ON [Rolls].[SkillRolls]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[SkillRolls]
		SET [DateModified] = getUtcDate()
		WHERE [SkillRollId] in (SELECT DISTINCT [SkillRollId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[SkillRolls] ENABLE TRIGGER [TR_SkillRolls_DateModified]
GO
/****** Object:  Trigger [Rolls].[TR_SkillTypes_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Rolls].[TR_SkillTypes_DateModified]
	ON [Rolls].[SkillTypes]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[SkillTypes]
		SET [DateModified] = getUtcDate()
		WHERE [SkillTypeId] in (SELECT DISTINCT [SkillTypeId] FROM Inserted)
;
GO
ALTER TABLE [Rolls].[SkillTypes] ENABLE TRIGGER [TR_SkillTypes_DateModified]
GO
/****** Object:  Trigger [Users].[TR_AccessLevels_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Users].[TR_AccessLevels_DateModified]
	ON [Users].[AccessLevels]
	AFTER UPDATE
	AS
		UPDATE [Users].[AccessLevels]
		SET [DateModified] = getUtcDate()
		WHERE [AccessLevelId] in (SELECT DISTINCT [AccessLevelId] FROM Inserted)
;
GO
ALTER TABLE [Users].[AccessLevels] ENABLE TRIGGER [TR_AccessLevels_DateModified]
GO
/****** Object:  Trigger [Users].[TR_Users_UserNames_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Users].[TR_Users_UserNames_DateModified]
	ON [Users].[UserNames]
	AFTER UPDATE
	AS
		UPDATE [Users].[UserNames]
		SET [DateModified] = getUtcDate()
		WHERE [UserNameId] IN (SELECT DISTINCT [UserNameId] FROM Inserted)
;
GO
ALTER TABLE [Users].[UserNames] ENABLE TRIGGER [TR_Users_UserNames_DateModified]
GO
/****** Object:  Trigger [Users].[TR_Users_DateModified]    Script Date: 2/20/2021 5:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Users].[TR_Users_DateModified]
	ON [Users].[Users]
	AFTER UPDATE
	AS
		UPDATE [Users].[Users]
		SET [DateModified] = getUtcDate()
		WHERE [UserId] in (SELECT DISTINCT [UserId] FROM Inserted)
;
GO
ALTER TABLE [Users].[Users] ENABLE TRIGGER [TR_Users_DateModified]
GO
-- USE [master]
-- GO
-- ALTER DATABASE [$DatabaseName$] SET  READ_WRITE
-- GO
