package com.peace.ostp.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.peace.ostp.domain.UserRole;
import com.peace.ostp.persistence.UserRoleMapper;
import com.peace.ostp.service.IUserRole;


@Service
public class UserRoleServiceImpl implements IUserRole {
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Override
	public int inser(UserRole userrole) {
		// TODO Auto-generated method stub
		return userRoleMapper.insert(userrole);
	}
	@Override
	public void deleteOneByUserId(String userId) {
		userRoleMapper.deleteOneByUserId(userId);
	}
	@Override
	public void updateByUserId(UserRole userRole) {
		// TODO Auto-generated method stub
		userRoleMapper.updateByUserId(userRole);
	}

	
}
