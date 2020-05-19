package org.travel.service;

import org.travel.dao.ArticleDaoimpl;
import org.travelWebsite.service.ArticleService;
import org.travel.article.article;

public class ArticleServiceImpl implements ArticleService {
	
	private static ArticleDaoimpl ud=new ArticleDaoimpl();
	
	@Override
	public boolean InsetrSubmit(article art) {		
		 return ud.insertContent(art);
	}
	
	private static ArticleDaoimpl up=new ArticleDaoimpl();	

	public article[] RootArticle(article art) {
		return up.RootArticle(art);
	}
	
	private static ArticleDaoimpl ue=new ArticleDaoimpl();	

	public boolean RootDelete(article art) {
		return up.RootDelete(art);
	}

}
