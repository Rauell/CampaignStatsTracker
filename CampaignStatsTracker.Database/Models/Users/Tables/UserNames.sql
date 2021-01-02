CREATE TABLE [Users].[UserNames]
(
	[UserNameId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Users_UserNames_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Users_UserNames_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[Name] VARCHAR(100)
		NOT NULL,
	CONSTRAINT [UC_Users_UserNames_Name]
		UNIQUE ([Name])
);
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