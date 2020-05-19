package org.travel.service;

import org.travel.dao.RootDaoImpl;
import org.travel.root.root;

public class RootServiceImpl implements RootService {
	
	private static RootDaoImpl ud = new RootDaoImpl();
	public root queryByname(String name) {
		return ud.selectByname(name);
	}
}
