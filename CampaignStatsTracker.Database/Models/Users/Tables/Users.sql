CREATE TABLE [Users].[Users]
(
	[UserId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[EntityId] BIGINT
		NOT NULL,
	CONSTRAINT [FK_Users_Users_Entities_Entities]
		FOREIGN KEY ([EntityId])
		REFERENCES [Entities].[Entities]([EntityId]),
	CONSTRAINT [UC_Users_Users_EntityId]
		UNIQUE ([EntityId]),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Users_Users_DateCreated]
			DEFAULT (getutcdate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Users_Users_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[Handle] VARCHAR(50)
		NOT NULL,
	CONSTRAINT [UC_Users_Users_Handle]
		UNIQUE ([Handle]),
	CONSTRAINT [CK_Users_Users_Handle]
		CHECK ((LEN([Handle]) > 3)),

	[Email] VARCHAR(200)
		NOT NULL,
	CONSTRAINT [UC_Users_Users_Email]
		UNIQUE ([Email]),
	CONSTRAINT [CK_Users_Users_Email]
		CHECK ([Users].[Sc_IsValidEmail]([Email]) = 1),

	[PasswordHash] BINARY(64)
		NOT NULL,

	[FirstNameId] INT
		NOT NULL,
	CONSTRAINT [FK_Users_Users_FirstName_Entities_Names]
		FOREIGN KEY ([FirstNameId])
		REFERENCES [Users].[UserNames]([UserNameId]),

	[MiddleNameId] INT,
	CONSTRAINT [FK_Users_Users_MiddleName_Users_UserNames]
		FOREIGN KEY ([MiddleNameId])
		REFERENCES [Users].[UserNames]([UserNameId]),

	[LastNameId] INT
		NOT NULL,
	CONSTRAINT [FK_Users_Users_LastName_Users_UserNames]
		FOREIGN KEY ([LastNameId])
		REFERENCES [Users].[UserNames]([UserNameId])
);
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