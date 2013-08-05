using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    public class Matrix
    {
        public int Rows { get; set; }
        public int Cols { get; set; }
        public string Text { get; set; }
        public string[][] MatrixArray { get; set; }

        public Matrix(int Rows, int Cols, string Text)
        {
            this.Rows = Rows;
            this.Cols = Cols;
            this.Text = Text;
            this.MatrixArray = BuildMultidimensionalArray();
        }

        private string[][] BuildMultidimensionalArray()
        {
            List<string[]> rowArray = new List<string[]>();

            for (int r = 0; r < Rows; r++)
            {
                string row = Text.Substring(r * Cols, Cols);

                List<string> colArray = new List<string>();

                for (int c = 0; c < Cols; c++)
                {
                    string col = row.Substring(c, 1);
                    colArray.Add(col);
                }

                rowArray.Add(colArray.ToArray());
            }

            return rowArray.ToArray();
        }
    }

    class Program
    {
        private static List<Tuple<int, int, int>> offsetList = null;
        private static List<Matrix> matrixList = null;

        //still need to convert linear matrix to multidimensonal array

        static void Main(string[] args)
        {
            List<string> results = new List<string>();
            matrixList = ReadInMatrices(args[0]);
            offsetList = HydrateOffsetList();

            foreach (Matrix item in matrixList)
            {
                string result = AnalyzeMatrix(item);

                if (result != string.Empty)
                {
                    results.Add(result);
                }
                else
                {
                    //Console.WriteLine("");
                    //notify of failure
                }

            }

            //output results
            foreach (string item in results)
            {
                Console.WriteLine(item);
            }

            //Console.ReadKey();
        }

        private static string AnalyzeMatrix(Matrix matrix)
        {
            StringBuilder result = new StringBuilder();
            //Console.WriteLine(string.Format("Analyzing matrix '{0}'", matrix.Text));

            for (int row = 0; row < matrix.Rows; row++)
            {
                StringBuilder sb = new StringBuilder();

                for (int col = 0; col < matrix.Cols; col++)
                {
                    string cellValue = matrix.MatrixArray[row][col];

                    int adjacentCount = 0;

                    if (cellValue != "*")
                    {
                        foreach (Tuple<int, int, int> item in offsetList)
                        {
                            if (CheckForAdjacentMineWithOffSet(matrix.MatrixArray, row, col, item.Item1, item.Item2, item.Item2))
                            {
                                adjacentCount += 1;
                            }
                        }

                        cellValue = adjacentCount.ToString();
                    }

                    sb.Append(cellValue);
                }

                result.Append(sb.ToString());
                //result.AppendLine(sb.ToString());
            }

            return result.ToString();
        }

        private static List<Tuple<int, int, int>> HydrateOffsetList()
        {
            List<Tuple<int, int, int>> results = new List<Tuple<int, int, int>>();

            //check the cell one row up and to the left
            results.Add(new Tuple<int, int, int>(-1, -1, 1));

            //check the cell one row up and directly above
            results.Add(new Tuple<int, int, int>(-1, 0, 2));

            //check the cell one row up and to the right
            results.Add(new Tuple<int, int, int>(-1, 1, 3));

            //check the cell directly left
            results.Add(new Tuple<int, int, int>(0, -1, 4));

            //check the cell directly right
            results.Add(new Tuple<int, int, int>(0, 1, 5));

            //check the cell one row down and to the left
            results.Add(new Tuple<int, int, int>(1, -1, 6));

            //check the cell one row down and directly below
            results.Add(new Tuple<int, int, int>(1, 0, 7));

            //check the cell one row down and to the right
            results.Add(new Tuple<int, int, int>(1, 1, 8));

            return results;
        }

        private static List<Matrix> ReadInMatrices(string configFile)
        {
            string line;

            List<Matrix> matrixList = null;
            System.IO.StreamReader file = null;

            try
            {
                file = new System.IO.StreamReader(configFile);
            }
            catch (Exception e)
            {
                //Console.WriteLine(e.ToString());
            }

            if (file != null)
            {
                try
                {
                    while ((line = file.ReadLine()) != null)
                    {
                        if (matrixList == null)
                        {
                            matrixList = new List<Matrix>();
                        }

                        matrixList.Add(ParseMatrix(line));
                    }
                }
                finally
                {
                    file.Close();
                }
            }

            return matrixList;
        }

        private static Matrix ParseMatrix(string input)
        {
            Matrix result = null;

            string[] raw = input.Split(';');
            string[] arrayDimensions = raw[0].Split(',');

            result = new Matrix(int.Parse(arrayDimensions[0]), int.Parse(arrayDimensions[1]), raw[1]);
            return result;
        }

        private static bool CheckForAdjacentMineWithOffSet(string[][] a, int row, int col, int RowOffset, int ColOffset, int adjacentOrdinalPos)
        {
            bool result = false;

            //Console.WriteLine(string.Format("Checking {0}:{1}:{2}", row, col, adjacentOrdinalPos));

            try
            {
                result = (a[row + RowOffset][col + ColOffset] == "*");
            }
            catch (Exception e)
            {
                //Console.WriteLine(e.Message.ToString());
            }

            return result;
        }
    }
}