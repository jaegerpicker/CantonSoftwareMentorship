using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using Minesweeper.Algorithms;
using Minesweeper.Core;

namespace Minesweeper.Data_Access_Layer
{
	/// <summary>
	/// An implementation of the IMinesweeperSerializer interface.
	/// IMinefields are loaded from a file path.
	/// Each line in the file contains a unique minefield.
	/// Minefields are in the following format:
	/// row,col;data
	/// row = number of rows in the minefield matrix
	/// col = number of columns in the minefield matrix
	/// data = a list of '*' and '.' characters. '*' indicates a mine cell, '.' indicates a clear cell. Cells are sorted in row major order.
	/// </summary>
	class RowMajorFileSerializer : IMinesweeperSerializer
	{
		public RowMajorFileSerializer(string path)
		{
			m_path = path;
		}

		public IEnumerable<IMinefield> Load()
		{
			IList<IMinefield> minefields = new List<IMinefield>();

			var regex = new Regex(@"^(?<rows>\d+),(?<cols>\d+);(?<data>[*.]+)$", RegexOptions.Compiled);
			string[] lines = File.ReadAllLines(m_path);

			// Each line in the field yields a unique minefield
			foreach (string line in lines)
			{
				var match = regex.Match(line);

				if (match.Success)
				{
					int rows = int.Parse(match.Groups["rows"].Value);
					int cols = int.Parse(match.Groups["cols"].Value);
					string data = match.Groups["data"].Value;

					Minefield field = new Minefield(cols, rows);

					// Enumerate mine areas and mine data
					IEnumerator<IMineArea> areaEnum = field.AreasByRow().GetEnumerator();
					IEnumerator<char> dataEnum = data.GetEnumerator();

					while (areaEnum.MoveNext() && dataEnum.MoveNext())
						areaEnum.Current.ContainsMine = HasMine(dataEnum.Current);

					minefields.Add(field);
				}
			}

			return minefields;
		}

		private bool HasMine(char data)
		{
			return data == '*';
		}

		public void Save(IEnumerable<IMinefield> fields)
		{
			StringBuilder data = new StringBuilder();

			foreach (IMinefield field in fields)
			{
				//string rows = field.Height.ToString();
				//string cols = field.Width.ToString();
				StringBuilder fieldData = field.AreasByRow().Aggregate(new StringBuilder(), (str, area) => str.Append(PrintArea(area)));

				// Commented out line outputs data in same format as loaded from
				//data.AppendLine(string.Format("{0},{1};{2}", rows, cols, fieldData));

				// Rows and columns are not printed for challenge
				data.AppendLine(fieldData.ToString());
			}

			File.WriteAllText(m_path, data.ToString());
		}

		private string PrintArea(IMineArea area)
		{
			if (area.ContainsMine)
				return "*";

			else
				return area.AdjacentMines.ToString();
		}

		#region Private Data

		private string m_path;

		#endregion / Private Data
	}
}
