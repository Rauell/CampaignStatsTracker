CREATE TABLE [Rolls].[RollsToUsers]
(
	[RollsToUsersId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_RollsToUsers_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_RollsToUsers_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[UserId] INT
		NOT NULL,
	CONSTRAINT [FK_Rolls_RollsToUsers_Users_Users]
		FOREIGN KEY ([UserId])
		REFERENCES [Users].[Users]([UserId]),

	[RollId] INT
		NOT NULL,
	CONSTRAINT [FK_Rolls_RollsToUsers_Rolls_Rolls]
		FOREIGN KEY ([RollId])
		REFERENCES [Rolls].[Rolls]([RollId])
);
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