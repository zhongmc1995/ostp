package com.peace.ostp.persistence;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.InfoSecondLevelType;

public interface InfoSecondLevelTypeMapper {
    int deleteByPrimaryKey(String secondlevelinfotypeid);

    int insert(InfoSecondLevelType record);

    int insertSelective(InfoSecondLevelType record);

    InfoSecondLevelType selectByPrimaryKey(String secondlevelinfotypeid);

    int updateByPrimaryKeySelective(InfoSecondLevelType record);

    int updateByPrimaryKey(InfoSecondLevelType record);
    
    List<Map<String, String>> getSecondLevelTypeByFirstID(String firstLevelTypeID);
    
    List<Map<String, String>> getAllSecondLevelType();
    
    List<Map<String, String>> getSecondLevelTypeForFirstLevel();
}