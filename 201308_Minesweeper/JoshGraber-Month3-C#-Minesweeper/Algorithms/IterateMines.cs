using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Minesweeper.Core;
using Minesweeper.Utilities;

namespace Minesweeper.Algorithms
{
	class IterateMines : IMinefieldSolver
	{
		public void Solve(IMinefield minefield)
		{
			// For every mine in the minefield
			foreach (IMineArea area in minefield.MineAreas())
			{
				// Select all neighbors and increment their number of adjacent mines
				area.NeighboringAreas(minefield).ForEach(neighbor => neighbor.AdjacentMines += 1);
			}
		}
	}
}