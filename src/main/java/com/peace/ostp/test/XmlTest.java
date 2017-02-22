package com.peace.ostp.test;

import java.util.Map;
import com.alibaba.fastjson.JSON; 


public class XmlTest {
	public static void main(String[] args) {
		String msg = "{'answer':'B','id':195,'point':1,'type':1}";
		System.out.println(getJsonMapInfo(msg).get("id"));
		System.out.println(getJsonMapInfo(msg));
	}
	
	public static Map<String, Object> getJsonMapInfo(String jsonMapString) {
		Map<String, Object> applicationMap = null;
		try {
			applicationMap = JSON.parseObject(jsonMapString, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return applicationMap;
	}

}
