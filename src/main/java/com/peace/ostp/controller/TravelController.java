package com.peace.ostp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.peace.ostp.domain.Message;
import com.peace.ostp.domain.PositionDetailInfo;
import com.peace.ostp.domain.TripTravelInfo;
import com.peace.ostp.service.IBasicSportType;
import com.peace.ostp.service.IPositionInfo;
import com.peace.ostp.service.ITripInfo;
import com.peace.ostp.util.Page;
import com.peace.ostp.util.PagingUtil;
import com.peace.ostp.util.StringUtil;

/**
 * 行程控制器
 * 
 * @author YLS
 *
 */
@Controller
@RequestMapping("admin")
public class TravelController {
	
	@Autowired
	ITripInfo tripInfoService;
	
	@Autowired
	private IPositionInfo positionInfoService;
	
	@Autowired
	private IBasicSportType basicSportTypeService;
	
	@Autowired
	private IBasicSportType basicSprotTypeService;
	
	//分页的每页数量
	//private Integer PER_PAGE_NUM = 1;
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	
	/**
	 * 添加行程页面
	 * @param tripTravelInfo
	 * @return
	 */
	@RequestMapping(value = "/travel-add", method = RequestMethod.GET)
	public String travel_edit(Model model, TripTravelInfo tripTravelInfo){
		List<Map<String, String>> sportType = new ArrayList<Map<String,String>>();
		List<Map<String, String>> positionTypes = new ArrayList<Map<String,String>>();
		Page<PositionDetailInfo> page = new Page<PositionDetailInfo>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		page.setPageNo(1);
		//page.setPageSize(PER_PAGE_NUM);
		page.setTotalRecord(positionInfoService.getTotalRecord(new PositionDetailInfo()));
		//存储查询参数
		
		map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		page.setResults(positionInfoService.getPositionInfos(new PositionDetailInfo(),map));
		String pageStr = PagingUtil.getPagelink(1, page.getTotalPage(), "", "admin/travel-positions-page");
		sportType.addAll(basicSprotTypeService.SportTypeCombox());

		model.addAttribute("sportType", sportType);
		model.addAttribute("pageStr", pageStr);
		model.addAttribute("positionTypes", positionTypes);
		model.addAttribute("positionInfos", page);
		return "admin/travel/travel_add";
	}
	
	/**
	 * 添加行程
	 * @param tripTravelInfo
	 * @return
	 */
	@RequestMapping("/insert")
	public String insert(TripTravelInfo tripTravelInfo){
		
		tripTravelInfo.setTravelid(StringUtil.getUuid());
		tripTravelInfo.setCreattime(StringUtil.getCurrentTime());
		
		int result = tripInfoService.insert(tripTravelInfo);
		if (result > 0) {
			return "redirect:/admin/travel-list";
		} else {
			return "admin/travel/travel_add";
		}
	}
	
	/**
	 * 查看行程详情
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/travel-view", method = RequestMethod.GET)
	public String travel_view(String travelid, String sporttypeid, HttpServletRequest request) {
		TripTravelInfo tripTravelInfo = tripInfoService.getTripInfoByID(travelid.trim(),sporttypeid.trim());
		request.setAttribute("tripTravelInfo", tripTravelInfo);
		return "admin/travel/travel_view";
	}
	
	/**
	 * 编辑行程页面
	 * @param travelid
	 * @param sporttypeid
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/travel-edit", method = RequestMethod.GET)
	public String travel_edit(String travelid, String sporttypeid, HttpServletRequest request) {
		List<Map<String, String>> sportType = new ArrayList<Map<String,String>>();
		TripTravelInfo tripTravelInfo = tripInfoService.getTripInfoByID(travelid.trim(),sporttypeid.trim());
		Page<PositionDetailInfo> page = new Page<PositionDetailInfo>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		page.setPageNo(1);
		//page.setPageSize(PER_PAGE_NUM);
		page.setTotalRecord(positionInfoService.getTotalRecord(new PositionDetailInfo()));
		//存储查询参数
		
		map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		page.setResults(positionInfoService.getPositionInfos(new PositionDetailInfo(),map));
		
		String pageStr = PagingUtil.getPagelink(1, page.getTotalPage(), "", "admin/travel-positions-page");
		
		sportType.addAll(basicSprotTypeService.SportTypeCombox());
		
		request.setAttribute("pageStr", pageStr);
		request.setAttribute("positionInfos", page);
		request.setAttribute("sportType", sportType);
		request.setAttribute("tripTravelInfo", tripTravelInfo);
		
		return "admin/travel/travel_edit";
	}
	
	/**
	 * 修改行程
	 * @param tripTravelInfo
	 * @return
	 */
	@RequestMapping("travel-update")
	public String xingcheng_update(TripTravelInfo tripTravelInfo) {
		int result = tripInfoService.updateTripInfo(tripTravelInfo);
		if (result > 0) {
			return "redirect:/admin/travel-list";
		} else {
			return "admin/travel/travel_edit";
		}
	}
	
	/**
	 * 行程列表页面
	 * @param tripTravelInfo
	 * @return
	 */
	@RequestMapping(value = "/travel-list")
	public ModelAndView travel_list(TripTravelInfo tripTravelInfo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		//System.out.println(tripTravelInfo.getKeyword()+"   "+tripTravelInfo.getTravelid()+"   "+tripTravelInfo.getSporttypeid());
		//当页面加载时就加载初始数据
		//sportType运动类型，和已存在的行程数据tripTravelInfos
		List<Map<String, String>> sportType = new ArrayList<Map<String,String>>();
		Page<TripTravelInfo> page = new Page<TripTravelInfo>();
		
		/*=====分页 start======*/
		int index = 1;
		if (request.getParameter("page") != null)
			index = Integer.parseInt(request.getParameter("page"));
		sportType.addAll(basicSprotTypeService.SportTypeCombox());
		
		page.setPageNo(index);
		//page.setPageSize(PER_PAGE_NUM);
		page.setTotalRecord(tripInfoService.getTotalRecord(tripTravelInfo));
		//存储查询参数
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		page.setResults(tripInfoService.getTripInfos(tripTravelInfo,map));
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/travel-list-page");
		/*=====分页 end======*/
		
		mav.addObject("sportType", sportType);
		mav.addObject("tripTravelInfo", tripTravelInfo);
		mav.addObject("tripTravelInfos", page);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("admin/travel/travel_list");
		return mav;
	}
	
	/**
	 * 行程列表分页
	 * @param index
	 * @param tripTravelInfo
	 * @param response
	 */
	@RequestMapping("/travel-list-page")
    public void travlesPage(@RequestParam("page") Integer index, TripTravelInfo tripTravelInfo, HttpServletResponse response) {
    	/*=====分页 start======*/
    	Page<TripTravelInfo> page = new Page<TripTravelInfo>();
		page.setPageNo(index);
		//page.setPageSize(PER_PAGE_NUM);
		page.setTotalRecord(tripInfoService.getTotalRecord(tripTravelInfo));
		//存储查询参数
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		page.setResults(tripInfoService.getTripInfos(tripTravelInfo,map));
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/travel-list-page");
		List<Object> list = new ArrayList<Object>();
		list.add(0,pageStr);
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
	
	/**
	 * 删除行程
	 * @param travelid
	 * @return
	 */
	/*@RequestMapping(value = "/travel-del", method = RequestMethod.GET)
	public String travel_del(String travelid) {
		int result = tripInfoService.deleteTripInfo(travelid);
		if (result > 0) {
			return "redirect:/admin/travel-list";
		} else {
			return "redirect:/admin/travel-list";
		}
	}*/
	 @RequestMapping(value="/travel-del/{travelid}",method=RequestMethod.POST)
		public @ResponseBody String positionDel(@PathVariable String travelid,HttpServletResponse response){
			Message message=new Message();
			
			int result = tripInfoService.deleteTripInfo(travelid);
			if (result > 0) {
				message.setResult(SUCCESS_MESSAGE);
				message.setMessageInfo("删除成功");
			} else {
				message.setResult(ERROR_MESSAGE);
				message.setMessageInfo("travelid不存在");
			}
			
			return JSON.toJSONString(message);
		}
	
	/**
	 * 异步获取位置信息
	 * @param index
	 * @param positionDetailInfo
	 * @param request
	 * @return
	 */
	@RequestMapping("/travel-positions-page")
	public void positions(@RequestParam("page") Integer index, PositionDetailInfo positionDetailInfo, HttpServletRequest request, HttpServletResponse response) {
		//运动类型（下拉框）给视图
    	List<Map<String, String>> sportType = new ArrayList<Map<String,String>>();
    	//位置类型（下拉框）给视图
		List<Map<String, String>> positionTypes = new ArrayList<Map<String,String>>();
		//装载对象集合给视图
		List<Object> list = new ArrayList<Object>();
		//分页对象，返回给视图
		Page<PositionDetailInfo> page = new Page<PositionDetailInfo>();
		//装载分页参数，传入数据库中使用
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		/*=====分页 start======*/
		index = 1;
		if (request.getParameter("page") != null)
			index = Integer.parseInt(request.getParameter("page"));
		//分页初始化
		page.setPageNo(index);
		//page.setPageSize(PER_PAGE_NUM);
		page.setTotalRecord(positionInfoService.getTotalRecord(positionDetailInfo));
		
		//存储查询参数
		map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		//返回查询结果
		page.setResults(positionInfoService.getPositionInfos(positionDetailInfo,map));
		//分页
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/travel-positions-page");
		
		list.add(0,pageStr);
		list.add(1,page.getResults());
		if(positionDetailInfo != null) {//如果是分页则无需查找下拉框的数据
			sportType.addAll(basicSprotTypeService.SportTypeCombox());
			positionTypes.addAll(positionInfoService.getPositionType());
			list.add(2, sportType);
			list.add(3, positionTypes);
		}
		String strJson = JSON.toJSONString(list);
		try {
			response.getWriter().print(strJson);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*@RequestMapping("/travel-positions-page")
    public @ResponseBody Message positions(@RequestParam("page") Integer index, PositionDetailInfo positionDetailInfo, HttpServletRequest request){
    	//返回消息对象
    	Message message = new Message();
    	//运动类型（下拉框）给视图
    	List<Map<String, String>> sportType = new ArrayList<Map<String,String>>();
    	//位置类型（下拉框）给视图
		List<Map<String, String>> positionTypes = new ArrayList<Map<String,String>>();
		//装载对象集合给视图
		List<Object> list = new ArrayList<Object>();
		//分页对象，返回给视图
		Page<PositionDetailInfo> page = new Page<PositionDetailInfo>();
		//装载分页参数，传入数据库中使用
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		=====分页 start======
		index = 1;
		if (request.getParameter("page") != null)
			index = Integer.parseInt(request.getParameter("page"));
		//分页初始化
		page.setPageNo(index);
		page.setPageSize(PER_PAGE_NUM);
		page.setTotalRecord(positionInfoService.getTotalRecord(positionDetailInfo));
		
		//存储查询参数
		map.put("startIndex", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		//返回查询结果
		page.setResults(positionInfoService.getPositionInfos(positionDetailInfo,map));
		//分页
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "admin/travel-positions-page");
		
		list.add(0,pageStr);
		list.add(1,page.getResults());
		if(positionDetailInfo != null) {//如果是分页则无需查找下拉框的数据
			sportType.addAll(basicSportTypeService.getAllSportType());
			positionTypes.addAll(positionInfoService.getPosionType());
			list.add(2, sportType);
			list.add(3, positionTypes);
		}
		message.setObject(list);
    	return message;
    }*/

}