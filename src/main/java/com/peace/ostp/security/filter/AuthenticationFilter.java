package com.peace.ostp.security.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.util.StringUtils;

import com.peace.ostp.domain.User;
import com.peace.ostp.security.UserInfo;
import com.peace.ostp.service.IUser;
import com.peace.ostp.util.StandardPasswordEncoderForSha1;

/**
 * @Project: YCIG_EXTRONLINE从业人员考试系统后台管理
 * @Title: AuthenticationFilter
 * @Description: 重写以添加验证码工具
 * @author: lijz
 * @date :2016年2月17日 下午3:54:07
 * @Copyright: Copyright (c) 2016
 * @version V1.0
 */
public class AuthenticationFilter extends UsernamePasswordAuthenticationFilter {

	public static final String VALIDATE_CODE = "validate_code";
	public static final String USERNAME = "j_username";
	public static final String PASSWORD = "j_password";
	public static final String KAPTCHA_SESSION_KEY = com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

	@Autowired
	public UserDetailsService userDetailsService;
	@Autowired
	public IUser userService;

	/**
	 * @Description:用户登录验证方法入口
	 * @param :args
	 * @return
	 * @throws Exception
	 */
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {

		if (!request.getMethod().equals("POST")) {
			throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
		}
		String username = this.obtainUsername(request);
		String password = this.obtainPassword(request);
		logger.debug(this.getClass().getName() + "登录用户名:" + username + ", 登录密码:" + password);
		// 加密密码(根据“密码{用户名})进行加密
		String sh1Password = password + "{" + username + "}";
		PasswordEncoder passwordEncoder = new StandardPasswordEncoderForSha1();
		String result = passwordEncoder.encode(sh1Password);
		System.out.println(passwordEncoder.encode("123"+"{"+"courseadmin"+"}"));
		UserInfo userDetails = (UserInfo) userDetailsService.loadUserByUsername(username);
		if (userDetails == null || "0".equals(userDetails.getEnabled()) || !passwordEncoder.matches(userDetails.getPassword(), result)) {
			 
			throw new AuthenticationServiceException("用户名或密码错误！");
		}
		
		UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);
		this.setDetails(request, authRequest);
		Authentication authentication = null;
		try {
			authentication = this.getAuthenticationManager().authenticate(authRequest);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			User tmpUser = new User();
			tmpUser.setUserid(userDetails.getUserid());
			userService.updateUser(tmpUser, null);
		} catch (Exception e) {
			logger.error("记录最后登录时间发生错误！", e);
		}
		return authentication;
	}

	/**
	 * @Description:判断验证码是否正确的方法并忽略大小写
	 * @param :args
	 * @return
	 * @throws Exception
	 */
	protected void checkValidateCode(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String sessionValidateCode = this.obtainSessionValidateCode(session);
		// 将验证码session清空
		session.setAttribute(KAPTCHA_SESSION_KEY, null);
		String validateCodeParameter = this.obtainValidateCodeParameter(request);

		if (StringUtils.isEmpty(validateCodeParameter) || !sessionValidateCode.equalsIgnoreCase(validateCodeParameter)) {
			// System.out.println("验证码错误！sessionValidateCode=" +
			// sessionValidateCode + " validateCodeParameter=" +
			// validateCodeParameter);
			throw new AuthenticationServiceException("验证码错误！");
		}
	}

	/**
	 * @Description:获取验证码参数
	 * @param :args
	 * @return
	 * @throws Exception
	 */
	protected String obtainValidateCodeParameter(HttpServletRequest request) {
		Object obj = request.getParameter(VALIDATE_CODE);
		return null == obj ? "" : obj.toString().trim().toUpperCase();
	}

	protected String obtainSessionValidateCode(HttpSession session) {
		Object obj = session.getAttribute(KAPTCHA_SESSION_KEY);
		return null == obj ? "" : obj.toString();
	}

	/**
	 * @Description:获取密码
	 * @param :args
	 * @return
	 * @throws Exception
	 */
	@Override
	protected String obtainPassword(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Object obj = request.getParameter(PASSWORD);
		return null == obj ? "" : obj.toString();
	}

	/**
	 * @Description:获取用户名
	 * @param :args
	 * @return
	 * @throws Exception
	 */
	@Override
	protected String obtainUsername(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Object obj = request.getParameter(USERNAME);
		return null == obj ? "" : obj.toString().trim().toLowerCase();
	}

	/**
	 * 日志
	 */
	private static Logger logger = Logger.getLogger(AuthenticationFilter.class);
	public static void main(String[] args) {
		PasswordEncoder passwordEncoder = new StandardPasswordEncoderForSha1();
		System.out.println(passwordEncoder.encode("123"+"{"+"courseadmin"+"}"));
	}
}
