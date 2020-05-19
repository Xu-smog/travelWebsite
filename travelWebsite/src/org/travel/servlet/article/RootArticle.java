package org.travel.servlet.article;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.travel.article.article;
import org.travel.dao.ArticleDaoimpl;
import org.travel.service.*;
import org.travel.user.User;


@WebServlet("/RootArticle")
public class RootArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String user_id = request.getParameter("keywords");
		String article_id = "";
		//System.out.println(user_id);
		article select = new article(article_id,user_id);
		ArticleServiceImpl imp=new ArticleServiceImpl();
		article res[] = imp.RootArticle(select);
		int count = ArticleDaoimpl.count;
		//System.out.println(res[0].getSight_id());
		ArrayList<article> userAll = new ArrayList();
		Collections.addAll(userAll, res);
		//System.out.println(userAll);
		request.setAttribute("count", count);
		request.setAttribute("userAll", userAll);
		request.getRequestDispatcher("/rootarticle.jsp").forward(request,response);
		
	}

}
