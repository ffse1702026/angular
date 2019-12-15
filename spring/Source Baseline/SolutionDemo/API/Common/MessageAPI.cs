using Infini.AutomaticDivideTool.API.Resources;

namespace Infini.AutomaticDivideTool.API.Common
{
    /// <summary>
    /// Class MessageAPI
    /// </summary>
    public class MessageAPI
    {
        /// <summary>
        /// getMessageLinxByKey
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static string GetMessageLinxByKey(string key)
        {
            key = "MSGLINX" + key;
            return Messages.ResourceManager.GetString(key);
        }

        /// <summary>
        /// getMessageLinxByKey
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static string GetMessageLinxByKey(int key)
        {
            string msgkey = "MSGLINX" + key;
            return Messages.ResourceManager.GetString(msgkey);
        }
    }
}
