<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<head>
		<meta charset="utf-8">
		<title>用户信息</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/lrtk.css" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script src="js/modernizr.custom.js"></script>

		<style type="text/css">
			body {
				width: 1200px;
				margin: 0 auto;
			}
			
			#container {

				background-image: url(img/user_background_img.jpg);
				background-repeat: no-repeat;
				background-size: cover;
				width: inherit;
				height: 1500px;
			}

			#bottom_div {
				position: absolute;
				top: 1400px;
				background-color: #5a5a5a;
				height: 100px;
				width: inherit;
			}

			#submit_info {
				margin: 0 auto;
				width: 550px;
				position: relative;
				top: 330px;
			}

			#user_face {
				max-height: 180px;
				max-width: 180px;
				position: relative;
			}

			#bot_layer {
				width: 180px;
				height: 90px;
				background-color: rgba(0, 0, 0, 0.5);
				position: absolute;
				top: 112px;
				z-index: 0;
				text-align: center;
				line-height: 90px;
			}
			.error{
				color: red;
				float: right;
				position: relative;
				right: -120px;
				top: -28px;
			}
		</style>
	</head>
	<body>
		<div id="container">
			
			<%@ include file="/nav.jsp" %>

			<li class="cs-style-2" style="position: relative;top: 250px;left: 150px;width: 180px;height: 180px;">
				<figure style="height: 180px;">
					<div style="height: 180px;">
						<img src="${pageContext.request.contextPath }/<%=request.getAttribute("user_face_url")%>" alt="用户头像" id="user_face">
						<a href="#" onclick="to()">
							<div id="bot_layer">
								<font size="5" color="#C0C0C0">点击修改头像</font>
								<span id="show"></span>
							</div>
						</a>
					</div>
				</figure>
			</li>

			<div id="submit_info">
				<form role="form" action="${pageContext.request.contextPath }/UserServlet" method="post">
					<div class="form-group">						<label for="exampleInputEmail1">
							<font size="4">用户名：</font>
						</label><input type="text" class="form-control" id="exampleInputEmail1" name="username" value="<%=request.getAttribute("user_name")%>"/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">
							<font size="4">电子邮箱：</font>
						</label><input type="email" readonly="readonly" class="form-control" id="exampleInputEmail1" name="email" value="<%=request.getAttribute("email2")%>"/>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">
							<font size="4">当前密码：</font>
						</label><input type="password" class="form-control" id="exampleInputPassword1" name="cpassword"/>
						<% boolean cpassword = (boolean)request.getAttribute("cpassword");
						   if(!cpassword) {  %>
						   		<span class="error">密码错误</span>
						 <%} %>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">
							<font size="4">新密码：</font>
						</label><input type="password" class="form-control" id="exampleInputPassword1" name="npassword"/>
						<% boolean npassword = (boolean)request.getAttribute("npassword");
						   if(!npassword) {  %>
						   		<span class="error">密码长度6-12位</span>
						 <%} %>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">
							<font size="4">确认密码：</font>
						</label><input type="password" class="form-control" id="exampleInputPassword1" name="qpassword"/>
						<% boolean qpassword = (boolean)request.getAttribute("qpassword");
						   if(!qpassword) {  %>
						   		<span class="error">两次密码不同</span>
						 <%} %>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">
							<font size="4">介绍一下自己：</font>
						</label><textarea class="form-control" id="exampleInputPassword1" style="resize: none;height: 200px;" name="introduc" ><%=request.getAttribute("intro")%></textarea>
					</div>

					<button type="submit" class="btn btn-default" style="position: absolute; right: 0px;">
						<font size="4">提交</font>
					</button>
				</form><strong></strong>
			</div>

			<div id="bottom_div">
				<p style="font-size: 15px;color: #a0a0a0;letter-spacing: 5px;line-height: 1.5;position: relative;right: -50px;top: 40px;">
					关于我们
				</p>
			</div>
		</div>
	</body>

	<script src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
		function to(){  
			window.location.href="cutImg.jsp?valus="+$("#user_face")[0].src 
		} 
	</script>
</html>