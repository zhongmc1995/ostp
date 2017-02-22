package com.peace.ostp.service;


import com.peace.ostp.domain.UserRole;


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
public interface IUserRole {

	int inser(UserRole userrole);

	void deleteOneByUserId(String userId);

	void updateByUserId(UserRole userRole);
}
