package com.peace.ostp.service.impl;

import java.util.List;
import java.util.Map;

import org.bouncycastle.jce.provider.JDKDSASigner.ecDSA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.BasicEquipType;
import com.peace.ostp.domain.BasicSportType;
import com.peace.ostp.domain.Equip;
import com.peace.ostp.persistence.BasicEquipTypeMapper;
import com.peace.ostp.persistence.BasicSportTypeMapper;
import com.peace.ostp.persistence.EquipMapper;
import com.peace.ostp.service.IEquip;

@Service
public class EquipSerivceImpl implements IEquip{

	@Autowired
	private EquipMapper equipMapper;
	
	@Autowired
	private BasicEquipTypeMapper equipTypeMapper;
	
	@Autowired
	private BasicSportTypeMapper sportTypeMapper;
	
	@Override
	public List<Equip> selectAllEquip(Map<String, Object> map) {
		List<Equip> equips = equipMapper.selectAllEquip(map);
		return equips;
	}

	@Override
	public int selectAllEquipCount(Map<String, Object> map) {
		int totalEquip = equipMapper.selectAllEquipCount(map);
		return totalEquip;
	}

	@Override
	public int deleteByPrimaryKey(String equipid) {
		int  result = equipMapper.deleteByPrimaryKey(equipid);
		return result;
	}

	@Override
	public int insert(Equip equip) {
		int result = equipMapper.insert(equip);
		return result;
	}

	@Override
	public List<BasicSportType> findAllSportType() {
		List<BasicSportType> sportTypes = sportTypeMapper.getAllSportType();
		return sportTypes;
	}

	@Override
	public List<BasicEquipType> findAllEquipType() {
		List<BasicEquipType> equipTypes = equipTypeMapper.getAllEquipType();
		return equipTypes;
	}

	@Override
	public int updateByPrimaryKey(Equip equip) {
		int result = equipMapper.updateByPrimaryKey(equip);
		return result;
	}

	@Override
	public int insertSelective(Equip record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Equip selectByPrimaryKey(String equipid) {
		Equip equip = equipMapper.selectByPrimaryKey(equipid);
		return equip;
	}

	@Override
	public int updateByPrimaryKeySelective(Equip record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String selectEquipType(String equiptypeid) {
		// TODO Auto-generated method stub
		return equipTypeMapper.selectEquipType(equiptypeid);
	}

	@Override
	public String selectSportType(String sporttypeid) {
		// TODO Auto-generated method stub
		return sportTypeMapper.selectSportType(sporttypeid);
	}

}
