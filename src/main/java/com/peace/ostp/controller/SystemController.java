package com.peace.ostp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpRequest;
import org.apache.xmlbeans.impl.jam.mutable.MPackage;
import org.pdfbox.pdmodel.graphics.predictor.Paeth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.peace.ostp.domain.Menu;
import com.peace.ostp.domain.Message;
import com.peace.ostp.domain.Role;
import com.peace.ostp.domain.RoleMenu;
import com.peace.ostp.domain.User;
import com.peace.ostp.domain.UserRole;
import com.peace.ostp.service.IMenu;
import com.peace.ostp.service.IRole;
import com.peace.ostp.service.IRoleMenu;
import com.peace.ostp.service.IUser;
import com.peace.ostp.service.IUserRole;
import com.peace.ostp.util.MenuUtil;
import com.peace.ostp.util.Page;
import com.peace.ostp.util.PagingUtil;
import com.peace.ostp.util.StandardPasswordEncoderForSha1;
import com.peace.ostp.util.StringUtil;

@Controller
@RequestMapping(value = "/admin", method = RequestMethod.GET)
public class SystemController {
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";

	/**
	 * 系统管理子页面 xitong_quanxian 权限 xitong_user 系统用户 xitong_juese 角色用户 xitong 系统列表
	 */
	@RequestMapping(value = "/system-authority", method = RequestMethod.GET)
	public String xitong_quanxianGet(Model model, HttpServletRequest request) {
		return "admin/system/system_authority";
	}
	
	/*
	 * 用户列表
	 * */
	@RequestMapping(value = "/system-user", method = RequestMethod.GET)
	public String xitong_userGet(Model model, HttpServletRequest request) {
		//模态框中角色种类
		List<Role> roleList = iRole.getAllRole();
		model.addAttribute("roleList", roleList);
		
		int index = 1;
		if (request.getParameter("page") != null)
			index = Integer.parseInt(request.getParameter("page"));
		
		//用户列表 分页查询
		Page<User> page = new Page<User>();
		page.setPageNo(index);
		//page.setPageSize(6);
		int totalRecord = iUser.getTotalRecord();
		page.setTotalRecord(totalRecord);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
		page.setParams(params);
		List<User> results = iUser.getPageRecord(page);
		page.setResults(results);
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/system-user");
		model.addAttribute("page", page);
		model.addAttribute("pageStr", pageStr);
		return "admin/system/system_user";
	}
	@Autowired
	IUser iUser;
	@Autowired
	IUserRole iUserRole;
	/*
	 * 系统用户添加
	 * */
	@RequestMapping(value = "/user-add", method = RequestMethod.POST)
	public @ResponseBody Message userAdd(@RequestBody User user, HttpServletRequest request) {
		String roleId = user.getUserauthority();//角色的id
		String userId = StringUtil.getUuid();
		user.setUserid(userId);
		UserRole userRole = new UserRole();
		userRole.setRoleid(roleId);
		userRole.setUserid(userId);
		Role role = iRole.getRoleById(roleId);
		user.setUserauthority(role.getAuthority());
		String sh1Password = user.getUserpsw() + "{" + user.getUsername() + "}";
		PasswordEncoder passwordEncoder = new StandardPasswordEncoderForSha1();
		String result = passwordEncoder.encode(sh1Password);
		user.setUserpsw(result);
		user.setUserdesc(role.getName());
		Message message = new Message();
		
		try {
			iUser.addUser(user);
			iUserRole.inser(userRole);
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("添加成功!");
		} catch (Exception e) {
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("添加失败!");
		}
		return message;
	}
	
	/*
	 * 	系统用户编辑页面跳转
	 * */
	@RequestMapping(value="to-usereditor",method=RequestMethod.GET)
	public String toEditorUser(Model model,HttpServletRequest request){
		String userId = request.getParameter("userId");
		if(userId!=null&&!"".equals(userId)){
			User user = iUser.getUserById(userId);
			List<Role> role = iRole.getAllRole();
			model.addAttribute("roleList", role);
			model.addAttribute("user", user);
		}
		return "admin/system/systemuser_editor";
	}
	
	/*
	 * 	系统用户编辑更新
	 * 用户角色变更 修改roleuser表
	 * */
	@RequestMapping(value="user-editor",method=RequestMethod.POST)
	public String editorUser(Model model,User user){
		
		UserRole userRole = new UserRole();
		userRole.setRoleid(user.getUserauthority());
		userRole.setUserid(user.getUserid());
		Role role = iRole.getRoleById(user.getUserauthority());
		user.setUserauthority(role.getAuthority());
		iUserRole.updateByUserId(userRole);
		iUser.editUser(user);
		return "redirect:system-user";
	}
	
	@RequestMapping(value="/delete-user",method=RequestMethod.GET)
	public String deleteUser(HttpServletRequest request){
		String userId = request.getParameter("id");
		if(userId!=null&&!"".equals(userId)){
			iUser.deleteUser(userId);
			iUserRole.deleteOneByUserId(userId);
		}
		return "redirect:system-user";
	}
	@Autowired
	private IRole iRole;
	/*
	 * 角色列表
	 * */
	@RequestMapping(value = "/system-role", method = RequestMethod.GET)
	public String xitong_jueseGet(Model model, HttpServletRequest request) {
		List<Menu> temp = iMenu.getMenusByMenuId(0);
		MenuUtil menuUtil = new MenuUtil();
		menuUtil.setiMenu(iMenu);
		List<Menu> superMenuList = new ArrayList<Menu>();//获取所有的菜单
		for (Menu menu : temp) {
			superMenuList.add(menuUtil.recursiveTree(menu.getId()));
		}
		Object object = JSON.toJSON(superMenuList);
		//String menuStr = ((String)object).replace("menuname", "name");
		model.addAttribute("json", object);
		model.addAttribute("roleList",iRole.getAllRole());
		return "admin/system/system_role";
	}
	/*
	 * 角色添加
	 * */
	@RequestMapping(value="/role-add", method = RequestMethod.POST)
	public @ResponseBody Message roleAdd(@RequestBody Role role,HttpServletRequest request){
		String roleId = StringUtil.getUuid();
		role.setId(roleId);
		Message message = new Message();
		try {
			iRole.insertRole(role);
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("角色添加成功！");
		} catch (Exception e) {
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("角色添加失败！");
		}
		return message;
	} 
	/*
	 * 角色删除
	 * */
	@RequestMapping(value = "/delete-role", method = RequestMethod.GET)
	public String roleDelete(HttpServletRequest request) {
		String roleId = request.getParameter("id");
		if(!"".equals(roleId)&&roleId!=null){
			iRole.deleteRoleById(roleId);
			try {
				iRole.deleteRoleById(roleId);
			} catch (Exception e) {
				
			}
		}
		return "redirect:system-role";
	}
	/*
	 * 角色授权
	 * */
	@RequestMapping(value = "/role-authority", method = RequestMethod.POST)
	public @ResponseBody Message roleAuthority(@RequestBody String ids,HttpServletRequest request) {
		String roleId = request.getParameter("roleId");
		Message message = new Message();
		try {
			// 获取角色Id
			String[] id = ids.split(",");
			iRoleMenu.deleteByRoleId(roleId);
			//删除原表的数据
			try {
				for (String menuId : id) {
					RoleMenu roleMenu = new RoleMenu();
					roleMenu.setRoleid(roleId);
					roleMenu.setMenuid(Integer.parseInt(menuId));
					iRoleMenu.insert(roleMenu);
				}
			} catch (Exception e) {
				message.setResult(ERROR_MESSAGE);
				message.setMessageInfo("授权失败！");
			}
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("授权成功！");
			
		} catch (Exception e) {
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("授权失败！");
		}
		
		return message;
	}
	
	/*
	 * 角色编辑
	 * */
	@RequestMapping(value="role-editor",method=RequestMethod.POST)
	public @ResponseBody Message editorRole(@RequestBody Role role){
		Message message = new Message();
		try {
			iRole.update(role);
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("更新成功！");
		} catch (Exception e) {
			// TODO: handle exception
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("更新失败！");
		}
		return message;
	}
	
	@RequestMapping(value="/getSelectMenuId",method=RequestMethod.GET)
	public @ResponseBody Map<String, String> getSelectMenuId(HttpServletRequest request){
		String roleId = request.getParameter("roleId");
		List<Menu> list = iRoleMenu.getMenusByRoleId(roleId);
		StringBuffer sb = new StringBuffer();
		for (Menu menu : list) {
			sb.append(menu.getId()+"").append(",");
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("ids", sb.toString());
		return map;
	}
	@Autowired
	private IMenu iMenu;

	/* 菜单管理 */
	@RequestMapping(value = "/system-menu", method = RequestMethod.GET)
	public String xitongGet(Model model, HttpServletRequest request) {
		int index = 1;
		if (request.getParameter("page") != null)
			index = Integer.parseInt(request.getParameter("page"));
		Page<Menu> page = new Page<Menu>();
		page.setPageNo(index);
		page.setPageSize(6000);
		//page.setParams(getParentMuen());
		page.setTotalRecord(iMenu.getTotalRecord());
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", page.getPageSize() * (page.getPageNo() - 1));
		map.put("pageSize", page.getPageSize());
		page.setResults(iMenu.getPageMenu(map));
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/system-menu");
		model.addAttribute("pageStr", pageStr);
		model.addAttribute("page", page);
		return "admin/system/system_menu";
	}
	@RequestMapping(value = "/ztree", method = RequestMethod.GET)
	public String zz(Model model, HttpServletRequest request) {
		
		return "admin/system/ztree";
	}
	/* 角色管理 */
	/* 权限管理 */
	@RequestMapping(value = "menu-add", method = RequestMethod.POST)
	public @ResponseBody Message menuAdd(@RequestBody Menu menu, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Message message = new Message();
		try {
			iMenu.insertMenu(menu);
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("添加成功！");
		} catch (Exception e) {
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("添加失败！");
		}
		return message;
	}
	@RequestMapping(value="menu-editor",method=RequestMethod.POST)
	public @ResponseBody Message editorMenu(Model model,@RequestBody Menu menu){
		Message message = new Message();
		try {
			if (menu!=null) {
				iMenu.updateMenu(menu);
				message.setResult(SUCCESS_MESSAGE);
				message.setMessageInfo("更新成功！");
			}
		} catch (Exception e) {
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("更新失败！");
		}
		//iUserRole.updateByUserId();
		return message;
	}
	@Autowired
	private IRoleMenu iRoleMenu;
	/*菜单删除*/
	@RequestMapping(value = "delete-menu", method = RequestMethod.POST)
	public String deleteMenu(Model model, HttpServletRequest request){
		String menuId = request.getParameter("id");
		iMenu.deleteMenuById(menuId);
		iRoleMenu.deleteOneByMenuId(menuId);
		return "redirect:/admin/system-menu";
	}
}
