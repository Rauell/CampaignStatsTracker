CREATE TABLE [Rolls].[RollsToEntities]
(
	[RollToEntityId] INT
		NOT NULL
		PRIMARY KEY
		IDENTITY(1, 1),

	[DateCreated] DATETIME2(2)
		CONSTRAINT [DF_Dice_RollsToEntities_DateCreated]
			DEFAULT (getUtcDate())
		NOT NULL,

	[DateModified] DATETIME2(2)
		CONSTRAINT [DF_Dice_RollsToEntities_DateModified]
			DEFAULT (getUtcDate())
		NOT NULL,

	[RollId] INT
		NOT NULL,
	CONSTRAINT [FK_Dice_RollsToEntities_Dice_Rolls]
		FOREIGN KEY ([RollId])
		REFERENCES [Rolls].[Rolls]([RollId]),

	[EntityId] BIGINT
		NOT NULL,
	CONSTRAINT [FK_Rolls_RollsToEntities_Entities_Entities]
		FOREIGN KEY ([EntityId])
		REFERENCES [Entities].[Entities]([EntityId]),
	CONSTRAINT [DF_Rolls_RollsToEntities_RollId_EntityId]
		UNIQUE ([RollId], [EntityId])
);
GO

CREATE TRIGGER [Rolls].[TR_RollsToEntities_DateModified]
	ON [Rolls].[RollsToEntities]
	AFTER UPDATE
	AS
		UPDATE [Rolls].[RollsToEntities]
		SET [DateModified] = getUtcDate()
		WHERE [RollToEntityId] IN (SELECT DISTINCT [RollToEntityId] FROM Inserted)
;
GO