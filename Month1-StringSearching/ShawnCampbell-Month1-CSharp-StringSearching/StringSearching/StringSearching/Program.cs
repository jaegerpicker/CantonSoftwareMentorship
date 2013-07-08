using System.IO;
using System.Collections.Generic;
namespace StringSearching
{
    class Program
    {
        static void Main(string[] args)
        {
            using (StreamReader reader = File.OpenText(args[0]))
                while (!reader.EndOfStream)
                {
                    string line = reader.ReadLine();
                    if (null == line)
                        break;
                    var searchArr = line.Split(',');
                    string searchStr = searchArr[0];
                    string searchee = searchArr[1];
                    if (searchStr == searchee)
                    {
                        System.Console.WriteLine("true");
                        break; ;
                    }
                    for (int i = 0; i < searchStr.Length; i++)
                    {
                        if (searchStr.Substring(i).Length <= searchee.Length)
                        {
                            System.Console.WriteLine("false");
                            break;
                        }
                        if (searchStr.Substring(i, searchee.Length) == searchee)
                        {
                            System.Console.WriteLine("true");
                            break;
                        }
                        if (contains_wildcard(searchee))
                        {
                            if (contains_only_wildcards(searchee) && searchStr.Length > 0)
                            {
                                System.Console.WriteLine("true");
                                break;
                            }
                            string search_prefix = searchStr.Substring(0, searchee.Substring(0, searchee.IndexOf('*')).Length);
                            string searchee_prefix = searchee.Substring(0, searchee.IndexOf('*'));
                            if (searchee.LastIndexOf('*') + 1 == searchee.Length && search_prefix == searchee_prefix)
                            {
                                System.Console.WriteLine("true");
                                break; ;
                            }
                            string first_nonwildcard = searchee.Substring(searchee.LastIndexOf('*') + 1, 1);
                            if (searchStr.Substring(i).IndexOf(first_nonwildcard) > 0)
                            {
                                System.Console.WriteLine("true");
                                break;
                            }
                            else
                            {
                                System.Console.WriteLine("false");
                                break;
                            }
                        }
                    }
                }
            System.Console.ReadLine();
        }

        static bool contains_wildcard(string s)
        {
            bool found_wildcard = false;
            for (int j = 0; j < s.Length; j++)
            {
                if (s.Substring(j, 1) == "*" && s.Substring(j > 0 ? j - 1 : j, 1) != "\\")
                {
                    found_wildcard = true;
                    break;
                }
            }
            return found_wildcard;
        }

        static bool contains_only_wildcards(string s)
        {
            bool only_wildcards = true;
            for (int j = 0; j < s.Length; j++)
            {
                if (s.Substring(j, 1) != "*")
                {
                    only_wildcards = false;
                    break;
                }
            }
            return only_wildcards;

        }
    }
}