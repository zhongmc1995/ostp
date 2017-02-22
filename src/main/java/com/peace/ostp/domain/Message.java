package com.peace.ostp.domain;

import java.io.Serializable;

/**
 * @Project: Peace
 * @Title: Message
 * @Description: 消息对象类
 * @author: zw
 * @date :2016年3月26日 晚上22:26:49
 * @Copyright: Copyright (c) 2016
 * @version V1.0
 */
public class Message implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2991603577177353117L;
	private String phoneNum;
	private int generatedId;
	private String messageInfo;
	private String result = "success";
	private Object object;

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public int getGeneratedId() {
		return generatedId;
	}

	public void setGeneratedId(int generatedId) {
		this.generatedId = generatedId;
	}

	public String getMessageInfo() {
		return messageInfo;
	}

	public void setMessageInfo(String messageInfo) {
		this.messageInfo = messageInfo;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	@Override
	public String toString() {
		return "Message [phoneNum=" + phoneNum + ", generatedId=" + generatedId + ", messageInfo=" + messageInfo + ", result=" + result + ", object="
				+ object + "]";
	}

}
