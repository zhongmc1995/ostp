package com.peace.ostp.security;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.peace.ostp.domain.Role;
import com.peace.ostp.domain.User;
import com.peace.ostp.persistence.UserMapper;
import com.peace.ostp.persistence.UserRoleMapper;

/*import com.extr.controller.ExamController;
import com.extr.domain.Role;
import com.extr.domain.User;
import com.extr.persistence.UserMapper;*/

/**
 * @Project: YCIG_EXTRONLINE从业人员考试系统后台管理
 * @Title: UserDetailsServiceImpl
 * @Description: 用户详细信息实现类
 * @author: lijz
 * @date :2016年2月18日 下午4:08:37
 * @Copyright: Copyright (c) 2016
 * @version V1.0
 */
//@Component 对那些比较中立的类进行注释
//@Component泛指组件，当组件不好归类的时候，我们可以使用这个注解进行标注。
@Component("userDetailsServiceImpl")
public class UserDetailsServiceImpl implements UserDetailsService {  

	private UserInfo userInfo;
	
    //@Autowired的用法和作用这个注解就是spring可以自动帮你把bean里面引用的对象的setter/getter方法省略，它会自动帮你set/get.

	@Autowired
	public UserMapper userMapper;

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		User user = userMapper.getUserByName(username);
		if (user == null)
			throw new UsernameNotFoundException("user not found!");
		List<Role> roleList = userMapper.getRoleListByUserId(user.getUserid());
		 
		user.setRoleListStack(roleList);
		String roles = "";
		String rolesName = "";
		for (int i = 0; i < roleList.size(); i++) {
			roles += roleList.get(i).getAuthority() + ",";
			rolesName += roleList.get(i).getName() + ",";
		}
		
		roles = roles.substring(0, roles.length() - 1);
		rolesName = rolesName.substring(0, rolesName.length() - 1);
		List<GrantedAuthority> authorities = AuthorityUtils.commaSeparatedStringToAuthorityList(roles);
		userInfo = new UserInfo(username, user.getUserpsw(), user.getEnabled().equals("1"), true, true, true, authorities);
		userInfo.setRoleList(roleList);
		userInfo.setUserid(user.getUserid());
		userInfo.setRolesName(rolesName);
		userInfo.setEnabled(user.getEnabled());
		userInfo.setUserName(user.getUsername());

		return userInfo;
	}

	/**
	 * 日志
	 */
	private static Logger log = Logger.getLogger(UserDetailsServiceImpl.class);

}
