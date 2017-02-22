package com.peace.ostp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.Menu;
import com.peace.ostp.domain.RoleMenu;
import com.peace.ostp.persistence.RoleMenuMapper;
import com.peace.ostp.service.IRoleMenu;

@Service
public class RoleMenuServiceImpl implements IRoleMenu {

	@Autowired
	private RoleMenuMapper roleMenuMapper;

	@Override
	public List<Menu> getMenusByRoleId(String RoleId) {
		// TODO Auto-generated method stub
		return roleMenuMapper.getMenusByRoleId(RoleId);
	}

	@Override
	public void deleteOneByMenuId(String menuId) {
		roleMenuMapper.deleteOneByMenuId(menuId);
	}

	@Override
	public void insert(RoleMenu roleMenu) {
		roleMenuMapper.insert(roleMenu);
	}

	@Override
	public void deleteByRoleId(String roleId) {
		roleMenuMapper.deleteByRoleId(roleId);
	}
	
}
