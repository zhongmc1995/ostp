package com.peace.ostp.persistence;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.BasicEquipType;
import com.peace.ostp.domain.BasicSportType;
import com.peace.ostp.domain.Equip;

public interface EquipMapper {
   

    

    int insertSelective(Equip record);
    /*
     * 查询一条
     */
    public Equip selectByPrimaryKey(String equipid);

    int updateByPrimaryKeySelective(Equip record);


    /*
     * 查询全部的equip
     */
    public List<Equip> selectAllEquip(Map<String, Object> map);
    /*
     * 获取equip总条数
     */
    public int selectAllEquipCount(Map<String, Object> map);
    /*
     * 使用ID删除equip
     */
    public int deleteByPrimaryKey(String equipid);
    /*
     * 插入一条equip
     */
    public int insert(Equip equip);
    /*
     * 更新一条equip
     */
    public int updateByPrimaryKey(Equip equip);
    
}