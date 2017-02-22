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
import com.peace.ostp.domain.Message;
import com.peace.ostp.domain.PositionTypeInfo;
import com.peace.ostp.security.UserInfo;
import com.peace.ostp.service.IBasicPositionType;

@Controller
public class PositionTypeController {

	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	@Autowired
	private IBasicPositionType iBasicPositionType;
	
	@RequestMapping(value = "/admin/positionType-list", method = RequestMethod.GET)
	private String getAllPositionType(Model model, HttpServletRequest request) {
		
		List<PositionTypeInfo> positionTypeList = iBasicPositionType.getAllPositionType();
		model.addAttribute("positionTypeList", positionTypeList);
		return "admin/basic/outdoorPositionType";
	}
	@RequestMapping(value = "/admin/positionType-add", method = RequestMethod.POST)
	public @ResponseBody Message addPositionType(@RequestBody PositionTypeInfo positionTypeInfo) {
		Message message = new Message();
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		positionTypeInfo.setCreateBy(userInfo.getUserName());
		positionTypeInfo.setCreateDate(new Date());
		positionTypeInfo.setUpdateBy(userInfo.getUserName());
		positionTypeInfo.setUpdateDate(new Date());
		try {
			positionTypeInfo.setPositiontypeid(UUID.randomUUID().toString().replace("-", ""));
			iBasicPositionType.insertPositiontype(positionTypeInfo);
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
	@RequestMapping(value = "/admin/positionType-del/{id}", method = RequestMethod.POST)
	public @ResponseBody Message DelPositiontype(Model model,HttpServletResponse response,@PathVariable String id) {
		Message delmessage = new Message();
		try {
			iBasicPositionType.deleteByPrimaryKey(id);
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
	@RequestMapping(value = "/admin/positionType-update", method = RequestMethod.POST)
	public @ResponseBody Message updatePositionType(@RequestBody PositionTypeInfo positionTypeInfo) {
		Message message = new Message();
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		positionTypeInfo.setUpdateBy(userInfo.getUserName());
		positionTypeInfo.setUpdateDate(new Date());
		try {
			iBasicPositionType.updatePositionType(positionTypeInfo);
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
