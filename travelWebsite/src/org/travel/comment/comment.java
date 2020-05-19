package org.travel.comment;

public class comment {
	private String user_id;
	private String comment_id;
	private String content;
	private String zan_num;
	private String comment_time;
	
	
	public comment(String user_id,String content,String zan_num,String comment_id,String comment_time) {
		super();
		this.user_id = user_id;
		this.comment_id = comment_id;
		this.content = content;
		this.zan_num = zan_num;
		this.comment_time = comment_time;
	}
	
	public String getUser_id() {
		return user_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getZan_num() {
		return zan_num;
	}
	
	public void setZan_num(String zan_num) {
		this.zan_num = zan_num;
	}

	public String getComment_time() {
		return comment_time;
	}

	public void setComment_time(String comment_time) {
		this.comment_time = comment_time;
	}
	
}


