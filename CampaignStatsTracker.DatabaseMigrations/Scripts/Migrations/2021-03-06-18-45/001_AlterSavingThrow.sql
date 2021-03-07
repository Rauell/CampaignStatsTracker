USE [$DatabaseName$]
GO

ALTER TABLE [Rolls].[SavingThrows]
	ALTER COLUMN [Success] BIT NULL
GO
