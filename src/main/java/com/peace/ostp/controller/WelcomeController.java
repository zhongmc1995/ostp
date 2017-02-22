package com.peace.ostp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	/**
	 * 资源访问 welcome界面
	 */
	@RequestMapping(value = "/wc", method = RequestMethod.GET)
	public String wcGet(Model model, HttpServletRequest request) {
		return "admin/welcome";
	}

}
