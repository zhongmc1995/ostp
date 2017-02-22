package com.peace.ostp.controller;

import java.io.IOException;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.peace.ostp.domain.Message;
import com.peace.ostp.domain.PhotoPhotoGraphy;
import com.peace.ostp.domain.PositionDetailInfo;
import com.peace.ostp.service.IBasicPhotoStyle;
import com.peace.ostp.service.IBasicSportType;
import com.peace.ostp.service.IPhotoPhotoGraphy;
import com.peace.ostp.util.DrawImageUtil;
import com.peace.ostp.util.FileUpload;
import com.peace.ostp.util.Page;
import com.peace.ostp.util.PagingUtil;
import com.peace.ostp.util.StringUtil;

@Controller
@RequestMapping("/admin")
public class PhotographyController {
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	
	@Autowired
	private IBasicPhotoStyle basicPhotoStyleService;
	
	@Autowired
	private IBasicSportType basicSprotTypeService;
	
	@Autowired
	private IPhotoPhotoGraphy photoPhotoGarphyService;
	
	
	/**
	 * 格式化日期，因为springmvc不能自己对日期格式化
	 * @param binder
	 */
    @InitBinder
    public void initBinder(WebDataBinder binder) {  
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
        dateFormat.setLenient(false);  
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
    }
	/**
	 * 摄影管理 sheying_insert 添加摄影 sheying_edit 编辑摄影 sheying_view 摄影详情 sheying 摄影列表
	 */
	@RequestMapping(value = "/photography-insert", method = RequestMethod.POST)
	public String  photography_insert(PhotoPhotoGraphy photophotography, /*@RequestParam("picture") MultipartFile file,*/ HttpServletRequest request) {
	/*	FileUpload fileUpload = new FileUpload();
		System.out.println("..........................................................添加.......................................................");
		try {
			fileUpload.uploadFile(file, request);//上传文件
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//缩略图上传，初始化工作
    	DrawImageUtil img = new DrawImageUtil(file, request, fileUpload);
    	//缩略工作
    	img.resizeFix();
		photophotography.setPhotourl(fileUpload.getFilePath(file));
		photophotography.setThumbphotography(img.getThumbnailPath());*/
		photophotography.setPictureid(StringUtil.getUuid());
		/*Message message = new Message();
		if(photoPhotoGarphyService.addPhoto(photophotography) == 1){
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("添加成功");
		}else{
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("添加失败");
		}
		return message;*/
		int result = photoPhotoGarphyService.addPhoto(photophotography);
		if(result > 0){
			return "redirect:photography-list";
		} else {
			return "admin/photography/photography_list";
		}
	}
	
	@RequestMapping(value = "/photography", method = RequestMethod.GET)
	public String photography(String pictureid, String photostyleid, String sporttypeid, HttpServletRequest request) {
	    	
	    	//当页面加载的时候获取初始数据
		 	List<Map<String,String>> photoStyle = new ArrayList<Map<String,String>>();
			List<Map<String,String>> sportType=new ArrayList<Map<String,String>>();
			System.out.println(pictureid+"----------"+photostyleid+"----------"+sporttypeid);
			PhotoPhotoGraphy photophotography = photoPhotoGarphyService.getPhotographyherf(pictureid, photostyleid, sporttypeid);
			System.out.println(photophotography.getAuthor()+"----------");
			sportType.addAll(basicSprotTypeService.SportTypeCombox());
			photoStyle.addAll(basicPhotoStyleService.getAllPhotoStyleStr());
			System.out.println(photophotography.getPictureid()+"-id---------");
			request.setAttribute("sportType", sportType);
			request.setAttribute("photoStyle", photoStyle);
	    	request.setAttribute("photophotography", photophotography);
	    	return "admin/photography/photography_edit";
		}
	 
	@RequestMapping(value = "/photography-add")
	public String Photo_addGet(Model model, HttpServletRequest request) {
		List<Map<String,String>> photoStyle = new ArrayList<Map<String,String>>();
		List<Map<String,String>> sportType=new ArrayList<Map<String,String>>();
		sportType.addAll(basicSprotTypeService.SportTypeCombox());
		photoStyle.addAll(basicPhotoStyleService.getAllPhotoStyleStr());
		model.addAttribute("photoStyle", photoStyle);
		model.addAttribute("sportType", sportType);
		return "admin/photography/photography_add";
	}
	
	@RequestMapping(value = "/photography-edit", method = RequestMethod.POST)
	public String photography_edit(PhotoPhotoGraphy photophotography, HttpServletRequest request) {
		/*FileUpload fileUpload = new FileUpload();
    	if (!file.isEmpty()) {//如果更新图片，则把原来的旧图片删除
    		fileUpload.deletFile(photophotography.getPhotourl(), request);
    		try {
    			fileUpload.uploadFile(file, request);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}*/
    	System.out.println("....."+photophotography.getPhotourl());
    	int result = photoPhotoGarphyService.updatePhotoGraphy(photophotography);
		if(result > 0){
			return "redirect:photography-list";
		} else {
			return "admin/photography/photography_list";
		}
	}

	@RequestMapping(value = "/photography-view", method = RequestMethod.GET)
	public String photography_view(Model model,String pictureid, String photostyleid, String sporttypeid, HttpServletRequest request) { 
		PhotoPhotoGraphy photophotography = photoPhotoGarphyService.getPhotographyherf(pictureid, photostyleid, sporttypeid);
		model.addAttribute("photophotography",photophotography);
		return "admin/photography/photography_view";
	}
	
	 @RequestMapping(value = "/photography-del", method = RequestMethod.POST)
	    public @ResponseBody Message positionDelete(/*String pictureid, String photourl, */@RequestBody Map<String, String> data/*,HttpServletRequest request*/) {
		 int result = photoPhotoGarphyService.deletePhotoGraphy(data.get("pictureid"));
			Message message = new Message();   
			if(result == 1){
				message.setResult(SUCCESS_MESSAGE);
				message.setMessageInfo("删除成功！");
			}else{
				message.setResult(ERROR_MESSAGE);
				message.setMessageInfo("删除失败！");
			}
			return message;
		/* if(photourl!=null){
	    	FileUpload fileUpload = new FileUpload();
	    	fileUpload.deletFile(photourl, request);
		 }
	    	photoPhotoGarphyService.deletePhotoGraphy(pictureid);
	    	return "redirect:photography-list";*/
	    }
	 
	 
	@RequestMapping(value = "/photography-list")
	public String photography_search(Model model,PhotoPhotoGraphy photophotography, HttpServletRequest request) {
		System.out.println("......................................................................");
		System.out.println("......................................................................");
		List<Map<String,String>> photoStyle = new ArrayList<Map<String,String>>();
		List<Map<String,String>> sportType=new ArrayList<Map<String,String>>();
		List<PhotoPhotoGraphy> list=new ArrayList<PhotoPhotoGraphy>();
		sportType.addAll(basicSprotTypeService.SportTypeCombox());
		photoStyle.addAll(basicPhotoStyleService.getAllPhotoStyleStr());
		
		int index = 1;
		if (request.getParameter("page") != null)
			index = Integer.parseInt(request.getParameter("page"));
		Page<PhotoPhotoGraphy> page = new Page<PhotoPhotoGraphy>();
		page.setPageNo(index);
		//page.setPageSize(3);
		page.setTotalRecord(photoPhotoGarphyService.getTotalRecord());
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		System.out.println(":.....................今日最小:"+photophotography.getMinliketimes()+"今日最大:"+photophotography.getMaxliketimes());
		page.setResults(list=photoPhotoGarphyService.getPhotoGraphy(photophotography,map));
 		System.out.println("size:"+list.size()+"");
		if(list.size()!=0)
			{for(int i=0;i<list.size();i++)
		System.out.println("......................................................................风格id："+list.get(i).getSporttypeid()+"总"+list.get(i).getTotalliketimes());}
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/photography-list-page");
		model.addAttribute("pageStr", pageStr);
		model.addAttribute("sportType", sportType);
		model.addAttribute("photoStyle", photoStyle);
		model.addAttribute("photophotography", photophotography);
		model.addAttribute("photophotographys", page);
		return "admin/photography/photography_list";
	}
	
	  @RequestMapping("/photography-list-page")
	    public void photographyPage(@RequestParam("page") Integer index,PhotoPhotoGraphy photophotography, HttpServletResponse response) {
	    	/*=====分页 start======*/
	    	Page<PhotoPhotoGraphy> page = new Page<PhotoPhotoGraphy>();
			page.setPageNo(index);
			page.setPageSize(3);
			page.setTotalRecord(photoPhotoGarphyService.getTotalRecord());
			//存储查询参数
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
			map.put("pageSize", page.getPageSize());
			page.setResults(photoPhotoGarphyService.getPhotoGraphy(photophotography,map));
			String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/photography-list-page");
			List<Object> list = new ArrayList<Object>();
			list.add(0,pageStr);
			System.out.println("集合："+page.getResults());
			list.add(1,page.getResults());
			/*=====分页 end======*/
			String strJson = JSON.toJSONString(list);
			try {
				response.getWriter().print(strJson);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	  
/*	@RequestMapping(value = "/photography-list", method = RequestMethod.GET)
	public String photography_list(Model model, HttpServletRequest request) {
		List<Map<String, String>> photoStyle = new ArrayList<Map<String,String>>();
		List<Map<String,String>> sportType=new ArrayList<Map<String,String>>();
		sportType.addAll(basicSprotTypeService.getAllSportType());
		photoStyle.addAll(basicPhotoStyleService.getAllPhotoStyle());
		model.addAttribute("sportType", sportType);
		model.addAttribute("photoStyle", photoStyle);
		return "admin/photography/photography_list";
	}*/


}
