package com.peace.ostp.persistence;

import java.util.List;

import com.peace.ostp.domain.Role;
import com.peace.ostp.domain.UserRole;

public interface UserRoleMapper {
    int deleteByPrimaryKey(String roleid);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(String roleid);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
    
    List<Role> getRoleListByUserId(String userid);

	void deleteOneByUserId(String userId);

	void updateByUserId(UserRole userRole);
}