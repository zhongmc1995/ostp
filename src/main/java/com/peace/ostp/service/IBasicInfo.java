package com.peace.ostp.service;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.BasicInfo;
import com.peace.ostp.domain.User;
import com.peace.ostp.util.Page;

public interface IBasicInfo {

	void addInfo(BasicInfo basicInfo);
	
	void deleteInfo(String infoid);
	
	void updateInfo(BasicInfo basicInfo);
	
	BasicInfo selectBasicInfoById(String basicinfoId);
	
	List<BasicInfo> getAll(Page<BasicInfo> page);
	
	int getTotalRecord(BasicInfo basicInfo);
	
	List<BasicInfo> getPageRecord(Map<String, Integer> page);
	
	List<BasicInfo> searchByInfo(BasicInfo basicInfo,Map<String, Integer> map);
	
}
