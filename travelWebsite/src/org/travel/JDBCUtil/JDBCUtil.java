package org.travel.JDBCUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtil {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		try {
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "hr", "0277");
			conn.setAutoCommit(true);
			
			return conn;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void release(Connection conn) {
		try {
			if(conn!=null)
				conn.close();			
		}catch(SQLException e) {
			e.printStackTrace();
		}	
	}
}
