package com.peace.ostp.service;

import java.util.List;

import com.peace.ostp.domain.CourseType;

public interface ICourseType {
	
	int deleteByPrimaryKey(String coursetypeid);

    int insert(CourseType record);

    int insertSelective(CourseType record);

    CourseType selectByPrimaryKey(String coursetypeid);

    int updateByPrimaryKeySelective(CourseType record);

    int updateByPrimaryKey(CourseType record);
    
    List<CourseType> getAllCourseType();
}
