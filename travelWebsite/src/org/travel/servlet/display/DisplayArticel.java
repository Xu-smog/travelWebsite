package org.travel.servlet.display;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

import javax.servlet.http.HttpSession;

import org.travel.article.article;
import org.travel.service.*;

@WebServlet("/DisplayArticel")
public class DisplayArticel extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("------------display");
		HttpSession session = request.getSession();
		String article_id = (String)session.getAttribute("article_id");
		
		System.out.println(article_id);
		article art = new article(article_id);
		DisplayServiceImpl impl=new DisplayServiceImpl();
		article res = impl.ContentSelect(art);
		String path = res.getContent();
		String title = res.getTitle();
		String time = res.getAtricle_time();
		String lineTxt = "";
		String content = "";
		try {
		    File file = new File(path);
		    if(file.isFile() && file.exists()) {
		    	InputStreamReader isr = new InputStreamReader(new FileInputStream(file), "utf-8");
		    	BufferedReader br = new BufferedReader(isr);
		    	while ((lineTxt = br.readLine()) != null) {
		    		content += lineTxt;
		    	}
		    	br.close();
		    } else {
		    	System.out.println("文件不存在!");
		    }
		  }catch (Exception e) {
			  	System.out.println("文件读取错误!");
		  }


		request.setAttribute("title", title);
		request.setAttribute("content", content);
		request.setAttribute("time", time);
        request.getRequestDispatcher("/user.jsp").forward(request, response);
	}

}
