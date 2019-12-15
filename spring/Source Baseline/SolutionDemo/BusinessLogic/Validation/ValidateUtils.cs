using Infini.AutomaticDivideTool.Utilities;
using System;
using System.IO;
using System.Text.RegularExpressions;

namespace Infini.AutomaticDivideTool.BusinessLogic.Validation
{
    public class ValidateUtils
    {
        public static readonly string REGEX_TIME = @"[0-9]{1,2}:[0-9]{1,2}";
        public static readonly string REGEX_NUMBER = @"^\d$";
        public static readonly string REGEX_STATUS = @"^[A-Z]{2}$";
        public static readonly string REGEX_PCC = @"^[A-Z0-9]{3}6{0,1}$";
        public static readonly string REGEX_QBOX = @"^\d{1,3}$";

        /// <summary>
        /// Determines whether [is required valid] [the specified value].
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns>
        ///   <c>true</c> if [is required valid] [the specified value]; otherwise, <c>false</c>.
        /// </returns>
        public static bool IsRequiredValid(string value)
        {
            bool res = !StringUtils.IsNullOrEmpty(value);
            return res;
        }

        /// <summary>
        /// Determines whether [is email valid] [the specified email].
        /// </summary>
        /// <param name="email">The email.</param>
        /// <returns>
        ///   <c>true</c> if [is email valid] [the specified email]; otherwise, <c>false</c>.
        /// </returns>
        public static bool IsEmailValid(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Determines whether [is time valid] [the specified time].
        /// </summary>
        /// <param name="time">The time.</param>
        /// <returns>
        ///   <c>true</c> if [is time valid] [the specified time]; otherwise, <c>false</c>.
        /// </returns>
        public static bool IsTimeValid(string time)
        {
            bool isMatch = Regex.IsMatch(time, REGEX_TIME);
            return isMatch;
        }

        /// <summary>
        /// Determines whether [is between valid] [the specified value].
        /// </summary>
        /// <param name="value">The value.</param>
        /// <param name="min">The minimum.</param>
        /// <param name="max">The maximum.</param>
        /// <returns>
        ///   <c>true</c> if [is between valid] [the specified value]; otherwise, <c>false</c>.
        /// </returns>
        public static bool IsBetweenValid(string value, int min, int max)
        {
            if (!IsNumberValid(value)) return false;
            int val = Int32.Parse(value);
            if (val <= max && val >= min) return true;
            return false;
        }

        /// <summary>
        /// Determines whether [is number valid] [the specified number].
        /// </summary>
        /// <param name="number">The number.</param>
        /// <returns>
        ///   <c>true</c> if [is number valid] [the specified number]; otherwise, <c>false</c>.
        /// </returns>
        public static bool IsNumberValid(string number)
        {
            bool isMatch = Regex.IsMatch(number, REGEX_NUMBER);
            return isMatch;
        }

        /// <summary>
        /// Determines whether [is status valid] [the specified status].
        /// </summary>
        /// <param name="status">The status.</param>
        /// <returns>
        ///   <c>true</c> if [is status valid] [the specified status]; otherwise, <c>false</c>.
        /// </returns>
        public static bool IsStatusValid(string status)
        {
            bool isMatch = Regex.IsMatch(status, REGEX_STATUS);
            return isMatch;
        }

        /// <summary>
        /// Determines whether [is PCC valid] [the specified PCC].
        /// </summary>
        /// <param name="pcc">The PCC.</param>
        /// <returns>
        ///   <c>true</c> if [is PCC valid] [the specified PCC]; otherwise, <c>false</c>.
        /// </returns>
        public static bool IsPCCValid(string pcc)
        {
            bool isMatch = Regex.IsMatch(pcc, REGEX_PCC);
            return isMatch;
        }

        /// <summary>
        /// Determines whether [is QBOX valid] [the specified QBOX].
        /// </summary>
        /// <param name="qbox">The QBOX.</param>
        /// <returns>
        ///   <c>true</c> if [is QBOX valid] [the specified QBOX]; otherwise, <c>false</c>.
        /// </returns>
        public static bool IsQBOXValid(string qbox)
        {
            bool isMatch = Regex.IsMatch(qbox, REGEX_QBOX);
            return isMatch;
        }

        /// <summary>
        /// Determines whether [is folder path valid] [the specified folder path].
        /// </summary>
        /// <param name="folderPath">The folder path.</param>
        /// <returns>
        ///   <c>true</c> if [is folder path valid] [the specified folder path]; otherwise, <c>false</c>.
        /// </returns>
        public static bool IsFolderPathValid(string folderPath)
        {
            bool isValid = Directory.Exists(folderPath);
            return isValid;
        }
    }
}
