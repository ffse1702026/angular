using System;
using System.Runtime.InteropServices;

namespace Infini.AutomaticDivideTool.API.LibraryManager
{
    internal static class LinxApiManager
    {
        [DllImport("kernel32.dll", SetLastError = true)]
        internal extern static IntPtr LoadLibrary(string libraryName);
        [DllImport("kernel32.dll", SetLastError = true)]
        internal extern static bool FreeLibrary(IntPtr hModule);
        [DllImport("kernel32.dll", SetLastError = true)]
        internal extern static IntPtr GetProcAddress(IntPtr hModule, string procName);
        [DllImport("kernel32.dll", SetLastError = true)]
        internal extern static IntPtr GetModuleHandle(string libraryName =null);
    }
}
