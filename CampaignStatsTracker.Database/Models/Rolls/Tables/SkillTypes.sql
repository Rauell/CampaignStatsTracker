CREATE TABLE [Rolls].[SkillTypes]
(
	[SkillTypeId] SMALLINT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Rolls_SkillTypes_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Rolls_SkillTypes_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[Name] VARCHAR(40)
		NOT NULL
	CONSTRAINT [UC_Rolls_SkillTypes_Name]
		UNIQUE ([Name])
);
GO

CREATE TRIGGER [Rolls].[TR_SkillTypes_DateModified]
	ON [Rolls].[SkillTypes]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[SkillTypes]
		SET [DateModified] = getUtcDate()
		WHERE [SkillTypeId] in (SELECT DISTINCT [SkillTypeId] FROM Inserted)
;
GO