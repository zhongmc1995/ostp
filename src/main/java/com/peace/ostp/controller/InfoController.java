package com.peace.ostp.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.peace.ostp.domain.BasicInfo;
import com.peace.ostp.domain.Message;
import com.peace.ostp.service.IBasicInfo;
import com.peace.ostp.service.IBasicSportType;
import com.peace.ostp.service.IInfoFirstLevelType;
import com.peace.ostp.service.IInfoSecondLevelType;
import com.peace.ostp.util.FileUpload;
import com.peace.ostp.util.Page;
import com.peace.ostp.util.PagingUtil;

@Controller
@RequestMapping("/admin")
public class InfoController {


	@Autowired
	private IBasicInfo infoService;
	
	@Autowired
	private IInfoSecondLevelType InfoSecondLevelTypeService;
	
	@Autowired
	IBasicInfo basicInfoService;
	
	@Autowired
	IInfoFirstLevelType firstLevelTypeService;
	
	@Autowired
	IBasicSportType sportTypeService;
	
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	private Integer PER_PAGE_NUM = 5;

	/**
	 * 格式化日期
	 * @param binder
	 */
    @InitBinder  
    public void initBinder(WebDataBinder binder) {  
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
//        dateFormat.setLenient(false);  
//        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        CustomDateEditor dateEditor = new CustomDateEditor(df, true);  
        //表示如果命令对象有Date类型的属性，将使用该属性编辑器进行类型转换  
        binder.registerCustomEditor(Date.class, dateEditor); 

    }  
    //获取二级类目
    @RequestMapping(value="/info-getSecondLevelTypeByFirstID/{firstLevelTypeID}",method=RequestMethod.POST)
	public void getSecondLevelTypeByFirstID(@PathVariable String firstLevelTypeID,HttpServletResponse response) {
		List<Map<String, String>> secondLevelType = InfoSecondLevelTypeService.getSecondLevelTypeByFirstID(firstLevelTypeID);
		String jsonData=null;
		if (secondLevelType != null) {
			jsonData = JSON.toJSONString(secondLevelType);
			try {
				response.getWriter().print(jsonData);
			
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			}
		}
		
	}
    
    //咨询主页
	@RequestMapping(value = "/info-list", method = RequestMethod.GET)
	public String info_list(BasicInfo basicInfo,Model model, HttpServletRequest request) {
		//分页操作
		int index = 1;
		if (request.getParameter("page") != null)
			index = Integer.parseInt(request.getParameter("page"));
		Page<BasicInfo> page = new Page<BasicInfo>();
		page.setPageNo(index);
		//page.setPageSize(5);
		page.setTotalRecord(basicInfoService.getTotalRecord(basicInfo));
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		page.setResults(basicInfoService.getPageRecord(map));
		//List<BasicInfo> basicInfoLists = basicInfoService.getAll(page);
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/info-list");
		
		//加载一级类目
		List<Map<String, String>> firstLevelType =(firstLevelTypeService.getAllFirstLevelType());
		model.addAttribute("firstLevelType", firstLevelType);
		
		//加载默认的二级类目
		List<Map<String, String>> secondLevel =(InfoSecondLevelTypeService.getSecondLevelTypeForFirstLevel());
		model.addAttribute("secondLevel", secondLevel);
		
		//加载所有的二级类目
		List<Map<String, String>> allSecondLevel=(InfoSecondLevelTypeService.getAllSecondLevelType());
		model.addAttribute("allSecondLevel", allSecondLevel);
		
		//加载运动类型
		List<Map<String, String>> sportType=sportTypeService.SportTypeCombox();
		model.addAttribute("sportType", sportType);
		
		//传参数
		model.addAttribute("pageStr", pageStr);
		model.addAttribute("page", page);
		return "admin/info/info_list";
	}

	//访问增加咨询页面
	@RequestMapping(value="/info-add",method=RequestMethod.GET)
	public String addInfoPage(Model model, HttpServletRequest request) {
		//加载一级类目
		List<Map<String, String>> firstLevelType =(firstLevelTypeService.getAllFirstLevelType());
		model.addAttribute("firstLevelType", firstLevelType);
		//加载二级类目
		List<Map<String, String>> secondLevel =(InfoSecondLevelTypeService.getAllSecondLevelType());
		model.addAttribute("secondLevel", secondLevel);
		//加载运动类型
		List<Map<String, String>> sportType=sportTypeService.SportTypeCombox();
		model.addAttribute("sportType", sportType);
		
		return "admin/info/info_add";
	}
	//新增咨询信息
	@RequestMapping(value="/info-add",method=RequestMethod.POST)
	public  String addInfo(BasicInfo basicInfo, HttpServletRequest request) {
		//新增信息类用来返回ajax值
		/*Message message = new Message();
		FileUpload fileUpload = new FileUpload();
		if(!file.isEmpty()){
			System.out.println("进来了");
			//图片上传异常处理
			try {
				fileUpload.uploadFile(file, request);//上传文件
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("图片上传出错"+e.getMessage());
				message.setResult(ERROR_MESSAGE);
				message.setMessageInfo("上传图片失败");
			}
			//封装图片信息
			basicInfo.setImgurl(fileUpload.getFilePath(file));
		}else {
			
			//设置返回信息
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("咨询添加成功");
		}*/
		//随进生产咨询ID
		basicInfo.setInfoId(String.valueOf(System.currentTimeMillis()));
		//封装传过来的值
		infoService.addInfo(basicInfo);
		return "redirect:info-list";
	}
	
	@RequestMapping(value = "/info-edit/{infoId}", method = RequestMethod.GET)
	public String infoEditPage(Model model, HttpServletRequest request, @PathVariable String infoId) {
		//查询并添加需要编辑的信息
		BasicInfo basicInfo = basicInfoService.selectBasicInfoById(infoId);
		model.addAttribute("basicinfo", basicInfo);
		//加载一级类目
		List<Map<String, String>> firstLevelType =(firstLevelTypeService.getAllFirstLevelType());
		model.addAttribute("firstLevelType", firstLevelType);
		//加载默认的二级类目
		List<Map<String, String>> secondLevel =(InfoSecondLevelTypeService.getSecondLevelTypeByFirstID(basicInfo.getFirstlevelinfotypeid()));
		model.addAttribute("secondLevel", secondLevel);
		//加载运动类型
		List<Map<String, String>> sportType=sportTypeService.SportTypeCombox();
		model.addAttribute("sportType", sportType);
		
		return "admin/info/info_edit";
	}
	
	@RequestMapping(value = "/info-edit", method = RequestMethod.POST)
	public  String infoEdit(BasicInfo basicInfo, HttpServletRequest request) {
		
				infoService.updateInfo(basicInfo);
	
		return "redirect:info-list";
	}
	
	@RequestMapping(value="/info-view/{infoid}")
	public String info_view(Model model, HttpServletRequest request,@PathVariable String infoid){
		BasicInfo basicInfo = basicInfoService.selectBasicInfoById(infoid);
		model.addAttribute("basicinfo", basicInfo);
		return "admin/info/info_view";
	}
	
	@RequestMapping(value="/info-del/{infoid}",method=RequestMethod.POST)
	public @ResponseBody String infoDel(@PathVariable String infoid,HttpServletResponse response){
		Message message=new Message();
		if(infoid==null){
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("infoid不存在");
			
		}else{
			infoService.deleteInfo(infoid);
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("删除成功");
		}
		
		return JSON.toJSONString(message);
	}
	
	@RequestMapping(value="/info-search",method=RequestMethod.POST)
	public String  infoSearch(Model model,BasicInfo basicInfo,HttpServletRequest request){
		//分页操作
		int index = 1;
		if (request.getParameter("page") != null)
			index = Integer.parseInt(request.getParameter("page"));
		Page<BasicInfo> page = new Page<BasicInfo>();
		page.setPageNo(index);
		page.setPageSize(5);
		page.setTotalRecord(infoService.getTotalRecord(basicInfo));
		System.out.println(page.getTotalRecord());
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		page.setResults(infoService.searchByInfo(basicInfo, map));
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/info-list");
		
		//加载一级类目
		List<Map<String, String>> firstLevelType =(firstLevelTypeService.getAllFirstLevelType());
		model.addAttribute("firstLevelType", firstLevelType);
		
		//加载默认的二级类目
		List<Map<String, String>> secondLevel =(InfoSecondLevelTypeService.getSecondLevelTypeForFirstLevel());
		model.addAttribute("secondLevel", secondLevel);
		
		//加载所有的二级类目
		List<Map<String, String>> allSecondLevel=(InfoSecondLevelTypeService.getAllSecondLevelType());
		model.addAttribute("allSecondLevel", allSecondLevel);
		
		//加载运动类型
		List<Map<String, String>> sportType=sportTypeService.SportTypeCombox();
		model.addAttribute("sportType", sportType);
		
		//传参数
		model.addAttribute("pageStr", pageStr);
		System.out.println(pageStr);
		model.addAttribute("page", page);		
		
		return "admin/info/info_list";
	
	}
	
	@RequestMapping(value = "/info-list", method = RequestMethod.POST)
	    public @ResponseBody String positionsPage(@RequestParam("page") Integer index,BasicInfo basicInfo, HttpServletResponse response) {
	    	/*=====分页 start======*/
	    	Page<BasicInfo> page = new Page<BasicInfo>();
			page.setPageNo(index);
			page.setPageSize(PER_PAGE_NUM);
			page.setTotalRecord(basicInfoService.getTotalRecord(basicInfo));
			//存储查询参数
			System.out.println("共有:"+page.getTotalPage()+"条数据");
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
			map.put("pageSize", page.getPageSize());
			//存取数据
			page.setResults(basicInfoService.searchByInfo(basicInfo, map));
			String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/info-list");
			//封装json
			List<Object> list = new ArrayList<Object>();
			list.add(0,pageStr);
			list.add(1,page.getResults());
			String strJson = JSON.toJSONString(list);
			return strJson;
	    }
}
