namespace SampleCli
{
    public class Sample
    {
        public int Addition(int x, int y)
        {
            return x + y;
        }

        public int Subtraction(int x, int y)
        {
            return x - y;
        }

        public string GetHello()
        {
            return "Hello,World!";
        }

        public bool IsOverZero(int x)
        {
            bool res = false;
            if (0 < x)
            {
                res = true;
            }
            return res;
        }
    }
}
