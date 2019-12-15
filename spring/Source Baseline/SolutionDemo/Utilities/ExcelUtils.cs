using OfficeOpenXml;
using OfficeOpenXml.Style;
using OfficeOpenXml.Table;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Reflection;

namespace Infini.AutomaticDivideTool.Utilities
{
    /// <summary>
    /// Common Process For Excel 
    /// </summary>
    public class ExcelUtils : IDisposable
    {
        private const string DEFAULT_SHEET = "Sheet1";
        private object _workbook;
        private object _worksheet;

        public ExcelUtils()
        {
            AppDomain.CurrentDomain.AssemblyResolve += (sender, args) =>
            {
                using (var stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("Infini.AutomaticDivideTool.Resources.EPPlus.dll"))
                {
                    byte[] assemblyData = new byte[stream.Length];
                    stream.Read(assemblyData, 0, assemblyData.Length);
                    return Assembly.Load(assemblyData);
                }
            };
        }

        /// <summary>
        /// Create new workbook with default sheet
        /// </summary>
        public void Workbook_Create()
        {
            ExcelPackage package = new ExcelPackage();
            package.Workbook.Worksheets.Add(DEFAULT_SHEET);
            _workbook = package;
        }

        public void Worksheet_Create(string wsName)
        {
            ExcelPackage package = (ExcelPackage)_workbook;
            package.Workbook.Worksheets.Add(wsName);
            _workbook = package;
        }

        /// <summary>
        /// open workbook
        /// </summary>
        /// <param name="templatePath"></param>
        public void Workbook_Open(string templatePath)
        {
            ExcelPackage package = new ExcelPackage();
            package.Load(Assembly.GetExecutingAssembly().GetManifestResourceStream(templatePath));
            _workbook = package;
        }

        /// <summary>
        /// clone worksheet
        /// </summary>
        /// <param name="numSheetClone"></param>
        public void Workbook_CopyWorkSheet(string existingWorksheetName, string newWorksheetName)
        {
            ExcelPackage package = (ExcelPackage)_workbook;
            ExcelWorksheet worksheet = package.Workbook.Worksheets.Copy(existingWorksheetName, newWorksheetName);
            _worksheet = worksheet;
        }

        /// <summary>
        /// delete worksheet
        /// </summary>
        /// <param name="existingWorksheetName"></param>
        /// <param name="newWorksheetName"></param>
        public void Workbook_DeleteWorkSheet(string worksheetName)
        {
            ExcelPackage package = (ExcelPackage)_workbook;
            package.Workbook.Worksheets.Delete(worksheetName);
            _workbook = package;
        }

        /// <summary>
        /// open workbook
        /// </summary>
        /// <param name="templatePath"></param>
        public void Workbook_OpenFromFile(string templatePath)
        {
            FileInfo fileInfo = new FileInfo(templatePath);
            ExcelPackage package = new ExcelPackage(fileInfo);
            _workbook = package;
        }

        /// <summary>
        /// Create new workbook with sheet name
        /// </summary>
        /// <param name="worksheetName"></param>
        public void Workbook_Create(string worksheetName)
        {
            ExcelPackage package = new ExcelPackage();
            package.Workbook.Worksheets.Add(worksheetName);
            _workbook = package;
        }

        /// <summary>
        /// Get worksheet by sheet name
        /// </summary>
        /// <param name="worksheetName"></param>
        public void Worksheet_SelectByName(string worksheetName)
        {
            ExcelPackage package = (ExcelPackage)_workbook;
            ExcelWorksheet worksheet = package.Workbook.Worksheets[worksheetName];
            _worksheet = worksheet;
        }

        /// <summary>
        /// Get worksheet by index sheet
        /// </summary>
        /// <param name="index"></param>
        public void Worksheet_SelectByIndex(int index)
        {
            ExcelPackage package = (ExcelPackage)_workbook;
            ExcelWorksheet worksheet = package.Workbook.Worksheets[index];
            _worksheet = worksheet;
        }

        /// <summary>
        /// Get binary data workbook
        /// </summary>
        /// <param name="binaryData"></param>
        public void Workbook_GetBinaryData(out byte[] binaryData)
        {
            ExcelPackage package = (ExcelPackage)_workbook;
            binaryData = package.GetAsByteArray();
        }

        /// <summary>
        /// Rename worksheet
        /// </summary>
        /// <param name="name"></param>
        public void Worksheet_Rename(string name)
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            worksheet.Name = name;
        }

        /// <summary>
        /// Write cell by row and column
        /// </summary>
        /// <param name="row"></param>
        /// <param name="column"></param>
        /// <param name="value"></param>
        public void Cell_WriteByIndex(int row, int column, object value)
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            worksheet.SetValue(row, column, value);
        }

        /// <summary>
        /// Write cell by row and column
        /// </summary>
        /// <param name="row"></param>
        /// <param name="column"></param>
        /// <param name="value"></param>
        public void Cell_WriteByIndexWithStyleNumberFormat(int row, int column, string style, object value)
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            worksheet.Cells[row, column].Style.Numberformat.Format = style;
            worksheet.SetValue(row, column, value);
        }

        /// <summary>
        /// Write cell by range
        /// </summary>
        /// <param name="rowStart"></param>
        /// <param name="columnStart"></param>
        /// <param name="data"></param>
        /// <param name="isWriteHeader"></param>
        public void Cell_WriteRange(int rowStart, int columnStart, DataTable data, bool isWriteHeader)
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            worksheet.Cells[rowStart, columnStart].LoadFromDataTable(data, isWriteHeader);
        }

        /// <summary>
        /// Cells the write range.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="rowStart">The row start.</param>
        /// <param name="columnStart">The column start.</param>
        /// <param name="data">The data.</param>
        /// <param name="isWriteHeader">if set to <c>true</c> [is write header].</param>
        public void Cell_WriteRange<T>(int rowStart, int columnStart, List<T> data, bool isWriteHeader)
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            worksheet.Cells[rowStart, columnStart].LoadFromCollection(data, isWriteHeader);
        }

        /// <summary>
        /// Cells the write range.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="rowStart">The row start.</param>
        /// <param name="columnStart">The column start.</param>
        /// <param name="items">The items.</param>
        /// <param name="numericColumns">The numeric columns.</param>
        /// <param name="formulaColumns">The formula columns.</param>
        /// <param name="isWriteHeader">if set to <c>true</c> [is write header].</param>
        public void Cell_WriteRange<T>(int rowStart, int columnStart, List<T> items, List<string> numericColumns, List<string> formulaColumns, bool isWriteHeader)
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            PropertyInfo[] propertyInfos = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);

            for (int i = 0; i < items.Count; i++)
            {
                var values = new object[propertyInfos.Length];
                for (int j = 0; j < propertyInfos.Length; j++)
                {
                    var value = propertyInfos[j].GetValue(items[i], null);
                    if (numericColumns.Contains(propertyInfos[j].Name))
                    {
                        if (value == null || value.ToString().Equals(String.Empty))
                            worksheet.Cells[rowStart + i, columnStart + j].Value = String.Empty;
                        else
                            worksheet.Cells[rowStart + i, columnStart + j].Value = Int32.Parse(value.ToString());
                    }
                    else if (formulaColumns.Contains(propertyInfos[j].Name))
                    {
                        if (value == null || value.ToString().Equals(String.Empty))
                            worksheet.Cells[rowStart + i, columnStart + j].Value = String.Empty;
                        else
                            worksheet.Cells[rowStart + i, columnStart + j].Formula = value.ToString();
                    }
                    else
                    {
                        worksheet.Cells[rowStart + i, columnStart + j].Value = value;
                    }
                }
            }
        }

        /// <summary>
        /// Save workbook
        /// </summary>
        /// <param name="path"></param>
        public void Workbook_Save(string path)
        {
            ExcelPackage package = (ExcelPackage)_workbook;

            if (!Directory.Exists(Path.GetDirectoryName(path)))
            {
                Directory.CreateDirectory(Path.GetDirectoryName(path));
            }

            if (package.Workbook.Worksheets.Count > 0)
                package.Workbook.Worksheets[1].Select();

            package.SaveAs(new FileInfo(path));
        }

        /// <summary>
        /// Merge cell with range
        /// </summary>
        /// <param name="rowStart"></param>
        /// <param name="columnStart"></param>
        /// <param name="rowEnd"></param>
        /// <param name="columnEnd"></param>
        /// <param name="isMerge"></param>
        public void Range_SetMerge(int rowStart, int columnStart, int rowEnd, int columnEnd, bool isMerge)
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            ExcelRange range = worksheet.Cells[rowStart, columnStart, rowEnd, columnEnd];
            range.Merge = isMerge;
        }

        /// <summary>
        /// Set background color for cell
        /// </summary>
        /// <param name="row"></param>
        /// <param name="cell"></param>
        /// <param name="color"></param>
        public void Cell_SetBackgroundColor(int row, int cell, string color)
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            Color colFromHex = ColorTranslator.FromHtml(color);
            worksheet.Cells[row, cell].Style.Fill.BackgroundColor.SetColor(colFromHex);
        }

        /// <summary>
        /// Set font color for cell
        /// </summary>
        /// <param name="row"></param>
        /// <param name="cell"></param>
        /// <param name="color"></param>
        public void Cell_SetFontColor(int row, int cell, string color)
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            Color colFromHex = ColorTranslator.FromHtml(color);
            worksheet.Cells[row, cell].Style.Font.Color.SetColor(colFromHex);
        }

        /// <summary>
        /// Set border for cell
        /// </summary>
        /// <param name="row"></param>
        /// <param name="cell"></param>
        /// <param name="color"></param>
        public void Cell_SetBorder(int row, int cell, string color)
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            Color colFromHex = ColorTranslator.FromHtml(color);
            worksheet.Cells[row, cell].Style.Border.Left.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[row, cell].Style.Border.Left.Color.SetColor(colFromHex);
            worksheet.Cells[row, cell].Style.Border.Top.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[row, cell].Style.Border.Top.Color.SetColor(colFromHex);
            worksheet.Cells[row, cell].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[row, cell].Style.Border.Right.Color.SetColor(colFromHex);
            worksheet.Cells[row, cell].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[row, cell].Style.Border.Bottom.Color.SetColor(colFromHex);
        }

        /// <summary>
        /// Get last row
        /// </summary>
        /// <returns></returns>
        public int Worksheet_GetLastRow()
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            if (worksheet.Dimension != null && worksheet.Dimension.End != null)
            {
                return worksheet.Dimension.End.Row;
            }
            return 0;
        }

        /// <summary>
        /// Get last column
        /// </summary>
        /// <returns></returns>
        public int Worksheet_GetLastColumn()
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            if (worksheet.Dimension != null && worksheet.Dimension.End != null)
            {
                return worksheet.Dimension.End.Column;
            }
            return 0;
        }

        /// <summary>
        /// Write format
        /// </summary>
        /// <param name="rowStart"></param>
        /// <param name="columnStart"></param>
        /// <param name="rowStyle"></param>
        public void Range_WriteStyleByRow(int rowStart, int columnStart, int rowStyle, int lastRow, int lastColumn)
        {
            ExcelWorksheet ws = (ExcelWorksheet)_worksheet;
            //int lastRow = worksheet_GetLastRow();
            //int lastColumn = worksheet_GetLastColumn();
            for (int i = rowStart; i < (lastRow + rowStart - 1); i++)
            {
                for (int j = columnStart; j < (lastColumn + columnStart); j++)
                {
                    ws.Cells[i, j].Style.Border.Left.Style = ws.Cells[rowStyle, j].Style.Border.Left.Style;
                    ws.Cells[i, j].Style.Border.Right.Style = ws.Cells[rowStyle, j].Style.Border.Right.Style;
                    ws.Cells[i, j].Style.Border.Top.Style = ws.Cells[rowStyle, j].Style.Border.Top.Style;
                    ws.Cells[i, j].Style.Border.Bottom.Style = ws.Cells[rowStyle, j].Style.Border.Bottom.Style;
                    ws.Cells[i, j].Style.Numberformat.Format = ws.Cells[rowStyle, j].Style.Numberformat.Format;
                    ws.Cells[i, j].Style.Fill = ws.Cells[rowStyle, j].Style.Fill;
                    ws.Cells[i, j].Style.Font.Name = ws.Cells[rowStyle, j].Style.Font.Name;
                    ws.Cells[i, j].Style.VerticalAlignment = ws.Cells[rowStyle, j].Style.VerticalAlignment;
                    ws.Cells[i, j].Style.HorizontalAlignment = ws.Cells[rowStyle, j].Style.HorizontalAlignment;
                    ws.Cells[i, j].Style.WrapText = ws.Cells[rowStyle, j].Style.WrapText;
                }
            }

        }

        /// <summary>
        /// Ranges the set table.
        /// </summary>
        /// <param name="rowStart">The row start.</param>
        /// <param name="columnStart">The column start.</param>
        /// <param name="rowEnd">The row end.</param>
        /// <param name="columnEnd">The column end.</param>
        public ExcelRange Range_GetRange(int rowStart, int columnStart, int rowEnd, int columnEnd)
        {
            ExcelWorksheet ws = (ExcelWorksheet)_worksheet;
            ExcelRange range = ws.Cells[rowStart, columnStart, rowEnd, columnEnd];
            return range;
        }

        /// <summary>
        /// Ranges the get table.
        /// </summary>
        /// <param name="tableName">Name of the table.</param>
        /// <returns></returns>
        public ExcelTable Range_GetTable(string tableName)
        {
            ExcelWorksheet ws = (ExcelWorksheet)_worksheet;
            ExcelTableCollection listTable = ws.Tables;
            if (listTable == null || listTable.Count == 0)
            {
                return null;
            }

            for (int i = 0; i < listTable.Count; i++)
            {
                if (tableName.Equals(listTable[i].Name))
                {
                    return listTable[i];
                }
            }
            return null;
        }

        /// <summary>
        /// Auto fit Column
        /// </summary>
        /// <param name="range">Range column</param>
        public void Worksheet_AutofitColumnByRange(string range)
        {
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            worksheet.Cells[range].AutoFitColumns();
        }

        /// <summary>
        /// Dispose
        /// </summary>
        public void Dispose()
        {
            _workbook = null;
            _worksheet = null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="startRow"></param>
        /// <param name="startCol"></param>
        /// <param name="endRow"></param>
        /// <param name="endCol"></param>
        public void Wooksheet_SetBackgroundColor(int startRow, int startCol, int endRow, int endCol)
        {
            if (startRow > endRow || startCol > endCol) return;
            string previous = string.Empty;
            Color currentColor = Color.FromArgb(218, 238, 243);
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;

            for (int i = startRow; i <= endRow; i++)
            {
                if (!worksheet.Cells[i, 3].Text.Equals(previous))
                {
                    if (currentColor == Color.FromArgb(218, 238, 243))
                        currentColor = Color.FromArgb(255, 255, 255);
                    else
                        currentColor = Color.FromArgb(218, 238, 243);
                    previous = worksheet.Cells[i, 3].Text;
                }
                worksheet.Cells[i, startCol, i, endCol].Style.Fill.PatternType = ExcelFillStyle.Solid;
                worksheet.Cells[i, startCol, i, endCol].Style.Fill.BackgroundColor.SetColor(currentColor);
            }
        }

        /// <summary>
        /// get value cell
        /// </summary>
        /// <param name="row"></param>
        /// <param name="column"></param>
        /// <returns></returns>
        public string Cell_GetValue(int row, int column)
        {
            string value = string.Empty;
            ExcelWorksheet worksheet = (ExcelWorksheet)_worksheet;
            object obj = worksheet.Cells[row, column].Value;
            if (obj != null)
            {
                value = obj.ToString();
            }
            return value;
        }

        /// <summary>
        /// Copy Range
        /// </summary>
        /// <param name="rowCopy"></param>
        /// <param name="rowParse"></param>
        /// <param name="length"></param>
        public void Range_CopyRange(int rowCopy, int rowParse, int columnStart, int columnEnd, int length)
        {
            ExcelWorksheet ws = (ExcelWorksheet)_worksheet;
            ws.Cells[rowCopy, columnStart, rowCopy + length - 1, columnEnd].Copy(ws.Cells[rowParse, columnStart, rowParse + length - 1, columnEnd]);
        }

        /// <summary>
        /// Delete Rows
        /// </summary>
        /// <param name="rowStart"></param>
        /// <param name="rowEnd"></param>
        /// <param name="shiftOtherRowsUp"></param>
        public void Range_DeleteRows(int rowStart, int rowEnd, bool shiftOtherRowsUp)
        {
            ExcelWorksheet ws = (ExcelWorksheet)_worksheet;
            ws.DeleteRow(rowStart, rowEnd - rowStart + 1, shiftOtherRowsUp);
        }
    }
}
