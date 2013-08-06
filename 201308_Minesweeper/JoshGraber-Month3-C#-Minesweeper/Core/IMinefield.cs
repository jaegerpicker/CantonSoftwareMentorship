using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Minesweeper.Core
{
	/// <summary>
	/// Represents a matrix of minefield cells.
	/// </summary>
	public interface IMinefield
	{
		/// <summary>
		/// Gets the width of the matrix.
		/// </summary>
		int Width { get; }

		/// <summary>
		/// Gets the height of the matrix.
		/// </summary>
		int Height { get; }

		/// <summary>
		/// Gets the total number of areas / cells in the matrix.
		/// </summary>
		int NumAreas { get; }

		/// <summary>
		/// Gets the contents of a specific cell in the matrix.
		/// </summary>
		/// <param name="row">The row of the cell to retrieve.</param>
		/// <param name="col">The column of the cell to retrieve.</param>
		/// <returns>The cell at the given row and column.</returns>
		/// <exception cref="IndexOutOfRangeException">Throws an exception if the specified row / column are less than 0 or greater than or equal to the width / height of the matrix.</exception>
		IMineArea GetArea(int row, int col);
	}
}
