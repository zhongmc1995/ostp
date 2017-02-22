package com.peace.ostp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.persistence.InfoSecondLevelTypeMapper;
import com.peace.ostp.service.IInfoSecondLevelType;

@Service
public class SecondLevelTypeServiceImpl implements IInfoSecondLevelType {

	@Autowired
	private InfoSecondLevelTypeMapper infoSecondLevelTypeMapper;
	/**
	 * 获取资讯一级类型，并且存进Map集合
	 */
	@Override
	public List<Map<String, String>> getSecondLevelTypeByFirstID(
			String firstLevelTypeID) {
		List<Map<String, String>> map =null;
		try {
			map = infoSecondLevelTypeMapper.getSecondLevelTypeByFirstID(firstLevelTypeID);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
		return map;
	}
	@Override
	public List<Map<String, String>> getAllSecondLevelType() {
		List<Map<String, String>> map = null;
		try {
			map = infoSecondLevelTypeMapper.getAllSecondLevelType();
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
		return map;
	}
	@Override
	public List<Map<String, String>> getSecondLevelTypeForFirstLevel() {
		List<Map<String, String>> map = null;
		try {
			map = infoSecondLevelTypeMapper.getSecondLevelTypeForFirstLevel();
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
		return map;
	}


}
