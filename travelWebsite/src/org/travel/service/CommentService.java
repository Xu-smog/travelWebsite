package org.travel.service;

import org.travel.comment.comment;

public interface CommentService {
		comment[] RootComment(String user_id);//管理员评论管理展示
		
		boolean RootCommentdelete(String comment_id);//管理员评论管理删除
}
