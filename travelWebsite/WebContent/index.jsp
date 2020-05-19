<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>首页</title>
		<link rel="stylesheet" href="css/travel.css">

		<!-- CSS -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
		<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
		<link rel="stylesheet" href="assets/css/style.css">
		
	</head>
	<body>

		<!-- 登录 -->
		<div class="modal fade" id="modal-register" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="modal-title" id="modal-register-label">登录</h3>
						<p>分享你的旅途:</p>
					</div>

					<div class="modal-body">
						<form role="form" action="${pageContext.request.contextPath }/LoginServlet" method="post" class="registration-form" onsubmit="return logcheck()" target="iframe">
							<div class="form-group">
								<label class="sr-only" for="form-last-name">电子邮箱</label>
								<input type="text" name="email" placeholder="电子邮箱..." class="form-last-name form-control" id="form-last-name">
							</div>
							<div class="form-group">
								<label class="sr-only" for="form-email">密码</label>
								<input name="password" placeholder="密码..." class="form-email form-control" id="form-email" type="password">
							</div>
							<button type="submit" class="btn" id="button1"  >登录</button>
						</form>
						<iframe name="iframe" style="display:none"></iframe>
					</div>
				</div>
			</div>
		</div>

		<!-- 注册 -->
		<div class="modal fade" id="modal-register1" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="modal-title" id="modal-register-label1">注册</h3>
						<p>分享你的旅途:</p>
					</div>

					<div class="modal-body">
						<!-- 输出检验 -->
						<form role="form" action="${pageContext.request.contextPath }/RegistServlet" method="post" class="registration-form" onsubmit="return signcheck()" target="iframe1">
							<div class="form-group">
								<label class="sr-only" for="form-first-name">昵称</label>
								<input type="text" name="user_name" placeholder="昵称..." class="form-first-name form-control" id="form-first-name1">
							</div>
							<div class="form-group">
								<label class="sr-only" for="form-last-name">电子邮箱</label>
								<input type="text" name="email" placeholder="电子邮箱..." class="form-last-name form-control" id="form-last-name1">
							</div>
							<div class="form-group">
								<label class="sr-only" for="form-email">密码</label>
								<input name="password" placeholder="密码..." class="form-email form-control" id="form-email1" type="password">
							</div>
							<div class="form-group">
								<label class="sr-only" for="form-about-yourself">介绍一下自己</label>
								<textarea name="about_me" placeholder="介绍一下自己..." class="form-about-yourself form-control" id="form-about-yourself1"></textarea>
							</div>
							<button type="submit" class="btn">注册并登录</button>
						</form>
						<iframe name="iframe1" style="display:none"></iframe>
					</div>

				</div>
			</div>
		</div>

		<div id="main-div">
			<nav class="navbar navbar-inverse" role="navigation" style="overflow:hidden;">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">主页</a>
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
				
				<div class="search1"></div>
			</nav>
			<div style="padding-bottom: 15px;">
				<!--旅游攻略TOP10-->
				<div style="width: 280px;display: inline-block; margin-top:15px">
					<p class="top7"><strong>TOP10</strong>旅游攻略</p>
					<div class="top10" style="padding-right: 10px;">
						<a href="#" class="list-group-item" style="height: 46px;">01、杭州旅游攻略</a>
						<a href="#" class="list-group-item" style="height: 46px;">02、上海旅游攻略</a>
						<a href="#" class="list-group-item" style="height: 46px;">03、青岛旅游攻略</a>
						<a href="#" class="list-group-item" style="height: 46px;">04、南京旅游攻略</a>
						<a href="#" class="list-group-item" style="height: 46px;">05、成都旅游攻略</a>
						<a href="#" class="list-group-item" style="height: 46px;">06、日本旅游攻略</a>
						<a href="#" class="list-group-item" style="height: 46px;">07、北京旅游攻略</a>
						<a href="#" class="list-group-item" style="height: 46px;">08、欧洲旅游攻略</a>
						<a href="#" class="list-group-item" style="height: 46px;">09、武汉旅游攻略</a>
						<a href="#" class="list-group-item" style="height: 46px;">10、西安旅游攻略</a>
						<a href="#" class="list-group-item" style="height: 46x;">更多</a>
					</div>
				</div>
				<div style="width: 855px;display: inline-block;position: relative;top: 17px;float: right;">
					<p class="top7">今日美图</p>
					<div id="myCarousel" class="carousel slide">
						<!-- 轮播（Carousel）指标 -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
							<li data-target="#myCarousel" data-slide-to="3"></li>
							<li data-target="#myCarousel" data-slide-to="4"></li>
						</ol>
						<!-- 轮播（Carousel）项目 -->
						<div class="carousel-inner lunbotu">

							<div class="item active">
								<img src="img/轮播图1.jpg" alt="First slide">
							</div>
							<div class="item">
								<img src="img/冰岛瀑布.png" alt="Second slide">
							</div>
							<div class="item">
								<img src="img/轮播图3.jpg" alt="Third slide">
							</div>
							<div class="item">
								<img src="img/青岛奥帆中心.png" alt="Forth slide">
							</div>
							<div class="item">
								<img src="img/轮播图2.jpg" alt="Fifth slide">
							</div>

						</div>
						<!-- 轮播（Carousel）导航 -->
						<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>

			<hr size="2" />
				<div class="ma">
					<div id="ma-left">
						<table style="border-collapse: separate;border-spacing: 12px">
							<tr>
								<td>
									<div class="content">

										<div class="img_container">
											<a href=""><img src="img/冰岛瀑布.png" /></a>
											<div class="mask">冰岛瀑布</div>
										</div>
									</div>
								</td>
								<td>
									<div class="content">
										<div class="img_container">
											<a href=""><img src="img/新年祭司.png" /></a>
											<div class="mask">新年祭祀</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="content">
										<div class="img_container">
											<a href=""><img src="img/琴鹤楼.png" /></a>
											<div class="mask">琴鹤楼</div>
										</div>
									</div>
								</td>
								<td rowspan="2">
									<div class="content">
										<div class="img_container1">
											<a href=""><img src="img/瑞士苏黎世湖冲浪.png" style="width: 340px;height:410px;border-radius: 4px;" /></a>
											<div class="mask">瑞士苏黎世湖冲浪</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="content">
										<div class="img_container">
											<a href=""><img src="img/青岛奥帆中心.png" /></a>
											<div class="mask">青岛奥帆中心</div>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div id="ma-right">
						<h1 style="letter-spacing: 5px;margin-bottom: 30px;padding: 0;margin-left: 20px ;margin-top: 0;">遇见·此刻</h1>
						<div class="user-ing">
							<ul>
								<li><a class="a-img" href="" target="_blank"> <img src="img/face1.png"
										 width="40" height="40"> </a> <a class="a-name" href="" target="_blank">
										绾发 </a> <span class="action">
										分享了 </span>
									<h6><a href="" title=" 穿行在遂昌南尖岩的山水画卷" target="_blank">
											穿行在遂昌南尖岩的山水画卷 </a> </h6>
								</li>
								<li><a class="a-img" href="" target="_blank"> <img src="img/face2.png"
										 width="40" height="40"> </a> <a class="a-name" href="" target="_blank">
										绾发 </a> <span class="action">
										分享了 </span>
									<h6><a href="" title=" 根艺王国——寻一种根艺根宫佛国" target="_blank">
											根艺王国——寻一种根艺根宫... </a> </h6>
								</li>
								<li><a class="a-img" href="" target="_blank"> <img src="img/face3.png"
										 width="40" height="40"> </a> <a class="a-name" href="" target="_blank">
										Vivienne9612 </a> <span class="action">
										喜欢了 </span>
									<h6><a href="" title=" 吃货要来哦！（2011.11）" target="_blank">
											吃货要来哦！（2011.11） </a> </h6>
								</li>
								<li><a class="a-img" href="" target="_blank"> <img src="img/face4.png"
										 width="40" height="40"> </a> <a class="a-name" href="" target="_blank">
										Z&amp;L </a> <span class="action">
										喜欢了 </span>
									<h6><a href="" title=" 那一抹深蓝" target="_blank">
											那一抹深蓝 </a> </h6>
								</li>
								<li><a class="a-img" href="" target="_blank"> <img src="img/face5.png"
										 width="40" height="40"> </a> <a class="a-name" href="" target="_blank">
										一部手机游甘肃 </a> <span class="action">
										分享了 </span>
									<h6><a href="" title=" 这里是“东方小瑞士”，是灵魂深处纯净的乐..." target="_blank">
											这里是“东方小瑞士”，是灵... </a> </h6>
								</li>
								<li><a class="a-img" href="" target="_blank"> <img src="img/face6.jpg"
										 width="40" height="40"> </a> <a class="a-name" href="" target="_blank">
										傲绝林 </a> <span class="action">
										分享了 </span>
									<h6><a href="" title=" 富阳  " target="_blank">
											富阳 </a> </h6>
								</li>

							</ul>
						</div>
					</div>
					<!--zjj-->
					<div style="background:#f8f8f8;width: inherit;margin-top: 20px;">
						</br>
						<p style="font-size: 45px;letter-spacing: 5px;">&nbsp;趁青春，去发现</p>
						<div style="border-right:2px solid #eaeaea; width: 280px;display: inline-block;">
							<table class="des-t">
								<tr>
									<td align="center" colspan="4">
										<img src="img/图标1.png" class="pic" /> <br />
										<a href="#" style="font: '微软雅黑';font-size: 25px;"> 当季游</a>
									</td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 杭州</a></td>
									<td><a href="#" class="a-link"> 大理</a></td>
									<td><a href="#" class="a-link"> 三亚</a></td>
									<td><a href="#" class="a-link"> 厦门</a></td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 甘肃</a></td>
									<td><a href="#" class="a-link"> 九寨沟</a></td>
									<td><a href="#" class="a-link"> 西双版纳</a></td>
									<td><a href="#" class="a-link"> 北京</a></td>
									<td></td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 成都</a></td>
									<td><a href="#" class="a-link"> 桂林</a></td>
									<td><a href="#" class="a-link"> 鼓浪屿</a></td>
									<td><a href="#" class="a-link"> 南京</a></td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 千岛湖</a></td>
									<td><a href="#" class="a-link"> 乌镇</a></td>
									<td><a href="#" class="a-link"> 新疆</a></td>
									<td><a href="#" class="a-link"> 黔东南</a></td>
								</tr>
							</table>
						</div>

						<div style="border-right:2px solid #eaeaea; width: 280px;display: inline-block;">
							<table class="des-t">
								<tr>
									<td align="center" colspan="4">
										<img src="img/图标2.png" class="pic" /> <br />
										<a href="#" style="font: '微软雅黑';font-size: 25px;"> 国内游</a>
									</td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 上海</a></td>
									<td><a href="#" class="a-link"> 香港</a></td>
									<td><a href="#" class="a-link"> 澳门</a></td>
									<td><a href="#" class="a-link"> 西藏</a></td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 青海湖</a></td>
									<td><a href="#" class="a-link"> 天津</a></td>
									<td><a href="#" class="a-link"> 涠洲岛</a></td>
									<td><a href="#" class="a-link"> 纳木错</a></td>
									<td></td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 拉萨</a></td>
									<td><a href="#" class="a-link"> 青岛</a></td>
									<td><a href="#" class="a-link"> 婺源</a></td>
									<td><a href="#" class="a-link"> 苏州</a></td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 武功山</a></td>
									<td><a href="#" class="a-link"> 西安</a></td>
									<td><a href="#" class="a-link"> 牛背山</a></td>
									<td><a href="#" class="a-link"> 平遥</a></td>
								</tr>
							</table>
						</div>

						<div style="border-right:2px solid #eaeaea; width: 280px;display: inline-block;">
							<table class="des-t">
								<tr>
									<td align="center" colspan="4">
										<img src="img/图标3.png" class="pic" /> <br />
										<a href="#" style="font: '微软雅黑';font-size: 25px;"> 欧美游</a>
									</td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 法国</a></td>
									<td><a href="#" class="a-link"> 巴黎</a></td>
									<td><a href="#" class="a-link"> 伦敦</a></td>
									<td><a href="#" class="a-link"> 纽约</a></td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 梵蒂冈</a></td>
									<td><a href="#" class="a-link"> 德国</a></td>
									<td><a href="#" class="a-link"> 西班牙</a></td>
									<td><a href="#" class="a-link"> 俄罗斯</a></td>
									<td></td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 意大利</a></td>
									<td><a href="#" class="a-link"> 威尼斯</a></td>
									<td><a href="#" class="a-link"> 美国</a></td>
									<td><a href="#" class="a-link"> 新西兰</a></td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 悉尼</a></td>
									<td><a href="#" class="a-link"> 墨尔本</a></td>
									<td><a href="#" class="a-link"> 塞班</a></td>
									<td><a href="#" class="a-link"> 罗马</a></td>
								</tr>
							</table>
						</div>

						<div style="width: 280px;display: inline-block;">
							<table class="des-t">
								<tr>
									<td align="center" colspan="4">
										<img src="img/图标4.png" class="pic" /> <br />
										<a href="#" style="font: '微软雅黑';font-size: 25px;"> 亚洲游</a>
									</td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 泰国</a></td>
									<td><a href="#" class="a-link"> 尼泊尔</a></td>
									<td><a href="#" class="a-link"> 印度尼西亚</a></td>
									<td><a href="#" class="a-link"> 日本</a></td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 越南</a></td>
									<td><a href="#" class="a-link"> 菲律宾</a></td>
									<td><a href="#" class="a-link"> 马来西亚</a></td>
									<td><a href="#" class="a-link"> 吉隆坡</a></td>
									<td></td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 韩国</a></td>
									<td><a href="#" class="a-link"> 马尔代夫</a></td>
									<td><a href="#" class="a-link"> 柬埔寨</a></td>
									<td><a href="#" class="a-link"> 印度</a></td>
								</tr>
								<tr class="des-r">
									<td><a href="#" class="a-link"> 新加坡</a></td>
									<td><a href="#" class="a-link"> 巴厘岛</a></td>
									<td><a href="#" class="a-link"> 长滩岛</a></td>
									<td><a href="#" class="a-link"> 缅甸</a></td>
								</tr>
							</table>
						</div>
						</br></br>
					</div>


					<div style="background-color: #5a5a5a; height: 100px;">
						<p style="font-size: 15px;color: #a0a0a0;letter-spacing: 5px;line-height: 1.5;position: relative;left: -500px;top: 40px;">
							关于我们
						</p>
					</div>
				</div>

			</body>

			<!-- Javascript -->
			<script src="assets/js/jquery-1.11.1.min.js"></script>
			<script src="assets/bootstrap/js/bootstrap.min.js"></script>
			<script src="assets/js/jquery.backstretch.min.js"></script>
			<script src="assets/js/scripts.js"></script>


			<!-- <script type="text/javascript" src="jquery-1.8.3.min.js"></script> -->
			<script type="text/javascript">
				$(function() {
					$(".img_container").hover(function() {
						$(".mask", this).slideToggle(400);
					});
					$(".img_container1").hover(function() {
						$(".mask", this).slideToggle(400);
					});
				});
				
				function logcheck(){
				    var email = document.getElementById("form-last-name").value;
				    var password = document.getElementById("form-email").value;
				    
				    if(!/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email)) {
				    	alert("请输入格式正确的 e-mail 地址！");
				    	return false;
				    }
				
				    if(password.length<6){ 
				        alert("您的密码长度小于6位，请重新输入");
				        return false;
				   	} 
				 	else if(password.length>12){ 
				        alert("您的密码长度大于12位，请重新输入");
						return false;
				    } 
				}
				
				function signcheck(){
					var nickname = document.getElementById("form-first-name1").value;		 //昵称
				    var email = document.getElementById("form-last-name1").value;			//邮箱
				    var password = document.getElementById("form-email1").value;			//密码
				    var aboutme = document.getElementById("form-about-yourself1").value;	//个人介绍
				    
				    var reg1 = /[~"#^$@%&!?%*;):'=(]/gi;
				    if (reg1.test(nickname)) {
				   		 alert("昵称不能含有特殊字符");
				   		 return false;
				    }
				    
				    if(!/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email)) {
				    	alert("请输入格式正确的 e-mail 地址！");
				    	return false;
				    }
				
				    if(password.length<6) { 
				        alert("您的密码长度小于6位，请重新输入");
				        return false;
				   	} else if(password.length>12) { 
				        alert("您的密码长度大于12位，请重新输入");
						return false;
				    } 
				}
			</script>
</html>
