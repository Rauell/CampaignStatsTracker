CREATE TABLE [Entities].[Entities]
(
	[EntityId] BIGINT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[PublicId] UNIQUEIDENTIFIER
		CONSTRAINT [DF_Entities_Entities_PublicId]
			DEFAULT newsequentialid()
		NOT NULL,
	CONSTRAINT [UC_Entities_Entities_PublicId]
		UNIQUE ([PublicId]),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Entities_Entities_DateCreated]
			DEFAULT getUtcDate()
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Entities_Entities_DateModified]
			DEFAULT getUtcDate()
		NOT NULL,

	[IsPublic] BIT
		CONSTRAINT [DF_Entities_Entities_IsPublic]
			DEFAULT 1
		NOT NULL,

	[IsDeleted] BIT
		CONSTRAINT [DF_Entities_Entities_IsDeleted]
			DEFAULT 0
		NOT NULL,
);