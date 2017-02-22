package com.peace.ostp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.BasicPhotoStyle;
import com.peace.ostp.persistence.BasicPhotoStyleMapper;
import com.peace.ostp.service.IBasicPhotoStyle;

@Service
public class BasicPhotoStyleImpl implements IBasicPhotoStyle {
	
	@Autowired
	public BasicPhotoStyleMapper basicPhotoStyleMapper;
	@Override
	public List<BasicPhotoStyle> getAllPhotoStyle() {
		// TODO Auto-generated method stub
		List<BasicPhotoStyle> basicPhotoStyleList=new ArrayList<BasicPhotoStyle>();
		basicPhotoStyleList=	basicPhotoStyleMapper.getAllPhotoStyle();
		return basicPhotoStyleList;
	}
	@Override
	public boolean insertPhotoStyle(BasicPhotoStyle basicPhotoStyle) {
		// TODO Auto-generated method stub
		if (basicPhotoStyleMapper.insert(basicPhotoStyle)==1) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public boolean deleteByPrimaryKey(String photostyleid) {
		// TODO Auto-generated method stub
		if (basicPhotoStyleMapper.deleteByPrimaryKey(photostyleid)==1) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public int updatePhotoStyle(BasicPhotoStyle basicPhotoStyle) {
		// TODO Auto-generated method stub
		return basicPhotoStyleMapper.updateByPrimaryKey(basicPhotoStyle);
	}
	@Override
	public List<Map<String, String>> getAllPhotoStyleStr() {
		// TODO Auto-generated method stub
					List<Map<String,String>> map=null;
					try {
						map = basicPhotoStyleMapper.getAllPhotoStyleStr();
					} catch (Exception e) {
						if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
							throw new RuntimeException("duplicate-username");
						else
							throw new RuntimeException(e.getMessage());
					}
					return map;
	}
}
