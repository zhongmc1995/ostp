package com.peace.ostp.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**

 * @author 
 *
 */
public class StringUtil {

	/**

	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str){
		if(str==null||"".equals(str.trim())){
			return true;
		}else{
			return false;
		}
	}
	
	/**

	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str){
		if((str!=null)&&!"".equals(str.trim())){
			return true;
		}else{
			return false;
		}
	}
	
	/**

	 * @param str
	 * @return
	 */
	public static String formatLike(String str){
		if(isNotEmpty(str)){
			return "%"+str+"%";
		}else{
			return null;
		}
	}
	
	
	public static String replace(String content, String compileValue, String replacement){
		System.out.println(content+"  "+compileValue+"  "+replacement);
		compileValue = "\\\\";
        Pattern pattern =  Pattern.compile(compileValue);
        Matcher matcher = pattern.matcher(content);
        return matcher.replaceAll(replacement);
    }
	

	public static String getUuid() {
		// TODO Auto-generated method stub
		UUID uuid = UUID.randomUUID();
		String uniqueCode = uuid.toString();
		uniqueCode = uniqueCode.toUpperCase();
		uniqueCode = uniqueCode.replaceAll("-", "");
		return uniqueCode;
	}
	
	public static String getCurrentTime(){
		Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
	}
}
