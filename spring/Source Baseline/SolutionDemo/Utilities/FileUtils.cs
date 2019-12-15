using System;
using System.IO;
using System.Text;

namespace Infini.AutomaticDivideTool.Utilities
{
    public class FileUtils
    {
        /// <summary>
        /// createDirectory
        /// </summary>
        /// <param name="path">string</param>
        public static void CreateDirectory(string path)
        {
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
        }

        /// <summary>
        /// Check file is exist
        /// </summary>
        /// <param name="filePath">file name</param>
        /// <returns>True: file is exist<br/>False: not exist</returns>
        public static bool IsExistFile(string filePath)
        {
            return File.Exists(filePath);
        }

        /// <summary>
        /// createFile
        /// </summary>
        /// <param name="filePath"></param>
        public static void CreateFile(string filePath)
        {
            CreateDirectory(Path.GetDirectoryName(filePath));
            if (!IsExistFile(filePath))
                File.Create(filePath);
        }

        /// <summary>
        /// readAllLine
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static string ReadAllLine(string filePath)
        {
            string[] lines = File.ReadAllLines(filePath, Encoding.UTF8);
            return String.Join(Environment.NewLine, lines);
        }

        /// <summary>
        /// appendAllText
        /// </summary>
        /// <param name="filePath">string</param>
        /// <param name="content">string</param>
        public static void AppendAllText(string filePath, string content)
        {
            File.AppendAllText(filePath, content + Environment.NewLine, Encoding.UTF8);
        }
    }
}
