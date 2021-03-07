USE [$DatabaseName$]
GO

CREATE TABLE [Rolls].[MiscellaneousRolls]
(
	[MiscellaneousRollId] INT
		IDENTITY(1,1)
		CONSTRAINT [PK_Rolls_MiscellaneousRolls]
			PRIMARY KEY
		NOT NULL,

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_MiscellaneousRolls_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_MiscellaneousRolls_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[RollId] INT
		CONSTRAINT [FK_Rolls_MiscellaneousRolls_Rolls_Rolls]
			FOREIGN KEY ([RollId])
			REFERENCES [Rolls].[Rolls]([RollId])
		NOT NULL,
	CONSTRAINT [UC_Rolls_MiscellaneousRolls_RollId]
		UNIQUE ([RollId]),

	[Success] BIT
		NULL
)
GO

CREATE TRIGGER [Rolls].[TR_Rolls_MiscellaneousRolls]
	ON [Rolls].[MiscellaneousRolls]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[MiscellaneousRolls]
		SET [DateModified] = getUtcDate()
		WHERE [MiscellaneousRollId] IN (SELECT DISTINCT [MiscellaneousRollId]
FROM Inserted)
GO