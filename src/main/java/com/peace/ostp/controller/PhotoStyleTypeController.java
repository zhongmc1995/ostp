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
import com.peace.ostp.domain.BasicPhotoStyle;
import com.peace.ostp.domain.Message;
import com.peace.ostp.security.UserInfo;
import com.peace.ostp.service.IBasicPhotoStyle;

@Controller
public class PhotoStyleTypeController {
	
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	@Autowired
	private IBasicPhotoStyle iBasicPhotoStyle;
	

	@RequestMapping(value = "/admin/pictureStyleType-list", method = RequestMethod.GET)
	private String getAllPhotoStyleType(Model model, HttpServletRequest request) {
		
		List<BasicPhotoStyle> basicPhotoStyleList = iBasicPhotoStyle.getAllPhotoStyle();
		model.addAttribute("basicPhotoStyleList", basicPhotoStyleList);
		return "admin/basic/pictureStyleType";
	}
	
	@RequestMapping(value = "/admin/pictureStyleType-add", method = RequestMethod.POST)
	public @ResponseBody Message addPhotoStyleType(@RequestBody BasicPhotoStyle basicPhotoStyle) {
		Message message = new Message();
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		basicPhotoStyle.setCreateBy(userInfo.getUserName());
		basicPhotoStyle.setCreateDate(new Date());
		basicPhotoStyle.setUpdateBy(userInfo.getUserName());
		basicPhotoStyle.setUpdateDate(new Date());
		try {
			basicPhotoStyle.setPhotostyleid(UUID.randomUUID().toString().replace("-", ""));
			iBasicPhotoStyle.insertPhotoStyle(basicPhotoStyle);
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
	@RequestMapping(value = "/admin/pictureStyleType-del/{id}", method = RequestMethod.POST)
	public @ResponseBody Message DelPhotoStyleType(Model model, HttpServletResponse response,@PathVariable String id) {
		Message delmessage = new Message();
		try {
			iBasicPhotoStyle.deleteByPrimaryKey(id);
			delmessage.setResult(SUCCESS_MESSAGE);
			delmessage.setMessageInfo("删除成功！");
		} catch (Exception e) {
			delmessage.setResult(ERROR_MESSAGE);
			delmessage.setMessageInfo("删除失败！");
			e.printStackTrace();
		}
		return delmessage;
	}
	@RequestMapping(value = "/admin/pictureStyleType-update", method = RequestMethod.POST)
	public @ResponseBody Message updatePhotoStyleType(@RequestBody BasicPhotoStyle basicPhotoStyle) {
		Message message = new Message();
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		basicPhotoStyle.setUpdateBy(userInfo.getUserName());
		basicPhotoStyle.setUpdateDate(new Date());
		try {
			iBasicPhotoStyle.updatePhotoStyle(basicPhotoStyle);
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
