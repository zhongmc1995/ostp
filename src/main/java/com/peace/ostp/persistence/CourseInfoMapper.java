package com.peace.ostp.persistence;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.CourseInfo;

public interface CourseInfoMapper {
	
	int Counts(Map<String,Object> map);
	
	List<CourseInfo> GetAllCourseInfo(Map<String,Object> map);
	
    int deleteByPrimaryKey(String courseid);

    int insert(CourseInfo record);

    int insertSelective(CourseInfo record);

    CourseInfo selectByPrimaryKey(String courseid);

    int updateByPrimaryKeySelective(CourseInfo record);

    int updateByPrimaryKey(CourseInfo record);
}