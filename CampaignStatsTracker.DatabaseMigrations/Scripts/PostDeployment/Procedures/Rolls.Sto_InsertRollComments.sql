USE [$DatabaseName$]
GO
/****** Object:  StoredProcedure [Rolls].[Sto_InsertRollComments]    Script Date: 1/23/2021 9:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rolls].[Sto_InsertRollComments]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Rolls].[Sto_InsertRollComments] AS'
END
GO
ALTER PROCEDURE [Rolls].[Sto_InsertRollComments]
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
