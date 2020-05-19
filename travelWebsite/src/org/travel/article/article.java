package org.travel.article;


/**
 * @author 文章管理功能函数
 *
 */
public class article {
	private String user_id;
	private String sight_id;
	private String article_id;
	private String content;
	private String title;
	private String article_time;
	
	public article(String article_id,String content, String title) {
		super();
		this.article_id = article_id;
		this.content = content;
		this.title = title;
	}
	
	public article(String article_id,String content, String title,String article_time) {
		super();
		this.article_id = article_id;
		this.content = content;
		this.title = title;
		this.article_time = article_time;
	}
	
	public article(String article_id) {
		super();
		this.article_id = article_id;
	}
	
	public article(String article_id,String user_id) {
		super();
		this.user_id = user_id;
		this.article_id = article_id;
	}

	public article(String user_id,String article_id, String content, String title,String article_time) {
		super();
		this.user_id = user_id;
		this.article_id = article_id;
		this.content = content;
		this.title = title;
		this.article_time = article_time;
	}

	@Override
	public String toString() {
		return "article [user_id=" + user_id + ", article_id=" + article_id + ", sight_id" + sight_id + ", content=" + content + ", title=" + title
				+ ", article_time=" + article_time + "]";
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setarticleUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
	}
	public String getSight_id() {
		return sight_id;
	}
	public void setSight_id(String sight_id) {
		this.sight_id = sight_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setAtricle_time(String atricle_time) {
		this.article_time = atricle_time;
	}
	public String getAtricle_time() {
		return article_time;
	}

}
