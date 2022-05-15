using System;

namespace SampleCli
{
    class Program
    {
        public static void Main(string[] args)
        {
            var sample = new Sample();

            Console.WriteLine(sample.GetHello());
        }
    }
}
