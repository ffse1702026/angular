using Infini.AutomaticDivideTool.Utilities;
using System.Collections.Generic;
using System.ComponentModel;

namespace Infini.AutomaticDivideTool.Models
{
    /// <summary>
    /// Class BaseModel
    /// </summary>
    public class BaseModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        /// <summary>
        /// Change value of attribute
        /// </summary>
        /// <param name="propertyName">propertyName</param>
        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(propertyName));
            }
        }

        private int a;

        /// <summary>
        /// change status visible
        /// </summary>
        private string _visibility;
        public string Visibility
        {
            get
            {
                if (StringUtils.IsNullOrEmpty(_visibility))
                {
                    _visibility = "Hidden";
                }
                return _visibility;
            }
            set
            {
                if (_visibility == value) return;
                _visibility = value;
                OnPropertyChanged("Visibility");
            }
        }

        /// <summary>
        /// Title
        /// </summary>
        private string _title;
        public string Title
        {
            get
            {
                return _title;
            }
            set
            {
                if (_title == value) return;
                _title = value;
                OnPropertyChanged("Title");
            }
        }

        /// <summary>
        /// The message loading
        /// </summary>
        private string _messageLoading;
        public string MessageLoading
        {
            get
            {
                if (StringUtils.IsNullOrEmpty(_messageLoading))
                {
                    _messageLoading = "少々お待ちください。";
                }
                return _messageLoading;
            }
            set
            {
                if (_messageLoading == value) return;
                _messageLoading = value;
                OnPropertyChanged("MessageLoading");
            }
        }

        /// <summary>
        /// The process percent
        /// </summary>
        private int _processPercent;
        public int ProcessPercent
        {
            get{ return _processPercent;}
            set
            {
                if (value == _processPercent) return;
                _processPercent = value;
                OnPropertyChanged("ProcessPercent");
            }
        }


        public List<string> ComponentNameNotDisable { get; set; }
       
    }
}
