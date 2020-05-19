package org.travel.dao;

import org.travel.user.User;

public interface UserDao {
	User selectByEmail(String email);
	
	User selectById(String id);
	
	User selectByuser_id(String user_id);
	
	boolean deleteByuser_id(String user_id);
}
