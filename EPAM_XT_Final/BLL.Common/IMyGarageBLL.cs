using Entities;
using System.Collections.Generic;

namespace BLL.Common
{
    public interface IMyGarageBLL
    {
        User GetUserInfo();

        List<CarReference> GetCarReferencesList();

        bool Authenticate(string nickname, int password, out string message);

        bool RegisterNewUser(string nickname, int password, out string message);

        void AddCarIntoUserGarage(int mileage, int carRefId);

        void RfreshCarMileage(int carId, int newMileage);

        void ServiceTheCar(int action, Car car);

        void DeleteCar(Car carToDelete);
    }
}
