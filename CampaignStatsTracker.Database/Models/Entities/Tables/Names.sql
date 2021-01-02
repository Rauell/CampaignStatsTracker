CREATE TABLE [Entities].[Names]
(
	[NameId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Entities_Names_DateCreated]
			DEFAULT getUtcDate()
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Entities_Names_DateModified]
			DEFAULT getUtcDate()
		NOT NULL,

	[Name] VARCHAR(200)
		NOT NULL,
	CONSTRAINT [UC_Entities_Names_Name]
		UNIQUE ([Name])
);
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