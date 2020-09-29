using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Car
    {
        public Car(int id, int ownerId, int referenceId, int totalMileage, int nextOilRefresh, int remainingEngineRes,
            int remainingTimingDriveRes, int remainingSuspensionRes, int remainingGearboxRes, int remainingSteeringRes,
            int remainingBrakesRes)
        {
            this.id = id;
            this.ownerId = ownerId;
            this.referenceId = referenceId;
            this.totalMileage = totalMileage;
            this.nextOilRefresh = nextOilRefresh;
            this.remainingEngineRes = remainingEngineRes;
            this.remainingTimingDriveRes = remainingTimingDriveRes;
            this.remainingSuspensionRes = remainingSuspensionRes;
            this.remainingGearboxRes = remainingGearboxRes;
            this.remainingSteeringRes = remainingSteeringRes;
            this.remainingBrakesRes = remainingBrakesRes;
        }
        public int id { get; private set; }

        public int ownerId { get; private set; }

        public int referenceId { get; private set; }

        public int totalMileage { get; private set; }

        public int nextOilRefresh { get; private set; }

        public int remainingEngineRes { get; private set; }

        public int remainingTimingDriveRes { get; private set; }

        public int remainingSuspensionRes { get; private set; }

        public int remainingGearboxRes { get; private set; }

        public int remainingSteeringRes { get; private set; }

        public int remainingBrakesRes { get; private set; }
    }
}
