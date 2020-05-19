package org.travel.servlet.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.travel.JDBCUtil.JDBCUtil;
import org.travel.service.UserServiceImpl;
import org.travel.user.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html;charset=UTF-8");
		
		String cemail =  (String) request.getSession().getAttribute("email");
		String username = request.getParameter("username");
		String npassword = request.getParameter("npassword");
		String cpassword = request.getParameter("cpassword");
		String qpassword = request.getParameter("qpassword");
		String introduc = request.getParameter("introduc");
		
		Connection conn=JDBCUtil.getConnection();
		PreparedStatement ps;
		UserServiceImpl impl=new UserServiceImpl();
		User user=impl.queryByEmail(cemail);
		int flag = 0;
		String pwd=user.getPassword();
		if(pwd.equals(cpassword)==false){
			request.setAttribute("cpassword",false); 
			request.setAttribute("npassword",true);
			request.setAttribute("qpassword",true);
			flag = flag + 1;
		}
		else{
			request.setAttribute("cpassword",true); 
			if(npassword.length()<6||npassword.length()>12){
				request.setAttribute("npassword",false);
				request.setAttribute("qpassword",true);
				flag = flag + 1;
			}
			else{
				request.setAttribute("npassword",true);  
				if(npassword.equals(qpassword)==false) {
					request.setAttribute("qpassword",false);
					flag = flag + 1;
				}
				else{
					request.setAttribute("qpassword",true);
				}
			}
		}
		if(flag==0){
			try {
				ps = conn.prepareStatement("update t_user set name = '"+username+"', password = '"+npassword+"', about_me = '"+introduc+"' where email = '"+cemail+"'");
				ps.executeUpdate();	
				ps.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			HttpSession session=request.getSession();
			session.setAttribute("userName", username);
			request.getRequestDispatcher("/index.jsp").forward(request,response);
		}
		else {
			request.setAttribute("flag",1);
			request.setAttribute("name",username);
			request.setAttribute("intro",introduc);
			request.getRequestDispatcher("/MyServlet").forward(request,response);
		}
	}
}
