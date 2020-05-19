<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<nav class="navbar navbar-inverse" role="navigation"
	style="overflow: hidden;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">主页</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath }/subject.jsp">广场</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<% String email = (String)request.getSession().getAttribute("email");
				if(email!=null) {  %>
					<li><a href="${pageContext.request.contextPath }/article.jsp">写作</a></li>
					<li><a href="${pageContext.request.contextPath }/PageServlet">动态</a></li>
					<li><a href="${pageContext.request.contextPath }/MyServlet">个人资料</a></li>
					<li><a href="${pageContext.request.contextPath }/QuitServlet">退出登录</a></li>
				<% } else { %>
					<li><a class="btn btn-link-1 launch-modal" href="#"
						data-modal-id="modal-register1"><span
							class="glyphicon glyphicon-user"></span> 注册</a></li>
					<li><a class="btn btn-link-1 launch-modal" href="#"
						data-modal-id="modal-register"><span
							class="glyphicon glyphicon-log-in"></span>登录</a></li>
				<% } %>
			</ul>
		</div>
	</div>
</nav>