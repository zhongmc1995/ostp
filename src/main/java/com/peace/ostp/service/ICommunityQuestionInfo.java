package com.peace.ostp.service;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.CommunityQuestionInfo;


public interface ICommunityQuestionInfo {
	
	public List<CommunityQuestionInfo> getAllQuestions();
	
	public int delQuestionById(String id);
	
	public int addQuestion(CommunityQuestionInfo communityquestioninfo);
	
	public int updateQuestionById(CommunityQuestionInfo communityquestioninfo);
	
	public int selectAllQuestionsCount(Map<String, Object> map);
	
	public CommunityQuestionInfo selectQuestionById(String id);
	
	 public List<CommunityQuestionInfo> selectAllQuestions(Map<String, Object> map);

}
