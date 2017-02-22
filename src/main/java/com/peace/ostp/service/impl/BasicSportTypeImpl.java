package com.peace.ostp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.BasicSportType;
import com.peace.ostp.persistence.BasicSportTypeMapper;
import com.peace.ostp.service.IBasicSportType;

@Service
public class BasicSportTypeImpl implements IBasicSportType{

	@Autowired
	public BasicSportTypeMapper basicSportTypeMapper;
	@Override
	public List<BasicSportType> getAllSportType() {
		// TODO Auto-generated method stub
		List<BasicSportType> basicSportTypeList=new ArrayList<BasicSportType>();
		basicSportTypeList=	basicSportTypeMapper.getAllSportType();
		return basicSportTypeList;
	}

	@Override
	public int updateByPrimaryKey(BasicSportType basicSportType) {
		// TODO Auto-generated method stub
		return basicSportTypeMapper.updateByPrimaryKey(basicSportType);
	}

	@Override
	public int delSportType(String id) {
		// TODO Auto-generated method stub
		return basicSportTypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int addSportType(BasicSportType basicSportType) {
		// TODO Auto-generated method stub
		return basicSportTypeMapper.insert(basicSportType);
	}
	
	@Override
	public List<Map<String, String>> SportTypeCombox() {
		List<Map<String, String>> map =null;
		try {
			map = basicSportTypeMapper.sportTypeCombox();
		} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
		}
		return map;
	}

	@Override
	public String selectSportType(String sporttypeid) {
		return basicSportTypeMapper.selectSportType(sporttypeid);
	}

}