using System.Collections.Generic;

namespace Entities
{
    public class User
    {
        public List<Car> CarsList;

        public User (string userName, int password)
        {
            this.userName = userName;
            this.password = password;
        }

        public User(int id, string userName, int password)
        {
            CarsList = new List<Car>();
            this.id = id;
            this.userName = userName;
            this.password = password;
        }

        public int id { get; private set; }

        public string userName { get; private set; }

        public int password { get; private set; }
    }
}
