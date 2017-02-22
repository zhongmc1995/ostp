package com.peace.ostp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.BasicInfo;
import com.peace.ostp.persistence.BasicInfoMapper;
import com.peace.ostp.service.IBasicInfo;
import com.peace.ostp.util.Page;
import com.sun.star.uno.RuntimeException;

@Service
public class InfoServiceImpl implements IBasicInfo {

	@Autowired
	public BasicInfoMapper basicInfoMapper;
	
	

	@Override
	public void addInfo(BasicInfo basicInfo) {
		// TODO Auto-generated method stub
		try {
			basicInfoMapper.insert(basicInfo);

		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public void deleteInfo(String infoid) {
		// TODO Auto-generated method stub
		try {
			basicInfoMapper.deleteByPrimaryKey(infoid);

		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public List<BasicInfo> getAll(Page<BasicInfo> page) {
		// TODO Auto-generated method stub
		List<BasicInfo> basicInfoLists =null;
		try {
			 basicInfoLists = basicInfoMapper.selectAll();
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
		return basicInfoLists;
	}

	@Override
	public BasicInfo selectBasicInfoById(String basicinfoId) {
		// TODO Auto-generated method stub
		BasicInfo basicInfo =null;
		try {
			basicInfo = basicInfoMapper.selectByInfoId(basicinfoId);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
		return basicInfo;
	}

	@Override
	public void updateInfo(BasicInfo basicInfo) {
		// TODO Auto-generated method stub
		try {
			basicInfoMapper.updateByPrimaryKeySelective(basicInfo);

		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public List<BasicInfo> getPageRecord(Map<String, Integer> page) {
		// TODO Auto-generated method stub
		return basicInfoMapper.getPageRecord(page);
	}


	@Override
	public List<BasicInfo> searchByInfo(BasicInfo basicInfo,Map<String, Integer> map) {
		// TODO Auto-generated method stub
		List<BasicInfo> basicInfoLists =null;
		try {
			 basicInfoLists = basicInfoMapper.searchByInfo(basicInfo,map);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
		return basicInfoLists;
	}

	@Override
	public int getTotalRecord(BasicInfo basicInfo) {
		int totalRecord=0;
		try{
			totalRecord=basicInfoMapper.getTotalRecord(basicInfo);
		}catch(Exception e){
			throw new RuntimeException("获取数据数量失败"+e.getMessage());
		}
		return totalRecord;
	}

}
