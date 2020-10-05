
CREATE PROCEDURE dbo.Users_GetByUserName
	@userName nvarChar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP 1
	id, username, password
	FROM Users
	WHERE username = @userName
END
