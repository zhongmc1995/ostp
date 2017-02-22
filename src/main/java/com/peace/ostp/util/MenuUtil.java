package com.peace.ostp.util;

import java.util.List;

import com.peace.ostp.domain.Menu;
import com.peace.ostp.service.IMenu;

public class MenuUtil {
	private IMenu iMenu;
	
	public IMenu getiMenu() {
		return iMenu;
	}

	public void setiMenu(IMenu iMenu) {
		this.iMenu = iMenu;
	}

	// 重上往下递归遍历
	public Menu recursiveTree(int cid) {
		Menu node = iMenu.getMenuById(cid);
		List<Menu> childTreeNodes = iMenu.getMenusByMenuId(cid);
		// 遍历子节点
		for (Menu child : childTreeNodes) {
			Menu n = recursiveTree(child.getId()); // 递归
			node.getChildren().add(n);
		}
		return node;
	}

	// 重上往下递归遍历
	//list为该角色对应的所有菜单
	public Menu recursiveTree(int cid, List<Menu> list) {
		Menu node = iMenu.getMenuById(cid);
		List<Menu> childTreeNodes = iMenu.getMenusByMenuId(cid);
		// 遍历子节点
		for (Menu child : childTreeNodes) {
			Menu n = recursiveTree(child.getId()); // 递归
			if (isContainMenu(n, list)) {
				node.getChildren().add(n);
			}
		}
		return node;
	}
	
	public boolean isContainMenu(Menu menu, List<Menu> menuList) {
		if (menu != null && menuList != null) {
			for (Menu menuItem : menuList) {
				if (menuItem.getId() == menu.getId()) {
					return true;
				}
			}
		}
		return false;
	}
}
