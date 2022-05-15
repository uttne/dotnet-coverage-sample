using System;

namespace SampleCli
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var sample = new Sample();

            Console.WriteLine(sample.GetHello());
        }
    }
}
