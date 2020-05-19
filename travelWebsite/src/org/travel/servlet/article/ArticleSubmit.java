package org.travel.servlet.article;


//import java.util.Date;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.travel.article.article;
import org.travel.service.*;
import org.travel.user.User;
/**
 * 接收文章内容并将其插入数据库
 */
@WebServlet("/ArticleSubmit")
public class ArticleSubmit extends HttpServlet {
	public static String article_id="";

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String title=null;
		String content=null;
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();   
            ServletFileUpload upload = new ServletFileUpload(factory);   
            upload.setHeaderEncoding("UTF-8");  
            List items = upload.parseRequest(request);  
            Map params = new HashMap();   
            for(Object object:items){  
                FileItem fileItem = (FileItem) object;   
                if (fileItem.isFormField()) {   
                    //这里就相当与FormData中的key,value
                    params.put(fileItem.getFieldName(), fileItem.getString("utf-8"));//页面编码是utf-8的   
                }  
            }   
            //使用params.get获取参数值 send_time就是key 
            title = (String) params.get("title");
            System.out.println("---------------title------------------");
            System.out.println(title);
            content = (String) params.get("content");
            
 
        } catch (FileUploadException e1) {
            e1.printStackTrace();
        }  
		
		long millis = System.currentTimeMillis();
	    //加上两位随机数
	    Random random = new Random();
	    int end2 = random.nextInt(99);
	    //如果不足两位前面补0
	    String str = millis + String.format("%02d", end2);
	    article_id = str;
	    
		String path=request.getServletContext().getRealPath("/article/")+ article_id + ".txt";
		try{//异常处理
			
			System.out.println(path);
			
			FileWriter fw = new FileWriter(path);
			fw.write(content);
			fw.close();

		}catch(IOException e){
			e.printStackTrace();
		}

		SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间 
        sdf.applyPattern("yyyy-MM-dd HH:mm:ss"); 
        Date date = new Date();// 获取当前时间 
        String time = sdf.format(date); //已经格式化的现在时间（24小时制）
		article art = new article(article_id,path,title,time);
		art.setArticle_id(article_id);
		art.setContent(path);
		art.setTitle(title);
		art.setAtricle_time(time);
		ArticleServiceImpl impl=new ArticleServiceImpl();
		
		request.setAttribute("time", time);
		impl.InsetrSubmit(art);

		System.out.println(article_id);
		//标题只能字符开头？？？？？？？？？？？？？
		HttpSession session=request.getSession();
		session.setAttribute("article_id", article_id);
		
		response.sendRedirect(request.getContextPath()+"/article.jsp");

	}

}
