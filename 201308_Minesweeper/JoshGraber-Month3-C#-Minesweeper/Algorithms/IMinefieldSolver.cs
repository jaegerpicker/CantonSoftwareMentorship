using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Minesweeper.Core;

namespace Minesweeper.Algorithms
{
	/// <summary>
	/// Encapsulates the code for solving the minefield so that it can be swapped out with alternate algorithms if desired.
	/// </summary>
	public interface IMinefieldSolver
	{
		/// <summary>
		/// Solves the minefield argument.
		/// </summary>
		/// <param name="minefield">The minefield to solve.</param>
		void Solve(IMinefield minefield);
	}
}