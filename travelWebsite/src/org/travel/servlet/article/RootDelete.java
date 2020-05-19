package org.travel.servlet.article;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.travel.article.article;
import org.travel.service.ArticleServiceImpl;

/**
 * Servlet implementation class RootDelete
 */
@WebServlet("/RootDelete")
public class RootDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String article_id = request.getParameter("article_id");
		System.out.println(article_id);
		article del = new article(article_id);
		ArticleServiceImpl imp=new ArticleServiceImpl();
		boolean result = imp.RootDelete(del);
		System.out.println(result);
		//HttpSession session=request.getSession();
		//session.setAttribute("result", result);
		//response.sendRedirect(request.getContextPath()+"/rootarticle.jsp");
	}

}
