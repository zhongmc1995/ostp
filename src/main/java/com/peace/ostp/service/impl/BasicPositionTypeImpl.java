package com.peace.ostp.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.PositionTypeInfo;
import com.peace.ostp.persistence.PositionTypeInfoMapper;
import com.peace.ostp.service.IBasicPositionType;

@Service
public class BasicPositionTypeImpl implements IBasicPositionType {
	
	@Autowired
	public PositionTypeInfoMapper positionTypeInfoMapper;
	@Override
	public List<PositionTypeInfo> getAllPositionType() {
		// TODO Auto-generated method stub
		List<PositionTypeInfo> positionTypeInfoList=new ArrayList<PositionTypeInfo>();
		positionTypeInfoList=	positionTypeInfoMapper.getAllPositionType();
		return positionTypeInfoList;
	}
	@Override
	public boolean insertPositiontype(PositionTypeInfo positionTypeInfo) {
		// TODO Auto-generated method stub
		if (positionTypeInfoMapper.insert(positionTypeInfo)==1) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public boolean deleteByPrimaryKey(String positiontypeid) {
		// TODO Auto-generated method stub
		if (positionTypeInfoMapper.deleteByPrimaryKey(positiontypeid)==1) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public int updatePositionType(PositionTypeInfo positionTypeInfo) {
		// TODO Auto-generated method stub
		return positionTypeInfoMapper.updateByPrimaryKey(positionTypeInfo);
	}
}
