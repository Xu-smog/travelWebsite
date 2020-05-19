package org.travel.servlet.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.travel.JDBCUtil.JDBCUtil;
import org.travel.service.UserServiceImpl;
import org.travel.user.User;


@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String user_id=null;
		String user_name=request.getParameter("user_name");
		String email =request.getParameter("email");
		String password=request.getParameter("password");			
		String about_me=request.getParameter("about_me");
		String user_face_url="img/noface.gif";
		

		UserServiceImpl impl=new UserServiceImpl();
		User user=impl.queryByEmail(email);	
		
		Connection conn=JDBCUtil.getConnection();
		
		if(user==null) {			
			PreparedStatement ps;
			try {
				
				Random random = new Random(System.currentTimeMillis());
		        Integer number = random.nextInt();
		        user_id=Math.abs(user_name.hashCode()) +String.valueOf(Math.abs(number));
				
		        System.out.println(conn.toString());
		        System.out.println(user_id);
		        System.out.println(user_name);
		        System.out.println(email);		        
		        System.out.println(password);
		        System.out.println(about_me);
		        System.out.println(user_face_url);
		        
				ps = conn.prepareStatement("INSERT INTO T_USER VALUES('"+user_id+"','"+user_name
						+"','"+email+"','"+password+"','"+about_me+"','img/noface.gif')");

				if(ps.executeUpdate()!=0) {
					System.out.println("execute");
					
					HttpSession session=request.getSession();
					session.setAttribute("email", email);
					session.setAttribute("userID", user_id);
					session.setAttribute("userName", user_name);
					session.setAttribute("userFaceImg", user_face_url);
					session.setAttribute("about_me", about_me);
					
					response.getWriter().print("<script>alert('注册成功!');parent.location.href='/travelWebsite/index.jsp'</script>"); 
				}
				else {
					//对注册出错进行处理,页面进行提示
					System.out.println("false execute");
					String script = "<script>alert('注册出错啦！请稍后重试');</script>";  //注册出错
					response.getWriter().println(script);
				}													 
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else{
			//对用户重复进行处理,页面进行提示
			System.out.println("用户已存在");
			String script = "<script>alert('用户已存在！请更换您的邮箱和其他信息');</script>";  //注册重复
			response.getWriter().println(script);
		}		
	}

}
