<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="java.util.ArrayList, org.travel.user.DongTai, org.travel.user.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>用户评论</title>
<style type="text/css">
body {
	background-color: #d2e9fb;
	font-family: "微软雅黑";
	width: 1200px;
	margin: 0 auto;
}

table {
	border-radius: 10px;
	width: 100%;
	height: 300px;
	background-color: white;
	margin-top: 30px;
}

a:link,a:active {
	text-decoration: none;
	color: black;
}

#table1 {
	border-radius: 10px;
	width: 100%;
	height: 300px;
	background-color: white;
	margin-top: 30px;
	padding-right: 30px;
	border-collapse: separate;
	border-spacing: 1px;
}

#container {
	display: inline-block;
}

.userFace {
	border-radius: 50%;
	width: 70px;
	height: 70px;
	margin-left: 30px;
}

#userTb {
	background-size: 100%,;
}

#headerImg {
	width: 100%;
	height: 70px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.topic {
	padding-left: 20px;
}

/*zhang-code*/
.comm {
	margin: 0 auto;
	border-radius: 10px;
	width: 650px;
	height: 150px;
	background-color: white;
	text-align: center;
}

#te {
	border-radius: 5px;
	width: 600px;
	height: 150px;
	border: none;
	background-color: #e5e9ef;
}

.div2 {
	width: 600px;
	height: 40px;
}

#te:hover {
	background-color: white;
	border-style: solid;
	border-color: #d2e9fb;
}

#fabu {
	border: none;
	font-size: 18px;
	position: relative;
	top: 20px;
	right: -230px;
	height: 35px;
	width: 75px;
	background-color: #ffaec9;
	border-radius: 10px;
	color: white;
}

#sc {
	border: none;
	font-size: 17px;
	position: relative;
	top: 20px;
	right: 180px;
	height: 35px;
	width: 95px;
	background-color: #ffaec9;
	border-radius: 10px;
	color: white;
}
</style>
<script>
	$(function() {
		$("#sc").click(function() {
			$("#getF").click();
		});

	});

	function checkImg(event) {
		var docObj = document.getElementById("getF");
		if (docObj.files.length > 9) {
			alert('最多只能添加九张图片');
			event.preventDefault();
			return;
		}
	}
</script>

</head>

<body>

	<%@ include file="/nav.jsp" %>
	
	<div style="width: 265px; padding: 10px; float: left;">
		<table id="userTb">
			<tr>
				<td colspan="2" style="height: 70px;"><img src="img/img003.jpg"
					id="headerImg" /></td>
			</tr>
			<tr>
				<td style="width: 130px;">
					<img src="<%=request.getSession().getAttribute("userFaceImg")%>" class="userFace"></td>
				<td><font id="userName" style="text-align: center;"><%=(String) request.getSession().getAttribute("userName")%></font>
				</td>
			</tr>
			<!-- 
			<tr>
				<td><font color="#c0aeaa" size="4" style="margin-left: 40px;">动态</font>
					<font color="#00a1d6" size="4" style="margin-left: 10px;">0</font>
				</td>
				<td style="text-align: center;"><font color="#c0aeaa" size="4">点赞</font>
					<font color="#00a1d6" size="4" style="margin-left: 10px;">0</font>
				</td>
			</tr>
			 -->
		</table>
	</div>
	<div style="width: 670px; padding: 10px 10px 30px 10px; float: left;">
		<table>
			<tr>
				<td>
					<div class="comm" style="position: relative; top: -25px;">
						<form action="${pageContext.request.contextPath }/UploadServlet"
							method="post" enctype="multipart/form-data">
							<textarea style="font-size: 20px; resize: none;" name="comment"
								id="te" placeholder="有什么想说的吗?"></textarea>
							<div class="div2">
								<input type="button" value="上传图片" id="sc" /> 
								<input style="display: none;" type="file" id="getF" name="photo" accept="image" multiple /> 
								<input type="submit" value="发布" id="fabu" onclick="checkImg(event)" />
								<div id="showImage"></div>
							</div>
						</form>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div style="width: 265px; padding: 10px; float: right;">
		<table>
			<tr>
				<td class="topic"><font size="4">热门话题</font></td>
			</tr>
			<tr>
				<td class="topic"><a href="#">震惊！415舍长竟然……</a></td>
			</tr>
		</table>
	</div>

	<%
		ArrayList<DongTai> dtList = (ArrayList<DongTai>) request.getAttribute("dtList");
		ArrayList<User> userList = (ArrayList<User>) request.getAttribute("userList");
		for (int i = 0; i < dtList.size(); i++) {
	%>
	<div style="width: 670px; padding: 10px 5px 0px 5px; margin: 0 auto;">
		<table class="table1">
			<tr height="90px" style="cursor: pointer;">
				<td colspan="3">
					<img src="<%=userList.get(i).getUser_face_url()%>" class="userFace" />
					<font style="font-size: 20px; position: relative; right: -15px; color: #FB7299;"><%=userList.get(i).getUser_name()%></font>
				</td>
			</tr>
			<tr height="40px">
				<td colspan="3" style="padding-left: 20px; padding-right: 20px">
					<font style="font-size: 16px;"><%=dtList.get(i).getUser_comment()%></font>
				</td>
			</tr>
			<%
				ArrayList<String> photo = dtList.get(i).getPhoto();
					for (int j = 0; j <= (photo.size() - 1) / 3; j++) {
			%>
			<tr style="display: block; position: relative; left: 20px;">
				<%
					for (int k = 0; k < 3 && j * 3 + k < photo.size(); k++) {
				%>
				<td style="padding: 5px;">
					<img src="<%=photo.get(j * 3 + k)%>" style="width: 195px; height: 140px" />
				</td>
				<%
					}
				%>
			</tr>
			<%
				}
			%>

			<tr>
				<td colspan="3"	style="position: relative; right: -120px; padding-top: 10px; margin-buttom: 5px;">
						<img id="<%="img"+i %>" src="img/like_gray.png" style="height: 30px;" class="voteImg"/>&nbsp;&nbsp;&nbsp;
						<font id="<%="font"+i %>"><%=dtList.get(i).getZan() %></font> &nbsp;&nbsp;&nbsp; 
					<script type="text/javascript">
						$("#<%="img"+i %>").click(function(){
							var zan=parseInt($("#<%="font"+i %>").text());
							zan=zan+1;
							
							$.ajax({
						        type: "POST",
						        url: "${pageContext.request.contextPath }/VoteLikeServlet",
						        dataType: "text",
						        data: { 
					            	"dongtai_id" : "<%=dtList.get(i).getDongtai_id() %>",
					            	"zan" : zan
					            },
						        success: function(result){
						        	if(result=="false")
						        		return ;
						        	if($("#<%="img"+i %>").attr("src")==="img/like_red.png")
										return ;
									$("#<%="img"+i %>").attr("src","img/like_red.png");
									
 									$("#<%="font"+i %>").text(zan);
						        },
						        error: function(){
						        }
						    });
						});
						
					</script>
					<a title="分享到QQ" href="javascript:void(0)" class="share_qq" onclick="shareToqq(event)"> 
						<img src="img/share.png" style="height: 30px;" />
					</a> &nbsp;&nbsp;&nbsp; <font>分享到QQ</font>
					<p></p>
				</td>
			</tr>
		</table>
	</div>
	<%
		}
	%>
	<!-- 分页组件 -->
	<div style="position: relative; left: 275px">
		<ul class="pagination">

			<c:forEach begin="1" end="${pageCount }" var="page">
				<li><a
					href="${pageContext.request.contextPath }/PageServlet?page=${page}">${page }</a></li>
			</c:forEach>
		</ul>
	</div>
</body>

<script type="text/javascript">
	function shareToqq(event) {
		event.preventDefault();
		var _shareUrl = 'https://connect.qq.com/widget/shareqq/iframe_index.html?';
		_shareUrl += 'url='
				+ encodeURIComponent("${pageContext.request.contextPath }/comment.jsp"); //分享的链接
		_shareUrl += '&title=' + encodeURIComponent("用户动态"); //分享的标题
		window.open(_shareUrl, "newWindow", "width=720,height=510");
	}

</script>

</html>