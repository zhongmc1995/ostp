package com.peace.ostp.util;

import org.apache.log4j.Logger;
import java.io.File;
import java.io.FileReader;
import java.net.URL;
import java.util.List;

import org.sax.commons.xml.XmlElement;
import org.sax.commons.xml.XmlException;
import org.sax.commons.xml.XmlParser;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

public class Object2Xml {
	public static void main(String[] args) {
		new Object2Xml().initParameterConfigs();
	}

	public static String toXml(Object obj) {
		XStream xstream = new XStream();
		xstream.processAnnotations(obj.getClass());

		return xstream.toXML(obj);
	}

	public static <T> T toBean(String xmlStr, Class<T> cls) {
		XStream xstream = new XStream(new DomDriver());
		xstream.processAnnotations(cls);
		@SuppressWarnings("unchecked")
		T obj = (T) xstream.fromXML(xmlStr);
		return obj;
	}

	/**
	 * @Description:初始化参数配置文件同步本地缓存的方法
	 * @param :args
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void initParameterConfigs() {
		XmlParser xmlConfig = null;
		XmlElement rootElement = null;
		try {
			String configFile = "config/hbase-config.xml";
			log.info("开始加载配置文件:" + configFile);
			System.out.println("开始加载配置文件:" + configFile);
			URL dbURL = Object2Xml.class.getClassLoader().getResource(configFile);
			xmlConfig = new XmlParser(new FileReader(new File(dbURL.toURI())));
			log.info("加载配置文件:" + configFile + "完成！");
			System.out.println("加载配置文件:" + configFile + "完成！");
		} catch (Exception e) {
			log.error("FileNotFoundException ... ... ", e);
			e.printStackTrace();
		}

		try {
			rootElement = xmlConfig.parse();
		} catch (XmlException e) {
			e.printStackTrace();
		}

		// 配置文件描述
		String describeConfig = rootElement.getAttribute("describeConfig");
		log.info(this.getClass().getName() + " describeConfig : " + describeConfig + "开始 ... ...");
		List<XmlElement> parameters = rootElement.getChildElements("parameter");

		for (int i = 0; i < parameters.size(); i++) {
			XmlElement xmlElementTem = (XmlElement) parameters.get(i);
			String key = xmlElementTem.getAttribute("key");
			String value = xmlElementTem.getAttribute("value");
			System.out.println(key + "       " + value);
			log.info(this.getClass().getName() + ", key := " + key + ", value := " + value);
		}

		log.info(this.getClass().getName() + " describeConfig : " + describeConfig + "结束 ... ...");
	}

	private static Logger log = Logger.getLogger(Object2Xml.class);
}
