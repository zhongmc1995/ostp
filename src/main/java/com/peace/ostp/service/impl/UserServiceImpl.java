package com.peace.ostp.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.peace.ostp.domain.User;
import com.peace.ostp.persistence.UserMapper;
import com.peace.ostp.service.IUser;
import com.peace.ostp.util.Page;

/**
 * @author Ocelot
 * @date 2014年6月8日 下午8:21:31
 */
@Service
public class UserServiceImpl implements IUser {

	@Autowired
	public UserMapper userMapper;

	@Override
	@Transactional
	public String addUser(User user) {
		// TODO Auto-generated method stub
		try {
			String userId = "";
			userMapper.insert(user);
			userId = user.getUserid();
			return userId;
		} catch (Exception e) {
			if(e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else 
				throw new RuntimeException(e.getMessage());
		}
	}
	
	@Override
	public String editUser(User user) {
		// TODO Auto-generated method stub
		try {
			String userId = user.getUserid();
			userMapper.updateByPrimaryKey(user);
			return userId;
		} catch (Exception e) {
			if(e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else 
				throw new RuntimeException(e.getMessage());
		}
	}
	
	@Override
	public void updateUser(User user, String oldPassword) {
		// TODO Auto-generated method stub
		userMapper.updateUser(user, oldPassword);
	}
	public int addAdmin(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<User> getUserListByRoleId(int roleId, Page<User> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserById(String user_id) {
		// TODO Auto-generated method stub
		return userMapper.getUserById(user_id);
	}

	public void disableUser(String user_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> getPageRecord(Page<User> page) {
		// TODO Auto-generated method stub
		List<User> userList = userMapper.getPageRecord(page);
		return userList;
	}

	@Override
	public List<User> getSearchUserList(Page<User> page, String username) {
		// TODO Auto-generated method stub
		List<User> userList = userMapper.getSearchUserList(page, username);
		return userList;
	}

	@Override
	public void modifyPsw(String userid, String resultPassword) {
		// TODO Auto-generated method stub
		userMapper.updatePsw(userid,resultPassword);
		
	}

	@Override
	public int getTotalRecord() {
		// TODO Auto-generated method stub
		return userMapper.getTotalRecord();
	}

	@Override
	public void deleteUser(String userid) {
		userMapper.deleteByPrimaryKey(userid);
		
	}

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return userMapper.getAllUser();
	}

	
	
	
	/*	@Override
	@Transactional
	public int addSubscribe(Subscribe subscribe) {
		// TODO Auto-generated method stub
		try {
			userMapper.insertSubscribe(subscribe);
			
		} catch (Exception e) {
			if(e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else 
				throw new RuntimeException(e.getMessage());
		}
		return 0;
	}

	@Override
	@Transactional
	public void updateSubscribe(Subscribe subscribe) {
		// TODO Auto-generated method stub
		userMapper.updateSubscribe(subscribe,null);
	}

	@Override
	@Transactional
	public Subscribe getSubscribeByUsername(String userName) {
		// TODO Auto-generated method stub
		return userMapper.getSubscribeByUsername(userName);
		
	}
	@Override
	@Transactional
	public List<Subscribe> getAllSubHistoty(Page<Subscribe> page){
		return userMapper.getAllSubHistory(page);
	}
	
	@Override
	@Transactional
	public List<Subscribe> getSubtimeByFieldId(int fieldId){
		return userMapper.getSubtimeByFieldId(fieldId);
	}
	
	@Override
	@Transactional
	public void deleteSubscribeByQSubId(int subId){
		userMapper.deleteSubscribe(subId);
	}
	
	
	@Override
	@Transactional
	public int addUser(User user) {
		try {
			int userId = -1;
			userMapper.insertUser(user);
			userId = user.getId();
			if (user.getRoleListStack() == null)
				userMapper.grantUserRole(userId, 3);
			else
				userMapper.grantUserRole(user.getId(), user.getRoleListStack().get(0).getId());
			
			return userId;
		} catch (Exception e) {
			if(e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else 
				throw new RuntimeException(e.getMessage());
		}
	}
	
	@Override
	@Transactional
	public int addAdmin(User user) {
		try {
			int userId = -1;
			userMapper.insertUser(user);
			userId = user.getId();
			if (user.getRoleListStack() == null)
				userMapper.grantUserRole(userId, 1);
			else
				userMapper.grantUserRole(user.getId(), user.getRoleListStack().get(0).getId());
			
			return userId;
		} catch (Exception e) {
			if(e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else 
				throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public List<User> getUserListByRoleId(int roleId,Page<User> page) {
		// TODO Auto-generated method stub
		List<User> userList = userMapper.getUserListByRoleId(roleId, page);
		return userList;
	}

	@Override
	public void updateUser(User user, String oldPassword) {
		// TODO Auto-generated method stub
		userMapper.updateUser(user, oldPassword);
	}

	@Override
	public User getUserById(int user_id) {
		// TODO Auto-generated method stub
		return userMapper.getUserById(user_id);
	}

	@Override
	public void disableUser(int user_id) {
		// TODO Auto-generated method stub
	}

	@Override
	public int insertAppliction(Application application){
		
		try{
			userMapper.insertApplication(application);
			
		}catch(Exception e){
			if(e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException")){
				throw new RuntimeException("duplicate-username");
			}else
				throw new RuntimeException(e.getMessage());
		}
		return 0;
		
	}

	@Override
	public Application getApplicationByUsername(String userName){
		return userMapper.getApplicationByUserName(userName);
	}

	@Override
	public List<Application> getAllApplication(Page<Application> page){
		return userMapper.getAllApplication(page);
	}
	
	@Override
	public List<Application> getApplicationBySubid(Page<Application> page,int subId){
		return userMapper.getApplicationBySubid(page, subId);
	}
	
	@Override
	public List<Application> getNoPayApplication(Page<Application> page){
		return userMapper.getNoPayApplication(page);
	}
	
	@Override
	public void updateApplyOperator(Application application,String userName){
		userMapper.updateApplyOperator(application, userName);
	}
	
	@Override
	public List<Version> getVersionList(Page<Version> page) {
		// TODO Auto-generated method stub
		List<Version> versionList = userMapper.getVersionList(page);
		return versionList;
	}
	
	@Override
	@Transactional
	public void addVersion(Version version) {
		try {
			
			userMapper.insertVersion(version);
			
		} catch (Exception e) {
			if(e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else 
				throw new RuntimeException(e.getMessage());
		}
		
	}
	
	@Override
	@Transactional
	public void deleteVersionById(int id){
		userMapper.deleteVersion(id);
	}*/
}
