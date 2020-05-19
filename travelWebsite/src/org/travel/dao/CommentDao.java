package org.travel.dao;

import org.travel.comment.comment;

public interface CommentDao {
	comment[] RootComment(String user_id);
	
	boolean RootDeleteCom(String comment_id);
}
