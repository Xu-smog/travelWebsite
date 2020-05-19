package org.travel.servlet.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String email =  (String) request.getSession().getAttribute("email");
		UserServiceImpl impl=new UserServiceImpl();
		User user=impl.queryByEmail(email);
        String a = user.getUser_face_url();  
		String name = user.getUser_name(); 
		String intro = user.getAbout_me();
		try {
			int i = (int) request.getAttribute("flag");
			if(i==1) {
				request.setAttribute("user_face_url",a); 
				request.setAttribute("email2",email); 
				request.setAttribute("user_name", request.getAttribute("name"));
				request.setAttribute("intro", request.getAttribute("intro"));
				request.setAttribute("cpassword",request.getAttribute("cpassword")); 
				request.setAttribute("npassword",request.getAttribute("npassword"));
				request.setAttribute("qpassword",request.getAttribute("qpassword"));
				request.getRequestDispatcher("/Userinfo.jsp").forward(request,response); 
			}
		} catch (Exception e) {
			request.setAttribute("user_name", name);
			request.setAttribute("user_face_url",a); 
			request.setAttribute("intro",intro); 
			request.setAttribute("email2", email);
			request.setAttribute("cpassword",true); 
			request.setAttribute("npassword",true);
			request.setAttribute("qpassword",true);
			request.getRequestDispatcher("/Userinfo.jsp").forward(request,response); 
		}
	}
}
