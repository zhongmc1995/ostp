package com.peace.ostp.persistence;

import java.util.List;

import com.peace.ostp.domain.NavigationBar;


/**
 * @classname NavigationBarMapper
 * @author ZMC
 * @time 2016-12-26
 * 网站首页导航栏按钮dao层
 */
public interface NavigationBarMapper {
	
	void insert(NavigationBar navigationBar);
	
	//按sequence升序查询
	List<NavigationBar> getAllNavigationBar();

	void update(NavigationBar navigationBar);

	void delete(int id);
}
