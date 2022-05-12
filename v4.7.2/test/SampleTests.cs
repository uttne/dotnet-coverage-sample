using Xunit;

namespace SampleCli.Tests
{
    public class SampleTests
    {
        [Theory]
        [InlineData(1, 2, 3)]
        [InlineData(10, 5, 15)]
        [InlineData(5, -5, 0)]
        public void AdditionTest(int x, int y, int expected)
        {
            var sample = new Sample();

            var actual = sample.Addition(x, y);

            Assert.Equal(expected, actual);
        }

        [Theory]
        [InlineData(1, 2, -1)]
        [InlineData(10, 5, 5)]
        [InlineData(5, -5, 10)]
        public void SubtractionTest(int x, int y, int expected)
        {
            var sample = new Sample();

            var actual = sample.Subtraction(x, y);

            Assert.Equal(expected, actual);
        }

        [Theory]
        [InlineData("Hello,World!")]
        public void GetHelloTest(string expected)
        {
            var sample = new Sample();

            var actual = sample.GetHello();

            Assert.Equal(expected, actual);
        }
    }
}