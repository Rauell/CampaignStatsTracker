CREATE FUNCTION [Users].[Sc_IsValidEmail]
(
	@Email VARCHAR(250)
)
RETURNS BIT
AS
BEGIN
	DECLARE @bitEmailVal AS BIT
	DECLARE @EmailText VARCHAR(100)

	SET @EmailText=ltrim(rtrim(isnull(@EMAIL,'')))

	SET @bitEmailVal =
	CASE
		WHEN @EmailText = '' THEN 0
		WHEN @EmailText LIKE '% %' THEN 0
		WHEN @EmailText LIKE ('%["(),:;<>\]%') THEN 0
		WHEN substring(@EmailText,charindex('@',@EmailText),len(@EmailText)) LIKE ('%[!#$%&*+/=?^`_{|]%') THEN 0
		WHEN (left(@EmailText,1) LIKE ('[-_.+]') OR right(@EmailText,1) LIKE ('[-_.+]')) THEN 0
		WHEN (@EmailText LIKE '%[%' or @EmailText LIKE '%]%') THEN 0
		WHEN @EmailText LIKE '%@%@%' THEN 0
		WHEN @EmailText NOT LIKE '_%@_%._%' THEN 0
		ELSE 1
	END
	RETURN @bitEmailVal
END
GO
