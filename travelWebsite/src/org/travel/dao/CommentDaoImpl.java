package org.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.travel.JDBCUtil.JDBCUtil;
import org.travel.article.article;
import org.travel.comment.comment;

public class CommentDaoImpl implements CommentDao{
	public static int count=0;
	public comment[] RootComment(String user_id) {
		Connection conn=JDBCUtil.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement("select count(*) from dongtai where user_id = ?");
			ps.setString(1,user_id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			System.out.println(count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			PreparedStatement ps2 = conn.prepareStatement("select * from dongtai where user_id = ?");
			ps2.setString(1,user_id);
			ResultSet rs2 = ps2.executeQuery();
			comment [] res;
			res = new comment[count];
			int i=0;
			while(rs2.next()) {
				res[i] = new comment(rs2.getString(1),rs2.getString(2),rs2.getString(3),rs2.getString(4),rs2.getString(5));
				i++;
			}
			return res;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean RootDeleteCom(String comment_id) {
		Connection conn=JDBCUtil.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement("delete from dongtai where dongtai_id = ?");
			ps.setString(1,comment_id);
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
