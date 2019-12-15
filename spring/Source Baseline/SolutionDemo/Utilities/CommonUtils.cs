using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Reflection;
using System.Xml;


namespace Infini.AutomaticDivideTool.Utilities
{
    public class CommonUtils
    {
        private static Logger _logger = Logger.GetLogger();

        /// <summary>
        /// set data to datatable
        /// </summary>
        /// <typeparam name="T">T</typeparam>
        /// <param name="items">items</param>
        /// <returns>datatable</returns>
        public static DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);
            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            
            return dataTable;
        }

        public static string fileConfigName { get; set; }

        public static int top { get; set; }

        public static int left { get; set; }

        /// <summary>
        /// get location
        /// </summary>
        /// <param name="locationName">name location</param>
        public static void GetLocation(string locationName)
        {
            try
            {
                if (!File.Exists(fileConfigName))
                {
                    InitialConfigFile();
                }
                string topValue = XmlUtils.GetNodeValue(fileConfigName, Utilities.Constant.XML_NODE_CONFIGURATION + "/" + locationName + "/" + Utilities.Constant.XML_NODE_LOCATION_TOP);
                string leftValue = XmlUtils.GetNodeValue(fileConfigName, Utilities.Constant.XML_NODE_CONFIGURATION + "/" + locationName + "/" + Utilities.Constant.XML_NODE_LOCATION_LEFT);
                if (!string.IsNullOrEmpty(topValue) && !string.IsNullOrEmpty(leftValue))
                {
                    top = Convert.ToInt32(topValue);
                    left = Convert.ToInt32(leftValue);
					if (top < 0) top = 0;
					if (left < 0) left = 0;
                }
                else
                {
                    top = 0;
                    left = 0;
                }
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
            }
        }

        /// <summary>
        /// set location
        /// </summary>
        /// <param name="locationName">name location</param>
        public static void SetLocation(string locationName)
        {
            if (!File.Exists(fileConfigName))
            {
                InitialConfigFile();
            }

            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(fileConfigName);
            if (xdoc.SelectSingleNode(Utilities.Constant.XML_NODE_CONFIGURATION + "/" + locationName) == null)
            {
                XmlElement locationNode = xdoc.CreateElement(locationName);
                XmlElement topNode = xdoc.CreateElement(Utilities.Constant.XML_NODE_LOCATION_TOP);
                XmlElement leftNode = xdoc.CreateElement(Utilities.Constant.XML_NODE_LOCATION_LEFT);
                xdoc.DocumentElement.AppendChild(locationNode);
                xdoc.DocumentElement.SelectSingleNode(locationName).AppendChild(topNode);
                xdoc.DocumentElement.SelectSingleNode(locationName).AppendChild(leftNode);
                xdoc.Save(fileConfigName);
            }

            XmlUtils.SetNodeValue(fileConfigName, Utilities.Constant.XML_NODE_CONFIGURATION + "/" + locationName + "/" + Utilities.Constant.XML_NODE_LOCATION_TOP, top.ToString());
            XmlUtils.SetNodeValue(fileConfigName, Utilities.Constant.XML_NODE_CONFIGURATION + "/" + locationName + "/" + Utilities.Constant.XML_NODE_LOCATION_LEFT, left.ToString());
        }

        /// <summary>
        /// ini file config
        /// </summary>
        private static void InitialConfigFile()
        {
            try
            {
                FileStream fs = File.Create(fileConfigName);
                fs.Close();
                using (XmlWriter xmlWrite = XmlWriter.Create(fileConfigName))
                {
                    xmlWrite.WriteStartDocument();
                    xmlWrite.WriteStartElement(Utilities.Constant.XML_NODE_CONFIGURATION);
                    xmlWrite.WriteEndElement();
                    xmlWrite.WriteEndDocument();
                    xmlWrite.Flush();
                }
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
            }
        }

        /// <summary>
        /// convertObject
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="objectNew"></param>
        /// <param name="objectSource"></param>
        /// <returns></returns>
        public static T MappingData<T>(object objectSource)
        {
            PropertyInfo[] PropsObjectNew = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            PropertyInfo[] PropsObjectOld = objectSource.GetType().GetProperties(BindingFlags.Public | BindingFlags.Instance);
            T item = (T)Activator.CreateInstance(typeof(T));
            foreach (PropertyInfo prop in PropsObjectNew)
            {
                string propName = prop.Name;
                PropertyInfo propMatching = null;
                foreach (PropertyInfo propOld in PropsObjectOld)
                {
                    if (propOld.Name.Equals(prop.Name))
                    {
                        propMatching = propOld;
                        break;
                    }
                }
                object value = "";
                if (propMatching != null)
                {
                    if (prop.PropertyType.Name == "Boolean")
                    {
                        value = propMatching.GetValue(objectSource, null) == null ? "False" : propMatching.GetValue(objectSource, null);
                    }
                    else
                    {
                        value = propMatching.GetValue(objectSource, null);
                    }
                    prop.SetValue(item, Convert.ChangeType(value, prop.PropertyType), null);
                }
            }
            return item;
        }

        /// <summary>
        /// convertObject
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="objectNew"></param>
        /// <param name="objectOld"></param>
        /// <returns></returns>
        public static T ConvertObject<T>(T objectNew, Object objectOld)
        {
            PropertyInfo[] PropsObjectNew = objectNew.GetType().GetProperties(BindingFlags.Public | BindingFlags.Instance);
            PropertyInfo[] PropsObjectOld = objectOld.GetType().GetProperties(BindingFlags.Public | BindingFlags.Instance);
            T item = (T)Activator.CreateInstance(objectNew.GetType());
            foreach (PropertyInfo prop in PropsObjectNew)
            {
                string propName = prop.Name;
                PropertyInfo propMatching = null;
                foreach (PropertyInfo propOld in PropsObjectOld)
                {
                    if (propOld.Name.Equals(prop.Name))
                    {
                        propMatching = propOld;
                        break;
                    }
                }
                if (propMatching != null)
                {
                    object value = propMatching.GetValue(objectOld, null);
                    prop.SetValue(item, Convert.ChangeType(value, prop.PropertyType), null);
                }
            }
            return item;
        }
    }
}
