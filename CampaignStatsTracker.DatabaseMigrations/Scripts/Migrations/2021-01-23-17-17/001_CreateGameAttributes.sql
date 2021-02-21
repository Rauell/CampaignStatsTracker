USE [$DatabaseName$]
GO

CREATE TABLE [Games].[Attributes]
(
	[AttributeId] TINYINT
		IDENTITY(1,1)
		PRIMARY KEY
		NOT NULL,

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Games_Attributes_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Games_Attributes_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[Name] VARCHAR(20)
		NOT NULL,
	CONSTRAINT [UC_Games_Attributes_Name]
		UNIQUE ([Name]),

	[Abbreviation] VARCHAR(5)
		NOT NULL
)
GO

CREATE TRIGGER [Games].[TR_Games_Attributes] ON [Games].[Attributes]
AFTER UPDATE
AS
	UPDATE [Games].[Attributes]
	SET [DateModified] = getUtcDate()
	FROM [Games].[Attributes] AS GA
	INNER JOIN Insered AS I ON I.[AttributeId] = GA.[AttributeId]
GO

INSERT INTO [Games].[Attributes]
	([Name], [Abbreviation])
VALUES
	('Strength', 'Str'),
	('Dexterity', 'Dex'),
	('Constituion', 'Con'),
	('Intelligence', 'Int'),
	('Wisdom', 'Wis'),
	('Charisma', 'Cha')
GO
