using System.Data;
using System.Data.SqlClient;

namespace DBHelper
{
    internal class ManufacturersDataAccessor
    {

        private static SqlConnection connection;

        private string connectionString; 

        public ManufacturersDataAccessor(string coonectionString)
        {
            this.connectionString = coonectionString;
        }
        internal string GetManufacturerById(int wantedId)
        {
            using (connection = new SqlConnection(connectionString))
            {
                var storedProcedure = "dbo.manufacturers_GetById";

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

                var manufacturer = reader["manufacturer"] as string;

                return manufacturer;
            }
        }
    }
}
