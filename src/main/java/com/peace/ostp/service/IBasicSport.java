package com.peace.ostp.service;

import java.util.List;

import com.peace.ostp.domain.BasicSport;

public interface IBasicSport {

	List<BasicSport> getAllSport();

	int insertSport(BasicSport basicSport);

	int deleteByPrimaryKey(String sportid);

	int updatesport(BasicSport basicSport);

}
