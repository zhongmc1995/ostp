package com.peace.ostp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.Role;
import com.peace.ostp.persistence.RoleMapper;
import com.peace.ostp.service.IRole;

@Service
public class RoleServiceImpl implements IRole {
	
	@Autowired
	RoleMapper roleMapper;

	@Override
	public List<Role> getAllRole() {
		// TODO Auto-generated method stub
		return roleMapper.getAllRole();
	}

	@Override
	public int insertRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.insert(role);
	}

	@Override
	public void deleteRoleById(String id) {
		// TODO Auto-generated method stub
		roleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Role getRoleById(String id) {
		// TODO Auto-generated method stub
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public void update(Role role) {
		// TODO Auto-generated method stub
		roleMapper.updateByPrimaryKey(role);
	}

	

}
