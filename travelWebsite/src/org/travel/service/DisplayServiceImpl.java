package org.travel.service;

import org.travel.dao.DisplayDaoImpl;
import org.travel.article.article;

public class DisplayServiceImpl implements DisplayService {
	
	private static DisplayDaoImpl ud=new DisplayDaoImpl();
	
	@Override
	public article ContentSelect(article art) {		
		 return ud.DisplayContent(art);
	}

}