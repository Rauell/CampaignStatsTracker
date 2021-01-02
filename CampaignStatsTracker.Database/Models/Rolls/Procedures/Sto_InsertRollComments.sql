CREATE PROCEDURE [Rolls].[Sto_InsertRollComments]
	@RollId		INT,
	@Comments	[Rolls].[RollCommentType] READONLY
AS
BEGIN
	INSERT INTO [Rolls].[RollComments]([RollId], [Comment])
	OUTPUT INSERTED.[RollCommentId]
	SELECT
		@RollId,
		[Comment]
	FROM @Comments
	WHERE ISNULL([Comment], '') <> ''
	;
END

GO