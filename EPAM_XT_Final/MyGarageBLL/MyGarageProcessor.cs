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
                    initializeUserGarage();
                    message = null;
                    return true;
                }
            }
            message = "Введено неправильное имя пользователя или пароль!";
            return false;
        }

        public bool RegisterNewUser(string nickname, int password, out string message)
        {           
            List<string> existingNicknames = dal.GetAllNicknames();
            if (existingNicknames.Contains(nickname, StringComparer.InvariantCultureIgnoreCase))
            {
                message = "Имя уже используется!";
                return false;
            }
            else
            {
                dal.AddUser(new User(nickname, password));
                message = "Регистрация прошла успешно!";
                return true;
            }
        }

        public void AddCarIntoUserGarage(int mileage, int carRefId)
        {
            var carRef = CarReferencesList.FirstOrDefault(reference => reference.id == carRefId);
            var nextOilRefresh = carRef.nextOilRefresh - mileage;
            var newEngine = carRef.engineResource - mileage;
            var newTimingDrive = carRef.timingDriveResource - mileage;
            var newGearbox = carRef.gearboxResource - mileage;
            var newSuspension = carRef.suspensionResource - mileage;
            var newSteering = carRef.steeringResource - mileage;
            var newBrakes = carRef.brakesResource - mileage;
            Car newCar = new Car(currentUser.id, carRefId, mileage, nextOilRefresh, newEngine, newTimingDrive, newSuspension, newGearbox, newSteering, newBrakes);
            dal.AddCar(newCar);
            initializeUserGarage();
        }

        private void initializeUserGarage()
        {
            currentUser.CarsList = dal.GetCarsByOwnerId(currentUser.id);
            foreach (Car car in currentUser.CarsList)
            {
                var carReference = CarReferencesList.FirstOrDefault(carRef => carRef.id == car.referenceId);

                string fullName = carReference.vendor + " " + carReference.model;

                car.fullName = fullName;
            }
        }
    }
}
