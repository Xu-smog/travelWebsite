package org.travel.service;

import org.travel.article.article;

public interface ArticleService {
	boolean InsetrSubmit(article art);
	
	article[] RootArticle(article art);
	
	boolean RootDelete(article art);
}
