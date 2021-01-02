CREATE TABLE [Rolls].[DieTypes]
(
	[DieTypeId] TINYINT
		NOT NULL
		PRIMARY KEY,

	[NumberOfSides] AS [DieTypeId],

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_DieTypes_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_DieTypes_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DisplayName] VARCHAR(10)
		NOT NULL,
	CONSTRAINT [CK_Rolls_DieTypes_DisplayName]
		CHECK ((LEN([DisplayName]) >= 2))
);
GO

CREATE TRIGGER [Rolls].[TR_DieTypes_DateModified]
	ON [Rolls].[DieTypes]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[DieTypes]
		SET [DateModified] = getUtcDate()
		WHERE [DieTypeId] in (SELECT DISTINCT [DieTypeId] FROM Inserted)
;
GO