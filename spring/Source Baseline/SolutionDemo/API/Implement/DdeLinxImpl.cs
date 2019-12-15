using Infini.AutomaticDivideTool.API.Interface;
using Infini.AutomaticDivideTool.Utilities;
using NDde.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;

namespace Infini.AutomaticDivideTool.API.Implement
{
    public class DdeLinxImpl : IDdeLinx, IDisposable
    {
        // DDEｱｲﾃﾑ名の定義
        public const string ITEM_CRTBUFF = "CrtData"; // ｱｲﾃﾑ名:画面ﾊﾞｯﾌｧ
        public const string ITEM_SENDKEY = "SendKey"; // ｱｲﾃﾑ名:ｷｰのｼﾐｭﾚｰｼｮﾝ
        public const string ITEM_ENABLE = "EnableWindow";
        public const string ITEM_DISABLE = "DisableWindow";
        public const string SIGNIN_TO_INFINI = "SIGNIN TO INFINI";
        public const int TIME_OUT = 60000; // timed out after 60seconds
        private const string API_NAME = "LINX";
        private const string TOPIC_NAME = "LINXDDE";
        private Logger _logger = Logger.GetLogger();
        private DdeClient client;
        private bool isNotSigned { get; set; }

        /// <summary>
        /// DdeLinxImpl constructor
        /// </summary>
        /// <param name="appName">DDEでのｱﾌﾟﾘｹｰｼｮﾝ名</param>
        /// <param name="topicName">DDEでのﾄﾋﾟｯｸ名</param>
        public DdeLinxImpl()
        {
            _logger.InfoStart(MethodBase.GetCurrentMethod());
            CreateLink(API_NAME, TOPIC_NAME);
            _logger.InfoEnd(MethodBase.GetCurrentMethod());
        }

        /// <summary>
        /// 本プロシージャーは、ＩＮＦＩＮＩ　ＬＩＮＸ PLUSとのＤＤＥリンクを確立する。
        /// </summary>
        /// <param name="appName">DDEでのｱﾌﾟﾘｹｰｼｮﾝ名</param>
        /// <param name="topicName">DDEでのﾄﾋﾟｯｸ名</param>
        /// <returns>-1:APIﾗｲﾌﾞﾗﾘの初期化が済んでいない<br/>0:正常終了</returns>
        public int CreateLink(string appName, string topicName)
        {
            _logger.InfoStart(MethodBase.GetCurrentMethod());
            if (topicName == null) throw new ArgumentNullException("topicName");
            if (client != null && !client.IsConnected)
            {
                client.Connect();
                _logger.InfoEnd(MethodBase.GetCurrentMethod());
                return 0;
            }
            else
            {
                try
                {
                    client = new DdeClient(appName, topicName);
                    client.Connect();

                    _logger.Info("Execute client.CreateLink({0}, {1}). Connected state is: {2}", true, appName, topicName, client.IsConnected);
                    if (client.IsConnected)
                    {
                        _logger.InfoEnd(MethodBase.GetCurrentMethod());
                        return 0;
                    }
                    else
                    {
                        _logger.InfoEnd(MethodBase.GetCurrentMethod());
                        return -1;
                    }
                }
                catch (Exception ex)
                {
                    _logger.Error(ex, "Execute client.CreateLink({0}, {1})", true, appName, topicName);
                    _logger.InfoEnd(MethodBase.GetCurrentMethod());
                    return -1;
                }
            }
        }

        /// <summary>
        /// 本プロシージャーは、ＩＮＦＩＮＩ　ＬＩＮＸ PLUS　ＤＤＥのＡＰＩライブラリが初期化されているか調べる。
        /// </summary>
        /// <returns>True:初期化済み<br/>False:初期化が済んでいない</returns>
        public bool IsApiAvailable()
        {
            _logger.InfoStart(MethodBase.GetCurrentMethod());
            if (client != null && client.IsConnected)
            {
                _logger.InfoEnd(MethodBase.GetCurrentMethod());
                return true;
            }
            else
            {
                _logger.InfoEnd(MethodBase.GetCurrentMethod());
                return false;
            }
        }

        /// <summary>
        /// IsNotSignedToInfini
        /// </summary>
        /// <returns>True: not sign<br/>False: signed</returns>
        public bool IsNotSignedToInfini()
        {
            return isNotSigned;
        }

        /// <summary>
        /// 本プロシージャーは、ＩＮＦＩＮＩ　ＬＩＮＸ PLUSの画面バッファ全体を取得する。
        /// </summary>
        /// <param name="szString">送信するｷｰｽﾄﾘﾝｸﾞ</param>
        /// <returns>True:正常終了<br/>False:ｴﾗｰ</returns>
        public bool CrtData(ref String szString)
        {
            _logger.InfoStart(MethodBase.GetCurrentMethod());
            if (this.IsApiAvailable())
            {
                try
                {
                    szString = client.Request(ITEM_CRTBUFF, TIME_OUT);
                    int index = szString.IndexOf("[                                                                               \0");
                    if (index >= 0)
                    {
                        szString = szString.Substring(0, index);
                    }

                    if (szString != null)
                    {
                        Regex rg = new Regex(@"(^*.+?(?=\[\s{2,}\0))");
                        MatchCollection matchList = rg.Matches(szString);
                        if (matchList.Count == 1)
                        {
                            szString = matchList[0].Value;
                        }

                        isNotSigned = SIGNIN_TO_INFINI.Equals(szString.Trim());
                    }
                    _logger.Info("Execute client.Request({0}, {1})\nResponse:\n{2}", true, ITEM_CRTBUFF, TIME_OUT, szString);
                    _logger.InfoEnd(MethodBase.GetCurrentMethod());
                    return true;
                }
                catch (Exception ex)
                {
                    _logger.Error(ex, "Execute client.Request({0}, {1})", true, ITEM_CRTBUFF, TIME_OUT);
                    _logger.InfoEnd(MethodBase.GetCurrentMethod());
                    return false;
                }
            }
            _logger.InfoEnd(MethodBase.GetCurrentMethod());
            return false;
        }

        /// <summary>
        /// 本プロシージャーは、ＩＮＦＩＮＩ　ＬＩＮＸ PLUSのキーシュミレーションを実行する。
        /// </summary>
        /// <param name="keyString">送信するｷｰｽﾄﾘﾝｸﾞ</param>
        /// <returns>True:正常終了<br/>False:ｴﾗｰ</returns>
        public int SendKey(string keyString)
        {
            _logger.InfoStart(MethodBase.GetCurrentMethod());
            try
            {
                if (!client.IsConnected)
                {
                    CreateLink(API_NAME, TOPIC_NAME);
                }
                client.Poke(ITEM_SENDKEY, keyString + "%SEND%", TIME_OUT);
                _logger.Info("Execute client.SendKey({0}, {1}, {2})", true, ITEM_SENDKEY, keyString + "%SEND%", TIME_OUT);
                _logger.InfoEnd(MethodBase.GetCurrentMethod());
                return 1;
            }
            catch (Exception ex)
            {
                _logger.Error(ex, "Execute client.SendKey({0}, {1}, {2})", true, ITEM_SENDKEY, keyString + "%SEND%", TIME_OUT);
                _logger.InfoEnd(MethodBase.GetCurrentMethod());
                return -1;
            }
        }

        /// <summary>
        /// 本プロシージャーは、ＩＮＦＩＮＩ　ＬＩＮＸ PLUSとのＤＤＥリンクを破棄する。
        /// </summary>
        public void DistroyLink()
        {
            _logger.InfoStart(MethodBase.GetCurrentMethod());
            if (client != null)
            {
                client.Dispose();
                client = null;
            }
            _logger.InfoEnd(MethodBase.GetCurrentMethod());
        }

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose()
        {
            _logger.InfoStart(MethodBase.GetCurrentMethod());
            DistroyLink();
            _logger.InfoEnd(MethodBase.GetCurrentMethod());
        }


        /// <summary>
        /// EnableWindow
        /// </summary>
        /// <param name="fEnable">True or False</param>
        /// <returns>True: enable window<br/>False: disable window</returns>
        public bool EnableWindow(bool fEnable)
        {
            _logger.InfoStart(MethodBase.GetCurrentMethod());
            if (IsApiAvailable())
            {
                try
                {
                    string command = fEnable ? ITEM_ENABLE : ITEM_DISABLE;
                    client.Execute("[" + command + "]", TIME_OUT);
                    return true;
                }
                catch
                {
                    return false;
                }
                finally
                {
                    _logger.InfoEnd(MethodBase.GetCurrentMethod());
                }
            }
            _logger.InfoEnd(MethodBase.GetCurrentMethod());
            return false;
        }

        /// <summary>
        /// Execute command and get response
        /// </summary>
        /// <param name="command">command</param>
        /// <returns>List response</returns>
        public List<string> ExecuteCommnad(string command, bool isGetAll = true)
        {
            _logger.InfoStart(MethodBase.GetCurrentMethod());
            List<string> listResponse = new List<string>();
            string result = String.Empty;

            SendKey(command);
            CrtData(ref result);

            listResponse = StringUtils.BreakLineByLength(result, 80);

            // check scroll
            List<string> lstToCheck = listResponse;

            while (isGetAll && _isExistScroll(lstToCheck))
            {
                SendKey("MD");
                CrtData(ref result);
                lstToCheck = StringUtils.BreakLineByLength(result, 80);
                listResponse.AddRange(lstToCheck);
            }
            _logger.InfoEnd(MethodBase.GetCurrentMethod());
            return listResponse;
        }

        /// <summary>
        /// Determines whether [is exist scroll] [the specified list response].
        /// </summary>
        /// <param name="listResponse">The list response.</param>
        /// <returns>
        ///   <c>true</c> if [is exist scroll] [the specified list response]; otherwise, <c>false</c>.
        /// </returns>
        private bool _isExistScroll(List<string> listResponse)
        {
            _logger.InfoStart(MethodBase.GetCurrentMethod());

            //Empty Response
            if (listResponse == null || listResponse.Count == 0)
            {
                return false;
            }

            string firstLine = listResponse[0];
            string lastLine = listResponse[listResponse.Count - 1];
            //NO MORE
            if (firstLine.Contains("END OF SCROLL") || firstLine.Contains("NOTHING TO SCROLL"))
            {
                return false;
            }

            bool isExist = false;
            //Check number of rows
            if (listResponse.Count >= 10)
            {
                //Check 63th digit of last row
                if (lastLine.LastIndexOf(@"\") == 63)
                {
                    lastLine = lastLine.Remove(63);
                    lastLine = lastLine.Insert(63, " ");
                    listResponse[listResponse.Count - 1] = lastLine;
                    isExist = true;
                }
                else
                {
                    //Check last digit of last row
                    string temp = lastLine.TrimEnd();
                    if (temp.Length>0 && temp[temp.Length - 1] == '\\')
                    {
                        isExist = true;
                    }
                }
            }
            _logger.InfoEnd(MethodBase.GetCurrentMethod());
            return isExist;
        }
    }
}
