using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.IO;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Xml.Serialization;

namespace Infini.AutomaticDivideTool.Utilities
{
    public class XmlUtils
    {
        private static Logger _logger = Logger.GetLogger();

        /// <summary>
        /// 
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="pathNode"></param>
        /// <returns></returns>
        public static string GetNodeValue(string fileName, string pathNode)
        {
            if (File.Exists(fileName))
            {
                XmlDocument xdoc = new XmlDocument();
                xdoc.Load(fileName);
                try
                {
                    return xdoc.SelectSingleNode(pathNode).InnerText.Trim();
                }
                catch (Exception ex)
                {
                    _logger.Error(ex);
                    return null;
                }
            }
            return null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="pathNode"></param>
        /// <param name="value"></param>
        public static void SetNodeValue(string fileName, string pathNode, string value)
        {
            try
            {
                if (File.Exists(fileName))
                {
                    XmlDocument xdoc = new XmlDocument();
                    xdoc.Load(fileName);
                    if (xdoc.SelectSingleNode(pathNode) != null)
                    {
                        xdoc.SelectSingleNode(pathNode).InnerText = value;
                        xdoc.Save(fileName);
                    }
                }
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
            }
        }

        public static void CreateFile(string fileName, List<Dictionary<string, string>> listData, string rootName)
        {
            XmlTextWriter writer = new XmlTextWriter(fileName, System.Text.Encoding.UTF8);
            writer.WriteStartDocument(true);
            writer.Formatting = Formatting.Indented;
            writer.Indentation = 2;
            writer.WriteStartElement(rootName);
            foreach (Dictionary<string, string> dictionary in listData)
            {
                CreateNode(dictionary, writer);
            }
            writer.WriteEndElement();
            writer.WriteEndDocument();
            writer.Close();
        }

        private static void CreateNode(Dictionary<string, string> dictionary, XmlTextWriter writer)
        {
            if (dictionary == null || dictionary.Count == 0)
            {
                return;
            }
            bool isRoot = false;

            foreach (KeyValuePair<string, string> entry in dictionary)
            {
                if (entry.Value == null)
                {
                    isRoot = true;
                    writer.WriteStartElement(entry.Key);
                }
                else
                {
                    writer.WriteStartElement(entry.Key);
                    writer.WriteString(entry.Value);
                    writer.WriteEndElement();
                }
            }

            if (isRoot) writer.WriteEndElement();
        }

        public static bool IsExistFile(string fileName)
        {
            return File.Exists(fileName);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="fileName"></param>
        /// <param name="item"></param>
        /// <param name="pathParentNode"></param>
        /// <returns></returns>
        public static bool InsertData<T>(string fileName, T item, string pathParentNode)
        {
            try
            {   
                
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(fileName);

                // Create node new
                string nodeName = typeof(T).Name.Replace("Entity","");
                XmlNode nodeParrent = xmlDoc.CreateNode("element", nodeName, "");
                XmlNodeList nodesCheck = xmlDoc.GetElementsByTagName(nodeName);
                if (nodesCheck != null && nodesCheck.Count > 0)
                {
                    XmlNode nodeRemove = nodesCheck[0];
                    if (nodeRemove != null)
                    {
                        nodeRemove.ParentNode.RemoveChild(nodeRemove);
                    }
                }

                //Get all the properties
                PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
                for (int i = 0; i < Props.Length; i++)
                {
                    string nodeItemName = Props[i].Name;
                    string value = "";
                    if (Props[i].GetValue(item, null) != null)
                    {
                        value = Props[i].GetValue(item, null).ToString();
                    }
                    else
                    {
                        value = "";
                    }

                    XmlNode nodeItem = xmlDoc.CreateNode("element", nodeItemName, "");
                    nodeItem.InnerText = value;
                    nodeParrent.AppendChild(nodeItem);
                }

                XmlNode nodeRoot = xmlDoc.SelectSingleNode(pathParentNode);
                if (nodeRoot == null)
                {
                    CreateNodeFromPath(pathParentNode, xmlDoc);
                    nodeRoot = xmlDoc.SelectSingleNode(pathParentNode);
                }

                nodeRoot.AppendChild(nodeParrent);
                xmlDoc.Save(fileName);
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// insertData from class
        /// </summary>
        /// <typeparam name="fileName">string</typeparam>
        /// <typeparam name="T">Class</typeparam>
        /// <param name="items">List</param>
        /// <param name="pathParentNode">string</param>
        /// <param name="id">string</param>
        /// <returns>True: is success<br/>False: faild</returns>
        public static bool InsertListData<T>(string fileName, List<T> items, string pathParentNode, string id = null)
        {
            try
            {
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(fileName);

                // Create node new
                string nodeName = typeof(T).Name.Replace("Entity", "");
                XmlNode nodeParrent = xmlDoc.CreateNode("element", nodeName, "");
                if (!String.IsNullOrEmpty(id))
                {
                    XmlAttribute newAttribute = xmlDoc.CreateAttribute("id");
                    newAttribute.Value = id;
                    nodeParrent.Attributes.Append(newAttribute);

                    // Remove node exist
                    XmlNodeList nodesCheck = xmlDoc.GetElementsByTagName(nodeName);
                    XmlNode nodeRemove = GetNodeByTagNameAndId(nodesCheck, id);
                    if (nodeRemove != null)
                    {
                        nodeRemove.ParentNode.RemoveChild(nodeRemove);
                    }
                }
                else
                {
                    XmlNode nodeR = xmlDoc.SelectSingleNode(pathParentNode.TrimEnd('/') + "/" + nodeName);
                    if (nodeR != null)
                    {
                        nodeR.ParentNode.RemoveChild(nodeR);
                    }
                }

                //Get all the properties
                PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);

                foreach (T item in items)
                {
                    XmlNode nodeRecord = xmlDoc.CreateNode("element", Constant.XML_NODE_RECORD, "");
                    for (int i = 0; i < Props.Length; i++)
                    {
                        string nodeItemName = Props[i].Name;
                        string value = Props[i].GetValue(item, null).ToString();
                        XmlNode nodeItem = xmlDoc.CreateNode("element", nodeItemName, "");
                        nodeItem.InnerText = value;
                        nodeRecord.AppendChild(nodeItem);
                    }
                    nodeParrent.AppendChild(nodeRecord);
                }
                XmlNode nodeRoot = xmlDoc.SelectSingleNode(pathParentNode);
                if (nodeRoot == null)
                {
                    CreateNodeFromPath(pathParentNode, xmlDoc);
                    nodeRoot = xmlDoc.SelectSingleNode(pathParentNode);
                }

                nodeRoot.AppendChild(nodeParrent);
                xmlDoc.Save(fileName);
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Select data from Class
        /// </summary>
        /// <typeparam name="T">T</typeparam>
        /// <param name="fileName">string</param>
        /// <param name="Class">T</param>
        /// <returns>List Class</returns>
        public static T GetData<T>(string fileName)
        {
            T item = (T)Activator.CreateInstance(typeof(T));
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(fileName);

            // Select all node by tag name
            string nodeName = typeof(T).Name.Replace("Entity", "");
            XmlNodeList nodes = xmlDoc.GetElementsByTagName(nodeName);

            if (nodes != null && nodes.Count > 0)
            {
                XmlNode node = nodes[0];
                XmlNodeList nodeChilds = node.ChildNodes;
                PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
                foreach (XmlNode child in nodeChilds)
                {
                    foreach (PropertyInfo prop in Props)
                    {
                        string value = null;
                        if (child.Name.Equals(prop.Name))
                        {
                            if (prop.PropertyType.Name == "Boolean")
                            {
                                value = child.InnerText == "" ? "False" : child.InnerText;
                            }
                            else
                            {
                                value = child.InnerText;
                            }
                            prop.SetValue(item, Convert.ChangeType(value, prop.PropertyType), null);
                        }
                    }
                }
            }
            return item;
        }

        /// <summary>
        /// Select data from Class
        /// </summary>
        /// <typeparam name="T">T</typeparam>
        /// <param name="fileName">string</param>
        /// <param name="Class">T</param>
        /// <returns>List Class</returns>
        public static List<T> SelectListData<T>(string fileName, T Class, string id = null)
        {
            List<T> list = new List<T>();
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(fileName);

            // Select all node by tag name
            string nodeName = typeof(T).Name.Replace("Entity", "");
            XmlNodeList nodes = xmlDoc.GetElementsByTagName(nodeName);
            XmlNode nodeParent = GetNodeByTagNameAndId(nodes, id);
            if (!String.IsNullOrEmpty(id) && nodeParent == null)
            {
                return list;
            }

            if (nodes != null && nodes.Count > 0)
            {
                XmlNode node = (nodeParent == null) ? nodes[0] : nodeParent;
                XmlNodeList nodeChilds = node.ChildNodes;
                PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
                foreach (XmlNode child in nodeChilds)
                {

                    T item = (T)Activator.CreateInstance(Class.GetType());
                    foreach (PropertyInfo prop in Props)
                    {
                        string nodeItemName = prop.Name;
                        string value = null;
                        if (child[nodeItemName] != null)
                        {
                            value = child[nodeItemName].InnerText;
                        }

                        prop.SetValue(item, Convert.ChangeType(value, prop.PropertyType), null);
                    }
                    list.Add(item);
                }
            }
            return list;
        }

        /// <summary>
        /// Get node by id value
        /// </summary>
        /// <param name="nodes"></param>
        /// <param name="id"></param>
        /// <returns>XmlNode</returns>
        private static XmlNode GetNodeByTagNameAndId(XmlNodeList nodes, string id)
        {
            if (nodes != null && !String.IsNullOrEmpty(id))
            {
                foreach (XmlNode node in nodes)
                {

                    if (node.Attributes["id"] != null && id.Equals(node.Attributes["id"].Value))
                    {
                        return node;
                    }
                }
            }
            return null;
        }

        /// <summary>
        /// createNodeFromPath
        /// </summary>
        /// <param name="path">string</param>
        /// <param name="xmlDoc">XmlDocument</param>
        public static void CreateNodeFromPath(string path, XmlDocument xmlDoc)
        {
            string[] listNode = path.Split('/');
            StringBuilder sb = new StringBuilder();
            XmlNode nodeExist = null;
            int indexNotExist = -1;
            for (int i = 0; i < listNode.Length; i++)
            {
                if (StringUtils.IsNullOrEmpty(sb.ToString()))
                {
                    sb = sb.Append(listNode[i]);
                }
                else
                {
                    sb = sb.Append("/" + listNode[i]);
                }
                XmlNode node = xmlDoc.SelectSingleNode(sb.ToString());
                if (node != null)
                {
                    nodeExist = node;
                }
                else
                {
                    indexNotExist = i;
                    break;
                }
            }
            if (indexNotExist == -1)
            {
                return;
            }
            XmlNode nodeChild = null;
            for (int i = listNode.Length - 1; i >= indexNotExist; i--)
            {
                if (nodeChild == null)
                {
                    string patternAttribute = @"(?<=\[).+?(?=])";

                    MatchCollection matchList = Regex.Matches(listNode[i], patternAttribute);
                    if (matchList.Count == 1)
                    {
                        string patternNodeName = @".+?(?=\[)";
                        MatchCollection matchListNodeName = Regex.Matches(listNode[i], patternNodeName);
                        string nodeName = matchListNodeName[0].Value;
                        string value = matchList[0].Value.Replace("'", "");
                        string[] nodeInfo = value.Split('=');
                        XmlAttribute newAttribute = xmlDoc.CreateAttribute(nodeInfo[0].Replace("@", ""));
                        newAttribute.Value = nodeInfo[1];
                        nodeChild = xmlDoc.CreateNode("element", nodeName, "");
                        nodeChild.Attributes.Append(newAttribute);
                    }
                    else
                    {
                        nodeChild = xmlDoc.CreateNode("element", listNode[i], "");
                    }
                }
                else
                {
                    XmlNode nodeParrent = null;
                    string patternAttribute = @"(?<=\[).+?(?=])";

                    MatchCollection matchList = Regex.Matches(listNode[i], patternAttribute);
                    if (matchList.Count == 1)
                    {
                        string patternNodeName = @".+?(?=\[)";
                        MatchCollection matchListNodeName = Regex.Matches(listNode[i], patternNodeName);
                        string nodeName = matchListNodeName[0].Value;
                        string value = matchList[0].Value.Replace("'", "");
                        string[] nodeInfo = value.Split('=');

                        XmlAttribute newAttribute = xmlDoc.CreateAttribute(nodeInfo[0].Replace("@", ""));
                        newAttribute.Value = nodeInfo[1];
                        nodeParrent = xmlDoc.CreateNode("element", nodeName, "");
                        nodeParrent.Attributes.Append(newAttribute);
                    }
                    else
                    {
                        nodeParrent = xmlDoc.CreateNode("element", listNode[i], "");
                    }
                    nodeParrent.AppendChild(nodeChild);
                    nodeChild = nodeParrent;
                }
            }
            nodeExist.AppendChild(nodeChild);
        }

        /// <summary>
        /// Serialize object to string 
        /// </summary>
        /// <typeparam name="T">Object Type</typeparam>
        /// <param name="obj">object</param>
        /// <returns></returns>
        public static string ObjectToString<T>(T obj)
        {
            var serializer = new XmlSerializer(typeof(T));
            using (StringWriter sw = new StringWriter())
            {
                serializer.Serialize(sw, obj);
                return sw.ToString();
            }
        }

        /// <summary>
        /// Serialize object to file
        /// </summary>
        /// <typeparam name="T">Object Type</typeparam>
        /// <param name="obj">Object</param>
        /// <param name="path">File Path</param>
        public static void ObjectToFile<T>(T obj, string path)
        {
            var serializer = new XmlSerializer(typeof(T));
            using (FileStream fs = new FileStream(path, FileMode.Create))
            {
                serializer.Serialize(fs, obj);
            }
        }

        /// <summary>
        /// Deserialize object from string
        /// </summary>
        /// <typeparam name="T">Object Type</typeparam>
        /// <param name="xml">xml string</param>
        /// <returns></returns>
        public static T StringToObject<T>(string xml)
        {
            var serializer = new XmlSerializer(typeof(T));
            return (T)serializer.Deserialize(new StringReader(xml));
        }

        /// <summary>
        /// Deserialize object from file
        /// </summary>
        /// <typeparam name="T">Object Tyoe</typeparam>
        /// <param name="path">File Path</param>
        /// <returns></returns>
        public static T FileToObject<T>(string path)
        {
            var serializer = new XmlSerializer(typeof(T));
            using (Stream reader = new FileStream(path, FileMode.Open))
            {
                return (T)serializer.Deserialize(reader);
            };
        }
    }
}
