package com.peace.ostp.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peace.ostp.domain.BasicSportType;
import com.peace.ostp.domain.Message;
import com.peace.ostp.security.UserInfo;
import com.peace.ostp.service.IBasicSportType;

@Controller
public class OutdoorSportTypeController {

	
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	
	@Autowired
	private IBasicSportType iBasicSportType;
	
	@RequestMapping(value = "/admin/outdoorSportType-list", method = RequestMethod.GET)
	private String getAllSportType(Model model, HttpServletRequest request) {
		
		List<BasicSportType> sportTypeList = iBasicSportType.getAllSportType();
		
		model.addAttribute("sportTypeList", sportTypeList);
		return "admin/basic/outdoorSportType";
	}
	
	@RequestMapping(value = "/admin/outdoorSportType-del/{id}", method = RequestMethod.POST)
	public @ResponseBody Message delSportType(Model model,HttpServletResponse response,@PathVariable String id) {
		Message delmessage = new Message();
		try {
			iBasicSportType.delSportType(id);
			delmessage.setResult(SUCCESS_MESSAGE);
			delmessage.setMessageInfo("删除成功！");
			System.out.println("success");
		} catch (Exception e) {
			delmessage.setResult(ERROR_MESSAGE);
			delmessage.setMessageInfo("删除失败！");
			e.printStackTrace();
		}
		return delmessage;
	}
	
	
	@RequestMapping(value = "/admin/outdoorSportType-add", method = RequestMethod.POST)
	public @ResponseBody Message addSportType(@RequestBody BasicSportType basicSportType) {
		Message message = new Message();
		basicSportType.setSporttypeid(UUID.randomUUID().toString().replace("-", ""));
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		basicSportType.setCreateBy(userInfo.getUserName());
		basicSportType.setCreateDate(new Date());
		basicSportType.setUpdateBy(userInfo.getUserName());
		basicSportType.setUpdateDate(new Date());
		try {
			iBasicSportType.addSportType(basicSportType);
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("添加成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
				message.setResult(ERROR_MESSAGE);
				message.setMessageInfo("添加失败");
			e.printStackTrace();
		}
		return message;
	}
	
	@RequestMapping(value = "/admin/outdoorSportType-update", method = RequestMethod.POST)
	public @ResponseBody Message updateSportType(@RequestBody BasicSportType basicSportType) {
		Message message = new Message();
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		basicSportType.setUpdateBy(userInfo.getUserName());
		basicSportType.setUpdateDate(new Date());
		try {
			iBasicSportType.updateByPrimaryKey(basicSportType);
			System.out.println("1111111111111111111111111111111111"+basicSportType.getSporttypeid());
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("更新成功！");
			System.out.println("success");
		} catch (Exception e) {
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("更新失败！");
			e.printStackTrace();
		}
		return message;
	}
}
