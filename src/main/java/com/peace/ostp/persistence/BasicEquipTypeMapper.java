package com.peace.ostp.persistence;

import java.util.List;

import com.peace.ostp.domain.BasicEquipType;
import com.peace.ostp.util.Page;

public interface BasicEquipTypeMapper {
    int deleteByPrimaryKey(String equiptypeid);

    int insert(BasicEquipType basicEquipType);

    int insertSelective(BasicEquipType basicEquipType);

    BasicEquipType selectByPrimaryKey(String equiptypeid);

    //int updateByPrimaryKeySelective(BasicEquipType record);

    int updateByPrimaryKey(BasicEquipType basicEquipType);

	int deleteEquipTypeByid(String equiptypeid);

	List<BasicEquipType> getAllEquipType();
	
	public String selectEquipType(String equiptypeid);
}