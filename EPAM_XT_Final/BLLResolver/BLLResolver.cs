using BLL.Common;
using MyGarageBLL;

namespace BLL.BLLResolver
{
    public static class BLLResolver
    {
        private static IMyGarageBLL processor;

        public static IMyGarageBLL BLLProcessor => processor ?? (processor = new MyGarageProcessor());
    }
}
