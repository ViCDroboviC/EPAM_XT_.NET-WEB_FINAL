using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyGarageBLL
{
    public static class ResourceCalculator
    {
        public static int CalculateRemainingResourceOfUnit(int delta, int currentResource)
        {
            if(currentResource < delta)
            {
                return 0;
            }
            else
            {
                return currentResource - delta;
            }
        }
    }
}
