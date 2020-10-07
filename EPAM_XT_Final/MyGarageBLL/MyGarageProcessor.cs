﻿using BLL.Common;
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
            if (wantedUser != null)
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

        public void RfreshCarMileage(int carId, int newMileage)
        {
            var car = currentUser.CarsList.FirstOrDefault(item => item.id == carId); //Получаем автомобиль из списка авто текущего пользователя по id
            var delta = newMileage - car.totalMileage;

            var nextOilRefresh = ResourceCalculator.CalculateRemainingResourceOfUnit(delta, car.nextOilRefresh);
            var remainingEngineRes = ResourceCalculator.CalculateRemainingResourceOfUnit(delta, car.remainingEngineRes);
            var remainingTimingDriveRes = ResourceCalculator.CalculateRemainingResourceOfUnit(delta, car.remainingTimingDriveRes);
            var remainingSuspensionRes = ResourceCalculator.CalculateRemainingResourceOfUnit(delta, car.remainingSuspensionRes);
            var remainingGearboxRes = ResourceCalculator.CalculateRemainingResourceOfUnit(delta, car.remainingGearboxRes);
            var remainingSteeringRes = ResourceCalculator.CalculateRemainingResourceOfUnit(delta, car.remainingSteeringRes);
            var remainingBrakesRes = ResourceCalculator.CalculateRemainingResourceOfUnit(delta, car.remainingBrakesRes);

            car = new Car(carId, currentUser.id, car.referenceId, newMileage, nextOilRefresh, remainingEngineRes, remainingTimingDriveRes, remainingSuspensionRes,
                remainingGearboxRes, remainingSteeringRes, remainingBrakesRes);

            dal.RefreshCarData(car);
            initializeUserGarage();
        }

        public void ServiceTheCar(int action, Car car)
        {
            var reference = CarReferencesList.FirstOrDefault(item => item.id == car.referenceId);
            Car servicedCar = null;

            switch (action)
            {
                case 0:
                    int nextOilRefresh = ResourceCalculator.RefreshUnitResource(action, reference);
                    servicedCar = new Car(car.id,
                        currentUser.id,
                        car.referenceId,
                        car.totalMileage,
                        nextOilRefresh,
                        car.remainingEngineRes,
                        car.remainingTimingDriveRes,
                        car.remainingSuspensionRes,
                        car.remainingGearboxRes,
                        car.remainingSteeringRes,
                        car.remainingBrakesRes);

                    dal.RefreshCarData(servicedCar);
                    break;
                case 1:
                    int remainingTimingDriveRes = ResourceCalculator.RefreshUnitResource(action, reference);
                    servicedCar = new Car(car.id,
                        currentUser.id,
                        car.referenceId,
                        car.totalMileage,
                        car.nextOilRefresh,
                        car.remainingEngineRes,
                        remainingTimingDriveRes,
                        car.remainingSuspensionRes,
                        car.remainingGearboxRes,
                        car.remainingSteeringRes,
                        car.remainingBrakesRes);

                    dal.RefreshCarData(servicedCar);
                    break;
                case 2:
                    int remainingEngineRes = ResourceCalculator.RefreshUnitResource(action, reference);
                    servicedCar = new Car(car.id,
                        currentUser.id,
                        car.referenceId,
                        car.totalMileage,
                        car.nextOilRefresh,
                        remainingEngineRes,
                        car.remainingTimingDriveRes,
                        car.remainingSuspensionRes,
                        car.remainingGearboxRes,
                        car.remainingSteeringRes,
                        car.remainingBrakesRes);

                    dal.RefreshCarData(servicedCar);
                    break;
                case 3:
                    int remainingGearboxRes = ResourceCalculator.RefreshUnitResource(action, reference);
                    servicedCar = new Car(car.id,
                        currentUser.id,
                        car.referenceId,
                        car.totalMileage,
                        car.nextOilRefresh,
                        car.remainingEngineRes,
                        car.remainingTimingDriveRes,
                        car.remainingSuspensionRes,
                        remainingGearboxRes,
                        car.remainingSteeringRes,
                        car.remainingBrakesRes);

                    dal.RefreshCarData(servicedCar);
                    break;
                case 4:
                    int remainingSuspensionRes = ResourceCalculator.RefreshUnitResource(action, reference);
                    servicedCar = new Car(car.id,
                        currentUser.id,
                        car.referenceId,
                        car.totalMileage,
                        car.nextOilRefresh,
                        car.remainingEngineRes,
                        car.remainingTimingDriveRes,
                        remainingSuspensionRes,
                        car.remainingGearboxRes,
                        car.remainingSteeringRes,
                        car.remainingBrakesRes);

                    dal.RefreshCarData(servicedCar);
                    break;
                case 5:
                    int remainingSteeringRes = ResourceCalculator.RefreshUnitResource(action, reference);
                    servicedCar = new Car(car.id,
                        currentUser.id,
                        car.referenceId,
                        car.totalMileage,
                        car.nextOilRefresh,
                        car.remainingEngineRes,
                        car.remainingTimingDriveRes,
                        car.remainingSuspensionRes,
                        car.remainingGearboxRes,
                        remainingSteeringRes,
                        car.remainingBrakesRes);

                    dal.RefreshCarData(servicedCar);
                    break;
                case 6:
                    int remainingBrakesRes = ResourceCalculator.RefreshUnitResource(action, reference);
                    servicedCar = new Car(car.id,
                        currentUser.id,
                        car.referenceId,
                        car.totalMileage,
                        car.nextOilRefresh,
                        car.remainingEngineRes,
                        car.remainingTimingDriveRes,
                        car.remainingSuspensionRes,
                        car.remainingGearboxRes,
                        car.remainingSteeringRes,
                        remainingBrakesRes);
                    dal.RefreshCarData(servicedCar);
                    break;
            }
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
