using System;
namespace Infini.AutomaticDivideTool.Utilities
{
    public class Constant
    {
        public static readonly string FILE_CONFIG = System.AppDomain.CurrentDomain.BaseDirectory + @"\" + "Config.ini";
        public static readonly string FILE_EXPORT_LOG = AppDomain.CurrentDomain.BaseDirectory + @"Errors\" + "ErrorLog_{0}.csv";
        public static readonly string LOGDIR = System.AppDomain.CurrentDomain.BaseDirectory + "\\" + "Log";

        public const string XML_NODE_CONFIGURATION = "Configuration";
        public const string XML_NODE_LOCATION_MAIN = "LocationMain";
        public const string XML_NODE_LOCATION_SUB = "LocationSub";
        public const string XML_NODE_LOCATION_TOP = "Top";
        public const string XML_NODE_LOCATION_LEFT = "Left";
        public const string XML_NODE_RECORD = "Record";
        public const string KEY_REGIST_STARTUP = "Infini.AutomaticDivideTool";
        public const string CSV_SEPERATOR = "\"";
        public static readonly int MAX_INFINI_DISPLAY = 1;
        public static readonly string MSG_SYSTEM_ERROR_CONTACT_AD = @"システムエラーが発生しました。" + Environment.NewLine + "管理者へご連絡ください。" + Environment.NewLine + "（";

        //Encrypt-Decrypt
        public static readonly string CRYPT_KEY = "sblw-3hn8-sqoy19";
        
        public static readonly string START = "START: ";
        public static readonly string END = "END: ";

        public static readonly string FORMAT_DATE = "yyyy/MM/dd HH:mm:ss";
        public static readonly string RESPONSE_OK = "OK";
        public static readonly string LIST_VENDER_CODE = "ATPC,SITA,ATPCX,";
        public static readonly string iFARE_TICKET = "i-FARE";
        public static readonly string MANUAL_TICKET = "M-MANUAL";

        public static string EXCEL_SUMMARY_PCC_FILE_TEMPLATE = @"Infini.AutomaticDivideTool.Resources.SummaryPcc.xlsx";
        public static string EXCEL_SUMMARY_CLASSIFY_PCC_FILE_TEMPLATE = @"Infini.AutomaticDivideTool.Resources.SummaryClassifyPcc.xlsx";
        public static string EXCEL_DETAIL_CLASSIFY_PCC_FILE_TEMPLATE = @"Infini.AutomaticDivideTool.Resources.DetailClassifyPcc.xlsx";
    }
}
