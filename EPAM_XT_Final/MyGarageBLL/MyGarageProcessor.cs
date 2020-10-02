using BLL.Common;
using DAL.Common;
using DAL.Resolver;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyGarageBLL
{
    public class MyGarageProcessor : IMyGarageBLL
    {
        private IMyGarageDAL dal = DALResolver.UsersDAL;

        private List<CarReference> CarReferencesList;

        public MyGarageProcessor()
        {
            CarReferencesList = dal.GetAllCarReferences();
        }


        public User GetUserInfo()
        {
            throw new NotImplementedException();
        }

        public List<CarReference> GetCarReferencesList()
        {
            return CarReferencesList;
        }
    }
}
