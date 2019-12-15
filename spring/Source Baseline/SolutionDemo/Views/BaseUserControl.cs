using Infini.AutomaticDivideTool.Models;
using Infini.AutomaticDivideTool.Utilities;
//using Microsoft.Windows.Controls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Threading;

namespace Infini.AutomaticDivideTool.Views
{
    /// <summary>
    /// Class BaseUserControl
    /// </summary>
    public class BaseUserControl : UserControl
    {
        private BackgroundWorker _worker = null;
        private Action _action = null;
        private BaseModel _model = null;
        protected MessageType messageType { get; set; }
        protected string message { get; set; }
        private Window _currentWindow = null;
        private List<string> enableNames = null;
        private DispatcherTimer _timer ;
        protected bool _isTimerRunning;
        protected bool _isWorkerRunning;
        private Action _timerAction = null;

        /// <summary>
        /// Initializes a new instance of the <see cref="BaseUserControl"/> class.
        /// </summary>
        /// <param name="model">The model.</param>
        public BaseUserControl(BaseModel model)
        {
            _currentWindow = Window.GetWindow(this);
            _model = model;
            _worker = new BackgroundWorker();
            _worker.DoWork += Worker_DoWork;
            _worker.RunWorkerCompleted += Worker_RunWorkerCompleted;
            _worker.WorkerSupportsCancellation = true;
            _timer = new DispatcherTimer();
        }

        /// <summary>
        /// Handles the RunWorkerCompleted event of the worker control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="RunWorkerCompletedEventArgs"/> instance containing the event data.</param>
        private void Worker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            //enableComponent(false);
            MessageUtils.Show(messageType, message);
            message = String.Empty;
            _isWorkerRunning = false;
        }

        /// <summary>
        /// Handles the DoWork event of the worker control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="DoWorkEventArgs"/> instance containing the event data.</param>
        private void Worker_DoWork(object sender, DoWorkEventArgs e)
        {
            //Set locate
            //CultureInfo ci = CultureInfo.CreateSpecificCulture("en-US");
            //ci.DateTimeFormat.ShortDatePattern = "yyyy/MM/dd";
            //Thread.CurrentThread.CurrentCulture = ci;

            //Run action
            _action();
        }

        /// <summary>
        /// Runs the specified action.
        /// </summary>
        /// <param name="action">The action.</param>
        protected void Run(Action action)
        {
            //enableComponent(true);
            _action = action;
            _isWorkerRunning = true;
            _worker.RunWorkerAsync();
        }

        /// <summary>
        /// Stops this instance.
        /// </summary>
        protected void Stop()
        {
            if (_worker != null && _worker.IsBusy)
                _worker.CancelAsync();
        }

        /// <summary>
        /// Initializes the timer.
        /// </summary>
        /// <param name="action">The action.</param>
        /// <param name="interval">The interval.</param>
        protected void InitTimer(Action action, int interval)
        {
            _timerAction = action;
            _isTimerRunning = false; 
            _timer.Interval = TimeSpan.FromSeconds(interval);
            _timer.Tick += Timer_Tick;
        }

        /// <summary>
        /// Starts the timer.
        /// </summary>
        protected void StartTimer()
        {
            _timer.Start();
        }

        /// <summary>
        /// Handles the Tick event of the Timer control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        private void Timer_Tick(object sender, EventArgs e)
        {
            try
            {
                if (_isTimerRunning || _isWorkerRunning) return;
                _isTimerRunning = true;
                Run(_timerAction);
            }
            finally
            {
                _isTimerRunning = false;
            }
        }

        /// <summary>
        /// Closes the window.
        /// </summary>
        protected void CloseWindow()
        {
            _currentWindow = Window.GetWindow(this);
            _currentWindow.Close();
        }

        /// <summary>
        /// Enables the component.
        /// </summary>
        /// <param name="isRunning">if set to <c>true</c> [is running].</param>
        private void EnableComponent(bool isRunning)
        {
            if (isRunning)
            {
                enableNames = new List<string>();
            }

            _model.Visibility = isRunning ? "Visible" : "Hidden";

            _currentWindow = Window.GetWindow(this);
            _enableButton(isRunning);
            _enableTextBox(isRunning);
            _enableComboBox(isRunning);
            _enableCheckBox(isRunning);
            _enableRadioButton(isRunning);
            _enableMenuItem(isRunning);
            _enablePasswordBox(isRunning);
        }

        /// <summary>
        /// _enableButton
        /// </summary>
        /// <param name="isRunning"></param>
        private void _enableButton(bool isRunning)
        {
            foreach (Button comp in FindVisualChildren<Button>(_currentWindow))
            {
                comp.IsEnabled = _isEnable(comp.Name, isRunning, comp.IsEnabled);
            }
        }

        /// <summary>
        /// _enableTextBox
        /// </summary>
        /// <param name="isRunning"></param>
        private void _enableTextBox(bool isRunning)
        {
            foreach (TextBox comp in FindVisualChildren<TextBox>(_currentWindow))
            {
                comp.IsEnabled = _isEnable(comp.Name, isRunning, comp.IsEnabled);
            }
        }

        /// <summary>
        /// _enableComboBox
        /// </summary>
        /// <param name="isRunning"></param>
        private void _enableComboBox(bool isRunning)
        {
            foreach (ComboBox comp in FindVisualChildren<ComboBox>(_currentWindow))
            {
                comp.IsEnabled = _isEnable(comp.Name, isRunning, comp.IsEnabled);
            }
        }

        /// <summary>
        /// _enableCheckBox
        /// </summary>
        /// <param name="isRunning"></param>
        private void _enableCheckBox(bool isRunning)
        {
            foreach (CheckBox comp in FindVisualChildren<CheckBox>(_currentWindow))
            {
                comp.IsEnabled = _isEnable(comp.Name, isRunning, comp.IsEnabled);
            }
        }

        /// <summary>
        /// _enableRadioButton
        /// </summary>
        /// <param name="isRunning"></param>
        private void _enableRadioButton(bool isRunning)
        {
            foreach (RadioButton comp in FindVisualChildren<RadioButton>(_currentWindow))
            {
                comp.IsEnabled = _isEnable(comp.Name, isRunning, comp.IsEnabled);
            }
        }

        /// <summary>
        /// _enableMenuItem
        /// </summary>
        /// <param name="isRunning"></param>
        private void _enableMenuItem(bool isRunning)
        {
            foreach (MenuItem comp in FindVisualChildren<MenuItem>(_currentWindow))
            {
                comp.IsEnabled = _isEnable(comp.Name, isRunning, comp.IsEnabled);
            }
        }

        /// <summary>
        /// _enableMenuItem
        /// </summary>
        /// <param name="isRunning"></param>
        private void _enablePasswordBox(bool isRunning)
        {
            foreach (PasswordBox comp in FindVisualChildren<PasswordBox>(_currentWindow))
            {
                comp.IsEnabled = _isEnable(comp.Name, isRunning, comp.IsEnabled);
            }
        }

        /// <summary>
        /// _isEnable
        /// </summary>
        /// <param name="componentName"></param>
        /// <param name="isRunning"></param>
        /// <param name="isComponentEnable"></param>
        /// <returns></returns>
        private bool _isEnable(string componentName, bool isRunning, bool isComponentEnable)
        {
            if (isRunning)
            {
                if (_model.ComponentNameNotDisable != null && _model.ComponentNameNotDisable.Contains(componentName))
                    return true;
                if (isComponentEnable)
                    enableNames.Add(componentName);
                return false;
            }
            else
            {
                if (enableNames.Contains(componentName))
                    return true;
                return true;
            }
        }

        /// <summary>
        /// Get all component by component type
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="depObj"></param>
        /// <returns></returns>
        private static IEnumerable<T> FindVisualChildren<T>(DependencyObject depObj) where T : DependencyObject
        {
            if (depObj != null)
            {
                for (int i = 0; i < VisualTreeHelper.GetChildrenCount(depObj); i++)
                {
                    DependencyObject child = VisualTreeHelper.GetChild(depObj, i);
                    if (child != null && child is T)
                    {
                        yield return (T)child;
                    }

                    foreach (T childOfChild in FindVisualChildren<T>(child))
                    {
                        yield return childOfChild;
                    }
                }
            }
        }

        /// <summary>
        /// setFocusTextBox
        /// </summary>
        /// <param name="name"></param>
        protected void SetFocusTextBox(string name)
        {
            if (String.IsNullOrEmpty(name)) return;

            bool isFocus = false;

            _currentWindow = Window.GetWindow(this);
            foreach (TextBox comp in FindVisualChildren<TextBox>(_currentWindow))
            {
                if (comp.Name.Equals(name))
                {
                    comp.Focus();
                    comp.SelectAll();
                    isFocus = true;
                    break;
                }
            }

            if (isFocus) return;

            foreach (PasswordBox comp in FindVisualChildren<PasswordBox>(_currentWindow))
            {
                if (comp.Name.Equals(name))
                {
                    comp.Focus();
                    comp.SelectAll();
                    isFocus = true;
                    break;
                }
            }

            if (isFocus) return;

            //foreach (DatePicker comp in FindVisualChildren<DatePicker>(_currentWindow))
            //{
            //    if (comp.Name.Equals(name))
            //    {
            //        comp.Focus();
            //        isFocus = true;
            //        break;
            //    }
            //}
        }
    }
}
