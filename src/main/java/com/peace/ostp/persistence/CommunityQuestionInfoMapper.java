package com.peace.ostp.persistence;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.CommunityQuestionInfo;

public interface CommunityQuestionInfoMapper {
    public int deleteByPrimaryKey(String questionid);

    public int insert(CommunityQuestionInfo record);

    public int insertSelective(CommunityQuestionInfo record);

    public CommunityQuestionInfo selectByPrimaryKey(String questionid);

    public int updateByPrimaryKeySelective(CommunityQuestionInfo record);

    public int updateByPrimaryKey(CommunityQuestionInfo record);
    
    public List<CommunityQuestionInfo> getAllQuestions();
    
    public int selectAllQuestionsCount(Map<String, Object> map);
    
    public List<CommunityQuestionInfo> selectAllEquip(Map<String, Object> map);
}