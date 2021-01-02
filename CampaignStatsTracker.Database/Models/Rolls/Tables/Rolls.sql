CREATE TABLE [Rolls].[Rolls]
(
	[RollId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[EntityId] BIGINT
		NOT NULL,
	CONSTRAINT [FK_Rolls_Rolls_Entities_Entities]
		FOREIGN KEY ([EntityId])
		REFERENCES [Entities].[Entities]([EntityId]),
	CONSTRAINT [UC_Rolls_Rolls_EntityId]
		UNIQUE ([EntityId]),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_Rolls_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_Rolls_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL
);
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