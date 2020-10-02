
using BLLResolver;
using BLL.Common;
using Entities;
using System.Collections.Generic;
using System;

namespace MyGarageConsoleTest
{
    class Test
    {
        static void Main(string[] args)
        {
            var bll = BLLResolver.BLLResolver.BLLProcessor;

            List<CarReference> CarsList = bll.GetCarReferencesList();

            foreach(CarReference reference in CarsList)
            {
                Console.WriteLine(reference.vendor + reference.model);
            }
        }
    }
}
