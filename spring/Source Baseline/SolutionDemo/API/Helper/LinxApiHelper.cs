using Infini.AutomaticDivideTool.API.Common;
using Infini.AutomaticDivideTool.API.LibraryManager;
using Infini.AutomaticDivideTool.Utilities;
using System;
using System.Runtime.InteropServices;
using System.Text;

namespace Infini.AutomaticDivideTool.API.Helper
{
    /// <summary>
    /// LinxApiHelper
    /// </summary>
    /// <seealso cref="System.IDisposable" />
    public class LinxApiHelper : IDisposable
    {
        private Logger _logger = Logger.GetLogger();

        #region Private members
        private IntPtr _libraryHandle;
        private LinxLogin _linxLogin;
        private LinxSignIn _linxSignIn;
        private LinxCommand _linxCommand;
        private LinxRPTCommand _linxRPTCommand;
        private LinxSignOut _linxSignOut;
        private LinxLogOut _linxLogOut;
        private LinxDoubleLogin _linxDoubleLogin;
        #endregion

        #region Linx api functions delegates
        private delegate int LinxLogin(string userID, string pass, string pcc, string linxDir, StringBuilder res, int len);
        private delegate int LinxSignIn(string command, int pxxx, StringBuilder res, int len);
        private delegate int LinxCommand(string command, StringBuilder c1c2, StringBuilder res, int len);
        private delegate int LinxRPTCommand(string command, StringBuilder c1c2, StringBuilder res, int len, string rpt);
        private delegate int LinxSignOut(StringBuilder res, int len);
        private delegate int LinxLogOut();
        private delegate int LinxDoubleLogin(StringBuilder res, int len);
        #endregion

        /// <summary>
        /// Initializes a new instance of the <see cref="LinxApiHelper"/> class.
        /// </summary>
        public LinxApiHelper()
        {
            _libraryHandle = LinxApiManager.LoadLibrary(@"Resources\LinxApi.dll");
            if (_libraryHandle == IntPtr.Zero)
                Marshal.ThrowExceptionForHR(Marshal.GetHRForLastWin32Error());
            _linxLogin = LoadMethod<LinxLogin>(@"LinxLogin");
            _linxSignIn = LoadMethod<LinxSignIn>(@"LinxSignIn");
            _linxCommand = LoadMethod<LinxCommand>(@"LinxCommand");
            _linxRPTCommand = LoadMethod<LinxRPTCommand>(@"LinxRPTCommand");
            _linxSignOut = LoadMethod<LinxSignOut>(@"LinxSignOut");
            _linxLogOut = LoadMethod<LinxLogOut>(@"LinxLogOut");
            _linxDoubleLogin = LoadMethod<LinxDoubleLogin>(@"LinxDoubleLogin");
        }

        /// <summary>
        /// LoginLinx
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="pass"></param>
        /// <param name="pcc"></param>
        /// <param name="linx_dir"></param>
        /// <returns></returns>
        public string LoginLinx(string userId, string pass, string pcc, string linx_dir, ref string logMessage)
        {
            int length = 6;
            string resultMessage = String.Empty;

            StringBuilder res = new StringBuilder(length);

            int result = _linxLogin(userId, pass, pcc, linx_dir, res, length);

            if (result == 4)
            {
                result = _linxDoubleLogin(res, length);
            }

            if (result == 0)
            {
                resultMessage = "OK";

                logMessage = string.Format("\nLogin success. ID: {0} in pcc: {1}. \nResponse: {2}\n",  userId, pcc, res.ToString());
                _logger.Info(logMessage);
            }
            else
            {
                resultMessage = MessageAPI.GetMessageLinxByKey(result);

                logMessage = string.Format("\nLogin fail. ID: {0} in pcc: {1}. \nResponse: {2}\n", userId, pcc, resultMessage);
                _logger.Info(logMessage);
            }

            return resultMessage;
        }

        /// <summary>
        /// LogoutLinx
        /// </summary>
        /// <returns></returns>
        public bool LogoutLinx()
        {
            int result = _linxLogOut();
            string logMessage;
            string resultMessage = String.Empty;
            resultMessage = MessageAPI.GetMessageLinxByKey(result);

            if (result == 0)
            {
                logMessage = string.Format("\nLogout success. Message: {0}\n", resultMessage);
                _logger.Info(logMessage);
                return true;
            }
            else
            {
                logMessage = string.Format("\nLogout fail. Message: {0}\n", resultMessage);
                _logger.Info(logMessage);
                return false;
            }
        }

        /// <summary>
        /// SendCommand
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        public string SendCommand(string command, ref bool isError)
        {
            int c1c2Len = 5;
            int resLenth = 20000;
            StringBuilder c1c2 = new StringBuilder(c1c2Len);
            StringBuilder response = new StringBuilder(resLenth);
            string resultMessage = String.Empty;

            // Send command by API
            int result = _linxCommand(command, c1c2, response, resLenth);

            if (result == 0)
            {
                string logMessage = string.Format("\nCommand: {0}.\nResponse: {1}\n", command, response.ToString());
                _logger.Info(logMessage);
                isError = false;

                return response.ToString();
            }
            else
            {
                resultMessage = MessageAPI.GetMessageLinxByKey(result);

                string logMessage = string.Format("\nCommand: {0}.\nResponse: {1}\n", command, resultMessage);
                _logger.Info(logMessage);
                isError = true;

                return resultMessage;
            }
        }

        /// <summary>
        /// SendCommandJX
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        public string SendCommandJX(string command)
        {
            string responseType = "X";
            int resLength = 200000;
            int c1c2Len = 5;
            StringBuilder c1c2 = new StringBuilder(c1c2Len);
            StringBuilder response = new StringBuilder(resLength);
            string resultMessage = String.Empty;

            int result = _linxRPTCommand(command, c1c2, response, resLength, responseType);

            if (result == 0)
            {
                string logMessage = string.Format("\nCommand: {0}.\nResponse: {1}\n", command, response.ToString());
                _logger.Info(logMessage);
                return response.ToString();
            }
            else
            {
                resultMessage = MessageAPI.GetMessageLinxByKey(result);

                string logMessage = string.Format("\nCommand: {0}.\nResponse: {1}\n", command, resultMessage);
                _logger.Info(logMessage);

                return resultMessage;
            }
        }

        /// <summary>
        /// SigninInfini
        /// </summary>
        /// <param name="command"></param>
        /// <param name="maxDisplay"></param>
        /// <returns></returns>
        public string SigninInfini(string command, int maxDisplay)
        {
            int length = 100;
            StringBuilder response = new StringBuilder(length);
            string logMessage;
            string resultMessage = String.Empty;

            int result = _linxSignIn(command, maxDisplay, response, length);

            if (result == 0)
            {
                logMessage = string.Format("\nSignin success. Command: {0}. \nResponse: {1}\n", command, response.ToString());
                _logger.Info(logMessage);
                return response.ToString();
            }
            else
            {
                resultMessage = MessageAPI.GetMessageLinxByKey(result);

                logMessage = string.Format("\nSignin fail. Command: {0}. \nResponse: {1}\n", command, resultMessage);
                _logger.Info(logMessage);

                return resultMessage;
            }
        }

        /// <summary>
        /// SignoutInfini
        /// </summary>
        /// <returns></returns>
        public string SignoutInfini()
        {
            int length = 20000;
            StringBuilder response = new StringBuilder(length);
            string logMessage;
            int result = _linxSignOut(response, length);
            string resultMessage = String.Empty;

            if (result == 0)
            {
                logMessage = string.Format("\nSignout success. Message: {0}\n", response.ToString());
                _logger.Info(logMessage);
                return response.ToString();
            }
            else
            {
                resultMessage = MessageAPI.GetMessageLinxByKey(result);

                logMessage = string.Format("\nSignout fail. Message: {0}\n", resultMessage);
                _logger.Info(logMessage);
                return resultMessage;
            }
        }

        /// <summary>
        /// Releases unmanaged and - optionally - managed resources.
        /// </summary>
        public void Dispose()
        {
            Dispose(true);

            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// Finalizes an instance of the <see cref="LinxApiHelper"/> class.
        /// </summary>
        ~LinxApiHelper()
        {
            Dispose(false);
        }

        #region Private helper methods        
        /// <summary>
        /// Loads the external function.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="methodName">Name of the function.</param>
        /// <returns></returns>
        private T LoadMethod<T>(string methodName) where T : class
        {
            //Debug.Assert(!String.IsNullOrEmpty(functionName));
            // load function pointer
            IntPtr functionPointer =
              LinxApiManager.GetProcAddress(_libraryHandle, methodName);

            if (functionPointer == IntPtr.Zero)
                Marshal.ThrowExceptionForHR(Marshal.GetHRForLastWin32Error());
            // Marshal to requested delegate
            return Marshal.GetDelegateForFunctionPointer(functionPointer, typeof(T)) as T;
        }

        /// <summary>
        /// Releases unmanaged and - optionally - managed resources.
        /// </summary>
        /// <param name="disposing"><c>true</c> to release both managed and unmanaged resources; <c>false</c> to release only unmanaged resources.</param>
        private void Dispose(bool disposing)
        {
            if (disposing)
            {
                _linxLogin = null;
                _linxSignIn = null;
                _linxCommand = null;
                _linxRPTCommand = null;
                _linxSignOut = null;
                _linxLogOut = null;
                _linxDoubleLogin = null;
            }

            if (_libraryHandle != IntPtr.Zero)
            {
                if (!LinxApiManager.FreeLibrary(_libraryHandle))
                    Marshal.ThrowExceptionForHR(Marshal.GetHRForLastWin32Error());

                _libraryHandle = IntPtr.Zero;
            }
        }
        #endregion
    }
}
