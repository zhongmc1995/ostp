package com.peace.ostp.security;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.peace.ostp.domain.Role;

/**
 * @Project: YCIG_EXTRONLINE从业人员考试系统后台管理
 * @Title: UserInfo
 * @Description: 用户信息表
 * @author: lijz
 * @date :2016年2月18日 下午3:57:34
 * @Copyright: Copyright (c) 2016
 * @version V1.0
 */
public class UserInfo extends User {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String userid;
	private List<Role> roleList;
	private String userName;
	private String rolesName;
	private String enabled;

	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getRolesName() {
		return rolesName;
	}

	public void setRolesName(String rolesName) {
		this.rolesName = rolesName;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String string) {
		this.userid = string;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public UserInfo(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		// TODO Auto-generated constructor stub
	}

}
