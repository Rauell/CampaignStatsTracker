USE [$DatabaseName$]
GO
/****** Object:  UserDefinedFunction [Games].[Sc_GetCharacterPublicId]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [Games].[Sc_GetCharacterPublicId]
(
	@CharacterId INT
)
RETURNS UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @PublicId UNIQUEIDENTIFIER;

	SELECT @PublicId = EE.[PublicId]
	FROM [Games].[Characters] GC
		INNER JOIN [Entities].[Entities] EE
			ON EE.[EntityId] = GC.[EntityId]
	WHERE GC.[CharacterId] = @CharacterId
	;

	RETURN @PublicId
END
GO
