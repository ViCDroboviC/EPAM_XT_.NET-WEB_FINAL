using BLL.Common;
using DAL.Common;
using DBHelper;
using MyGarageBLL;

namespace DependencyResolver
{
    public static class Resolver
    {
        public static IMyGarageDAL dal { get; private set; }
        public static IMyGarageBLL bll { get; private set; }

        static Resolver()
        {
            dal = new MyGarageDBHelper();
            bll = new MyGarageProcessor(dal);
        }
    }
}
