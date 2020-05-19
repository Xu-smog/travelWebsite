package org.travel.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.travel.service.UserServiceImpl;
import org.travel.user.User;

import org.travel.service.UserServiceImpl;;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String email =request.getParameter("email");
		String password=request.getParameter("password");
		
		UserServiceImpl impl=new UserServiceImpl();
		User user=impl.queryByEmail(email);
		
		if(user!=null) {
			
			String pwd=user.getPassword();
			if(pwd!=null&&pwd.equals(password)) {
				
				HttpSession session=request.getSession();
				session.setAttribute("email", email);
				session.setAttribute("userID", user.getUser_id());
				session.setAttribute("userName", user.getUser_name());
				session.setAttribute("userFaceImg", user.getUser_face_url());
				session.setAttribute("about_me", user.getAbout_me());
				
				response.getWriter().print("<script>alert('登录成功!');parent.location.href='/travelWebsite/index.jsp'</script>"); 
				
			}
			else
			{
				String script = "<script> alert('密码错误 !请重新输入密码');</script>";
				response.getWriter().println(script);
			
			}
		}
		else {
			//response.对登录出错进行处理，页面进行提示

			String script = "<script>alert('账户不存在 ! 请先注册账户');</script>";  //用户输入的邮箱不存在时
			response.getWriter().println(script);
		}
	}
}
