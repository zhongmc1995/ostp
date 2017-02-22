package com.peace.ostp.test;

import java.io.IOException;
import java.io.StringReader;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class XmlUtil {

	public static void main(String[] args) {
		String strXML = "<QuestionContent><title>职业是社会成员对社会所承担的职责和工作。（     ）</title><titleImg></titleImg></QuestionContent>";
		parserXML(strXML);
	}

	public static void parserXML(String strXML) {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder builder = factory.newDocumentBuilder();
			StringReader sr = new StringReader(strXML);
			InputSource is = new InputSource(sr);
			Document doc = builder.parse(is);
			Element rootElement = doc.getDocumentElement();
			NodeList phones = rootElement.getElementsByTagName("QuestionContent");
			for (int i = 0; i < phones.getLength(); i++) {
				Node type = phones.item(i);
				String phoneName = ((Element) type).getAttribute("title");
				System.out.println("Phone name = " + phoneName);
				NodeList properties = type.getChildNodes();
				for (int j = 0; j < properties.getLength(); j++) {
					Node property = properties.item(j);
					String nodeName = property.getNodeName();
					if (nodeName.equals("price")) {
						String price = property.getFirstChild().getNodeValue();
						System.out.println("price=" + price);
					} else if (nodeName.equals("operator")) {
						String operator = property.getFirstChild().getNodeValue();
						System.out.println("operator=" + operator);
					}
				}
			}
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
