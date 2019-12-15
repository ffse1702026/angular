using System;
using System.Collections.Generic;

namespace Infini.AutomaticDivideTool.API.Interface
{
    public interface IDdeLinx : IDisposable
    {
        int CreateLink(string appName, string topicName);
        bool IsApiAvailable();
        bool IsNotSignedToInfini();
        bool CrtData(ref String szString);
        int SendKey(string keyString);
        bool EnableWindow(bool fEnable);
        List<string> ExecuteCommnad(string command, bool isGetAll = true);
    }
}
