using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Windows.Forms;

namespace Infini.AutomaticDivideTool.Utilities
{
    /// <summary>
    /// Class Logger.
    /// </summary>
    internal class Logger
    {
        private const string Format = @"${longdate} - ${level}: ${message}${onexception}${newline}";
        private const string FormatOnException = @"${newline}EXCEPTION:${exception}";
        private const string FormatDate = "yyyy-MM-dd";

        private static readonly string LogDir = Constant.LOGDIR;
        private static readonly object Locker = new object();

        private Logger()
        {
            ClearLogFiles();
        }

        public static Logger GetLogger()
        {
            return new Logger();
        }

        /// <summary>
        /// Errors the specified exception.
        /// </summary>
        /// <param name="exception">The exception.</param>
        public void Error(Exception exception)
        {
            WriteLog("error", exception, string.Empty);
        }

        /// <summary>
        /// Errors the specified message.
        /// </summary>
        /// <param name="message">The message.</param>
        /// <param name="args">The arguments.</param>
        public void Error(string message, bool hasArgs = false, params object[] args)
        {
            if (hasArgs)
                WriteLog("error", null, message, args);
            else
                WriteLog("error", null, message);
        }

        /// <summary>
        /// Errors the specified exception.
        /// </summary>
        /// <param name="exception">The exception.</param>
        /// <param name="message">The message.</param>
        /// <param name="args">The arguments.</param>
        public void Error(Exception exception, string message, bool hasArgs = false, params object[] args)
        {
            if (hasArgs)
                WriteLog("error", exception, message, args);
            else
                WriteLog("error", exception, message);
        }

        /// <summary>
        /// Fatals the specified exception.
        /// </summary>
        /// <param name="exception">The exception.</param>
        public void Fatal(Exception exception)
        {
            WriteLog("fatal", exception, string.Empty);
        }

        /// <summary>
        /// Fatals the specified message.
        /// </summary>
        /// <param name="message">The message.</param>
        /// <param name="args">The arguments.</param>
        public void Fatal(string message, bool hasArgs = false, params object[] args)
        {
            if (hasArgs)
                WriteLog("fatal", null, message, args);
            else
                WriteLog("fatal", null, message);
        }

        /// <summary>
        /// Fatals the specified exception.
        /// </summary>
        /// <param name="exception">The exception.</param>
        /// <param name="message">The message.</param>
        /// <param name="args">The arguments.</param>
        public void Fatal(Exception exception, string message, bool hasArgs = false, params object[] args)
        {
            if (hasArgs)
                WriteLog("fatal", exception, message, args);
            else
                WriteLog("fatal", exception, message);

        }

        /// <summary>
        /// Informations the specified exception.
        /// </summary>
        /// <param name="exception">The exception.</param>
        public void Info(Exception exception)
        {
            WriteLog("info", exception, string.Empty);
        }

        /// <summary>
        /// Informations the specified message.
        /// </summary>
        /// <param name="message">The message.</param>
        /// <param name="args">The arguments.</param>
        public void Info(string message, bool hasArgs = false, params object[] args)
        {
            if (hasArgs)
                WriteLog("info", null, message, args);
            else
                WriteLog("info", null, message);
        }

        public void InfoStart(MethodBase method, params object[] args)
        {
            WriteLog("info", null, "START: " + method.ReflectedType.Name + " - " + method.Name, args);
        }

        public void InfoEnd(MethodBase method, params object[] args)
        {
            WriteLog("info", null, "END: " + method.ReflectedType.Name + " - " + method.Name, args);
        }

        /// <summary>
        /// Informations the specified exception.
        /// </summary>
        /// <param name="exception">The exception.</param>
        /// <param name="message">The message.</param>
        /// <param name="args">The arguments.</param>
        public void Info(Exception exception, string message, bool hasArgs = false, params object[] args)
        {
            if (hasArgs)
                WriteLog("info", exception, message, args);
            else
                WriteLog("info", exception, message);
        }

        private void WriteLog(string level, Exception exception, string message, params object[] args)
        {
            message = string.Format(message, args);
            WriteLog(level, exception, message);
        }

        private void WriteLog(string level, Exception exception, string message)
        {
            level = level.ToUpper();

            // ログフォルダが無かった場合、新フォルダを作成する
            if (!Directory.Exists(LogDir))
            {
                Directory.CreateDirectory(LogDir);
            }

            //ログファイル作成
            var logFile = string.Format("{0}\\Log_{1}.txt", LogDir, DateTime.Now.ToString(FormatDate));
            var content = Format
                .Replace("${longdate}", DateTime.Now.ToString("O"))
                .Replace("${level}", level)
                .Replace("${message}", message);

            if (exception == null)
            {
                content = content.Replace("${onexception}", string.Empty);
            }
            else
            {
                content = content
                    .Replace("${onexception}", FormatOnException)
                    .Replace("${exception}", exception.ToString());
            }
            content = content.Replace("${newline}", Environment.NewLine);

            lock (Locker)
            {
                File.AppendAllText(logFile, content, Encoding.UTF8);
            }
        }

        public void ClearLogFiles()
        {
            try
            {
                // ログフォルダが無かった場合、新フォルダを作成する
                if (!Directory.Exists(LogDir))
                {
                    Directory.CreateDirectory(LogDir);
                }

                // Delete files older than 30 days old in a directory
                var dateCheckDelete = DateTime.Now.AddDays(-30);
                foreach (var filePath in Directory.GetFiles(LogDir))
                {
                    FileInfo fi = new FileInfo(filePath);

                    //var fileDate = fi.LastAccessTime;
                    var dateOfFile = DateTime.ParseExact(fi.Name.Replace("Log_", string.Empty).Replace(".txt", string.Empty), FormatDate, null);

                    if (dateOfFile < dateCheckDelete)
                    {
                        fi.Delete();
                    }
                }
            }
            catch (Exception ex)
            {
                Fatal(ex, "Cannot delete log files.");
            }
        }
    }
}
