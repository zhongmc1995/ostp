package com.peace.ostp.persistence;

import java.util.List;

import com.peace.ostp.domain.BasicSport;

public interface BasicSportMapper {
    int deleteByPrimaryKey(String sportid);

    int insert(BasicSport basicSport);

    int insertSelective(BasicSport basicSport);

    BasicSport selectByPrimaryKey(String sportid);

    int updateByPrimaryKeySelective(BasicSport basicSport);

    int updateByPrimaryKey(BasicSport basicSport);

	List<BasicSport> getAllSport();
}
