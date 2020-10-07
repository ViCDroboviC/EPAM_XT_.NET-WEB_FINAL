﻿using Entities;
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

        public static int RefreshUnitResource(int unit, CarReference reference)
        {
            switch (unit)
            {
                case 0:
                    return reference.nextOilRefresh;
                case 1:
                    return reference.timingDriveResource;
                case 2:
                    return reference.engineResource;
                case 3:
                    return reference.gearboxResource;
                case 4:
                    return reference.suspensionResource;
                case 5:
                    return reference.steeringResource;
                case 6:
                    return reference.brakesResource;
                default:
                    return 10;
            }
        }
    }
}
