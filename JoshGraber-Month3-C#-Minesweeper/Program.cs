using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Minesweeper.Algorithms;
using Minesweeper.Core;
using Minesweeper.Data_Access_Layer;
using Minesweeper.Utilities;

namespace Minesweeper
{
	class Program
	{
		static void Main(string[] args)
		{
			if (args.Length < 1)
				throw new ArgumentException("Invalid number of arguments. Please specify the path to the minefield file as the first argument of the program.");

			Console.WriteLine("Initializing...");
			IMinesweeperSerializer serializer = new RowMajorFileSerializer(args[0]);
			IMinefieldSolver solver = new IterateMines();

			Console.WriteLine("Loading minefields from file...");
			IEnumerable<IMinefield> minefields = serializer.Load();

			Console.WriteLine("Solving minefields...");
			minefields.ForEach(field => solver.Solve(field));

			Console.WriteLine("Saving minefields to disk...");
			serializer.Save(minefields);
		}
	}
}