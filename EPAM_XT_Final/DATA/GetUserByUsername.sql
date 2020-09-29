
CREATE PROCEDURE dbo.Users_GetByUserName
	@userName int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP 1
	id, username, password
	FROM Users
	WHERE username = @userName
END
