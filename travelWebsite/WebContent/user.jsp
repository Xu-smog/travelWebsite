<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>~</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link href="css/user.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
	</head>

	<body>
		<%@ include file="/nav.jsp" %>
		<!--用户动态-->
		<!--1头像-->

		<table style="width: inherit;">
			<tr>
				<td>
					<div class="user"><img src="<%=request.getSession().getAttribute("userFaceImg")%>" id="portrait"></img>
						<P>用户名：<%=(String) request.getSession().getAttribute("userName")%>	</P>
						<p>个性签名:<%=(String) request.getSession().getAttribute("about_me")%></p>
						<!--3他还去过-->
						<div class="user2">
							<p>
								<a href="#">他还去过：</a>
							</p>
							<a href="#"><img src="img/其他分享2.png" / class="img1"></a>
						</div>
					</div>

					<!--2动态-->
					<div id="article">
						<h3>
							${requestScope.title }
						</h3>
						<p style="font-size: 15px; color: #a8b0b7;">
							${requestScope.time }
						</p>
						<div id="passage">
							${requestScope.content }
						</div>
					</div>

				</td>
			</tr>
			<tr>
				<td>
					<div id="bottom_div">
						<p style="font-size: 15px;color: #a0a0a0;letter-spacing: 5px;line-height: 1.5;position: relative;right: -50px;top: 40px;">
							关于我们
						</p>
					</div>
				</td>
			</tr>
		</table>
		<form role="form" action=" ${pageContext.request.contextPath }/DisplayAriticel" method="post">
			<script type="text/javascript">
			
			</script>
		</form>
	</body>

	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>

	<script type="text/javascript">
		$(window).load(function() {
			$('#article img').each(function() {
				var maxWidth = 400; // 图片最大宽度
				var maxHeight = 400; // 图片最大高度
				var ratio = 0; // 缩放比例
				var width = $(this).width(); // 图片实际宽度
				var height = $(this).height(); // 图片实际高度

				// 检查图片是否超宽
				if (width > maxWidth) {
					ratio = maxWidth / width; // 计算缩放比例
					$(this).css("width", maxWidth); // 设定实际显示宽度
					height = height * ratio; // 计算等比例缩放后的高度 
					$(this).css("height", height); // 设定等比例缩放后的高度
				}

				// 检查图片是否超高
				if (height > maxHeight) {
					ratio = maxHeight / height; // 计算缩放比例
					$(this).css("height", maxHeight); // 设定实际显示高度
					width = width * ratio; // 计算等比例缩放后的高度
					$(this).css("width", width * ratio); // 设定等比例缩放后的高度
				}
			});
		});
	</script>
</html>
