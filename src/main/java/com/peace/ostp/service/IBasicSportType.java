package com.peace.ostp.service;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.BasicSportType;


public interface IBasicSportType {
	List<Map<String, String>> SportTypeCombox();
	int delSportType(String id);

	List<BasicSportType> getAllSportType();

	int updateByPrimaryKey(BasicSportType basicSportType);

	int addSportType(BasicSportType basicSportType);
	
	public String selectSportType(String sporttypeid);

}