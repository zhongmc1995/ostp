package com.peace.ostp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.BasicEquipType;
import com.peace.ostp.persistence.BasicEquipTypeMapper;
import com.peace.ostp.service.IBasicEquipType;
import com.peace.ostp.util.Page;

@Service
public class BasicEquipTypeImpl implements IBasicEquipType {

	@Autowired
	public BasicEquipTypeMapper basicEquipTypeMapper;
	
	/*@Override
	public int deleteEquipTypeByid(String equiptypeid) {
		return basicEquipTypeMapper.deleteEquipTypeByid(equiptypeid);
	}*/
	@Override
	public int deleteByPrimaryKey(String equiptypeid) {
		return basicEquipTypeMapper.deleteByPrimaryKey(equiptypeid);
	}
	@Override
	public int insertEquipType(BasicEquipType basicEquipType) {
		// TODO Auto-generated method stub
		return basicEquipTypeMapper.insert(basicEquipType);
	}

	@Override
	public BasicEquipType getEquipTypeById(String equiptypeid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BasicEquipType> getAllEquipType() {
		// TODO Auto-generated method stub
		List<BasicEquipType> basicEquipTypeList=new ArrayList<BasicEquipType>();
		basicEquipTypeList=	basicEquipTypeMapper.getAllEquipType();
		return basicEquipTypeList;
	}

	@Override
	public int updateEquipType(BasicEquipType basicEquipType) {
		// TODO Auto-generated method stub
		return basicEquipTypeMapper.updateByPrimaryKey(basicEquipType);
	}


	@Override
	public List<BasicEquipType> getSearchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String selectEquipType(String equiptypeid) {
		// TODO Auto-generated method stub
		return basicEquipTypeMapper.selectEquipType(equiptypeid);
	}

}
