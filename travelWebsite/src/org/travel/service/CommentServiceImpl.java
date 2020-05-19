package org.travel.service;

import org.travel.dao.CommentDaoImpl;

import java.util.List;

import org.travel.comment.comment;


public class CommentServiceImpl implements CommentService{
	//管理员评论管理展示
	private static CommentDaoImpl up = new CommentDaoImpl();
		
	public comment[] RootComment(String user_id) {
		return up.RootComment(user_id);
	}
	//管理员评论管理删除
	private static CommentDaoImpl ue = new CommentDaoImpl();
	
	public boolean RootCommentdelete(String comment_id) {
		return ue.RootDeleteCom(comment_id);
	}
}


