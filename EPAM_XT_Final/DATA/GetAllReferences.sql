
CREATE PROCEDURE dbo.GetAll

AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
	id, vendor, model, oilRefreshRate, engineResource, timingDriveResource, suspensionResource,
	gearboxResource, steeringResource, brakesResource
	FROM CarReferences
END
GO
