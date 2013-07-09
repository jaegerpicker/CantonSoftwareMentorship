using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Minesweeper.Core;

namespace Minesweeper.Algorithms
{
	/// <summary>
	/// Extends IMinefield and IMineArea to add some basic helper functions for enumerating objects.
	/// </summary>
	public static class MinefieldExtensions
	{
		/// <summary>
		/// List all of the areas in a minefield by row.
		/// </summary>
		/// <param name="minefield">The minefield to enumerate.</param>
		/// <returns>An enumerable collection of IMineAreas in row order.</returns>
		public static IEnumerable<IMineArea> AreasByRow(this IMinefield minefield)
		{
			for (int row = 0; row < minefield.Height; row++)
				for (int col = 0; col < minefield.Width; col++)
					yield return minefield.GetArea(row, col);
		}

		/// <summary>
		/// List all of the areas in a minefield by column.
		/// </summary>
		/// <param name="minefield">The minefield to enumerate.</param>
		/// <returns>An enumerable collection of IMineAreas in column order.</returns>
		public static IEnumerable<IMineArea> AreasByColumn(this IMinefield minefield)
		{
			for (int col = 0; col < minefield.Width; col++)
				for (int row = 0; row < minefield.Height; row++)
					yield return minefield.GetArea(row, col);
		}

		/// <summary>
		/// Lists all of the areas in a minefield that contain mines, sorted in row order, from left to right, top to bottom.
		/// </summary>
		/// <param name="minefield">The minefield to enumerate.</param>
		/// <returns>An enumerable collection of IMineAreas containing mines in the minefield.</returns>
		public static IEnumerable<IMineArea> MineAreas(this IMinefield minefield)
		{
			return from area in minefield.AreasByRow()
				   where area.ContainsMine
				   select area;
		}

		/// <summary>
		/// Lists all of the areas in a minefield that do not contain mines, sorted in row order, from left to right, top to bottom.
		/// </summary>
		/// <param name="minefield">The minefield to enumerate.</param>
		/// <returns>An enumerable collection of IMineAreas that do not contain mines.</returns>
		public static IEnumerable<IMineArea> ClearAreas(this IMinefield minefield)
		{
			return from area in minefield.AreasByRow()
				   where area.Clear
				   select area;
		}

		/// <summary>
		/// Lists all of the areas that are adjacent to a mine area in a minefield.
		/// </summary>
		/// <param name="mineArea">Returns the neighbors of this area.</param>
		/// <param name="minefield">Uses this minefield to get references to neighboring areas.</param>
		/// <returns>An enumerable collection of IMineAreas that are adjacent to the specified area.</returns>
		public static IEnumerable<IMineArea> NeighboringAreas(this IMineArea mineArea, IMinefield minefield)
		{
			for (int row = mineArea.Row - 1; row <= mineArea.Row + 1; row++)
			{
				for (int col = mineArea.Col - 1; col <= mineArea.Col + 1; col++)
				{
					// Make sure indexes are in mine grid and area is not the current area
					if (row >= 0 && row < minefield.Height &&
						col >= 0 && col < minefield.Width &&
						(row != mineArea.Row || col != mineArea.Col))
						yield return minefield.GetArea(row, col);
				}
			}
		}
	}
}
