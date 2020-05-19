package org.travel.dao;

import java.util.ArrayList;

import org.travel.user.DongTai;

public interface DongTaiDao {
	
	ArrayList<DongTai> selectByPage(int start,int end);	
		
	int selectCount() ;//类别
	
}
