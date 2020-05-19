package org.travel.servlet.user;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.travel.JDBCUtil.JDBCUtil;
import org.travel.service.DongTaiServiceImpl;
import org.travel.service.UserServiceImpl;
import org.travel.user.DongTai;
import org.travel.user.User;

@MultipartConfig
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
    
	private String path="";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//编码处理
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//响应类型
		response.setContentType("text/html;charset=UTF-8");
		
		System.out.println("request.getContentType(): " + request.getContentType());
		
		path = request.getServletContext().getRealPath("/upload");
		
		if(!request.getContentType().split(";")[0].equals("multipart/form-data"))
			return;
		
		Collection<Part> parts = request.getParts();
		System.out.println(parts);
		
		
		HttpSession session = request.getSession();
		System.out.println(session.getId());

		//用户id
		String user_id=(String)session.getAttribute("userID");
		//时间
		long millis = System.currentTimeMillis();
		//动态id
		Random random = new Random(millis);
        Integer number = random.nextInt();
        String dongtai_id=Math.abs(user_id.hashCode()) +String.valueOf(Math.abs(number));
        //评论
        String comment=path+"\\"+dongtai_id+".txt";
        //赞
        int zan=0;
        //图片
        ArrayList<String> photoList = new ArrayList<String>();
        
        System.out.println(user_id);
        System.out.println(millis);
        System.out.println(dongtai_id);
        System.out.println(comment);
		 
		for(Part part:parts){
			System.out.println(part);
			System.out.println("part.getName(): " + part.getName());
	        
			if(part.getName().equals("photo")){
				String cd = part.getHeader("Content-Disposition");
				String[] cds = cd.split(";");
				String filename = cds[2].substring(cds[2].indexOf("=")+1).substring(cds[2].lastIndexOf("//")+1).replace("\"", "");
				String ext = filename.substring(filename.lastIndexOf(".")+1);
				
				System.out.println("filename:" + filename);
				System.out.println("ext:" + ext);				
				
				String[] splitPath = filename.replace("\\", " ").split(" ");
				String name="";
				name +=  splitPath[splitPath.length-1];			
				System.out.println(name+"---------------");
				System.out.println(path+"\\"+name);
				
				if(!name.equals("")) {
					part.write(path+"\\"+name);		
					photoList.add(path+"\\"+name);
				}				
			}else if(part.getName().equals("comment")) {
				part.write(path+"\\"+dongtai_id+".txt");
			}
		}
		
		String photoUrl="";
		
		for(int i=0;i<9;i++) {
			if(i<photoList.size()) {
				photoUrl+=",'"+photoList.get(i)+"'";
			}else {
				photoUrl+=",null";
			}
		}
		
		System.out.println("INSERT INTO DongTai VALUES('"+user_id+"','"+comment
				+"','"+zan+"','"+dongtai_id+"','"+millis+"'"+photoUrl+")");

		Connection conn=JDBCUtil.getConnection();
        PreparedStatement ps;
        try {
			ps = conn.prepareStatement("INSERT INTO DongTai VALUES('"+user_id+"','"+comment
					+"','"+zan+"','"+dongtai_id+"','"+millis+"'"+photoUrl+")");
			if(ps.executeUpdate()!=0) {
				System.out.println("inserted");
			}else{
				System.out.println("not execute");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        //跳转分页
        response.sendRedirect(request.getContextPath()+"/PageServlet");
	} 
}

