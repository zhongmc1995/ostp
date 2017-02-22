package com.peace.ostp.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.peace.ostp.domain.BasicInfo;

public interface BasicInfoMapper {
    int deleteByPrimaryKey(String infoId);

    int insert(BasicInfo record);

    int insertSelective(BasicInfo record);

    BasicInfo selectByInfoId(String infoId);
    
    List<BasicInfo> selectAll();

    int updateByPrimaryKeySelective(BasicInfo record);

    int updateByPrimaryKey(BasicInfo record);
    
    int getTotalRecord(@Param("basicinfo")BasicInfo basicInfo);
    
    List<BasicInfo> getPageRecord(Map<String, Integer> page);
    
    List<BasicInfo> searchByInfo(@Param("basicinfo")BasicInfo  basicInfo,@Param("page")Map<String, Integer> map);
}