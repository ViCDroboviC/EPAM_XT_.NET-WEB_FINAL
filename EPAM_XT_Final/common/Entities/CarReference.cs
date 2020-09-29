namespace Entities
{
    public class CarReference
    {
        public CarReference(int id, string vendor, string model, int oilRefresh, int engineResource, int timingDriveResource,
            int suspensionResource, int gearboxResource, int steeringResource, int brakesResource)
        {
            this.id = id;
            this.vendor = vendor;
            this.model = model;
            nextOilRefresh = oilRefresh;
            this.engineResource = engineResource;
            this.timingDriveResource = timingDriveResource;
            this.suspensionResource = suspensionResource;
            this.gearboxResource = gearboxResource;
            this.steeringResource = steeringResource;
            this.brakesResource = brakesResource;

        }
        public int id { get; private set; }

        public string vendor { get; private set; }

        public string model { get; private set; }

        public int nextOilRefresh { get; private set; } //Частота замены масла

        public int engineResource { get; private set; } //Примерный усредненный пробег ДВС до капремонта

        public int timingDriveResource { get; private set; } //Примерный усредненный пробег мех-ма привода ГРМ до ремонта

        public int suspensionResource { get; private set; } //Примерный усредненный пробег узлов подвески до ремонта

        public int gearboxResource { get; private set; } //Примерный усредненный пробег КПП до ремонта

        public int steeringResource { get; private set; } //Примерный усредненный пробег мех-ма рулевого управления до ремонта

        public int brakesResource { get; private set; } //Примерный усредненный пробег тормозного мех-ма до ремонта
    }
}
