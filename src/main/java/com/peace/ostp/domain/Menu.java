package com.peace.ostp.domain;

import java.util.ArrayList;
import java.util.List;

public class Menu {
    private int id;

    private String menuname;

    private int parentid;

    private String href;

    private String menuclass;

    private String icon;
    
    private int sequence;
    
    public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	private List<Menu> children = new ArrayList<Menu>();

    public List<Menu> getChildren() {
		return children;
	}

	public void setChildren(List<Menu> children) {
		this.children = children;
	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMenuname() {
        return menuname;
    }

    public void setMenuname(String menuname) {
        this.menuname = menuname;
    }

   

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    

    public int getParentid() {
		return parentid;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
	}

	public String getMenuclass() {
		return menuclass;
	}

	public void setMenuclass(String menuclass) {
		this.menuclass = menuclass;
	}

	public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }
}