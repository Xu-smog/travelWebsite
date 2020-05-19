package org.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.travel.JDBCUtil.JDBCUtil;
import org.travel.article.article;



/**
 * @author 插入文章内容至数据库的函数
 *
 */
public class ArticleDaoimpl implements ArticleDao{
	public static int count=0;
	@Override
	public boolean insertContent(article art) {
		// TODO Auto-generated method stub
		Connection conn=JDBCUtil.getConnection();
		//String user_id = art.getarticleUser_id();
		String article_id = art.getArticle_id();
		//String sight_id = art.getSight_id();
		String title = art.getTitle();
		String content = art.getContent();
		String article_time = art.getAtricle_time();
		try {
			PreparedStatement ps = conn.prepareStatement("insert into t_article (article_id,title,content_url,article_time) values ('"+
					article_id+"','"+title+"','"+content+"','"+article_time+"')");

			System.out.println("insert into t_article (article_id,title,content_url,article_time) values ('"+
					article_id+"','"+title+"','"+content+"','"+article_time+"')");
			System.out.println(article_id+title + content + article_time);
			
			if(ps.executeUpdate()!=0) {
				System.out.println("success");
				return true;
			}
			else {
				System.out.println("fail");
				return false;
			}
			
			//System.out.println(user.getUser_id()+" "+user.getUser_name()+" "+user.getEmail()+" "+user.getPassword());	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	//管理员文章管理界面
		public article[] RootArticle(article art) {
			Connection conn=JDBCUtil.getConnection();
			String user_id = art.getUser_id();
			String sight_id = art.getSight_id();
			String article_id = art.getArticle_id();
			String content = art.getContent();
			String title = art.getTitle();
			String article_time = art.getAtricle_time();
			//System.out.println(user_id);
			try {
				PreparedStatement ps = conn.prepareStatement("select count(*) from t_article where user_id = ?");
				ps.setString(1,user_id);
				//ps.setString(2,sight_id);
				ResultSet rs = ps.executeQuery();
				rs.next();
				count = rs.getInt(1);
				System.out.println(count);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				PreparedStatement ps2 = conn.prepareStatement("select user_id,article_id,content_url,title,article_time from t_article where user_id = ?");
				ps2.setString(1,user_id);
				ResultSet rs2 = ps2.executeQuery();
				article [] res;
				res = new article[count];
				int i=0;
				while(rs2.next()) {
					res[i] = new article(rs2.getString(1),rs2.getString(2),rs2.getString(3),rs2.getString(4),rs2.getString(5));
					System.out.println(res[i]);
					i++;
				}
				return res;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		//管理员删除文章
		public boolean RootDelete(article art) {
			Connection conn=JDBCUtil.getConnection();
			String article_id = art.getArticle_id();
			try {
				PreparedStatement ps = conn.prepareStatement("delete from t_article where article_id = ?");
				ps.setString(1,article_id);
				if(ps.executeUpdate()!=0) {
					return true;
				}
				else {
					return false;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
}
