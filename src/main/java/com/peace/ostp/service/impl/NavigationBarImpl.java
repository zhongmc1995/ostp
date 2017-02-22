package com.peace.ostp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.NavigationBar;
import com.peace.ostp.persistence.NavigationBarMapper;
import com.peace.ostp.service.INavigationBar;

@Service
public class NavigationBarImpl implements INavigationBar {
	
	@Autowired
	private NavigationBarMapper navigationBarMapper;
	@Override
	public void AddNavigationBar(NavigationBar navigationBar) {
		// TODO Auto-generated method stub
		navigationBarMapper.insert(navigationBar);
	}
	@Override
	public List<NavigationBar> getAllNavigationBar() {
		// TODO Auto-generated method stub
		return navigationBarMapper.getAllNavigationBar();
	}
	@Override
	public void Update(NavigationBar navigationBar) {
		// TODO Auto-generated method stub
		navigationBarMapper.update(navigationBar);
	}
	@Override
	public void deleteNavigationBar(int id) {
		// TODO Auto-generated method stub
		navigationBarMapper.delete(id);
	}
	
}
