package com.peace.ostp.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.BasicSport;
import com.peace.ostp.persistence.BasicSportMapper;
import com.peace.ostp.service.IBasicSport;

@Service
public class BasicSportImpl implements IBasicSport {
	
	@Autowired
	public BasicSportMapper basicSportMapper;
	
	@Override
	public List<BasicSport> getAllSport() {
		// TODO Auto-generated method stub
		List<BasicSport> basicSportList=new ArrayList<BasicSport>();
		basicSportList=	basicSportMapper.getAllSport();
		return basicSportList;
	}
	@Override
	public int insertSport(BasicSport basicSport) {
		return basicSportMapper.insert(basicSport);
	}
	@Override
	public int deleteByPrimaryKey(String sportid) {
		// TODO Auto-generated method stub
		return basicSportMapper.deleteByPrimaryKey(sportid);
	}

	@Override
	public int updatesport(BasicSport basicSport) {
		// TODO Auto-generated method stub
		return basicSportMapper.updateByPrimaryKey(basicSport);
	}
}
