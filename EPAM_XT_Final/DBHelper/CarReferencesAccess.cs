using Entities;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DBHelper
{
    internal class CarReferencesAccess : AbstractAccess
    {
        public CarReferencesAccess(string coonectionString) : base(coonectionString)
        {
        }

        internal IEnumerable<CarReference> GetAllCarRefs()
        {
            using (connection = new SqlConnection(connectionString))
            {
                var storedProcedure = "dbo.CarReferences_GetAll";

                var command = new SqlCommand(storedProcedure, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                connection.Open();

                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var id = (int)reader["id"];
                    var manufacturer = reader["manufacturer"] as string;
                    var model = reader["model"] as string;
                    var oilRefreshRate = (int)reader["oilRefreshRate"];
                    var engineResource = (int)reader["engineResource"];
                    var timingDriveResource = (int)reader["timingDriveResource"];
                    var suspensionResource = (int)reader["suspensionResource"];
                    var gearboxResource = (int)reader["gearboxResource"];
                    var steeringResource = (int)reader["steeringResource"];
                    var brakesResource = (int)reader["brakesResource"];

                    yield return new CarReference(id, manufacturer, model, oilRefreshRate, engineResource, timingDriveResource, suspensionResource,
                        gearboxResource, steeringResource, brakesResource);
                }
            }
        }
    }
}
