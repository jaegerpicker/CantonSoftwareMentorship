using System;

namespace Euler9
{
    class Program
    {
        static void Main()
        {
            Console.WriteLine("Problem 9.  There exists exactly one Pythagorean triplet for which a + b + c = 1000.\r\nFind the product abc.");
            // a+b+c = 1000
            // euclid's formula: a=m^2-n^2, b = 2mn, c=m^2+n^2, for some integers m and n where m>n
            // 2mn + m^2 + n^2 + m^2 - n^2 = 1000
            // 2mn + 2m^2 = 1000
            // mn + m^2 = 500
            // m(n+m) = 500

            for (int m = 2; m < 500; m++)
                for (int n = 1; n < m; n++)
                {
                    if (m * (n + m) == 500)
                    {
                        var a = m * m - n * n;
                        var b = 2 * m * n;
                        var c = m * m + n * n;
                        Console.WriteLine("Result is [" + m + "," + n + "](" + a + "," + b + "," + c + ").  abc = " + (a * b * c));
                        Console.ReadKey();
                        return;
                    }
                }
        }
    }
}
