using Infini.AutomaticDivideTool.Models;
using Infini.AutomaticDivideTool.Utilities;
using Infini.AutomaticDivideTool.Views;
using System;
using System.Windows;

namespace Infini.AutomaticDivideTool
{
    /// <summary>
    /// Interaction logic for SubWindow.xaml
    /// </summary>
    public partial class SubWindow : Window
    {
        private Logger _logger = Logger.GetLogger();
        private int _scrIndex = 0;
        //private Views.AutomaticDivideTool _mainForm = null;

        //public SubWindow(Views.AutomaticDivideTool mainForm, int scrIndex)
        //{
        //    InitializeComponent();
        //    _mainForm = mainForm;
        //    _scrIndex = scrIndex;
        //}

        /// <summary>
        /// Window_Loaded
        /// </summary>
        /// <param name="sender">object</param>
        /// <param name="e">RoutedEventArgs</param>
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            _logger.Info("START: Window_Loaded");
            this.mainGird.Children.Clear();

            switch (_scrIndex)
            {
                default:
                    break;
            }
            _logger.Info("END: Window_Loaded");
        }

        /// <summary>
        /// Window_Closing
        /// </summary>
        /// <param name="sender">sender</param>
        /// <param name="e">System.ComponentModel.CancelEventArgs</param>
        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            _logger.Info("START: Window_Closing");
            CommonUtils.fileConfigName = Constant.FILE_CONFIG;
            CommonUtils.top = Convert.ToInt32(this.Top);
            CommonUtils.left = Convert.ToInt32(this.Left);
            CommonUtils.SetLocation(Constant.XML_NODE_LOCATION_SUB);
            _logger.Info("END: Window_Closing");
        }
    }
}
