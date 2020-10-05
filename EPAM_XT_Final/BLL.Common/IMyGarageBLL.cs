using Entities;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Common
{
    public interface IMyGarageBLL
    {
        User GetUserInfo();

        List<CarReference> GetCarReferencesList();

        bool Authenticate(string nickname, int password, out string message);
    }
}
