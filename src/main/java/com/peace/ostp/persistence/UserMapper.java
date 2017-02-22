package com.peace.ostp.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peace.ostp.domain.Role;
import com.peace.ostp.domain.User;
import com.peace.ostp.util.Page;

public interface UserMapper {
    int deleteByPrimaryKey(String userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	void updateUser(User user, String oldPassword);

	List<User> getSearchUserList(Page<User> page, String username);

	List<User> getPageRecord(Page<User> page);

	User getUserById(String user_id);

	User getUserByName(String username);

	List<Role> getRoleListByUserId(String userid);
	int getTotalRecord();

	void updatePsw(@Param("userid") String userid, @Param("userpsw") String resultPassword);

	List<User> getAllUser();
}