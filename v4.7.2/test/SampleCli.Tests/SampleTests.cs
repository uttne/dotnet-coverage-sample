using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace SampleCli.Tests
{

    [TestClass]
    public class SampleTests
    {
        [TestMethod]
        [DataRow(1, 2, 3)]
        [DataRow(10, 5, 15)]
        [DataRow(5, -5, 0)]
        public void AdditionTest(int x, int y, int expected)
        {
            var sample = new Sample();

            var actual = sample.Addition(x, y);
            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        [DataRow(1, 2, -1)]
        [DataRow(10, 5, 5)]
        [DataRow(5, -5, 10)]
        public void SubtractionTest(int x, int y, int expected)
        {
            var sample = new Sample();

            var actual = sample.Subtraction(x, y);

            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        [DataRow("Hello,World!")]
        public void GetHelloTest(string expected)
        {
            var sample = new Sample();

            var actual = sample.GetHello();

            Assert.AreEqual(expected, actual);
        }
    }
}
