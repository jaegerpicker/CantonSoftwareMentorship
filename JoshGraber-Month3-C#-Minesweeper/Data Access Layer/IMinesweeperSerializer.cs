using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Minesweeper.Core;

namespace Minesweeper.Data_Access_Layer
{
	/// <summary>
	/// The data access layer for the minesweeper program. Allows the code for loading / saving minefields to be swapped in and out.
	/// </summary>
	public interface IMinesweeperSerializer
	{
		/// <summary>
		/// Load minefields from the serializer.
		/// </summary>
		/// <returns>The minefields that were loaded.</returns>
		IEnumerable<IMinefield> Load();

		/// <summary>
		/// Saves a collection of minefields.
		/// </summary>
		/// <param name="field">The minefields to save.</param>
		void Save(IEnumerable<IMinefield> fields);
	}
}