using DAL.Common;
using DBHelper;

namespace DAL.Resolver
{
    public class DALResolver
    {

        private static IMyGarageDAL usersDAL;

        public static IMyGarageDAL UsersDAL => usersDAL ?? (usersDAL = new MyGarageDBHelper());

    }
}
