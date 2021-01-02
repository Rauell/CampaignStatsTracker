CREATE TABLE [Rolls].[IndividualRolls]
(
	[IndividualRollId] BIGINT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_IndividualRolls_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_IndividualRolls_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[RollId] INT
		CONSTRAINT [FK_Rolls_IndividualRolls_Rolls_Rolls]
			FOREIGN KEY ([RollId])
			REFERENCES [Rolls].[Rolls]([RollId]),

	[DieTypeId] TINYINT
		NOT NULL,
	CONSTRAINT [FK_Rolls_IndividualRolls_Rolls_Types]
		FOREIGN KEY ([DieTypeId])
		REFERENCES [Rolls].[DieTypes]([DieTypeId]),

	[Value] TINYINT
		NOT NULL,
	CONSTRAINT [CK_Rolls_IndividualRolls_Value]
		CHECK ([Rolls].[Sc_IsValidRoll]([Value], [DieTypeId]) = 1)
);
GO

CREATE TRIGGER [Rolls].[TR_IndividualRolls_DateModified]
	ON [Rolls].[IndividualRolls]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[IndividualRolls]
		SET [DateModified] = getUtcDate()
		WHERE [IndividualRollId] in (SELECT DISTINCT [IndividualRollId] FROM Inserted)
;
GO