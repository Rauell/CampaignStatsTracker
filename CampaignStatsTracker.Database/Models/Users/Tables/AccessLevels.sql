CREATE TABLE [Users].[AccessLevels]
(
	[AccessLevelId] TINYINT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Users_AccessLevels_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Users_AccessLevels_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DisplayName] VARCHAR(50)
		NOT NULL,
	CONSTRAINT [UC_Users_AccessLevels_DisplayName]
		UNIQUE ([DisplayName]),
	CONSTRAINT [CK_Users_AccessLevels_DisplayName]
		CHECK ((LEN([DisplayName]) > 3)),

	[CanRead] BIT
		CONSTRAINT [DF_Users_AccessLevels_CanRead]
			DEFAULT (0)
		NOT NULL,

	[CanWrite] BIT
		CONSTRAINT [DF_Users_AccessLevels_CanWrite]
			DEFAULT (0)
		NOT NULL,

	[CanDelete] BIT
		CONSTRAINT [DF_Users_AccessLevels_CanDelete]
			DEFAULT (0)
		NOT NULL
);
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