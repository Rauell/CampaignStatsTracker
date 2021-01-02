CREATE FUNCTION [Users].[Sc_GetAccessLevelId]
(
	@AccessLevel VARCHAR(50)
)
RETURNS TINYINT
AS
BEGIN
	RETURN (
		SELECT [AccessLevelId]
		FROM [Users].[AccessLevels]
		WHERE [DisplayName] = @AccessLevel
	)
END
GO
