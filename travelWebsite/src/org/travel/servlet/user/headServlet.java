package org.travel.servlet.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import sun.misc.BASE64Decoder;
import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;
import com.sun.org.apache.xml.internal.security.utils.Base64;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.travel.JDBCUtil.JDBCUtil;
import org.travel.service.UserServiceImpl;
import org.travel.user.User;

import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;
import com.sun.org.apache.xml.internal.security.utils.Base64;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * Servlet implementation class headServlet
 */
@WebServlet("/headServlet")
public class headServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String separator = "/";
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String email =  (String) request.getSession().getAttribute("email");
		
		String[] address =  request.getParameterValues("userFaceImg");	
		String str="";
		for (String string : address) {
			str = str + string;
		}

		Connection conn=JDBCUtil.getConnection();
		PreparedStatement ps;
		
		String path;
		try {
			path = saveImg(str,request);
			String sql = "update t_user set user_face_url = ? where email = ?";   
            ps = conn.prepareStatement(sql);   
            ps.setString(1,path);   
            ps.setString(2,email);  
            if(ps.executeUpdate()!=0) {
            	System.out.println("execute");
            	response.getWriter().print(true); 
            }
            else {
            	System.out.println("false execute");
            }
            ps.close();
            conn.close();
            
            HttpSession session=request.getSession();
			session.setAttribute("userFaceImg", path);
      
		} catch (Base64DecodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	public String saveImg(String baseImg,HttpServletRequest request) throws Base64DecodingException   {
		//定义一个正则表达式的筛选规则，为了获取图片的类型
        String rgex = "data:image/(.*?);base64";
        String type = getSubUtilSimple(baseImg, rgex);
		baseImg = baseImg.replaceFirst("data:(.+?);base64,", ""); //去除base64图片的前缀
		byte[] b;
		byte[] bs;
		OutputStream os = null;
		String fileName = "";
		
		/*String nowDate = "";
		// 格式化并获取当前日期（用来命名）
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		nowDate = format.format(new Date());*/
		
		b = Base64.decode(baseImg.replaceAll(" ", "+")); //把图片转换成二进制
		String path = request.getServletContext().getRealPath("/img"); //生成路径
		
		fileName = UUID.randomUUID().toString() + "." + type;//随机生成图片的名字，同时根据类型结尾
		File file = new File(path);
		if (!file.exists() && !file.isDirectory()) {
			file.mkdirs();
		}
		File imageFile = new File(path + "/" + fileName);
		BASE64Decoder d = new BASE64Decoder();
		// 保存
		try {
			bs = d.decodeBuffer(Base64.encode(b));
			os = new FileOutputStream(imageFile);
			os.write(bs);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally {
			if (os != null) {
				try {
					os.close();
				} catch (IOException e) {
					e.getLocalizedMessage();
				}
			}
		}
		return "img" + separator + fileName;
	}
	
	public static String getSubUtilSimple(String soap,String rgex){
		Pattern pattern = Pattern.compile(rgex);
		Matcher m = pattern.matcher(soap);
		while(m.find()){
			return m.group(1);
		}
		return "";
	}	
}