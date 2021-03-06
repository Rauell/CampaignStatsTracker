USE [$DatabaseName$]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [Games].[Sto_GetAttributeId]
	@Name VARCHAR(20)
AS
BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = '';
	END

	DECLARE @AttributeId TINYINT = (
		SELECT [AttributeId]
		FROM [Games].[Attributes]
		WHERE [Name] = @Name
	);

	RETURN @AttributeId;
END
GO
