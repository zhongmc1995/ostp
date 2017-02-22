package com.peace.ostp.persistence;

import com.peace.ostp.domain.EquipValuate;

public interface EquipValuateMapper {
    int deleteByPrimaryKey(String evaluteid);

    int insert(EquipValuate record);

    int insertSelective(EquipValuate record);

    EquipValuate selectByPrimaryKey(String evaluteid);

    int updateByPrimaryKeySelective(EquipValuate record);

    int updateByPrimaryKey(EquipValuate record);
}