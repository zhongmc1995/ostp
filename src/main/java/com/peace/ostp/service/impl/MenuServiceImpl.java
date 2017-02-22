package com.peace.ostp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.Menu;
import com.peace.ostp.persistence.MenuMapper;
import com.peace.ostp.service.IMenu;

@Service
public class MenuServiceImpl implements IMenu {

	@Autowired
	private MenuMapper menuMapper;

	

	@Override
	public List<Menu> getAllMenu() {
		// TODO Auto-generated method stub
		List<Menu> list = menuMapper.getAllMenu();
		return list;
	}

	@Override
	public List<Menu> getPageMenu(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		System.out.println(menuMapper.getPageMenu(map));
		return menuMapper.getPageMenu(map);
	}

	@Override
	public int getTotalRecord() {
		// TODO Auto-generated method stub
		return menuMapper.getTotalRecord();
	}

	@Override
	public int insertMenu(Menu menu) {
		return menuMapper.insertMenu(menu);
	}

	@Override
	public int updateMenuChildrenids(Menu menu) {
		// TODO Auto-generated method stub
		return menuMapper.updateMenuChildrenids(menu);
	}

	

	@Override
	public int deleteMenuById(String id) {
		// TODO Auto-generated method stub
		return menuMapper.deleteMenuById(id);
	}

	@Override
	public Menu getMenuById(int id) {
		// TODO Auto-generated method stub
		return menuMapper.getMenuById(id);
	}

	@Override
	public List<Menu> getMenusByMenuId(int menuId) {
		// TODO Auto-generated method stub
		return menuMapper.getMenusByMenuId(menuId);
	}

	@Override
	public void updateMenu(Menu menu) {
		// TODO Auto-generated method stub
		menuMapper.updateMenu(menu);
	}

	


}
