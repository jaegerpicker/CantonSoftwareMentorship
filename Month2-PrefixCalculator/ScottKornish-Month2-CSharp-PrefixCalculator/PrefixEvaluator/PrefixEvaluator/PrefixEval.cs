using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;


namespace PrefixEvaluator
{
    class PrefixEval
    {
        public string Eval()
        {
            decimal result = 0;
            int position;
            string resultString = "";

            foreach (string line in File.ReadLines("C:\\users\\skornish\\Desktop\\prefix.txt"))
            {
                List<string> list = new List<string>(line.Split(' '));               
                while (list.Contains("+") ||
                       list.Contains("-") ||
                       list.Contains("/") ||
                       list.Contains("*"))
                {
                    position = 0;
                    foreach (string element in list)
                    {
                        if (element.Equals("+") ||
                            element.Equals("-") ||
                            element.Equals("/") ||
                            element.Equals("*"))
                        {
                            position = Math.Max(position, list.LastIndexOf(element));
                        }
                    }

                    if (list.ElementAt(position).Equals("+"))
                    {
                        result = decimal.Parse(list.ElementAt(position + 1)) +
                                 decimal.Parse(list.ElementAt(position + 2));
                    }
                    else if (list.ElementAt(position).Equals("-"))
                    {
                        result = decimal.Parse(list.ElementAt(position + 1)) -
                                 decimal.Parse(list.ElementAt(position + 2));
                    }
                    else if (list.ElementAt(position).Equals("/"))
                    {
                        result = decimal.Parse(list.ElementAt(position + 1)) /
                                 decimal.Parse(list.ElementAt(position + 2));
                    }
                    else if (list.ElementAt(position).Equals("*"))
                    {
                        result = decimal.Parse(list.ElementAt(position + 1)) *
                                 decimal.Parse(list.ElementAt(position + 2));
                    }
                    list.Insert(position, result.ToString());
                    list.RemoveAt(position + 3);
                    list.RemoveAt(position + 2);
                    list.RemoveAt(position + 1);
                }                
                resultString = resultString + "," + result.ToString();
            }           

            MessageBox.Show(resultString);
            return resultString;
        }
    }
}
