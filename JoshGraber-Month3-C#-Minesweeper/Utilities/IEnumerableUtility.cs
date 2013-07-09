using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Minesweeper.Utilities
{
	/// <summary>
	/// An extension class for adding convenient functions to IEnumerable<> objects
	/// </summary>
	public static class IEnumerableUtility
	{
		public static void ForEach<T>(this IEnumerable<T> e, Action<T> action)
		{
			foreach (T item in e)
				action.Invoke(item);
		}

		public static void ForEach(this IEnumerable e, Action<object> action)
		{
			foreach (object item in e)
				action.Invoke(item);
		}

		public static void ForEach<T>(this IEnumerable e, Action<T> action)
		{
			foreach (object item in e)
			{
				if (item is T)
					action.Invoke((T)item);
			}
		}

		public static void ForEach<T>(this IEnumerable<T> e, Action<T, int> action)
		{
			int i = 0;

			foreach (T item in e)
			{
				action.Invoke(item, i);
				i++;
			}
		}

		public static void ForEach<T>(this IEnumerable e, Action<T, int> action)
		{
			int i = 0;

			foreach (object item in e)
			{
				if (item is T)
					action.Invoke((T)item, i);

				i++;
			}
		}

		public static void ForEach(this IEnumerable e, Action<object, int> action)
		{
			int i = 0;

			foreach (object item in e)
			{
				action.Invoke(item, i);
				i++;
			}
		}
	}
}
