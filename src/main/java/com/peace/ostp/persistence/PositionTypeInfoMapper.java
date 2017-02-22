package com.peace.ostp.persistence;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.PositionTypeInfo;

public interface PositionTypeInfoMapper {
    int deleteByPrimaryKey(String positiontypeid);

    int insert(PositionTypeInfo positionTypeInfo);

    int insertSelective(PositionTypeInfo positionTypeInfo);

    PositionTypeInfo selectByPrimaryKey(String positiontypeid);

    int updateByPrimaryKeySelective(PositionTypeInfo positionTypeInfo);

    int updateByPrimaryKey(PositionTypeInfo positionTypeInfo);

	List<Map<String, String>> getPositionType();

	List<PositionTypeInfo> getAllPositionType();
}