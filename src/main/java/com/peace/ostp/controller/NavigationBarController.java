package com.peace.ostp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peace.ostp.domain.Message;
import com.peace.ostp.domain.NavigationBar;
import com.peace.ostp.service.INavigationBar;

@Controller
@RequestMapping("/admin")
public class NavigationBarController {
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	@Autowired
	private INavigationBar navigationBarService;

	@RequestMapping("/navigationbar-add")
	public @ResponseBody Message navigationbarAdd(@RequestBody NavigationBar navigationBar) {
		Message message = new Message();
		try {
			navigationBarService.AddNavigationBar(navigationBar);
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("添加成功");
			return message;
		} catch (Exception e) {
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("添加失败");
			return message;
		}
	}
	@RequestMapping("/navigationbar-list")
	public String navigationbarList(Model model) {
		List<NavigationBar> navigationBarList = navigationBarService
				.getAllNavigationBar();
		model.addAttribute("navigationBarList", navigationBarList);
		return "admin/system/front/navigation_list";
	}

	@RequestMapping("/navigationbar-edit")
	public @ResponseBody Message navigationbarEdit(@RequestBody NavigationBar navigationBar) {
		Message message = new Message();
		try {
			navigationBarService.Update(navigationBar);
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("更新成功");
			return message;
		} catch (RuntimeException e) {
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("更新失败");
			return message;
		}
	}

	@RequestMapping("/navigationbar-del")
	public String navigationbarDelete(int id,Model model) {
		navigationBarService.deleteNavigationBar(id);
		return "redirect:/admin/navigationbar-list";
	}

}
