using DAL.Common;
using Entities;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.SqlTypes;

namespace DBHelper
{
    public class MyGarageDBHelper : IMyGarageDAL
    {
        private static SqlConnection connection = new SqlConnection(_connectionString);
        //в случае проблем с подсоединением к БД проверять это место в первую очередь

        public MyGarageDBHelper() { }

        private static string _connectionString => ConfigurationManager.ConnectionStrings["DefaultDB"].ConnectionString;

        public void AddCar(Car newCar)
        {
            AddCarToDB(newCar);
        }

        public void AddUser(User newUser)
        {
            AddUserToDB(newUser);
        }

        public List<CarReference> GetAllCarReferences()
        {
            List<CarReference> carsList = new List<CarReference>(GetAwaliableCarsList());
            return carsList;
        }

        public List<Car> GetCarsByOwnerId(int ownerId)
        {
            List<Car> userGarage = new List<Car>(GetUserCars(ownerId));
            return userGarage;
        }

        public CarReference GetReferenceById(int wantedId)
        {
            return GetRefById(wantedId);
        }

        public User GetUser(string username)
        {
            return (GetByUsername(username));
        }

        public void RefreshCarData(Car car)
        {
            RefreshCar(car);
        }

        private void AddUserToDB(User newUser)
        {
            using (connection)
            {
                var storedProcedure = "dbo.Users_Add";

                var command = new SqlCommand(storedProcedure, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                var userName = new SqlParameter("@username", SqlDbType.NVarChar)
                {
                    Value = newUser.userName
                };

                command.Parameters.Add(userName);

                var password = new SqlParameter("@password", SqlDbType.NVarChar)
                {
                    Value = newUser.password
                };

                command.Parameters.Add(password);

                connection.Open();

                var reader = command.ExecuteReader();
            }
        }

        private void AddCarToDB(Car newCar)
        {
            using (connection)
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

        private void RefreshCar(Car car)
        {
            using (connection)
            {
                var storedProcedure = "dbo.Cars_Refresh";

                var command = new SqlCommand(storedProcedure, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

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

        private CarReference GetRefById(int wantedId)
        {
            using (connection)
            {
                var storedProcedure = "dbo.CarReferences_GetById";

                var command = new SqlCommand(storedProcedure, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                var id = new SqlParameter("@id", SqlDbType.Int)
                {
                    Value = wantedId
                };

                command.Parameters.Add(id);

                connection.Open();

                var reader = command.ExecuteReader();

                var vendor = reader["vendor"] as string;
                var model = reader["model"] as string;
                var oilRefreshRate = (int)reader["oilRefreshRate"];
                var engineResource = (int)reader["engineResource"];
                var timingDriveResource = (int)reader["timingDriveResource"];
                var suspensionResource = (int)reader["suspensionResource"];
                var gearboxResource = (int)reader["gearboxResource"];
                var steeringResource = (int)reader["steeringResource"];
                var brakesResource = (int)reader["brakesResource"];

                return new CarReference(wantedId, vendor, model, oilRefreshRate, engineResource, timingDriveResource,
                    suspensionResource, gearboxResource, steeringResource, brakesResource);
            }
        }

        private IEnumerable<Car> GetUserCars(int ownerId)
        {
            using (connection = new SqlConnection(_connectionString))
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

        private IEnumerable<CarReference> GetAwaliableCarsList()
        {
            using (connection = new SqlConnection(_connectionString))
            {
                var storedProcedure = "dbo.GetAll";

                var command = new SqlCommand(storedProcedure, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                connection.Open();

                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var id = (int)reader["id"];
                    var vendor = reader["vendor"] as string;
                    var model = reader["model"] as string;
                    var oilRefreshRate = (int)reader["oilRefreshRate"];
                    var engineResource = (int)reader["engineResource"];
                    var timingDriveResource = (int)reader["timingDriveResource"];
                    var suspensionResource = (int)reader["suspensionResource"];
                    var gearboxResource = (int)reader["gearboxResource"];
                    var steeringResource = (int)reader["steeringResource"];
                    var brakesResource = (int)reader["brakesResource"];

                    yield return new CarReference(id, vendor, model, oilRefreshRate, engineResource, timingDriveResource, suspensionResource,
                        gearboxResource, steeringResource, brakesResource);
                }
            }
        }

        private User GetByUsername(string wantedUsername)
        {
            using (connection = new SqlConnection(_connectionString))
            {
                var storedProcedure = "dbo.Users_GetByUserName";

                var command = new SqlCommand(storedProcedure, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                var userName = new SqlParameter("@userName", SqlDbType.NVarChar)
                {
                    Value = wantedUsername
                };

                command.Parameters.Add(userName);

                connection.Open();

                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var id = (int)reader["id"];
                    var username = reader["username"] as string;
                    var password = reader["password"] as string;
                    return new User(id, username, password);
                }
                return null;
            }
        }
    }
}
