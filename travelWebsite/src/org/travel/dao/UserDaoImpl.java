package org.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.travel.JDBCUtil.JDBCUtil;
import org.travel.user.User;


public class UserDaoImpl implements UserDao {

	@Override
	public User selectByEmail(String email) {
		// TODO Auto-generated method stub
		Connection conn=JDBCUtil.getConnection();
		User user=null;
		try {
			PreparedStatement ps = conn.prepareStatement("select * from t_user where email = ?");
			ps.setString(1,email);
			
			ResultSet rs = ps.executeQuery();
					
			while(rs.next()) {
						//System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3));
				user=new User(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
			}
			
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User selectById(String id) {
		// TODO Auto-generated method stub
		Connection conn=JDBCUtil.getConnection();
		User user=null;
		try {
			System.out.println("Id:"+id);
			PreparedStatement ps = conn.prepareStatement("select user_id,name,user_face_url from t_user where user_id = '"+id+"'");
			
			ResultSet rs = ps.executeQuery();
				
			while(rs.next()) {
				System.out.println("true");
				System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3));
				user=new User(rs.getString(1),rs.getString(2),rs.getString(3));
			}
			System.out.println("false");
			
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public User selectByuser_id(String user_id) {
		Connection conn=JDBCUtil.getConnection();
		User user=null;
		try {
			PreparedStatement ps = conn.prepareStatement("select * from t_user where user_id = ?");
			ps.setString(1,user_id);
			
			ResultSet rs = ps.executeQuery();
					
			while(rs.next()) {
				user=new User(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
			}
			
			//System.out.println(user.getUser_id()+" "+user.getUser_name()+" "+user.getEmail()+" "+user.getPassword());	
			
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean deleteByuser_id(String user_id) {
		Connection conn=JDBCUtil.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement("delete from t_user where user_id = ?");
			System.out.println(user_id);
			ps.setString(1,user_id);
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
