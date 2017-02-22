package com.peace.ostp.service;

import java.util.List;

import com.peace.ostp.domain.Role;

public interface IRole {

	List<Role> getAllRole();
	int insertRole(Role role);
	void deleteRoleById(String id);
	Role getRoleById(String id);
	void update(Role role);

}
