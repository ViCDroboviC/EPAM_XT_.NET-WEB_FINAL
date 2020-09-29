
CREATE PROCEDURE dbo.Cars_Refresh
	@ownerId int,
	@refId int,
	@nextOilRefresh int,
	@remainingEngineRes int,
	@remainingTimingDriveRes int,
	@remainingSuspensionRes int,
	@remainingGearboxRes int,
	@remainingSteeringRes int,
	@remainingBrakesRes int,
	@totalMileage int
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO Cars(ownerId, referenceId, remainingEngineRes, remainingTimingDriveRes,
	remainingSuspensionRes, remainingGearboxRes, remainingSteeringRes, remainingBrakesRes, totalMileage)
	VALUES(@ownerId, @refId, @nextOilRefresh, @remainingEngineRes, @remainingTimingDriveRes, @remainingSuspensionRes,
	@remainingGearboxRes, @remainingSteeringRes, @remainingBrakesRes, @totalMileage)
END
GO
