using BLL.Common;
using DAL.Common;
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
        private IMyGarageDAL dal;

        private List<CarReference> CarReferencesList;

        public MyGarageProcessor()
        {
        }

        public MyGarageProcessor(IMyGarageDAL dal)
        {
            this.dal = dal;
            CarReferencesList = dal.GetAllCarReferences();
        }


        public User GetUserInfo()
        {
            var wantedUser = dal.GetUser("ViCDroboviC");

            wantedUser.CarsList = dal.GetCarsByOwnerId(wantedUser.id);

            foreach (Car car in wantedUser.CarsList)
            {
                var carReference = CarReferencesList.FirstOrDefault(carRef => carRef.id == car.referenceId);

                string fullName = carReference.vendor + " " + carReference.model;

                car.fullName = fullName;
            }

            return wantedUser;
        }

        public List<CarReference> GetCarReferencesList()
        {
            return CarReferencesList;
        }
    }
}
