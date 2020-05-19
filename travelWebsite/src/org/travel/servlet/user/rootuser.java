package org.travel.servlet.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.travel.article.article;
import org.travel.service.UserServiceImpl;
import org.travel.user.User;


@WebServlet("/rootuser")
public class rootuser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String user_id =request.getParameter("user_id");
		
		UserServiceImpl impl=new UserServiceImpl();
		User user=impl.queryByuser_id(user_id);
		List<User> userAll = new ArrayList();
		Collections.addAll(userAll, user);
		//System.out.println(userAll);
		request.setAttribute("usersAll", userAll);
		request.getRequestDispatcher("/rootuser.jsp").forward(request,response);
	}

}
