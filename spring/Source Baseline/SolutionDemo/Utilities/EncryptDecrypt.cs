using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace Infini.AutomaticDivideTool.Utilities
{
    public class EncryptDecrypt
    {
        /// <summary>
        /// Encrypt data
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static string Encrypt(string data, string key)
        {
            try
            {
                if (!string.IsNullOrEmpty(data))
                {
                    byte[] b = ASCIIEncoding.ASCII.GetBytes(data);
                    TripleDESCryptoServiceProvider triple = new TripleDESCryptoServiceProvider();
                    triple.Key = ASCIIEncoding.ASCII.GetBytes(key);
                    triple.Mode = CipherMode.ECB;
                    triple.Padding = PaddingMode.PKCS7;
                    ICryptoTransform trans = triple.CreateEncryptor();
                    byte[] resultArr = trans.TransformFinalBlock(b, 0, b.Length);
                    triple.Clear();
                    return Convert.ToBase64String(resultArr);
                }
                return "";
            }
            catch (Exception ex)
            {
                string logMessage = string.Format("{0} - Can not encrypt password. Error: {1}", DateTime.Now, ex.Message);
                Logger.GetLogger().Error(ex, logMessage);
                return string.Empty;
            }
        }

        /// <summary>
        /// Decrypt data
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static string Decrypt(string data, string key)
        {
            byte[] b;

            try
            {
                b = Convert.FromBase64String(data);
                TripleDESCryptoServiceProvider tripleDec = new TripleDESCryptoServiceProvider();
                tripleDec.Key = ASCIIEncoding.ASCII.GetBytes(key);
                tripleDec.Mode = CipherMode.ECB;
                tripleDec.Padding = PaddingMode.PKCS7;
                ICryptoTransform trans = tripleDec.CreateDecryptor();
                byte[] resultArr = trans.TransformFinalBlock(b, 0, b.Length);
                return ASCIIEncoding.ASCII.GetString(resultArr);
            }
            catch (Exception ex)
            {
                string logMessage = string.Format("{0} - Can not decrypt password. Error: {1}", DateTime.Now, ex.Message);
                Logger.GetLogger().Error(ex, logMessage);
                return string.Empty;
            }
        }
    }
}
