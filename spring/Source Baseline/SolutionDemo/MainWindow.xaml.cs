using Infini.AutomaticDivideTool.BusinessLogic;
using Infini.AutomaticDivideTool.Models;
using Infini.AutomaticDivideTool.Utilities;
using Infini.AutomaticDivideTool.Views;
using System;
using System.IO;
using System.Reflection;
using System.Windows;

namespace Infini.AutomaticDivideTool
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private Logger _logger = Logger.GetLogger();
        public static readonly string MSGEXIT = "ご利用ありがとうございました。" + Environment.NewLine + "ツールを終了しますがよろしいですか？";

        /// <summary>
        /// Initializes a new instance of the <see cref="MainWindow"/> class.
        /// </summary>
        public MainWindow()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Handles the Loaded event of the Window control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="RoutedEventArgs"/> instance containing the event data.</param>
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            this.mainGird.Children.Clear();
            //this.mainGird.Children.Add(new Views.AutomaticDivideTool(new AutomaticDivideToolModel()));
        }

        /// <summary>
        /// Handles the Closing event of the Window control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.ComponentModel.CancelEventArgs"/> instance containing the event data.</param>
        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            _logger.Info(Constant.START + this.GetType().Name + " - " + MethodBase.GetCurrentMethod().Name);
            System.Windows.Forms.DialogResult dialogResult = MessageUtils.Show(MessageType.Confirm, MSGEXIT);
            if (dialogResult == System.Windows.Forms.DialogResult.Yes)
            {
                //Save location
                CommonUtils.fileConfigName = Constant.FILE_CONFIG;
                CommonUtils.top = Convert.ToInt32(this.Top);
                CommonUtils.left = Convert.ToInt32(this.Left);
                CommonUtils.SetLocation(Constant.XML_NODE_LOCATION_MAIN);
				e.Cancel = false;

                //Save screen infomation
                //Views.AutomaticDivideTool screen = (this.mainGird.Children[0]) as Views.AutomaticDivideTool;
                //screen.SaveScreenInfo();
                _logger.Info(Constant.END + this.GetType().Name + " - " + MethodBase.GetCurrentMethod().Name);
                return;
            }
            e.Cancel = true;
            _logger.Info(Constant.END + this.GetType().Name + " - " + MethodBase.GetCurrentMethod().Name);
        }
    }
}
