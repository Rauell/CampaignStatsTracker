USE [$DatabaseName$]
GO

CREATE OR ALTER PROCEDURE [TestCheckFunctions].[test the Users.Sc_IsValidEmail function]
AS
BEGIN

  DECLARE @Actual BIT;

  SELECT @Actual = [Users].[Sc_IsValidEmail]('a@b.c');
  EXEC tSQLt.AssertEquals 1, @Actual;

  SELECT @Actual = [Users].[Sc_IsValidEmail]('');
  EXEC tSQLt.AssertEquals 0, @Actual;

  SELECT @Actual = [Users].[Sc_IsValidEmail]('a');
  EXEC tSQLt.AssertEquals 0, @Actual;

  SELECT @Actual = [Users].[Sc_IsValidEmail]('a@b');
  EXEC tSQLt.AssertEquals 0, @Actual;

  SELECT @Actual = [Users].[Sc_IsValidEmail]('b.c');
  EXEC tSQLt.AssertEquals 0, @Actual;

  SELECT @Actual = [Users].[Sc_IsValidEmail]('abc');
  EXEC tSQLt.AssertEquals 0, @Actual;
END
GO