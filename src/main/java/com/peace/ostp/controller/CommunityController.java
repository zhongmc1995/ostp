package com.peace.ostp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


import com.peace.ostp.domain.CommunityQuestionInfo;
import com.peace.ostp.domain.Equip;
import com.peace.ostp.domain.Message;
import com.peace.ostp.domain.PositionDetailInfo;
import com.peace.ostp.security.UserInfo;
import com.peace.ostp.service.ICommunityQuestionInfo;
import com.peace.ostp.util.Page;
import com.peace.ostp.util.PagingUtil;
import com.peace.ostp.util.StringUtil;

@Controller
public class CommunityController {
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	
	@Autowired
	ICommunityQuestionInfo iCommunityQuestionInfo;
	/**
	 * 社区管理 shequ_add 社区添加 shequ_edit 社区编辑 shequ_view 社区详情 shequ 社区列表
	 */
	@RequestMapping(value = "/community_add", method = RequestMethod.GET)
	public String shequ_addGet(Model community_add, HttpServletRequest request) {
		return "admin/community/community_add";
	}

	@RequestMapping(value = "/community_edit", method = RequestMethod.GET)
	public String shequ_editGet(Model model, HttpServletRequest request) {
		return "admin/community/community_edit";
	}

	@RequestMapping(value = "/community_view", method = RequestMethod.GET)
	public String shequ_viewGet(Model model, HttpServletRequest request) {
		return "admin/community/community_view";
	}

	@RequestMapping(value = "/community_list", method = RequestMethod.GET)
	public String shequGet(Model model, HttpServletRequest request) {
		return "admin/community/community_list";
	}
	
	
	
	//只有一个 method =RequestMethod.GET 的时候 为什么不可以
	@RequestMapping(value = "/admin/community-questions-list", method = {RequestMethod.GET,RequestMethod.POST})
	private String getAllQuestions(Model model, HttpServletRequest request,CommunityQuestionInfo communityQuestion,String pageNo) {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		Page<CommunityQuestionInfo> page = new Page<CommunityQuestionInfo>();
		if(pageNo != null&&!"".equals(pageNo)) page.setPageNo(Integer.parseInt(pageNo.trim()));
		map.put("questiontitle", communityQuestion == null ? "" : communityQuestion.getQuestiontitle());
		map.put("questionattention", communityQuestion == null ? "" : communityQuestion.getQuestionattention());
		map.put("questionauthor", communityQuestion == null ? "" : communityQuestion.getQuestionauthor());
		//page.setPageSize(5);
		page.setTotalRecord(iCommunityQuestionInfo.selectAllQuestionsCount(map));
		map.put("startNo", page.getPageSize()*(page.getPageNo()-1));
		map.put("pageSize", page.getPageSize());
		
		//这里是得到所有的question 并且封装到 page.results 里面
		List<CommunityQuestionInfo> comquestion = iCommunityQuestionInfo.selectAllQuestions(map);
		page.setResults(comquestion);
		
		//将关于页面的信息封装到params里面
		page.setParams(map);
		String pageLabal = PagingUtil.getPageBtnlink(page.getPageNo(),page.getTotalPage());
		model.addAttribute("page", page);
		model.addAttribute("pageLabal", pageLabal);
		
		
		/*=====列举出所有的questions=======*/
	/*	List<CommunityQuestionInfo> communityQuestionInfoList = iCommunityQuestionInfo.getAllQuestions();
		model.addAttribute("communityQuestionInfoList", communityQuestionInfoList);*/
		
		return "admin/comunnity/community_questions_list";
	}
	
	//这里是详情
	@RequestMapping("/admin/community-questions-view")
	public String question_view(Model model,String id){
		
		CommunityQuestionInfo communityQuestion =iCommunityQuestionInfo.selectQuestionById(id);
		
		//转换日期格式
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String normalTime = sdf.format(communityQuestion.getQuestiontime());
				
				model.addAttribute("normalTime", normalTime);
		
		model.addAttribute("communityQuestion",communityQuestion);
		return "admin/comunnity/community_questions_view";
	}
	
	
	//这里是删除question 通过id
	@RequestMapping(value="/admin/community-questions-delete/{id}",method = RequestMethod.POST)
	public @ResponseBody Message question_detele(Model model,HttpServletResponse response, @PathVariable String id){
		
		int result = iCommunityQuestionInfo.delQuestionById(id);
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
	
	
	//添加按钮 跳转到 添加编辑页面
		@RequestMapping(value = "/admin/community-questions-add",method = RequestMethod.GET)
		public String question_add(Model model){
			return "admin/comunnity/community_questions_add";
		}
	

	//这里是添加编辑页面
	@RequestMapping(value = "/admin/community-questions-insert",method = RequestMethod.POST)
	public @ResponseBody Message question_insert(Model model,@RequestBody CommunityQuestionInfo communityQuestionInfo){
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		communityQuestionInfo.setQuestionid(StringUtil.getUuid());
		/*communityQuestionInfo.setQuestiontime(new java.sql.Date (communityQuestionInfo.getQuestiontime().getTime()));*/
		System.out.println(communityQuestionInfo.toString());
		/*communityQuestionInfo.setQuestiontime(new Date());*/
		Message message = new Message();
		
		if(iCommunityQuestionInfo.addQuestion(communityQuestionInfo) == 1){
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("添加成功");
		}else{
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("添加失败");
		}
		return message;
	}
	
	
	//这里是编辑页面
	@RequestMapping(value = "/admin/community-questions-edit",method = RequestMethod.GET)
	public String question_edit(Model model,String id){	
		
		CommunityQuestionInfo communityQuestion = iCommunityQuestionInfo.selectQuestionById(id);
	    
		//转换日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String normalTime = sdf.format(communityQuestion.getQuestiontime());
		
		model.addAttribute("normalTime", normalTime);
		model.addAttribute("communityQuestion",communityQuestion);
		return "admin/comunnity/community_questions_edit";
	}
	
	//更新数据库
	@RequestMapping(value = "/admin/community-questions-update",method = RequestMethod.POST)
	public @ResponseBody Message question_update(@RequestBody CommunityQuestionInfo communityQuestion){
        Message message = new Message();
		if(iCommunityQuestionInfo.updateQuestionById(communityQuestion) == 1){
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("更新成功");
		}else{
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("更新失败");
		}
		return message;
	}
	

}
