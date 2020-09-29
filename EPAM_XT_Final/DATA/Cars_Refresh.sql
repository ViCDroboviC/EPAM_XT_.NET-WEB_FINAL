
CREATE PROCEDURE dbo.Cars_Refresh
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

	INSERT INTO Cars(nextOilRefresh, remainingEngineRes, remainingTimingDriveRes,
	remainingSuspensionRes, remainingGearboxRes, remainingSteeringRes, remainingBrakesRes, totalMileage)
	VALUES(@nextOilRefresh, @remainingEngineRes, @remainingTimingDriveRes, @remainingSuspensionRes,
	@remainingGearboxRes, @remainingSteeringRes, @remainingBrakesRes, @totalMileage)
END
GO
