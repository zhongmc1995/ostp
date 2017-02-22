package com.peace.ostp.test;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.xml.sax.InputSource;

public class XMLHandler {

	public XMLHandler() {
		// TODO Auto-generated constructor stub
	}

	public String createXML() {
		String strXML = null;
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("root");

		Element phone = root.addElement("TelePhone");

		Element nokia = phone.addElement("type");
		nokia.addAttribute("name", "nokia");
		Element price_nokia = nokia.addElement("price");
		price_nokia.addText("599");
		Element operator_nokia = nokia.addElement("operator");
		operator_nokia.addText("CMCC");

		Element xiaomi = phone.addElement("type");
		xiaomi.addAttribute("name", "xiaomi");
		Element price_xiaomi = xiaomi.addElement("price");
		price_xiaomi.addText("699");
		Element operator_xiaomi = xiaomi.addElement("operator");
		operator_xiaomi.addText("ChinaNet");

		// --------
		StringWriter strWtr = new StringWriter();
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setEncoding("UTF-8");
		XMLWriter xmlWriter = new XMLWriter(strWtr, format);
		try {
			xmlWriter.write(document);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		strXML = strWtr.toString();
		// --------

		// -------
		// strXML=document.asXML();
		// ------

		// -------------
		File file = new File("TelePhone.xml");
		if (file.exists()) {
			file.delete();
		}
		try {
			file.createNewFile();
			XMLWriter out = new XMLWriter(new FileWriter(file));
			out.write(document);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// --------------

		return strXML;
	}

	public void parserXML(String strXML) {
		SAXReader reader = new SAXReader();
		StringReader sr = new StringReader(strXML);
		InputSource is = new InputSource(sr);
		try {
			Document document = reader.read(is);

			Element root = document.getRootElement();

			// get element
			List<Element> phoneList = root.elements("TelePhone");
			List<Element> typeList = phoneList.get(0).elements("type");
			for (int i = 0; i < typeList.size(); i++) {
				Element element = typeList.get(i);
				String phoneName = element.attributeValue("name");
				System.out.println("phonename = " + phoneName);
				// get all element
				List<Element> childList = element.elements();
				for (int j = 0; j < childList.size(); j++) {
					Element e = childList.get(j);
					System.out.println(e.getName() + "=" + e.getText());
				}
			}
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		XMLHandler handler = new XMLHandler();
		String strXML = handler.createXML();
		// System.out.println(strXML);
		// handler.parserXML(strXML);
		StringBuffer stringBuffer = new StringBuffer();
		// stringBuffer.append(
		// "<list><set><com.extr.controller.domain.QuestionQueryResult><questionId>169</questionId><content><QuestionContent>
		// <title>职业具有一定的（ ）。</title> <titleImg></titleImg> <choiceList> <entry>
		// <string>A</string> <string>社会责任性</string> </entry> <entry>
		// <string>B</string> <string>社会公益性</string> </entry> <entry>
		// <string>C</string> <string>社会实践性</string> </entry> </choiceList>
		// </QuestionContent></content><answer>A</answer><analysis></analysis><questionTypeId>1</questionTypeId><referenceName>单选</referenceName><pointName>模块A：职业道德和法律法规
		// > 机动车维修技术人员职业道德 >
		// 知识关键点：</pointName><fieldName>模块A：职业道德和法律法规</fieldName><questionPoint>1.0</questionPoint><examingPoint>职业道德和法律法规</examingPoint><knowledgePointId>8</knowledgePointId></com.extr.controller.domain.QuestionQueryResult></set></list>");
//		stringBuffer.append(
//				"<list><com.extr.controller.domain.QuestionQueryResult><questionId>169</questionId><content><QuestionContent> <title>职业具有一定的（ ）。</title> <titleImg></titleImg> <choiceList> <entry> <string>A</string> <string>社会责任性</string> </entry> <entry> <string>B</string> <string>社会公益性</string> </entry> <entry> <string>C</string> <string>社会实践性</string> </entry> </choiceList> </QuestionContent></content><answer>A</answer><analysis></analysis><questionTypeId>1</questionTypeId><referenceName>单选</referenceName><pointName>模块A：职业道德和法律法规 > 机动车维修技术人员职业道德 > 知识关键点：</pointName><fieldName>模块A：职业道德和法律法规</fieldName><questionPoint>1.0</questionPoint><examingPoint>职业道德和法律法规</examingPoint><knowledgePointId>8</knowledgePointId></com.extr.controller.domain.QuestionQueryResult></list>");
        stringBuffer.append("<list>"
  +"<com.extr.controller.domain.QuestionQueryResult><questionId>169</questionId><content><QuestionContent> <title>职业具有一定的（ ）。</title> <titleImg></titleImg> <choiceList> <entry> <string>A</string> <string>社会责任性</string> </entry> <entry> <string>B</string> <string>社会公益性</string> </entry> <entry> <string>C</string> <string>社会实践性</string> </entry> </choiceList> </QuestionContent></content><answer>A</answer><analysis></analysis><questionTypeId>1</questionTypeId><referenceName>单选</referenceName><pointName>模块A：职业道德和法律法规 > 机动车维修技术人员职业道德 > 知识关键点：</pointName><fieldName>模块A：职业道德和法律法规</fieldName><questionPoint>1.0</questionPoint><examingPoint>职业道德和法律法规</examingPoint><knowledgePointId>8</knowledgePointId></com.extr.controller.domain.QuestionQueryResult><com.extr.controller.domain.QuestionQueryResult>"
  +"<questionId>195</questionId>"
  +"<content>&lt;QuestionContent&gt;"
  +"&lt;title&gt;牢固树立“质量第一，客户至上”的观念，从业人员持证上岗，亮牌服务，举止文明，是《全国汽车维修行业行为规范公约》中所提出的“（     ）”要求的一种体现。&lt;/title&gt;"
  +"&lt;titleImg&gt;&lt;/titleImg&gt;"
  +"&lt;choiceList&gt;"
  +"&lt;entry&gt;"
  +"&lt;string&gt;A&lt;/string&gt;"
  +"&lt;string&gt;守法经营，接受监督&lt;/string&gt;"
  +"&lt;/entry&gt;"
  +"&lt;entry&gt;"
  +"&lt;string&gt;B&lt;/string&gt;"
  +"&lt;string&gt;尊重客户，热忱服务&lt;/string&gt;"
  +"&lt;/entry&gt;"
  +"&lt;entry&gt;"
  +"&lt;string&gt;C&lt;/string&gt;"
  +"&lt;string&gt;弘扬职业道德，建设精神文明&lt;/string&gt;"
  +"&lt;/entry&gt;"
  +"&lt;/choiceList&gt;"
  +"&lt;/QuestionContent&gt;</content>"
  +"<answer>B</answer>"
  +"<analysis></analysis>"
  +"<questionTypeId>1</questionTypeId>"
  +"<referenceName></referenceName>"
  +"<pointName>职业道德和法律法规 &gt; 机动车维修技术人员职业道德 &gt;" 
  +"知识关键点：</pointName>"
  +"<fieldName>职业道德和法律法规</fieldName>"
  +"<questionPoint>1.0</questionPoint>"
  +"<examingPoint></examingPoint>"
  +"<knowledgePointId>8</knowledgePointId>"
  +"</com.extr.controller.domain.QuestionQueryResult></list>");
		handler.parserXML1(stringBuffer.toString().replace("&lt;", "<").replace("&gt;", ">"));
		System.out.println("-----------");
		// handler.parserXMLbyXPath(strXML);
	}

	public void parserXML1(String strXML) {
		SAXReader reader = new SAXReader();
		StringReader sr = new StringReader(strXML);
		InputSource is = new InputSource(sr);
		try {
			Document document = reader.read(is);

			Element root = document.getRootElement();

			// get element
			// List<Element> phoneList = root.elements("set");
			// List<Element> typeList =
			// phoneList.get(0).elements("com.extr.controller.domain.QuestionQueryResult");
			List<Element> typeList = root.elements("com.extr.controller.domain.QuestionQueryResult");
			for (int i = 0; i < typeList.size(); i++) {
				Element element = typeList.get(i);
				List<Element> childList = element.elements();
				for (int j = 0; j < childList.size(); j++) {
					Element e = childList.get(j);
					if (!e.getName().equals("content")) {
						System.out.println(e.getName() + "=" + e.getText());
					} else {
						Element contentList = e.element("QuestionContent");
						Element title = contentList.element("title");
						System.out.println(title.getName() + "=" + title.getText());
						Element titleImg = contentList.element("titleImg");
						System.out.println(titleImg.getName() + "=" + titleImg.getText());
						List<Element> choiceList = contentList.elements("choiceList");
						List<Element> entryList = choiceList.get(0).elements("entry");
						for (int k = 0; k < entryList.size(); k++) {
							List<Element> e1 = entryList.get(k).elements("string");
							for (int m = 0; m < e1.size(); m++) {
								Element e2 = e1.get(m);
								System.out.println(e2.getName() + "=" + e2.getText());
							}
						}
					}
				}
			}
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
