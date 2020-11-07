using System.Data.SqlClient;

namespace DBHelper
{
    internal abstract class AbstractAccess
    {
        protected static SqlConnection connection;

        protected string connectionString;

        public AbstractAccess(string coonectionString)
        {
            this.connectionString = coonectionString;
        }
    }
}
