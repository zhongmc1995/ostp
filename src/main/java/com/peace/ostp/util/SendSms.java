package com.peace.ostp.util;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

/**
 * @ClassName: SendSms
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author A18ccms a18ccms_gmail_com
 * @date 2016年1月20日 下午5:31:16
 * 
 */
public class SendSms {

	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

	/**
	 * @Title: send @Description: TODO(这里用一句话描述这个方法的作用) @param @param
	 * phonenum @param @param checkcode @param @return 设定文件 @return boolean
	 * 返回类型 @throws
	 */
	public static boolean send(String phonenum, String checkcode) {

		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod(Url);

		// client.getParams().setContentCharset("GBK");
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType", "application/x-www-form-urlencoded;charset=UTF-8");

		// System.out.println(mobile);

		// String content = new String("您的验证码是：" + checkcode +
		// "。请不要把验证码泄露给其他人。");
		String content = new String("道运通的验证码是：【" + checkcode + "】。请不要把验证码泄露给其他人。");
		NameValuePair[] data = { //
				new NameValuePair("account", "cf_cjtxzl"), new NameValuePair("password", "123456"), // 32λMD5����
				new NameValuePair("mobile", phonenum), new NameValuePair("content", content), };

		method.setRequestBody(data);

		try {
			client.executeMethod(method);

			String SubmitResult = method.getResponseBodyAsString();

			if (SubmitResult == null || "".equals(SubmitResult)) {
				return false;
			}

			//System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();

			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");

			// System.out.println(code);
			// System.out.println(msg);
			// System.out.println(smsid);

			if ("2".equals(code)) {
				// System.out.println("短信提交成功");
				return true;
			}

		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public static void main(String[] args) {

		int mobile_code = (int) ((Math.random() * 9 + 1) * 100000);

		// System.out.println(mobile);
		send("13693659465", String.valueOf(mobile_code));

	}

}