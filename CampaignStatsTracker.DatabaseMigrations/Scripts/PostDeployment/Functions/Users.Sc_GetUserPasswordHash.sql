USE [$DatabaseName$]
GO
/****** Object:  UserDefinedFunction [Users].[Sc_GetUserPasswordHash]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [Users].[Sc_GetUserPasswordHash]
(
	@Password VARCHAR(250),
	@Handle VARCHAR(50)
)
RETURNS BINARY(64)
AS
BEGIN
	RETURN HASHBYTES('SHA2_512', CONCAT(@Handle, @Password));
END

GO
