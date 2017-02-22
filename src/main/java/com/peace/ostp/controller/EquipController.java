package com.peace.ostp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.peace.ostp.domain.Equip;
import com.peace.ostp.domain.Message;
import com.peace.ostp.security.UserInfo;
import com.peace.ostp.service.IBasicEquipType;
import com.peace.ostp.service.IBasicSportType;
import com.peace.ostp.service.impl.EquipSerivceImpl;
import com.peace.ostp.util.FileUpload;
import com.peace.ostp.util.Page;
import com.peace.ostp.util.PagingUtil;
import com.peace.ostp.util.StringUtil;

@Controller
@RequestMapping("/admin")
public class EquipController {
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	
	@Autowired
	private EquipSerivceImpl equipSerivce;
	
	@Autowired
	private IBasicSportType iBasicSportType;
	
	@Autowired
	private IBasicEquipType iBasicEquipType;
	
	//初始进入equip-list
	@RequestMapping(value = "/equip-list", method = {RequestMethod.GET,RequestMethod.POST})
	public String equip_list(Model model, HttpServletRequest request,Equip equip,String pageNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		Page<Equip> page = new Page<Equip>();
		if(pageNo != null&&pageNo != "") page.setPageNo(Integer.parseInt(pageNo));
		map.put("equiptypeid", equip.getEquiptypeid());
		map.put("sporttypeid", equip.getSporttypeid());
		map.put("equipname", equip.getEquipname() == null ? "" : equip.getEquipname().trim());
		//page.setPageSize(5);
		page.setTotalRecord(equipSerivce.selectAllEquipCount(map));
		map.put("startNo", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		List<Equip> equips = equipSerivce.selectAllEquip(map);
		for (Equip equip2 : equips) {
			equip2.setEquiptypeid(iBasicEquipType.selectEquipType(equip2.getEquiptypeid()));
			equip2.setSporttypeid(iBasicSportType.selectSportType(equip2.getSporttypeid()));
		}
		page.setResults(equips);
		page.setParams(map);
		String pageLabal = PagingUtil.getPageBtnlink(page.getPageNo(),page.getTotalPage());
		model.addAttribute("sporttypelist", equipSerivce.findAllSportType());
		model.addAttribute("equiptypelist", equipSerivce.findAllEquipType());
		model.addAttribute("page", page);
		model.addAttribute("pageLabal", pageLabal);
		return "admin/equip/equip_list";
	}
	
	
	//跳转到更新界面
	@RequestMapping(value = "/equip-edit", method = RequestMethod.GET)
	public String equip_edit(Model model,String equipid,HttpServletRequest request){
		
		model.addAttribute("equip", equipSerivce.selectByPrimaryKey(equipid));
		model.addAttribute("sporttypelist", equipSerivce.findAllSportType());
		model.addAttribute("equiptypelist", equipSerivce.findAllEquipType());
		return "admin/equip/equip_edit";
	}
	
	 //跳转到详情界面
	@RequestMapping(value = "/equip-view", method = RequestMethod.GET)
	public String equip_view(Model model,String equipid){
		Equip equip = equipSerivce.selectByPrimaryKey(equipid);
		equip.setEquiptypeid(iBasicEquipType.selectEquipType(equip.getEquiptypeid()));
		equip.setSporttypeid(iBasicSportType.selectSportType(equip.getSporttypeid()));
		model.addAttribute("equip", equip);
		return "admin/equip/equip_view";
	}
	
	//使用id删除equip
	@RequestMapping(value="/equip-delete",method = RequestMethod.POST)
	public @ResponseBody Message equip_detele(Model model,@RequestBody Map<String, String> data){
		
		int result = equipSerivce.deleteByPrimaryKey(data.get("equipid"));
		Message message = new Message();   
		if(result == 1){
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("删除成功！");
		}else{
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("删除失败！");
		}
		return message;
	}
	
	//跳转到添加界面
	@RequestMapping(value = "/equip-add",method = RequestMethod.GET)
	public String equip_add(Model model){
		model.addAttribute("sporttypelist", equipSerivce.findAllSportType());
		model.addAttribute("equiptypelist", equipSerivce.findAllEquipType());
		return "admin/equip/equip_add";
	}
	
	//添加equip
	@RequestMapping(value = "/equip-insert",method = RequestMethod.POST)
	public String equip_insert(Model model,Equip equip,
			HttpServletRequest request){
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		equip.setEquipid(StringUtil.getUuid());
		equip.setCreatedate(new Date());
		equip.setCreateby(userInfo.getUsername());
		equip.setUpdateby(userInfo.getUsername());
		equip.setUpdatedate(new Date());
		equipSerivce.insert(equip);
		return "redirect:/admin/equip-list";
	}
	
	//更新equip信息
	@RequestMapping(value = "/equip-update",method = RequestMethod.POST)
	public String equip_update(Equip equip,HttpServletRequest request){
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//String imagepath = equip.getEquipimage();
		
		equip.setUpdateby(userInfo.getUserName());
		equip.setUpdatedate(new Date());
		equipSerivce.updateByPrimaryKey(equip);
		return "redirect:/admin/equip-list";
	}
	
	@RequestMapping(value={"/equip-validate/{equipprice}"},method = {RequestMethod.GET})
	public @ResponseBody Map<String, Object> equip_validate(@PathVariable String equipprice){
		Map<String, Object> map = new HashMap<String, Object>();
	    try {
	    	Double.parseDouble(equipprice);
	    	map.put("validate", "1");
		} catch (Exception e) {
			map.put("validate", "0");
		}
		return map;
	}
}
