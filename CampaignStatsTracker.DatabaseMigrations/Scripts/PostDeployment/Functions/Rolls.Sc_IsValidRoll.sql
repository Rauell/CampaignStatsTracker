-- USE [$DatabaseName$]
-- GO
-- /****** Object:  UserDefinedFunction [Rolls].[Sc_IsValidRoll]    Script Date: 1/23/2021 9:26:53 AM ******/
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO

-- CREATE OR ALTER FUNCTION [Rolls].[Sc_IsValidRoll]
-- (
-- 	@Value TINYINT,
-- 	@DieTypeId TINYINT
-- )
-- RETURNS BIT
-- AS
-- BEGIN
-- 	DECLARE @isValid AS BIT;

-- 	SET @isValid =
-- 	CASE
-- 		WHEN @Value < 0 THEN 0
-- 		WHEN @Value > (SELECT NumberOfSides FROM [Rolls].[DieTypes] WHERE DieTypeId = @DieTypeId) THEN 0
-- 		ELSE 1
-- 	END

-- 	RETURN @isValid
-- END

-- GO
