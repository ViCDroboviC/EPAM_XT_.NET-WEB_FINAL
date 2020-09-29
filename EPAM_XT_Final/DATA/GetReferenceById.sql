

CREATE PROCEDURE dbo.CarReferences_GetById 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1
	vendor, model, oilRefreshRate, engineResource, timingDriveResource, suspensionResource, gearboxResource,
	steeringResource, brakesResource
	FROM CarReferences
	WHERE id = @id
END
GO
