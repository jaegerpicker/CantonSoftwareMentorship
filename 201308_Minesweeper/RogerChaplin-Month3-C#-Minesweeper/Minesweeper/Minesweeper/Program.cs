using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Minesweeper
{
   class Program
   {
      static void CountMines(int[,] minelist)
      {
         int m = minelist.GetUpperBound(0) + 1;
         int n = minelist.GetUpperBound(1) + 1;

         for (int row = 0; row < m; ++row)
         {
            for (int col = 0; col < n; ++col)
            {
               // If the cell contains a mine we don't need to count neighboring mines.
               if (minelist[row, col] == -1)
               {
                  continue;
               }

               // Check the cells above
               if (row > 0)
               {
                  if (col > 0 && minelist[row - 1, col - 1] == -1)
                  {
                     ++minelist[row, col];
                  }

                  if (col < n - 1 && minelist[row - 1, col + 1] == -1)
                  {
                     ++minelist[row, col];
                  }

                  if (minelist[row - 1, col] == -1)
                  {
                     ++minelist[row, col];
                  }
               }

               // Check the cells below
               if (row < m - 1)
               {
                  if (col > 0 && minelist[row + 1, col - 1] == -1)
                  {
                     ++minelist[row, col];
                  }

                  if (col < n - 1 && minelist[row + 1, col + 1] == -1)
                  {
                     ++minelist[row, col];
                  }

                  if (minelist[row + 1, col] == -1)
                  {
                     ++minelist[row, col];
                  }
               }

               // Check the cells to either side
               if (col > 0 && minelist[row, col - 1] == -1)
               {
                  ++minelist[row, col];
               }

               if (col < n - 1 && minelist[row, col + 1] == -1)
               {
                  ++minelist[row, col];
               }
            }
         }
      }

      static string ProduceOutput(int[,] minelist)
      {
         int m = minelist.GetUpperBound(0) + 1;
         int n = minelist.GetUpperBound(1) + 1;

         StringBuilder osb = new StringBuilder(m * n);
         for (int row = 0; row < m; ++row)
         {
            for (int col = 0; col < n; ++col)
            {
               if (minelist[row, col] == -1)
               {
                  osb.Append('*');
               }
               else
               {
                  osb.AppendFormat("{0}", minelist[row, col]);
               }
            }
         }

         return osb.ToString();
      }

      static void Main(string[] args)
      {
         if (args.Length < 1)
         {
            Console.WriteLine("Usage: Minesweeper <file>");
            return;
         }

         if (!File.Exists(args[0]))
         {
            Console.WriteLine("Error: Cannot find input file {0}", args[0]);
            return;
         }

         String[] inputlines = File.ReadAllLines(args[0]);

         for (int i = 0; i < inputlines.Length; ++i)
         {
            String inputline = inputlines[i];
            String[] firstparse = inputline.Split(new char[] { ';' });
            if (firstparse.Length != 2)
            {
               Console.WriteLine("Error in input line: {0}", inputline);
               continue;
            }

            String[] dimensions = firstparse[0].Split(new char[] { ',' });
            if (dimensions.Length != 2)
            {
               Console.WriteLine("Error in input line: {0}", inputline);
               continue;
            }

            int m = -1;
            int n = -1;
            if (!int.TryParse(dimensions[0], out m))
            {
               Console.WriteLine("Error in input line: {0}", inputline);
               continue;
            }

            if (!int.TryParse(dimensions[1], out n))
            {
               Console.WriteLine("Error in input line: {0}", inputline);
               continue;
            }

            if (m * n != firstparse[1].Length)
            {
               Console.WriteLine("Count mismatch in input line: {0}", inputline);
               continue;
            }

            int[,] mymines = new int[m, n];

            int inputindex = 0;
            for (int row = 0; row < m; ++row)
            {
               for (int col = 0; col < n; ++col)
               {
                  mymines[row, col] = firstparse[1][inputindex++] == '*' ? -1 : 0;
               }
            }

            CountMines(mymines);

            string output = ProduceOutput(mymines);
            Console.WriteLine(output);
         }
      }
    }
}
