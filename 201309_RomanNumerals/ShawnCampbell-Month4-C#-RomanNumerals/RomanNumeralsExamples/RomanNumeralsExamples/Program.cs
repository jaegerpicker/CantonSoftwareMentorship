using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;


namespace RomanNumeralsExamples
{
    class Program
    {
        static void Main(string[] args)
        {
            using (StreamReader reader = File.OpenText(args[0]))
            {
                while (!reader.EndOfStream)
                {
                    string line = reader.ReadLine();
                    if (null == line)
                    {
                        continue;
                    }
                    else
                    {
                        int number = int.Parse(line);
                        string res = NumberToRoman(number);
                        System.Console.WriteLine(res);
                        string iRes = RomanToNumber(res);
                        System.Console.WriteLine(iRes);
                    }
                    // do something with line
                }
            }
        }

        static public String RomanToNumber(String numerals)
        {
            Dictionary<String, int> RomanNumbers = new Dictionary<String, int>();
            RomanNumbers.Add("M", 1000);
            RomanNumbers.Add("CM", 900);
            RomanNumbers.Add("D", 500);
            RomanNumbers.Add("CD", 400);
            RomanNumbers.Add("C", 100);
            RomanNumbers.Add("XC", 90);
            RomanNumbers.Add("L", 50);
            RomanNumbers.Add("XL", 40);
            RomanNumbers.Add("X", 10);
            RomanNumbers.Add("IX", 9);
            RomanNumbers.Add("V", 5);
            RomanNumbers.Add("IV", 4);
            RomanNumbers.Add("I", 1);
            int result = 0;
            foreach (KeyValuePair<String, int> pair in RomanNumbers)
            {
                while (numerals.IndexOf(pair.Key.ToString()) == 0)
                {
                    result += int.Parse(pair.Value.ToString());
                    numerals = numerals.Substring(pair.Key.ToString().Length);
                }
            }
            return result.ToString();
        }

        static public string NumberToRoman(int number)
        {
            if (number < 0 || number > 3999)
            {
                throw new ArgumentException("Value must be in the range 0 – 3,999.");
            }
            if (number == 0) return "N";

            int[] values = new int[] { 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
            string[] numerals = new string[] { "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };

            StringBuilder result = new StringBuilder();
            for (int i = 0; i < 13; i++)
            {
                while (number >= values[i])
                {
                    number -= values[i];
                    result.Append(numerals[i]);
                }

            }
            return result.ToString();
        }
    }
}
