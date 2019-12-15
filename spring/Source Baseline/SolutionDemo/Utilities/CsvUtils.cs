using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Text;

namespace Infini.AutomaticDivideTool.Utilities
{

    #region ReadWriteData
    /// <summary>
    /// CSVデータを取得するクラス
    /// </summary>
    public class CsvRow : List<string>
    {
        public string LineText { get; set; }
    }

    /// <summary>
    /// CSVファイルからデータ読み込むためのクラス
    /// </summary>
    public class CsvFileReader : StreamReader
    {
        /// @file           CsvUtils.cs
        /// @brief          メモリからCSVデータを初期化する
        /// 
        /// @author         PhuongNH
        /// @since          2016.10.03.
        public CsvFileReader(Stream stream) : base(stream) { }

        /// @file           CsvUtils.cs
        /// @brief          CSVファイルからデータを読み込むためのクラス
        /// 
        /// @author         PhuongNH
        /// @since          2016.10.03.
        public bool ReadRow(CsvRow row)
        {
            //[データを1行ずつ読み込む。データなしの場合、処理を停止する。]
            row.LineText = ReadLine();
            if (String.IsNullOrEmpty(row.LineText))
                return false;

            int pos = 0;
            int rows = 0;
            //[[[行のデータをループする]]]
            while (pos < row.LineText.Length)
            {
                string value;
                ////[[二重引用符をつけた項目の場合]]
                if (row.LineText[pos] == '"')
                {
                    //[引用符を削除する]
                    pos++;

                    int start = pos;
                    while (pos < row.LineText.Length)
                    {
                        if (row.LineText[pos] == '"')
                        {
                            pos++;
                            if (pos >= row.LineText.Length || row.LineText[pos] != '"')
                            {
                                pos--;
                                break;
                            }
                        }
                        pos++;
                    }
                    //[引用符内の値を取得する]
                    value = row.LineText.Substring(start, pos - start);
                    value = value.Replace("\"\"", "\"");
                }
                else
                {
                    //[「,」までのデータを取得する]
                    int start = pos;
                    while (pos < row.LineText.Length && row.LineText[pos] != ',')
                        pos++;
                    value = row.LineText.Substring(start, pos - start);
                }
                //[行にデータを追加する]
                if (rows < row.Count)
                    row[rows] = value;
                else
                    row.Add(value);
                rows++;
                while (pos < row.LineText.Length && row.LineText[pos] != ',')
                    pos++;
                if (pos < row.LineText.Length)
                    pos++;
            }
            while (row.Count > rows)
                row.RemoveAt(rows);
            return (row.Count > 0);
        }
    }
    #endregion

    /// <summary>
    /// CsvUtils 
    /// </summary>
    public class CsvUtils
    {
        /// <summary>
        /// ReadCsv
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public List<T> ReadCsv<T>(string filePath)
        {
            Stream stream = null;
            T obj = (T)Activator.CreateInstance(typeof(T));
            List<T> resultList = new List<T>();

            try
            {
                stream = GetStreamReader(filePath);
                if (stream == null) return resultList;
                using (CsvFileReader reader = new CsvFileReader(stream))
                {
                    stream = null;
                    CsvRow row = new CsvRow();
                    //[[全行をループする。]]
                    while (reader.ReadRow(row))
                    {
                        resultList.Add(ConvertLineToObject<T>(row.LineText));
                    }
                }
            }
            finally
            {
                if (stream != null)
                {
                    // Dispose stream
                    stream.Dispose();
                }
            }
            return resultList;
        }

        /// <summary>
        /// Get all line in file CSV
        /// </summary>
        /// <param name="filePath">Path file</param>
        /// <returns>List string</returns>
        public static List<string> loadCsvFile(string filePath)
        {
            using (StreamReader reader = new StreamReader(File.OpenRead(filePath)))
            {
                List<string> searchList = new List<string>();
                while (!reader.EndOfStream)
                {
                    var line = reader.ReadLine();
                    searchList.Add(line);
                }
                return searchList;
            }
        }


        /// <summary>
        /// WriteCsv with list data
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="objList"></param>
        /// <param name="filePath"></param>
        public void WriteCsv<T>(List<T> objList, string filePath, string seperator = null)
        {
            StreamWriter writer = null;
            try
            {
                using (writer = GetStreamWriter(filePath))
                {
                    foreach (var obj in objList)
                    {
                        string line = ConvertObjectToLine(obj, seperator);
                        writer.WriteLine(line);
                    }
                }
            }
            finally
            {
                if (writer != null)
                {
                    // Dispose stream
                    writer.Dispose();
                }
            }
        }

        /// <summary>
        /// WriteCsv with object data
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj"></param>
        /// <param name="filePath"></param>
        public void WriteCsv<T>(T obj, string filePath, string seperator = null)
        {
            StreamWriter writer = null;
            try
            {
                using (writer = GetStreamWriter(filePath))
                {
                    string line = ConvertObjectToLine(obj, seperator);
                    writer.WriteLine(line);
                }
            }
            finally
            {
                if (writer != null)
                {
                    // Dispose stream
                    writer.Dispose();
                }
            }
        }


        /// <summary>
        /// Load file to stream
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        private Stream GetStreamReader(string filePath)
        {
            Stream stream = null;
            if (!File.Exists(filePath))
                return stream;
            stream = File.OpenRead(filePath);
            return stream;
        }

        /// <summary>
        /// Get stream writer
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        private StreamWriter GetStreamWriter(string filePath)
        {
            StreamWriter stream = null;
            Encoding encoding = Encoding.UTF8;
            FileStream fs = null;
            if (File.Exists(filePath))
            {
                fs = new FileStream(filePath, FileMode.Append);
                stream = new StreamWriter(fs, encoding);
            }

            else
            {
                if (!Directory.Exists(Path.GetDirectoryName(filePath)))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(filePath));
                }
                fs = new FileStream(filePath, FileMode.CreateNew);
                stream = new StreamWriter(fs, encoding);
            }

            return stream;
        }

        /// <summary>
        /// Convert line file to object class
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="line"></param>
        /// <returns></returns>
        private T ConvertLineToObject<T>(string line)
        {
            T obj = (T)Activator.CreateInstance(typeof(T));

            PropertyInfo[] props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            string[] lines = line.Split(',');
            if (lines.Length == 0) return obj;
            int index = 0;
            foreach (PropertyInfo prop in props)
            {
                string value = null;
                if (index < lines.Length)
                {
                    value = lines[index];
                    prop.SetValue(obj, Convert.ChangeType(value, prop.PropertyType), null);
                }
                index++;
            }

            return obj;
        }

        /// <summary>
        /// Convert object to line
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj"></param>
        /// <returns></returns>
        private string ConvertObjectToLine<T>(T obj, string seperator)
        {
            List<string> rows = new List<string>();
            PropertyInfo[] props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            if (String.IsNullOrEmpty(seperator))
                seperator = String.Empty;
            foreach (PropertyInfo prop in props)
            {
                var item = prop.GetValue(obj, null);
                if (item == null)
                    rows.Add(seperator + String.Empty + seperator);
                else
                    rows.Add(seperator + prop.GetValue(obj, null).ToString() + seperator);
            }

            string line = String.Join(",", rows.ToArray());

            return line;
        }
    }
}
