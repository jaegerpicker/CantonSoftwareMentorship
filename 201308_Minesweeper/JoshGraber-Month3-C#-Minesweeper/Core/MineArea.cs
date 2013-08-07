using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Minesweeper.Core
{
	/// <summary>
	/// A basic implementation of the IMineArea interface.
	/// </summary>
	class MineArea : IMineArea
	{
		public MineArea(int row, int col, bool mine = false)
		{
			Row = row;
			Col = col;
			ContainsMine = mine;

			AdjacentMines = 0;
		}

		public bool ContainsMine { get; set; }

		public bool Clear
		{
			get { return !ContainsMine; }
		}

		public int AdjacentMines { get; set; }

		public int Row { get; private set; }
		public int Col { get; private set; }
	}
}
