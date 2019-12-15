package com.infini.ccahe.utils;

import java.io.StringReader;
import java.io.StringWriter;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class XMLUtils {
	private static final String DEFAULT_INDENT = "2";
	
	public String xmlPrettyFormat(String input) {
		String indent = DEFAULT_INDENT;
		Source xmlInput = new StreamSource(new StringReader(input));
		StringWriter stringWriter = new StringWriter();
		try {
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.setOutputProperty(OutputKeys.DOCTYPE_PUBLIC, "yes");
			transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", indent);
			transformer.transform(xmlInput, new StreamResult(stringWriter));

			return stringWriter.toString().trim();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public String xmlPrettyFormat(String input, String indent) {
		Source xmlInput = new StreamSource(new StringReader(input));
		StringWriter stringWriter = new StringWriter();
		try {
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.setOutputProperty(OutputKeys.DOCTYPE_PUBLIC, "yes");
			transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", indent);
			transformer.transform(xmlInput, new StreamResult(stringWriter));

			return stringWriter.toString().trim();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
