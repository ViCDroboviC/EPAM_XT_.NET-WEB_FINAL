using DAL.Common;
using Entities;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;

namespace DBHelper
{
    public class MyGarageDBHelper : IMyGarageDAL
    {
        private static SqlConnection connection = new SqlConnection(_connectionString);

        private UsersDataAccess usersAccess = new UsersDataAccess(_connectionString);

        private CarReferencesAccess carReferencesAccess = new CarReferencesAccess(_connectionString);

        private CarsAccess carsAccess = new CarsAccess(_connectionString);

        public MyGarageDBHelper() { }

        private static string _connectionString => ConfigurationManager.ConnectionStrings["DefaultDB"].ConnectionString;

        public void AddCar(Car newCar)
        {
            carsAccess.AddCar(newCar);
        }

        public void AddUser(User newUser)
        {
            usersAccess.AddUserToDB(newUser);
        }

        public List<CarReference> GetAllCarReferences()
        {
            List<CarReference> carsList = new List<CarReference>(carReferencesAccess.GetAllCarRefs());
            return carsList;
        }

        public List<Car> GetCarsByOwnerId(int ownerId)
        {
            List<Car> userGarage = new List<Car>(carsAccess.GetCarsByUser(ownerId));
            return userGarage;
        }

        public User GetUser(string username)
        {
            return (usersAccess.GetByUsername(username));
        }

        public void RefreshCarData(Car car)
        {
            carsAccess.RefreshCar(car);
        }

        public List<string> GetAllNicknames()
        {
            List<string> usernames = new List<string>(usersAccess.GetAllUsernames());
            return usernames;
        }

        public void DeleteCarById(int id)
        {
            carsAccess.DeleteCar(id);
        }
    }
}
