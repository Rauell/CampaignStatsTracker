CREATE PROCEDURE [Rolls].[Sto_InsertDieType]
	@Sides				TINYINT,
	@DisplayName	VARCHAR(10)
AS
BEGIN

	INSERT INTO [Rolls].[DieTypes]([DieTypeId], [DisplayName])
	VALUES (@Sides, @DisplayName)
	;

	RETURN @Sides;
END

GO