package com.peace.ostp.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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

import com.alibaba.fastjson.support.odps.udf.CodecCheck.A;
import com.peace.ostp.domain.BasicSportType;
import com.peace.ostp.domain.CourseInfo;
import com.peace.ostp.domain.CourseType;
import com.peace.ostp.domain.Message;
import com.peace.ostp.security.UserInfo;
import com.peace.ostp.service.IBasicSportType;
import com.peace.ostp.service.ICourseInfoService;
import com.peace.ostp.service.ICourseType;
import com.peace.ostp.service.impl.CourseInfoServiceImpl;
import com.peace.ostp.util.Page;
import com.peace.ostp.util.PagingUtil;

@Controller
@RequestMapping("/admin")
public class CourseController {
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	
	@Autowired
	private ICourseInfoService iCourseInfoService;
	
	@Autowired
	private IBasicSportType iBasicSportType;

	@Autowired
	private ICourseType iCourseType;
	
	@RequestMapping(value = "/course-list", method = {RequestMethod.GET,RequestMethod.POST})
	private String getAllCourseInfo(Model model,String pageNo,CourseInfo courseInfo) {
		Page<CourseInfo> page = new Page<CourseInfo>();
		List<BasicSportType> sporttypelist = iBasicSportType.getAllSportType();
		model.addAttribute("sporttypelist", sporttypelist);
		//page.setPageSize(2);
		page.setPageNo(pageNo == null? 1: Integer.parseInt(pageNo));
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("index", (page.getPageNo()-1)*page.getPageSize());
		map.put("pageSize", page.getPageSize());
		map.put("coursetitle", courseInfo.getCoursetitle() == null? "":courseInfo.getCoursetitle().trim());
		map.put("sporttypeid", courseInfo.getSporttypeid());
		page.setTotalRecord(iCourseInfoService.Counts(map));
		//String pageStr = PagingUtil.getPagelink(page.getPageNo(), page.getTotalPage(), "", "/ostp/admin/course-list");
		String pageStr = PagingUtil.getPageBtnlink(page.getPageNo(), page.getTotalPage());
		page.setResults(iCourseInfoService.GetAllCourseInfo(map));
		page.setParams(map);
		model.addAttribute("page", page);
		model.addAttribute("pageStr",pageStr);
		
		return "admin/course/course_list";
	}
	
	@RequestMapping(value = "/course-del/{courseid}", method = RequestMethod.GET)
	public String Course_del(@PathVariable("courseid")String courseid) {
		Message message = new Message();
		try {
			iCourseInfoService.deleteByPrimaryKey(courseid);
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("删除成功！");

		} catch (Exception e) {
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("删除失败！");
			e.printStackTrace();
		}
		return "redirect:/admin/course-list";
	}
	
	@RequestMapping(value = "/course-view/{courseid}", method = RequestMethod.GET)
	public String Course_view(Model model, HttpServletRequest request,@PathVariable("courseid")String courseid) {
		List<BasicSportType> sporttypelist = iBasicSportType.getAllSportType();
		model.addAttribute("sporttypelist", sporttypelist);
		CourseInfo courseInfo = iCourseInfoService.selectByPrimaryKey(courseid);
		model.addAttribute("courseInfo", courseInfo);
		return "admin/course/course_view";
	}
	
	@RequestMapping(value = "/course-add", method = RequestMethod.GET)
	public String Course_add(Model model, HttpServletRequest request) {	
		List<BasicSportType> list1 = iBasicSportType.getAllSportType();
		List<CourseType> list2 = iCourseType.getAllCourseType();	
		model.addAttribute("SportTypeList", list1);
		model.addAttribute("CoursetypeList", list2);
		return "admin/course/course_add";
	}
	
	@RequestMapping(value = "/course-addimpl", method = RequestMethod.POST)
	public String Course_addimpl(CourseInfo courseinfo) {
			courseinfo.setCourseid(UUID.randomUUID().toString().replace("-", ""));
			courseinfo.setCreatetime(new Date());
			courseinfo.setUpdatetime(new Date());
			UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			courseinfo.setCreateby(userInfo.getUserName());
			iCourseInfoService.insert(courseinfo);	
			return "redirect:/admin/course-list";
	}
	
	@RequestMapping(value = "/course-update/{courseid}", method = RequestMethod.GET)
	public String Course_update(Model model, HttpServletRequest request,@PathVariable("courseid")String courseid) {	
		List<BasicSportType> list1 = iBasicSportType.getAllSportType();
		List<CourseType> list2 = iCourseType.getAllCourseType();
		CourseInfo courseInfo = iCourseInfoService.selectByPrimaryKey(courseid);
		model.addAttribute("SportTypeList", list1);
		model.addAttribute("CoursetypeList", list2);
		model.addAttribute("courseInfo", courseInfo);
		return "admin/course/course_edit";
	}
	@RequestMapping(value = "/course-updateimpl", method = RequestMethod.POST)
	public String updateSportType(CourseInfo courseinfo) {
			UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			courseinfo.setUpdateby(userInfo.getUserName());
			courseinfo.setUpdatetime(new Date());
			iCourseInfoService.updateByPrimaryKey(courseinfo);
		return "redirect:/admin/course-list";
	}
	
}