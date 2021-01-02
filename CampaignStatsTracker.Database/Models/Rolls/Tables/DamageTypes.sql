CREATE TABLE [Rolls].[DamageTypes]
(
	[DamageTypeId] SMALLINT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_DamageTypes_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_DamageTypes_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[Name] VARCHAR(40)
		NOT NULL
	CONSTRAINT [UC_Rolls_DamageTypes_Name]
		UNIQUE ([Name])
);
GO

CREATE TRIGGER [Rolls].[TR_DamageTypes_DateModified]
	ON [Rolls].[DamageTypes]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[DamageTypes]
		SET [DateModified] = getUtcDate()
		WHERE [DamageTypeId] in (SELECT DISTINCT [DamageTypeId] FROM Inserted)
;
GO