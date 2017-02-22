package com.peace.ostp.util;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;



import com.ckfinder.connector.ServletContextFactory;
import com.ckfinder.connector.configuration.Configuration;
import com.peace.ostp.util.StringUtil;

public class CKFinderConfig extends Configuration{

    public static final String USERFILES_BASE_URL = "userfiles/";
    private HttpServletRequest request;
    public CKFinderConfig(ServletConfig servletConfig) {
    	super(servletConfig);
    	request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
    }

    @Override
    protected Configuration createConfigurationInstance() {
        try {
        	this.baseDir = StringUtil.replace(getUserfilesBaseDir() + USERFILES_BASE_URL, "\\\\", "/");
            this.baseURL = StringUtil.replace(request.getContextPath() + "/" + USERFILES_BASE_URL, "\\\\", "/");
        	 /*this.baseURL = ServletContextFactory.getServletContext().getContextPath()+"/userfiles/"+"/";*/
        
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return new CKFinderConfig(this.servletConf);
    }
    /**
     * 获取当前请求对象
     * @return
     */
   /* public static HttpServletRequest getRequest(){
        try{
            return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest(); 
        }catch(Exception e){
        	System.err.println("=================");
            return null;
        }
    }*/
    
    /**
     * 获取项目路径
     * @return
     */
    private String getUserfilesBaseDir() {
    	
        return request.getSession().getServletContext().getRealPath("/");
    }
}