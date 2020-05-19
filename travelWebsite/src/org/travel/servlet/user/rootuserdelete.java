package org.travel.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.travel.article.article;
import org.travel.service.ArticleServiceImpl;
import org.travel.service.UserServiceImpl;

/**
 * Servlet implementation class rootuserdelete
 */
@WebServlet("/rootuserdelete")
public class rootuserdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String user_id = request.getParameter("user_id");
		//System.out.println(user_id);
		UserServiceImpl imp=new UserServiceImpl();
		boolean result = imp.deleteByuser_id(user_id);
		System.out.println(result);
	}

}
