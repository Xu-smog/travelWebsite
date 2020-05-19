package org.travel.servlet.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.travel.JDBCUtil.JDBCUtil;

@WebServlet("/VoteLikeServlet")
public class VoteLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 编码处理
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 响应类型
		response.setContentType("text/html;charset=UTF-8");
				
		String dongtai_id = request.getParameter("dongtai_id");
		String zan=request.getParameter("zan");
		
		PrintWriter write = response.getWriter();
		
		if(updateZan(dongtai_id, zan)) {
			write.print("true"); 
		}else {
			write.print("false");
		}
	}
	
	public boolean updateZan(String dongtai_id, String zan) {
		Connection conn = JDBCUtil.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE DongTai SET ZAN = ? WHERE dongtai_id = ?");
			
			ps.setString(1, zan);
			ps.setString(2, dongtai_id);
			
			if(ps.executeUpdate()!=0) {
				
				JDBCUtil.release(conn);
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return false;
	}

}
