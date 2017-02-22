package com.peace.ostp.persistence;


import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.Menu;

public interface MenuMapper {
	
	public Menu getMenuById(int id);
	public List<Menu> getMenusByMenuId(int MenuId);
    public List<Menu> getAllMenu();
    public List<Menu> getPageMenu(Map<String, Integer> map);
    public int getTotalRecord();
    public int insertMenu(Menu menu);
    public int updateMenuChildrenids(Menu menu);
    public int deleteMenuById(String id);
	public List<Menu> getParentMenuByParentId(int i);
	public void updateMenu(Menu menu);
}