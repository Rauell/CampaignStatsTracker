CREATE TABLE [Rolls].[RollComments]
(
	[RollCommentId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_Comments_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_Comments_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[RollId] INT
		CONSTRAINT [FK_Rolls_RollComments_Rolls_Rolls]
			FOREIGN KEY ([RollId])
			REFERENCES [Rolls].[Rolls]([RollId])
		NOT NULL,

	[Comment] VARCHAR(200)
		NOT NULL
);
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