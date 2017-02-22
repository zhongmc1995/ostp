package com.peace.ostp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peace.ostp.domain.Message;
import com.peace.ostp.domain.User;
import com.peace.ostp.security.UserInfo;
import com.peace.ostp.service.IUser;
import com.alibaba.fastjson.JSON;
import com.google.common.collect.Multiset.Entry;
import com.peace.ostp.domain.Menu;
import com.peace.ostp.service.IMenu;
import com.peace.ostp.service.IRoleMenu;
import com.peace.ostp.util.MenuUtil;
import com.peace.ostp.util.Page;
import com.peace.ostp.util.PagingUtil;
import com.peace.ostp.util.StandardPasswordEncoderForSha1;

@Controller
public class UserController {

	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";

	@Autowired
	private IUser userService;

	@Autowired
	private IRoleMenu iRoleMenu;

	@Autowired
	private IMenu iMenu;

	@RequestMapping(value = { "/user-login-page" }, method = RequestMethod.GET)
	public String issloginPage(Model model,
			@RequestParam(value = "result", required = false, defaultValue = "") String result) {
		if ("failed".equals(result)) {
			model.addAttribute("result", "无效的用户名或者密码");
		}
		return "admin/login";
	}

	/**
	 * 管理员信息界面
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "/admin/apply-list"}, method = RequestMethod.GET)
	private String adminApplyPage(Model model, HttpServletRequest request) {
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// 获取角色Id
		String roleId = userInfo.getRoleList().get(0).getId();
		// 获取角色对应的菜单
		List<Menu> menuList = iRoleMenu.getMenusByRoleId(roleId);
		// initMenu(menuList.get(1));
		// 将对应的菜单和一级菜单关联
		// map用来存放一级菜单的id map不会添加重复的值 map默认按key值排序
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		for (Menu menu : menuList) {
			initMenu(menu);
			map.put(supMenu.getSequence(), supMenu.getId());
		}
		// 存放一级菜单的list
		List<Menu> superMenuList = new ArrayList<Menu>();
		map.entrySet();
		MenuUtil menuUtil = new MenuUtil();
		menuUtil.setiMenu(iMenu);
		for (Object superMenuKey : map.keySet()) {
			superMenuList.add(menuUtil.recursiveTree(map.get(superMenuKey),menuList));
		}
		model.addAttribute("menuList", superMenuList);
		model.addAttribute("userInfo",userInfo);
		Object oo = JSON.toJSON(superMenuList);
		System.out.println(superMenuList);

		return "admin/index";
	}

	public static void main(String[] args) {
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		map.put(1, 1);
		map.put(1, 1);
		System.out.println(map.size());
	}

	

	// 从下往上递归遍历
	// 全局变量用来存放递归的return
	public Menu supMenu;

	public Menu initMenu(Menu menu) {
		List<Menu> menuList = new ArrayList<Menu>();
		if (menu.getParentid() != 0 && menu != null) {
			Menu paMenu = iMenu.getMenuById(menu.getParentid());
			menuList.add(menu);
			if (paMenu != null) {
				paMenu.setChildren(menuList);
				initMenu(paMenu);
			}

		}
		if (menu.getParentid() == 0) {
			supMenu = menu;
		}
		return menu;
	}

	/**
	 * 用户信息界面
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/admin/user-list", method = RequestMethod.GET)
	private String showUserListPage(Model model, HttpServletRequest request) {
		/*
		 * int index = 1; if (request.getParameter("page") != null) index =
		 * Integer.parseInt(request.getParameter("page")); Page<User> page = new
		 * Page<User>(); page.setPageNo(index); page.setPageSize(20); List<User>
		 * userList = userService.getAllUserList(page); String pageStr =
		 * PagingUtil.getPagelink(index, page.getTotalPage(), "",
		 * "admin/user-list"); model.addAttribute("userList", userList);
		 * model.addAttribute("pageStr", pageStr);
		 */
		return "admin/yonghu/user_list";
	}

	@RequestMapping(value = "/admin/user-list/{username}", method = RequestMethod.GET)
	private String searchUserListPage(Model model, HttpServletRequest request, @PathVariable String username) {
		int index = 1;
		if (request.getParameter("page") != null)
			index = Integer.parseInt(request.getParameter("page"));
		Page<User> page = new Page<User>();
		page.setPageNo(index);
		//page.setPageSize(20);
		List<User> userList = userService.getSearchUserList(page, username);
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/user-list");
		model.addAttribute("userList", userList);
		model.addAttribute("pageStr", pageStr);
		return "admin/user-list";
	}

	/**
	 * 添加用户界面
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/admin/add-user", method = RequestMethod.GET)
	private String addUserPage(Model model, HttpServletRequest request) {
		return "admin/add-user";
	}

	/**
	 * 添加用户
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = { "/admin/add-user" }, method = RequestMethod.POST)
	public @ResponseBody Message addUser(@RequestBody User user) {
		String password = user.getUserpsw() + "{" + user.getUsername() + "}";
		PasswordEncoder passwordEncoder = new StandardPasswordEncoderForSha1();
		String resultPassword = passwordEncoder.encode(password);
		user.setUserpsw(resultPassword);
		user.setEnabled("1");
		Message message = new Message();
		try {
			userService.addUser(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block

			if (e.getMessage().equals("duplicate-username")) {
				message.setResult(e.getMessage());
				message.setMessageInfo("用户名：" + user.getUsername() + "已经存在");
			} else
				message.setResult("错误！" + e.getClass().getName());
			e.printStackTrace();
		}
		// System.out.println(message.);
		return message;
	}

	/**
	 * 编辑用户界面
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/admin/edit-user/{userId}", method = RequestMethod.GET)
	private String editUserPage(Model model, HttpServletRequest request, @PathVariable String userId) {
		User user = new User();
		user = userService.getUserById(userId);
		model.addAttribute("sysuser", user);
		return "admin/user/user_personalinfo";
	}
	
	/*
	 * 	验证用户名是否有重复的
	 * */
	@Autowired
	private IUser iUser;
	@RequestMapping(value="/admin/verifyUserName",method=RequestMethod.GET)
	private @ResponseBody Message verifyUserName(HttpServletRequest request){
		String userName = request.getParameter("userName").trim();
		Message message = new Message();
		message.setResult(SUCCESS_MESSAGE);
		message.setMessageInfo("");
		if ("".equals(userName)) {
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("用户名不能为空！");
		}else {
			List<User> list = iUser.getAllUser();
			for (User user : list) {
				if (userName.equals(user.getUsername())) {
					message.setResult(ERROR_MESSAGE);
					message.setMessageInfo("用户名存在");
					break;
				}
			}
		}
		return message;
	}
	
	
	/**
	 * 编辑用户
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = { "/admin/edit-user" }, method = RequestMethod.POST)
	public @ResponseBody Message editUser(@RequestBody User user) {
		String password = user.getUserpsw() + "{" + user.getUsername() + "}";
		PasswordEncoder passwordEncoder = new StandardPasswordEncoderForSha1();
		String resultPassword = passwordEncoder.encode(password);
		user.setUserpsw(resultPassword);
		user.setUserid(user.getUserid());
		user.setUsername(user.getUsername());
		user.setEnabled("1");
		Message message = new Message();
		try {
			userService.editUser(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block

			if (e.getMessage().equals("duplicate-username")) {
				message.setResult(e.getMessage());
				message.setMessageInfo("用户名：" + user.getUsername() + "已经存在");
			} else
				message.setResult("错误！" + e.getClass().getName());
			e.printStackTrace();
		}
		return message;
	}

	/**
	 * 修改密码界面
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/admin/modify-pwd/{userId}", method = RequestMethod.GET)
	private String modifyPwdPage(Model model, HttpServletRequest request, @PathVariable String userId) {
		model.addAttribute("userId", userId);
		return "admin/user/modifyPwd";
	}

	/**
	 * 修改密码
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/admin/modify-psw", method = RequestMethod.POST)
	public @ResponseBody Message modifyPwd(@RequestBody User user) {

		String userpsw = user.getUserpsw();
		String userid = user.getUserid();
		UserInfo userinfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = userinfo.getUserName();
		String password = userpsw + "{" + username + "}";
		PasswordEncoder passwordEncoder = new StandardPasswordEncoderForSha1();
		String resultPassword = passwordEncoder.encode(password);

		Message message = new Message();
		try {
			userService.modifyPsw(userid, resultPassword);
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("修改密码成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("修改密码失败");
			e.printStackTrace();
		}
		return message;
	}

	/**
	 * 禁用用户
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/admin/disable-user/{userId}", method = RequestMethod.GET)
	public @ResponseBody Message disableUser(Model model, HttpServletRequest request, @PathVariable String userId) {
		Message message = new Message();
		try {
			User user = new User();
			user.setUserid(userId);
			user.setEnabled("0");
			userService.updateUser(user, null);
		} catch (Exception e) {
			e.printStackTrace();
			message.setResult(e.getClass().getName());
		}

		return message;
	}

	/**
	 * 启用用户
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/admin/enable-user/{userId}", method = RequestMethod.GET)
	public @ResponseBody Message enableUser(Model model, HttpServletRequest request, @PathVariable String userId) {

		Message message = new Message();
		try {
			User user = new User();
			user.setUserid(userId);
			user.setEnabled("1");
			userService.updateUser(user, null);
		} catch (Exception e) {
			e.printStackTrace();
			message.setResult(e.getClass().getName());
		}
		return message;
	}
}
