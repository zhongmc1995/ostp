package com.peace.ostp.service;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.Menu;

public interface IMenu {
	public Menu getMenuById(int id);
	public List<Menu> getMenusByMenuId(int menuId);
	public List<Menu> getAllMenu();
	public List<Menu> getPageMenu(Map<String, Integer> map);
	public int getTotalRecord();
	public int insertMenu(Menu menu);
	public int updateMenuChildrenids(Menu menu);
	public int deleteMenuById(String id);
	public void updateMenu(Menu menu);
}
