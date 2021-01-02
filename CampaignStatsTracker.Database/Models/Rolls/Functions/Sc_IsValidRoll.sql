CREATE FUNCTION [Rolls].[Sc_IsValidRoll]
(
	@Value TINYINT,
	@DieTypeId TINYINT
)
RETURNS BIT
AS
BEGIN
	DECLARE @isValid AS BIT;

	SET @isValid =
	CASE
		WHEN @Value < 0 THEN 0
		WHEN @Value > (SELECT NumberOfSides FROM [Rolls].[DieTypes] WHERE DieTypeId = @DieTypeId) THEN 0
		ELSE 1
	END

	RETURN @isValid
END
