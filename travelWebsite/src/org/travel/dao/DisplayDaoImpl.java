package org.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.travel.JDBCUtil.JDBCUtil;
import org.travel.article.article;
import org.travel.user.User;



/**
 * @author 插入文章内容至数据库的函数
 *
 */
public class DisplayDaoImpl implements DisplayDao{
	
	@Override
	public article DisplayContent(article art) {
		// TODO Auto-generated method stub
		Connection conn=JDBCUtil.getConnection();
		String user_id = art.getUser_id();
		String article_id = art.getArticle_id();
		String sight_id = art.getSight_id();
		String title = art.getTitle();
		String content = art.getContent();
		String article_time = art.getAtricle_time();
		article res = new article(user_id,article_id,title, content,article_time);
		try {
			PreparedStatement ps = conn.prepareStatement("select title,content_url,article_time from t_article where article_id = ?");
			ps.setString(1,article_id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String curr_title = rs.getString(1);
			String content_url = rs.getString(2);
			String time = rs.getString(3);
			res.setTitle(curr_title);
			res.setContent(content_url);
			res.setAtricle_time(time);
			return res;	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
}