using Infini.AutomaticDivideTool.Utilities;
using System;
using System.Globalization;
using System.Reflection;
using System.Threading;
using System.Windows;
using System.Windows.Threading;

namespace Infini.AutomaticDivideTool
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private readonly Logger _logger = Logger.GetLogger();
        MainWindow mainWindow;
        private Mutex _mutex = null;

        /// <summary>
        /// App_Startup
        /// </summary>
        /// <param name="sender">object</param>
        /// <param name="e">StartupEventArgs</param>
        public void App_Startup(object sender, StartupEventArgs e)
        {
            _logger.Info(Constant.START + this.GetType().Name + " - " + MethodBase.GetCurrentMethod().Name);

            //Set locate
            CultureInfo ci = CultureInfo.CreateSpecificCulture("ja-JP");
            ci.DateTimeFormat.ShortDatePattern = "yyyy/MM/dd";
            Thread.CurrentThread.CurrentCulture = ci;

            //check only app is running
            string appName = Assembly.GetExecutingAssembly().GetName().Name;
            bool createdNew;
            _mutex = new Mutex(true, appName, out createdNew);
            if (!createdNew)
            {
                MessageUtils.Show(MessageType.Error, String.Format("{0}は既に実行されています。", appName));
                Shutdown();
                _logger.Info("END: App_Startup");
                return;
            }

            mainWindow = new MainWindow();
            CommonUtils.fileConfigName = Constant.FILE_CONFIG;
            CommonUtils.GetLocation(Constant.XML_NODE_LOCATION_MAIN);
            mainWindow.Top = CommonUtils.top;
            mainWindow.Left = CommonUtils.left;
            mainWindow.Show();
            _logger.Info(Constant.END + this.GetType().Name + " - " + MethodBase.GetCurrentMethod().Name);
        }

        /// <summary>
        /// Application_DispatcherUnhandledException
        /// </summary>
        /// <param name="sender">object</param>
        /// <param name="e">DispatcherUnhandledExceptionEventArgs</param>
        void Application_DispatcherUnhandledException(object sender, DispatcherUnhandledExceptionEventArgs e)
        {
            _logger.Info(Constant.START + this.GetType().Name + " - " + MethodBase.GetCurrentMethod().Name);
            _logger.Error(e.Exception.Message);
            MessageUtils.Show(MessageType.Error, e.Exception.Message);
            e.Handled = true;
            _logger.Info(Constant.END + this.GetType().Name + " - " + MethodBase.GetCurrentMethod().Name);
        }
    }
}
