package org.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.travel.JDBCUtil.JDBCUtil;
import org.travel.root.root;
import org.travel.user.User;

public class RootDaoImpl implements RootDao{
	
	public root selectByname(String name) {
		Connection conn=JDBCUtil.getConnection();
		root user=null;
		try {
			PreparedStatement ps = conn.prepareStatement("select * from root_user where name = ?");
			ps.setString(1,name);
			ResultSet rs = ps.executeQuery();		
			while(rs.next()) {
						//System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3));
				user=new root(rs.getString(1),rs.getString(2),rs.getString(3));
			}
			
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
