package org.travel.service;

import org.travel.dao.UserDaoImpl;
import org.travel.user.User;

public class UserServiceImpl implements UserService {

	private static UserDaoImpl ud=new UserDaoImpl();
	
	@Override
	public User queryByEmail(String email) {		
		return ud.selectByEmail(email);
	}

	@Override
	public User queryById(String id) {
		System.out.println("queryById");
		return ud.selectById(id);
	}

	@Override
	public User queryByuser_id(String user_id) {		
		return ud.selectByuser_id(user_id);
	}
	
	@Override
	public boolean deleteByuser_id(String user_id) {		
		return ud.deleteByuser_id(user_id);
	}
}
