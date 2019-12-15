using System.Windows.Forms;

namespace Infini.AutomaticDivideTool.Utilities
{
    public class MessageUtils
    {
        private static readonly string PRODUCT_NAME = Application.ProductName;

        /// <summary>
        /// Show message error
        /// </summary>
        /// <param name="message">Message</param>
        private static void Error(string message)
        {
            MessageBox.Show(message, PRODUCT_NAME, MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        /// <summary>
        /// Show message warning
        /// </summary>
        /// <param name="message">Message</param>
        private static void Warning(string message)
        {
            MessageBox.Show(message, PRODUCT_NAME, MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        /// <summary>
        /// Show message information
        /// </summary>
        /// <param name="message">Message</param>
        private static void Info(string message)
        {
            MessageBox.Show(message, PRODUCT_NAME, MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        /// <summary>
        /// Show message confirm
        /// </summary>
        /// <param name="message">Message</param>
        /// <returns>DialogResult</returns>
        private static DialogResult Confirm(string message, MessageBoxButtons messageBoxButtons)
        {
            return MessageBox.Show(message, PRODUCT_NAME, MessageBoxButtons.YesNo, MessageBoxIcon.Question);
        }

        /// <summary>
        /// Show message
        /// </summary>
        /// <param name="type">type message</param>
        /// <param name="message">Message</param>
        /// <returns>DialogResult</returns>
        public static DialogResult Show(MessageType type, string message, MessageBoxButtons messageBoxButtons = MessageBoxButtons.OK)
        {
            if (!StringUtils.IsNullOrEmpty(message))
            {
                switch (type)
                {
                    case MessageType.Error: Error(message); break;
                    case MessageType.Warning: Warning(message); break;
                    case MessageType.Info: Info(message); break;
                    case MessageType.Confirm: return Confirm(message, messageBoxButtons);
                    default: break;
                }
            }
            return DialogResult.None;
        }
    }
}
