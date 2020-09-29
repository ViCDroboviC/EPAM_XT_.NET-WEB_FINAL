using Entities;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Common
{
    public interface IMyGarageDAL
    {
        User GetUser(string username);
    }
}
