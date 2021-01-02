CREATE TABLE [Rolls].[RollModifiers]
(
	[RollModifierId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_RollModifiers_DateCreated]
			DEFAULT getUtcDate()
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_RollModifiers_DateModified]
			DEFAULT getUtcDate()
		NOT NULL,

	[RollId] INT
		CONSTRAINT [FK_Rolls_RollModifiers_Rolls_Rolls]
			FOREIGN KEY ([RollId])
			REFERENCES [Rolls].[Rolls]([RollId]),

	[Value] SMALLINT
		NOT NULL
);
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