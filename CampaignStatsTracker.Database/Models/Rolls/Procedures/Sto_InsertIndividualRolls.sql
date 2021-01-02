CREATE PROCEDURE [Rolls].[Sto_InsertIndividualRolls]
	@RollId	INT,
	@Dice		[Rolls].[DieRollType] READONLY
AS
BEGIN
	INSERT INTO [Rolls].[IndividualRolls]([RollId], [DieTypeId], [Value])
	OUTPUT INSERTED.[IndividualRollId]
	SELECT
		@RollId,
		DT.[DieTypeId],
		D.[Value]
	FROM @Dice D
	INNER JOIN [Rolls].[DieTypes] DT
		ON DT.[NumberOfSides] = D.[NumberOfSides]
	;
END

GO