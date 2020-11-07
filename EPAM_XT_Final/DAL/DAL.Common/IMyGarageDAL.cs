using Entities;
using System.Collections.Generic;

namespace DAL.Common
{
    public interface IMyGarageDAL
    {
        User GetUser(string username); //Получение данных пользователя при авторизации

        List<CarReference> GetAllCarReferences(); // Вывод всех доступных авто при добавлении авто в гараж пользователя

        List<Car> GetCarsByOwnerId(int ownerId); // Получение списка авто в гараже пользователя

        void AddCar(Car newCar); // Добавление авто в гараж пользователя

        void AddUser(User newUser); // Создание нового пользователя

        void RefreshCarData(Car car); //Обновление пробега

        List<string> GetAllNicknames(); //Получение всех никнеймов для проверки возможности создания нового пользователя

        void DeleteCarById(int id); //Удаление авто по Id
    }
}
