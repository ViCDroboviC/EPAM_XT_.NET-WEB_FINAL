using Entities;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DBHelper
{
    internal class CarsAccess : AbstractAccess
    {
        public CarsAccess(string coonectionString) : base(coonectionString)
        {
        }

        internal void AddCar(Car newCar)
        {
            using (connection = new SqlConnection(connectionString))
            {
                var storedProcedure = "dbo.Cars_Add";

                var command = new SqlCommand(storedProcedure, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                var ownerId = new SqlParameter("@ownerId", SqlDbType.Int)
                {
                    Value = newCar.ownerId
                };

                command.Parameters.Add(ownerId);

                var referenceId = new SqlParameter("@refId", SqlDbType.Int)
                {
                    Value = newCar.referenceId
                };

                command.Parameters.Add(referenceId);

                var nextOilRefresh = new SqlParameter("@nextOilRefresh", SqlDbType.Int)
                {
                    Value = newCar.nextOilRefresh
                };

                command.Parameters.Add(nextOilRefresh);

                var remainingEngineRes = new SqlParameter("@remainingEngineRes", SqlDbType.Int)
                {
                    Value = newCar.remainingEngineRes
                };

                command.Parameters.Add(remainingEngineRes);

                var remainingTimingDriveRes = new SqlParameter("@remainingTimingDriveRes", SqlDbType.Int)
                {
                    Value = newCar.remainingTimingDriveRes
                };

                command.Parameters.Add(remainingTimingDriveRes);

                var remainingSuspensionRes = new SqlParameter("@remainingSuspensionRes", SqlDbType.Int)
                {
                    Value = newCar.remainingSuspensionRes
                };

                command.Parameters.Add(remainingSuspensionRes);

                var remainingGearboxRes = new SqlParameter("@remainingGearboxRes", SqlDbType.Int)
                {
                    Value = newCar.remainingGearboxRes
                };

                command.Parameters.Add(remainingGearboxRes);

                var remainingSteeringRes = new SqlParameter("@remainingSteeringRes", SqlDbType.Int)
                {
                    Value = newCar.remainingSteeringRes
                };

                command.Parameters.Add(remainingSteeringRes);

                var remainingBrakesRes = new SqlParameter("@remainingBrakesRes", SqlDbType.Int)
                {
                    Value = newCar.remainingBrakesRes
                };

                command.Parameters.Add(remainingBrakesRes);

                var totalMileage = new SqlParameter("@totalMileage", SqlDbType.Int)
                {
                    Value = newCar.totalMileage
                };

                command.Parameters.Add(totalMileage);

                connection.Open();

                var reader = command.ExecuteReader();
            }

        }

        internal void RefreshCar(Car car)
        {
            using (connection = new SqlConnection(connectionString))
            {
                var storedProcedure = "dbo.Cars_Refresh";

                var command = new SqlCommand(storedProcedure, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                var id = new SqlParameter("@id", SqlDbType.Int)
                {
                    Value = car.id
                };

                command.Parameters.Add(id);

                var nextOilRefresh = new SqlParameter("@nextOilRefresh", SqlDbType.Int)
                {
                    Value = car.nextOilRefresh
                };

                command.Parameters.Add(nextOilRefresh);

                var remainingEngineRes = new SqlParameter("@remainingEngineRes", SqlDbType.Int)
                {
                    Value = car.remainingEngineRes
                };

                command.Parameters.Add(remainingEngineRes);

                var remainingTimingDriveRes = new SqlParameter("@remainingTimingDriveRes", SqlDbType.Int)
                {
                    Value = car.remainingTimingDriveRes
                };

                command.Parameters.Add(remainingTimingDriveRes);

                var remainingSuspensionRes = new SqlParameter("@remainingSuspensionRes", SqlDbType.Int)
                {
                    Value = car.remainingSuspensionRes
                };

                command.Parameters.Add(remainingSuspensionRes);

                var remainingGearboxRes = new SqlParameter("@remainingGearboxRes", SqlDbType.Int)
                {
                    Value = car.remainingGearboxRes
                };

                command.Parameters.Add(remainingGearboxRes);

                var remainingSteeringRes = new SqlParameter("@remainingSteeringRes", SqlDbType.Int)
                {
                    Value = car.remainingSteeringRes
                };

                command.Parameters.Add(remainingSteeringRes);

                var remainingBrakesRes = new SqlParameter("@remainingBrakesRes", SqlDbType.Int)
                {
                    Value = car.remainingBrakesRes
                };

                command.Parameters.Add(remainingBrakesRes);

                var totalMileage = new SqlParameter("@totalMileage", SqlDbType.Int)
                {
                    Value = car.totalMileage
                };

                command.Parameters.Add(totalMileage);

                connection.Open();

                var reader = command.ExecuteReader();
            }
        }

        internal IEnumerable<Car> GetCarsByUser(int ownerId)
        {
            using (connection = new SqlConnection(connectionString))
            {
                var storedProcedure = "dbo.Cars_GetByUserId";

                var command = new SqlCommand(storedProcedure, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                var wantedId = new SqlParameter("@userId", SqlDbType.Int)
                {
                    Value = ownerId
                };

                command.Parameters.Add(wantedId);

                connection.Open();

                var reader = command.ExecuteReader();



                while (reader.Read())
                {
                    var id = (int)reader["id"];
                    var referenceId = (int)reader["referenceId"];
                    var nextOilRefresh = (int)reader["nextOilRefresh"];
                    var remainingEngineRes = (int)reader["remainingEngineRes"];
                    var remainingTimingDriveRes = (int)reader["remainingTimingDriveRes"];
                    var remainingSuspensionRes = (int)reader["remainingSuspensionRes"];
                    var remainingGearboxRes = (int)reader["remainingGearboxRes"];
                    var remainingSteeringRes = (int)reader["remainingSteeringRes"];
                    var remainingBrakesRes = (int)reader["remainingBrakesRes"];
                    var totalMileage = (int)reader["totalMileage"];

                    yield return new Car(id, ownerId, referenceId, totalMileage, nextOilRefresh, remainingEngineRes, remainingTimingDriveRes, remainingSuspensionRes, remainingGearboxRes,
                        remainingSteeringRes, remainingBrakesRes);
                }
            }
        }

        internal void DeleteCar(int carId)
        {
            using (connection = new SqlConnection(connectionString))
            {
                var storedProcedure = "dbo.Cars_DeleteById";

                var command = new SqlCommand(storedProcedure, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                var id = new SqlParameter("@id", SqlDbType.Int)
                {
                    Value = carId
                };

                command.Parameters.Add(id);

                connection.Open();

                command.ExecuteReader();
            }
        }
    }
}
