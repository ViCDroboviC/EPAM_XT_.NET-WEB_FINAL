using Entities;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DBHelper
{
    internal class UsersDataAccess : AbstractAccess
    {
        public UsersDataAccess(string coonectionString) : base(coonectionString)
        {
        }

        internal void AddUserToDB(User newUser)
        {
            using (connection = new SqlConnection(connectionString))
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

                var password = new SqlParameter("@password", SqlDbType.Int)
                {
                    Value = newUser.password
                };

                command.Parameters.Add(password);

                connection.Open();

                var reader = command.ExecuteReader();
            }
        }

        internal User GetByUsername(string wantedUsername)
        {
            using (connection = new SqlConnection(connectionString))
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
                    var password = (int)reader["password"];
                    return new User(id, username, password);
                }
                return null;
            }
        }

        internal IEnumerable<string> GetAllUsernames()
        {
            using (connection = new SqlConnection(connectionString))
            {
                var storedProcedure = "dbo.Users_GetAllNicknames";

                var command = new SqlCommand(storedProcedure, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                connection.Open();

                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var nickname = reader["username"] as string;

                    yield return nickname;
                }
            }
        }
    }
}
