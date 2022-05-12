using System;

namespace SampleCli
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            var sample = new Sample();
            
            Console.WriteLine(sample.GetHello());
        }
    }
}