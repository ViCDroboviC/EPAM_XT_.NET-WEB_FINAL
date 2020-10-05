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

        private User currentUser;

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
            return currentUser;
        }

        public List<CarReference> GetCarReferencesList()
        {
            return CarReferencesList;
        }

        public bool Authenticate(string nickname, int password, out string message)
        {
            var wantedUser = dal.GetUser(nickname);
            if(wantedUser != null)
            {
                if (wantedUser.userName.ToLower() == nickname.ToLower() && wantedUser.password == password)
                {
                    currentUser = wantedUser;
                    currentUser.CarsList = dal.GetCarsByOwnerId(currentUser.id);
                    foreach (Car car in wantedUser.CarsList)
                    {
                        var carReference = CarReferencesList.FirstOrDefault(carRef => carRef.id == car.referenceId);

                        string fullName = carReference.vendor + " " + carReference.model;

                        car.fullName = fullName;
                    }
                    message = null;
                    return true;
                }
            }
            message = "Введено неправильное имя пользователя или пароль!";
            return false;
        }
    }
}
