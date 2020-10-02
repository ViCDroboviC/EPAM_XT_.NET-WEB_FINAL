using BLL.Common;
using MyGarageBLL;

namespace BLLResolver
{
    public static class BLLResolver
    {
        private static IMyGarageBLL processor;

        public static IMyGarageBLL BLLProcessor => processor ?? (processor = new MyGarageProcessor());
    }
}
