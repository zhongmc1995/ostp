package com.peace.ostp.service;

import java.util.List;

import com.peace.ostp.domain.NavigationBar;

public interface INavigationBar {
	void AddNavigationBar(NavigationBar navigationBar);

	List<NavigationBar> getAllNavigationBar();

	void Update(NavigationBar navigationBar);

	void deleteNavigationBar(int id);
}
