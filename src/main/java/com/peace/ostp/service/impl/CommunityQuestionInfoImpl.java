package com.peace.ostp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.CommunityQuestionInfo;
import com.peace.ostp.persistence.CommunityQuestionInfoMapper;
import com.peace.ostp.service.ICommunityQuestionInfo;

@Service
public class CommunityQuestionInfoImpl implements ICommunityQuestionInfo {

	
	@Autowired
	CommunityQuestionInfoMapper communityQuestionInfoMapper;
	
	@Override
	public List<CommunityQuestionInfo> getAllQuestions() {
		// TODO Auto-generated method stub
		return communityQuestionInfoMapper.getAllQuestions();
	}

	@Override
	public int delQuestionById(String id) {
		// TODO Auto-generated method stub
		return communityQuestionInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int addQuestion(CommunityQuestionInfo communityquestioninfo) {
		// TODO Auto-generated method stub
		return communityQuestionInfoMapper.insert(communityquestioninfo);
	}

	@Override
	public int updateQuestionById(CommunityQuestionInfo communityquestioninfo) {
		// TODO Auto-generated method stub
		return communityQuestionInfoMapper.updateByPrimaryKey(communityquestioninfo);
	}

	@Override
	public int selectAllQuestionsCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return communityQuestionInfoMapper.selectAllQuestionsCount(map);
	}

	@Override
	public CommunityQuestionInfo selectQuestionById(String id) {
		// TODO Auto-generated method stub
		return communityQuestionInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<CommunityQuestionInfo> selectAllQuestions(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return communityQuestionInfoMapper.selectAllEquip(map);
	}

	
}
