package org.travel.servlet.root;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.travel.root.root;
import org.travel.service.RootServiceImpl;

@WebServlet("/RootLogin")
public class RootLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String name =request.getParameter("name");
		String password=request.getParameter("password");
		System.out.println(name+password);
		RootServiceImpl impl = new RootServiceImpl();
		root user = impl.queryByname(name);
		System.out.println(user);
		if(user!=null) {
			String pwd=user.getPassword();
			System.out.println(password);
			if(pwd.equals(password)) {
				PrintWriter writer = response.getWriter();
				writer.print("true");
			}
			else {
				PrintWriter writer = response.getWriter();
				writer.print("false");
			}
		}
		else {
			PrintWriter writer = response.getWriter();
			writer.print("false");
		}
	}

}
