package org.travel.servlet.comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.travel.service.CommentService;
import org.travel.service.CommentServiceImpl;

/**
 * 管理员评论管理删除评论，从前台接收comment_id,执行dao层函数
 */
@WebServlet("/commentdelete")
public class commentdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String comment_id = request.getParameter("comment_id");
		System.out.println(comment_id);
		CommentServiceImpl impl = new CommentServiceImpl();
		boolean result = impl.RootCommentdelete(comment_id);
		System.out.println(result);
	}

}
