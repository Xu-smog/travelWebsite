package org.travel.servlet.comment;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.travel.comment.comment;
import org.travel.dao.CommentDaoImpl;
import org.travel.service.CommentServiceImpl;


/**
 * 管理员评论管理展示servlet函数 接收前台用户ID并查询展示
 */
@WebServlet("/rootcomment")
public class rootcomment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int count = CommentDaoImpl.count;
		String user_id = request.getParameter("keywords");
		CommentServiceImpl impl=new CommentServiceImpl();
		comment[] com=impl.RootComment(user_id);
		List<comment> userAll = new ArrayList();
		Collections.addAll(userAll, com);
		//System.out.println(userAll);
		request.setAttribute("count", count);
		request.setAttribute("commentAll", userAll);
		request.getRequestDispatcher("/rootcomment.jsp").forward(request,response);
	}

}
