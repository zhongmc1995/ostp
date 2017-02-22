package com.peace.ostp.domain;


/**
 * @classname NavigationBar
 * @author ZMC
 * @time 2016-12-26
 * 网站首页导航栏按钮
 */
public class NavigationBar {
	private int id;
	private String menuName;
	private String href;
	private int sequence;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	
}
