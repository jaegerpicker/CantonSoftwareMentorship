using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Minesweeper.Core
{
	/// <summary>
	/// Represents a cell in the minefield.
	/// </summary>
	public interface IMineArea
	{
		/// <summary>
		/// Gets or sets whether or not this area contains a mine.
		/// </summary>
		bool ContainsMine { get; set; }

		/// <summary>
		/// Gets whether this area does not contain a mine (is clear).
		/// </summary>
		bool Clear { get; }

		/// <summary>
		/// Gets or sets the number of mines that are adjacent to this area.
		/// </summary>
		int AdjacentMines { get; set; }

		/// <summary>
		/// Gets the row number of this area.
		/// </summary>
		int Row { get; }

		/// <summary>
		/// Gets the column number of this area.
		/// </summary>
		int Col { get; }
	}
}
