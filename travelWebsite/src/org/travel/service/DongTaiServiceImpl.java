package org.travel.service;

import java.util.ArrayList;

import org.travel.dao.DongTaiDaoImpl;
import org.travel.user.DongTai;




public class DongTaiServiceImpl implements DongTaiService {

	@Override
	public ArrayList<DongTai> queryByPage(int page) {
		
		DongTaiDaoImpl pd = new DongTaiDaoImpl();		
		
		int start = (page-1)*6+1;		
		int end = page*6;  
		
		System.out.println("selectByPage("+start+","+ end+")");
		return pd.selectByPage(start, end);
	}

}
