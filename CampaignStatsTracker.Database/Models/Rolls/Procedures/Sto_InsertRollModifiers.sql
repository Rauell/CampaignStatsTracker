CREATE PROCEDURE [Rolls].[Sto_InsertRollModifiers]
	@RollId			INT,
	@Modifiers	[Rolls].[RollModifierType] READONLY
AS
BEGIN
	INSERT INTO [Rolls].[RollModifiers]
		([RollId], [Value])
	OUTPUT
	INSERTED.[RollModifierId]
	SELECT
		@RollId,
		[Value]
	FROM @Modifiers
	WHERE [Value] <> 0
;
END

GO