package com.peace.ostp.persistence;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.BasicSprotType;

public interface BasicSprotTypeMapper {
    int deleteByPrimaryKey(String sporttypeid);

    int insert(BasicSprotType record);

    int insertSelective(BasicSprotType record);

    BasicSprotType selectByPrimaryKey(String sporttypeid);

    int updateByPrimaryKeySelective(BasicSprotType record);

    int updateByPrimaryKey(BasicSprotType record);
    
    List<Map<String, String>> getAllSportType();
}