package com.peace.ostp.service;

import java.util.List;

import com.peace.ostp.domain.Menu;
import com.peace.ostp.domain.RoleMenu;

public interface IRoleMenu {
	public List<Menu> getMenusByRoleId(String RoleId);

	public void deleteOneByMenuId(String menuId);

	public void insert(RoleMenu roleMenu);

	public void deleteByRoleId(String roleId);
}
