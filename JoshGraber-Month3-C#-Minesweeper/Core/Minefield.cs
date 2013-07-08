using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Minesweeper.Core
{
	/// <summary>
	/// A basic implementation of the IMinefield interface, using a two-dimensional array to store the matrix.
	/// </summary>
	class Minefield : IMinefield
	{
		public Minefield(int width, int height)
		{
			Width = width;
			Height = height;

			m_mineAreas = new IMineArea[width,height];

			for (int i = 0; i < width; i++)
				for (int j = 0; j < height; j++)
					m_mineAreas[i, j] = new MineArea(j, i);
		}

		public int Width { get; private set; }
		public int Height { get; private set; }

		public int NumAreas 
		{
			get { return Width * Height; }
		}

		public IMineArea GetArea(int row, int col)
		{
			return m_mineAreas[col, row];
		}

		#region Private Data

		/// <summary>
		/// Array to store mine areas. Organized as X, Y
		/// </summary>
		private IMineArea[,] m_mineAreas;

		#endregion / Private Data
	}
}
