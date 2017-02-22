package com.peace.ostp.persistence;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.BasicSportType;

public interface BasicSportTypeMapper {
    int deleteByPrimaryKey(String sporttypeid);

    int insert(BasicSportType basicSportType);

    int insertSelective(BasicSportType basicSportType);

    BasicSportType selectByPrimaryKey(String sporttypeid);

    int updateByPrimaryKeySelective(BasicSportType basicSportType);

    int updateByPrimaryKey(BasicSportType basicSportType);

	List<BasicSportType> getAllSportType();
	List<Map<String, String>> sportTypeCombox();
	
	public String selectSportType(String sporttypeid);
}