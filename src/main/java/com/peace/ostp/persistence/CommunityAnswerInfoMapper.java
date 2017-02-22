package com.peace.ostp.persistence;

import com.peace.ostp.domain.CommunityAnswerInfo;

public interface CommunityAnswerInfoMapper {
    int deleteByPrimaryKey(Integer ansid);

    int insert(CommunityAnswerInfo record);

    int insertSelective(CommunityAnswerInfo record);

    CommunityAnswerInfo selectByPrimaryKey(Integer ansid);

    int updateByPrimaryKeySelective(CommunityAnswerInfo record);

    int updateByPrimaryKey(CommunityAnswerInfo record);
}