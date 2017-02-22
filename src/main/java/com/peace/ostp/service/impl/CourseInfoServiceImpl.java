package com.peace.ostp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.CourseInfo;
import com.peace.ostp.persistence.CourseInfoMapper;
import com.peace.ostp.service.ICourseInfoService;

@Service
public class CourseInfoServiceImpl implements ICourseInfoService {

	@Autowired
	private CourseInfoMapper courseInfoMapper;

	@Override
	public int Counts(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return courseInfoMapper.Counts(map);
	}
	@Override
	public List<CourseInfo> GetAllCourseInfo(Map<String, Object> map) {
		return courseInfoMapper.GetAllCourseInfo(map);
	}

	@Override
	public int deleteByPrimaryKey(String courseid) {
		return courseInfoMapper.deleteByPrimaryKey(courseid);
	}

	@Override
	public int insert(CourseInfo courseInfo) {
		// TODO Auto-generated method stub
		return courseInfoMapper.insert(courseInfo);
	}

	@Override
	public int insertSelective(CourseInfo courseInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CourseInfo selectByPrimaryKey(String courseid) {
		// TODO Auto-generated method stub
		return courseInfoMapper.selectByPrimaryKey(courseid);
	}

	@Override
	public int updateByPrimaryKeySelective(CourseInfo courseInfo) {
		// TODO Auto-generated method stub
		return courseInfoMapper.updateByPrimaryKey(courseInfo);
	}

	@Override
	public int updateByPrimaryKey(CourseInfo courseInfo) {
		// TODO Auto-generated method stub
		return courseInfoMapper.updateByPrimaryKey(courseInfo);
	}
}
