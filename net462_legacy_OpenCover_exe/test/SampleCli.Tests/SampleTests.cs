using NUnit.Framework;

namespace SampleCli.Tests
{
    [TestFixture]
    public class SampleTests
    {
        [TestCase(1, 2, 3)]
        [TestCase(10, 5, 15)]
        [TestCase(5, -5, 0)]
        public void AdditionTest(int x, int y, int expected)
        {
            var sample = new Sample();

            var actual = sample.Addition(x, y);
            Assert.AreEqual(expected, actual);
        }

        [TestCase(1, 2, -1)]
        [TestCase(10, 5, 5)]
        [TestCase(5, -5, 10)]
        public void SubtractionTest(int x, int y, int expected)
        {
            var sample = new Sample();

            var actual = sample.Subtraction(x, y);

            Assert.AreEqual(expected, actual);
        }

        [TestCase("Hello,World!")]
        public void GetHelloTest(string expected)
        {
            var sample = new Sample();

            var actual = sample.GetHello();

            Assert.AreEqual(expected, actual);
        }

        [TestCase(0, true)]
        [TestCase(1, false)]
        public void IsZeroTest(int x, bool expected)
        {
            var sample = new Sample();

            var actual = sample.IsZero(x);

            Assert.AreEqual(expected, actual);
        }
    }
}
