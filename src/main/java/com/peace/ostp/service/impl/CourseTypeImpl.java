package com.peace.ostp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.CourseType;
import com.peace.ostp.persistence.CourseTypeMapper;
import com.peace.ostp.service.ICourseType;

@Service
public class CourseTypeImpl implements ICourseType {

	@Autowired
	private CourseTypeMapper courseTypeMapper;
	
	@Override
	public int deleteByPrimaryKey(String coursetypeid) {
		// TODO Auto-generated method stub
		return courseTypeMapper.deleteByPrimaryKey(coursetypeid);
	}

	@Override
	public int insert(CourseType courseType) {
		// TODO Auto-generated method stub
		return courseTypeMapper.insert(courseType);
	}

	@Override
	public int insertSelective(CourseType courseType) {
		// TODO Auto-generated method stub
		return courseTypeMapper.insertSelective(courseType);
	}

	@Override
	public CourseType selectByPrimaryKey(String coursetypeid) {
		// TODO Auto-generated method stub
		return courseTypeMapper.selectByPrimaryKey(coursetypeid);
	}

	@Override
	public int updateByPrimaryKeySelective(CourseType courseType) {
		// TODO Auto-generated method stub
		return courseTypeMapper.updateByPrimaryKeySelective(courseType);
	}

	@Override
	public int updateByPrimaryKey(CourseType courseType) {
		// TODO Auto-generated method stub
		return courseTypeMapper.updateByPrimaryKey(courseType);
	}

	@Override
	public List<CourseType> getAllCourseType() {
		// TODO Auto-generated method stub
		return courseTypeMapper.getAllCourseType();
	}

	
}
