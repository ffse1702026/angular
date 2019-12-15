using Microsoft.Win32;
using System;
using System.Security.Principal;

namespace Infini.AutomaticDivideTool.Utilities
{
    /// <summary>
    /// Class StartUpManagerUtils
    /// </summary>
    public class StartUpManagerUtils
    {/// <summary>
        /// AddApplicationToCurrentUserStartup
        /// </summary>
        /// <param name="keyRegist"></param>
        public static void AddApplicationToCurrentUserStartup(string keyRegist)
        {
            using (RegistryKey key = Registry.CurrentUser.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true))
            {
                key.SetValue(keyRegist, "\"" + System.Reflection.Assembly.GetExecutingAssembly().Location + "\"");
            }
        }

        /// <summary>
        /// AddApplicationToAllUserStartup
        /// </summary>
        /// <param name="keyRegist"></param>
        public static void AddApplicationToAllUserStartup(string keyRegist)
        {
            using (RegistryKey key = Registry.LocalMachine.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true))
            {
                key.SetValue(keyRegist, "\"" + System.Reflection.Assembly.GetExecutingAssembly().Location + "\"");
            }
        }

        /// <summary>
        /// RemoveApplicationFromCurrentUserStartup
        /// </summary>
        /// <param name="keyRegist"></param>
        public static void RemoveApplicationFromCurrentUserStartup(string keyRegist)
        {
            using (RegistryKey key = Registry.CurrentUser.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true))
            {
                key.DeleteValue(keyRegist, false);
            }
        }

        /// <summary>
        /// RemoveApplicationFromAllUserStartup
        /// </summary>
        /// <param name="keyRegist"></param>
        public static void RemoveApplicationFromAllUserStartup(string keyRegist)
        {
            using (RegistryKey key = Registry.LocalMachine.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true))
            {
                key.DeleteValue(keyRegist, false);
            }
        }

        /// <summary>
        /// IsUserAdministrator
        /// </summary>
        /// <returns></returns>
        public static bool IsUserAdministrator()
        {
            bool isAdmin;
            try
            {
                WindowsIdentity user = WindowsIdentity.GetCurrent();
                WindowsPrincipal principal = new WindowsPrincipal(user);
                isAdmin = principal.IsInRole(WindowsBuiltInRole.Administrator);
            }
            catch (UnauthorizedAccessException)
            {
                isAdmin = false;
            }
            catch (Exception)
            {
                isAdmin = false;
            }
            return isAdmin;
        }
    }
}
