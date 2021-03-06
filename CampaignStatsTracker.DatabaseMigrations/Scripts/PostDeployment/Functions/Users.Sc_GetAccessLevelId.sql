USE [$DatabaseName$]
GO
/****** Object:  UserDefinedFunction [Users].[Sc_GetAccessLevelId]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [Users].[Sc_GetAccessLevelId]
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
