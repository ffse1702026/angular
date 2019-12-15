using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infini.AutomaticDivideTool.Utilities
{
    public class StringUtils
    {
        public static string Empty()
        {
            return String.Empty;
        }

        public static bool IsNullOrEmpty(string value)
        {
            return (value == null) || ("".Equals(value));
        }

        public static string RemoveBreakLine(string value)
        {
            if (!IsNullOrEmpty(value))
            {
                return value.Replace("\n", "").Replace("\r", "");
            }
            return value;
        }

        /// <summary>
        /// Breaks the length of the line by.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <param name="length">The length.</param>
        /// <returns></returns>
        public static List<string> BreakLineByLength(string value, int length)
        {
            if (IsNullOrEmpty(value))
            {
                return null;
            }

            return Enumerable.Range(0, value.Length / length).Select(i => value.Substring(i * length, length)).ToList();
        }

        /// <summary>
        /// Get data with a line
        /// </summary>
        /// <param name="value">string</param>
        /// <returns>List string</returns>
        public static List<string> GetLinesData(string value)
        {
            if (IsNullOrEmpty(value))
            {
                return new List<string>();
            }
            return value.Split(new[] { Environment.NewLine, "\n", "\r" }, StringSplitOptions.None).ToList();
        }
    }
}
