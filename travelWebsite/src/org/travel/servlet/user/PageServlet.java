package org.travel.servlet.user;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.travel.dao.DongTaiDaoImpl;
import org.travel.service.DongTaiServiceImpl;
import org.travel.service.UserServiceImpl;
import org.travel.user.DongTai;
import org.travel.user.User;

@WebServlet("/PageServlet")
public class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 编码处理
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 响应类型
		response.setContentType("text/html;charset=UTF-8");  

		String index = request.getParameter("page");// 页码
		System.out.println(index);
		int page = 0;

		if (index == null) {
			page = 1;
		} else {
			page = Integer.parseInt(index);
		}

		// 商品分页
		DongTaiServiceImpl dts = new DongTaiServiceImpl();
		UserServiceImpl users = new UserServiceImpl();

		ArrayList<DongTai> dtList = dts.queryByPage(page); 
		ArrayList<User> userList = new ArrayList<User>();
		// 计算页码
		DongTaiDaoImpl pd = new DongTaiDaoImpl();
		int totalCount = pd.selectCount();// 商品总数

		int pageCount = 0;
		if (totalCount % 6 == 0) {
			pageCount = totalCount / 6;
		} else {
			pageCount = totalCount / 6 + 1;
		}

		// 分页,index.jsp我的动态跳转到这个页面
		
		System.out.println(dtList.size());

		for (DongTai dt : dtList) {
			String path=dt.getUser_comment();
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
			dt.setUser_comment(content);
			userList.add(users.queryById(dt.getUser_id()));
			
			ArrayList<String> webPhoto = new ArrayList<String>();
			for (int j = 0; j < dt.getPhoto().size(); j++) {				
				String url=dt.getPhoto().get(j);
				if(url==null)
					continue;
				url=url.replace("E:\\study\\web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\travelWebsite\\", "");
				webPhoto.add(url.replace("\\", "/"));
			}
			dt.setPhoto(webPhoto);
		}
		
		System.out.println(dtList.toString());
		System.out.println(userList.toString());
		
		
		request.setAttribute("dtList", dtList);
		request.setAttribute("userList", userList);
		request.setAttribute("pageCount", pageCount);

		request.getRequestDispatcher("/comment.jsp").forward(request, response);
	}

}
