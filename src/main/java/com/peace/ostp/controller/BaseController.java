package com.peace.ostp.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peace.ostp.security.UserInfo;
import com.peace.ostp.service.IUser;

@Controller
public class BaseController {


	@Autowired
	private IUser userService;

	/**
	 * 网站首页
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model, HttpServletRequest request) {
		return "admin/login";
	}
	
	/**
	 * websocket
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value={"admin/websocket"},method = {RequestMethod.GET})
	public String Websocket(){
		return "admin/websocket/websocket";
	}
	/**
	 * 资源访问 welcome界面
	 */
	/*@RequestMapping(value = "/wc", method = RequestMethod.GET)
	public String wcGet(Model model, HttpServletRequest request) {
		return "admin/welcome";
	}*/
	
	/**
	 * 网站首页
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/pages", method = RequestMethod.GET)
	public String pagesPage(Model model, HttpServletRequest request) {
		return "pages/index";
	}
	/**
	 * 网站管理员首页
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(Model model, HttpServletRequest request) {
		String result = request.getParameter("result");
		HttpSession session = request.getSession();
		if ("1".equals((String) session.getAttribute("isphone")))
			return "redirect:phone-home";
		else
			return "redirect:user-login-page";

	}
	
	/**
	 *登录后的页面
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = { "home" }, method = RequestMethod.GET)
	public String directToExamHomePage(Model model, HttpServletRequest request) {
		String result = request.getParameter("result");
		HttpSession session = request.getSession();
		String home = "1".equals((String) session.getAttribute("isphone")) ? "phone-home" : "home";
		if ("failed".equals(result)) {
			model.addAttribute("result_msg", "登录失败");
		}

		if (SecurityContextHolder.getContext().getAuthentication() == null) {
			this.appendBaseInfo(model);
			return home;
		}
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString().endsWith("anonymousUser")) {
			this.appendBaseInfo(model);
			return home;
		}
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Collection<? extends GrantedAuthority> grantedAuthorities = userDetails.getAuthorities();

		if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_ADMIN"))) {
			return "redirect:admin/home";
		}else if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_COURSEADMIN"))) {
			return "redirect:admin/home";
		}else if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_POSITIONADMIN"))) {
			return "redirect:admin/home";
		}else if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_PHOTOADMIN"))) {
			return "redirect:admin/home";
		}else if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_BASICADMIN"))) {
			return "redirect:admin/home";
		}else if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_INFOADMIN"))) {
			return "redirect:admin/home";
		}else if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_TRAVELADMIN"))) {
			return "redirect:admin/home";
		}else if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_EQUIPADMIN"))) {
			return "redirect:admin/home";
		}else {
			return home;
		}
	}
	
	@RequestMapping(value = { "/admin/home" }, method = RequestMethod.GET)
	public String adminHomePage(Model model, HttpServletRequest request) {

		// return "redirect:/admin/question-list";
		return "redirect:/admin/apply-list";
	}
	@RequestMapping(value = { "/partb/home" }, method = RequestMethod.GET)
	public String partbHomePage(Model model, HttpServletRequest request) {

		// return "redirect:/admin/question-list";
		return "redirect:/partb/apply-list";
	}
	
	@RequestMapping(value = { "/partc/home" }, method = RequestMethod.GET)
	public String partcHomePage(Model model, HttpServletRequest request) {

		// return "redirect:/admin/question-list";
		return "redirect:/partc/apply-list";
	}
	
	public void appendBaseInfo(Model model) {
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(userInfo.getUserName());
	}

/*	*//**
	 * 管理员登录
	 * 
	 * @param model
	 * @param request
	 * @return
	 *//*
	@RequestMapping(value = { "/admin/home" }, method = RequestMethod.GET)
	public String adminHomePage(Model model, HttpServletRequest request) {

		// return "redirect:/admin/question-list";
		return "redirect:/admin/apply-list";
	}*/

	/**
	 * 考试中心登录后的页面
	 * 
	 * @param model
	 * @param request
	 * @return
	 *//*
	@SuppressWarnings("deprecation")
	@RequestMapping(value = { "examhome" }, method = RequestMethod.GET)
	public String directToExamHomePage(Model model, HttpServletRequest request) {
		String result = request.getParameter("result");
		HttpSession session = request.getSession();
		String examhome = "1".equals((String) session.getAttribute("isphone")) ? "phone-home" : "examhome";
		if ("failed".equals(result)) {
			model.addAttribute("result_msg", "登录失败");
		}

		if (SecurityContextHolder.getContext().getAuthentication() == null) {
			this.appendBaseInfo(model);
			return examhome;
		}
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString().endsWith("anonymousUser")) {
			this.appendBaseInfo(model);
			return examhome;
		}
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Collection<? extends GrantedAuthority> grantedAuthorities = userDetails.getAuthorities();

		if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_ADMIN"))) {
			return "redirect:admin/home";
		} else if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_TEACHER"))) {
			return "redirect:teacher/home";
		} else if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_STUDENT"))) {
			this.appendBaseInfo(model);

			return examhome;
		} else {
			return examhome;
		}
	}

	*//**
	 * 判断不同角色返回的页面
	 * 
	 * @param model
	 * @param request
	 * @return
	 *//*
	@SuppressWarnings("deprecation")
	@RequestMapping(value = { "home" }, method = RequestMethod.GET)
	public String directToBaseHomePage(Model model, HttpServletRequest request) {

		String result = request.getParameter("result");
		HttpSession session = request.getSession();
		String home = "1".equals((String) session.getAttribute("isphone")) ? "phone-home" : "home";
		if ("failed".equals(result)) {
			model.addAttribute("result_msg", "登录失败");
		}

		if (SecurityContextHolder.getContext().getAuthentication() == null) {
			this.appendBaseInfo(model);
			return home;
		}
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString().endsWith("anonymousUser")) {
			this.appendBaseInfo(model);
			return home;
		}
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Collection<? extends GrantedAuthority> grantedAuthorities = userDetails.getAuthorities();

		if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_ADMIN"))) {
			return "redirect:admin/home";
		} else if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_TEACHER"))) {
			return "redirect:teacher/home";
		} else if (grantedAuthorities.contains(new GrantedAuthorityImpl("ROLE_STUDENT"))) {
			this.appendBaseInfo(model);

			return home;
		} else {
			return home;
		}
	}

	@RequestMapping(value = "/phone-home", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(Model model, HttpServletRequest request) {
		this.appendBaseInfo(model);
		return "phone-home";
	}*/



	

}
