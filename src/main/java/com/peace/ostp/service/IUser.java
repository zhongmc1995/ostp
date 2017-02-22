package com.peace.ostp.service;

import java.util.List;

import com.peace.ostp.domain.Menu;
import com.peace.ostp.domain.User;
import com.peace.ostp.util.Page;


/*import com.extr.domain.Application;
import com.extr.domain.ExamHistory;
import com.extr.domain.Subscribe;
import com.extr.domain.User;
import com.extr.domain.Version;
import com.extr.util.Page;*/

/**
 * @author Ocelot
 * @date 2014年6月8日 下午5:52:55
 */
public interface IUser {

	String addUser(User user);
	
	int addAdmin(User user);

	public List<User> getUserListByRoleId(int roleId,Page<User> page);
	
	public void updateUser(User user,String oldPassword);
	
	public User getUserById(String user_id);
	
	public void disableUser(String user_id);

	List<User> getPageRecord(Page<User> page);

	String editUser(User user);

	List<User> getSearchUserList(Page<User> page, String username);

	void modifyPsw(String userid, String resultPassword);
	
	int getTotalRecord();
	/*public int addSubscribe(Subscribe subscribe);
	
	public void updateSubscribe(Subscribe subscribe);
	
	public Subscribe getSubscribeByUsername(String userName);
	//生成所有考场记录
	public List<Subscribe> getAllSubHistoty(Page<Subscribe> page);
	
	//根据工种ID获取考试场次
	public List<Subscribe> getSubtimeByFieldId(int fieldId);
	
	
	//根据ID删除考场记录
	public void deleteSubscribeByQSubId(int subId);
	
	//手机用户报名
	public int insertAppliction(Application application);
	
	//根据用户名查询报名信息
	public Application getApplicationByUsername(String userName);
	
	public List<Application> getAllApplication(Page<Application> page);
	
	public List<Application> getApplicationBySubid(Page<Application> page,int subId);
	
	public List<Application> getNoPayApplication(Page<Application> page);
	
	public void updateApplyOperator(Application application,String userName);
	
	//查询版本信息
	public List<Version> getVersionList(Page<Version> pageModel);

	public void addVersion(Version version);
		
	public void deleteVersionById(int id);*/

	void deleteUser(String userid);

	List<User> getAllUser();
}
