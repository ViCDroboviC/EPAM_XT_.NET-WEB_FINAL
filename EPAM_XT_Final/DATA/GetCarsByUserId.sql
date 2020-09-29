
CREATE PROCEDURE dbo.Cars_GetByUserId
	@userId int
AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
	id, referenceId, nextOilRefresh, remainingEngineRes, remainingTimingDriveRes, remainingSuspensionRes,
	remainingGearboxRes, remainingSteeringRes, remainingBrakesRes, totalMileage
	FROM Cars
	WHERE ownerId = @userId
END
GO
