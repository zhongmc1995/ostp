package com.peace.ostp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.persistence.InfoFirstLevelTypeMapper;
import com.peace.ostp.service.IInfoFirstLevelType;

@Service
public class FirstLevelTypeServiceImpl implements IInfoFirstLevelType {
	
	@Autowired
	private InfoFirstLevelTypeMapper infoFirstLevelTypeMapper;

	/**
	 * 获取资讯一级类型，并且存进Map集合
	 */
	@Override
	public List<Map<String, String>> getAllFirstLevelType() {
		List<Map<String, String>> map =null;
		try {
			map = infoFirstLevelTypeMapper.getAllFirstLevelType();
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
		return map;
	}
}
