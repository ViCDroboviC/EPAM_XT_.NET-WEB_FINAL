
CREATE PROCEDURE dbo.Users_Add
	@username nvarchar(50),
	@password int
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO Users(username, password)
	VALUES(@username, @password)
END
GO
