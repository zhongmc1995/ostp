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

import com.peace.ostp.domain.BasicEquipType;
import com.peace.ostp.domain.BasicSport;
import com.peace.ostp.domain.BasicSportType;
import com.peace.ostp.domain.Message;
import com.peace.ostp.security.UserInfo;
import com.peace.ostp.service.IBasicSport;
import com.peace.ostp.service.IBasicSportType;

@Controller
public class OutdoorSportController {
	
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	@Autowired
	private IBasicSport iBasicSport;
	@Autowired
	private IBasicSportType iBasicSportType;
	
	@RequestMapping(value = "/admin/outdoorSport-list", method = RequestMethod.GET)
	private String getAllSport(Model model, HttpServletRequest request) {
		
		List<BasicSportType> sportTypeList = iBasicSportType.getAllSportType();
		List<BasicSport> basicSportList = iBasicSport.getAllSport();
		
		model.addAttribute("sportTypeList", sportTypeList);
		model.addAttribute("basicSportList", basicSportList);
		return "admin/basic/sport";
	}
	
	@RequestMapping(value = "/admin/outdoorSport-add", method = RequestMethod.POST)
	public @ResponseBody Message addSport(@RequestBody BasicSport basicSport) {
		Message message = new Message();
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		basicSport.setCreateBy(userInfo.getUserName());
		basicSport.setCreateDate(new Date());
		basicSport.setUpdateBy(userInfo.getUserName());
		basicSport.setUpdateDate(new Date());
		try {
			basicSport.setSportid(UUID.randomUUID().toString().replace("-", ""));
			iBasicSport.insertSport(basicSport);
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
	@RequestMapping(value = "/admin/outdoorSport-del/{id}", method = RequestMethod.POST)
	public @ResponseBody Message DelSport(Model model,HttpServletResponse response, @PathVariable String id) {
		Message delmessage = new Message();
		try {
			iBasicSport.deleteByPrimaryKey(id);
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
	@RequestMapping(value = "/admin/outdoorSport-update", method = RequestMethod.POST)
	public @ResponseBody Message updateSport(@RequestBody BasicSport basicSport) {
		Message message = new Message();
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		basicSport.setUpdateBy(userInfo.getUserName());
		basicSport.setUpdateDate(new Date());
		try {
			iBasicSport.updatesport(basicSport);
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("更新成功！");
		} catch (Exception e) {
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("更新失败！");
			e.printStackTrace();
		}
		return message;
	}
}
