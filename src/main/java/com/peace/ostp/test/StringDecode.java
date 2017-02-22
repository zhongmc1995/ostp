package com.peace.ostp.test;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class StringDecode {

	public static void main(String[] args) {
		String s = "鄂A10001";  
        try {  
            //css or js post/get data submmit  
            s = URLEncoder.encode(s, "UTF-8");  
            System.out.println("encode :"+s);  
            //backstage java/jsp dispose  
            s = URLDecoder.decode(s, "UTF-8");  
            System.out.println("decode :"+s);  
            s = new String(s.getBytes(),"GBK");  
            System.out.println("GBK :" +s);  
            //combine encoding change  
        //  s = new String(URLDecoder.decode(s, "UTF-8").getBytes(),"GBK");  
        } catch (UnsupportedEncodingException e) {  
            System.out.println("encoding cause,change failure");  
        }catch (Exception e) {  
            System.out.println("others cause,change failure");  
        }  

	}

}
