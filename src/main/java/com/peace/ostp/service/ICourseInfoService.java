package com.peace.ostp.service;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.CourseInfo;

public interface ICourseInfoService {
	
	int Counts(Map<String,Object> map);
	
	List<CourseInfo> GetAllCourseInfo(Map<String,Object> map);
	
    int deleteByPrimaryKey(String courseid);

    int insert(CourseInfo courseInfo);

    int insertSelective(CourseInfo courseInfo);

    CourseInfo selectByPrimaryKey(String courseid);

    int updateByPrimaryKeySelective(CourseInfo courseInfo);

    int updateByPrimaryKey(CourseInfo courseInfo);
}
