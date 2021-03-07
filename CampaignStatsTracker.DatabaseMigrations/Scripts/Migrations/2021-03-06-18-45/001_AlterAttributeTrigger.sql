USE [$DatabaseName$]
GO

ALTER TRIGGER [Games].[TR_Games_Attributes] ON [Games].[Attributes]
AFTER UPDATE
AS
	UPDATE [Games].[Attributes]
	SET [DateModified] = getUtcDate()
	FROM [Games].[Attributes] AS GA
	INNER JOIN Inserted AS I ON I.[AttributeId] = GA.[AttributeId]
GO
