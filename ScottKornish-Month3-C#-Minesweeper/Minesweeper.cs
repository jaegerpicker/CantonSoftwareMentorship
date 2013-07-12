using System;
using System.IO;
using System.Collections.Generic;

class Program
{
    static void Main(string[] args)
    {
        int M;
        int N;
        using (StreamReader reader = File.OpenText(args[0]))
            while (!reader.EndOfStream)
            {
                string line = reader.ReadLine();
                if (null == line)
                    continue;
                else
                {
                    M = Convert.ToInt32(line.Substring(0, 1));
                    N = Convert.ToInt32(line.Substring(2, 1));
                }

                string[,] a = new string[M, N];
                string output = "";
                int z = 4;
                for (int i = 0; i < M; i++)
                {
                    for (int j = 0; j < N; j++)
                    {
                        a[i, j] = line.Substring((z), 1);
                        z++;
                    }
                }


                for (int i = 0; i < M; i++)
                {
                    for (int j = 0; j < N; j++)
                    {
                        if (a[i, j].Equals("*"))
                        {
                            output = output + a[i, j];
                        }
                        else
                        {
                            int w = 0;
                            for (int x = -1; x <= 1; x++)
                            {
                                for (int y = -1; y <= 1; y++)
                                {
                                    try
                                    {
                                        if (a[(i + x), (j + y)].Equals("*"))
                                        {
                                            w++;
                                        }
                                        else
                                        {
                                            continue;
                                        }
                                    }
                                    catch
                                    {
                                        continue;
                                    }
                                }
                            }

                            a[i, j] = w.ToString();
                            output = output + a[i, j];
                        }

                    }
                }
                Console.Write(output);
                Console.WriteLine();
            }
    }
}
