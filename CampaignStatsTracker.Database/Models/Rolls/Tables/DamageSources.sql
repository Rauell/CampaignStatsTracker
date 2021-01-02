CREATE TABLE [Rolls].[DamageSources]
(
	[DamageSourceId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_DamageSources_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_DamageSources_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DamageTypeId] SMALLINT
		CONSTRAINT [FK_Rolls_DamageSources_Rolls_DamageTypes]
			FOREIGN KEY ([DamageTypeId])
			REFERENCES [Rolls].[DamageTypes]([DamageTypeId]),

	[Name] VARCHAR(40)
		NOT NULL
	CONSTRAINT [UC_Rolls_DamageSources_Name]
		UNIQUE ([Name])
);
GO

CREATE TRIGGER [Rolls].[TR_DamageSources_DateModified]
	ON [Rolls].[DamageSources]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[DamageSources]
		SET [DateModified] = getUtcDate()
		WHERE [DamageSourceId] in (SELECT DISTINCT [DamageSourceId] FROM Inserted)
;
GO