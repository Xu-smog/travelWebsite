package org.travel.dao;

import org.travel.article.article;

/**
 * @author 文章管理插入函数
 *
 */
public interface ArticleDao {
	boolean insertContent(article art);	
	article[] RootArticle(article art);
	boolean RootDelete(article art);
}