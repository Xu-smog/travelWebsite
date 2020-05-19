package org.travel.service;

import org.travel.user.User;

public interface UserService {
	
	User queryByEmail(String email);
	
	User queryById(String id);
	
	User queryByuser_id(String user_id);
	
	boolean deleteByuser_id(String user_id);
}
