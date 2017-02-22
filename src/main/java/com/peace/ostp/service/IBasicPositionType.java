package com.peace.ostp.service;

import java.util.List;

import com.peace.ostp.domain.PositionTypeInfo;

public interface IBasicPositionType {

	List<PositionTypeInfo> getAllPositionType();

	boolean insertPositiontype(PositionTypeInfo positionTypeInfo);

	boolean deleteByPrimaryKey(String positiontypeid);

	int updatePositionType(PositionTypeInfo positionTypeInfo);

}
