<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>广场</title>
		<link href="css/tour.css" rel="stylesheet" type="text/css" />
		
		<!-- CSS -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
		<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
		<link rel="stylesheet" href="assets/css/style.css">
		
		<!-- Javascript -->
		<script src="assets/js/jquery-1.11.1.min.js"></script>
		<script src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.backstretch.min.js"></script>
		<script src="assets/js/scripts.js"></script>
	</head>

	<body>
		<div id="main-div">
		
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

		<nav class="navbar navbar-inverse" role="navigation" style="overflow:hidden;">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">主页</a>
					</div>
					<div>
						<ul class="nav navbar-nav">
							<li><a href="#">广场</a></li>
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
				
				<div id="myCarousel" class="carousel slide">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner lunbotu theme-lunbo">

					<div class="item active">
						<img src="img/主题页图片/轮转图2.png" alt="First slide">
					</div>
					<div class="item">
						<img src="img/主题页图片/轮转图1.png" alt="Second slide">
					</div>
					<div class="item">
						<img src="img/主题页图片/轮转图3.png" alt="Third slide">
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
			</nav>

		<!--当季旅游攻略-->
		<section class="sec1">
		    <div id="sec11">
		    	<img src="img/111.png" >
		        <span>当季旅游攻略</span>
		    </div>
		    
		    <!--毕业季图片-->
		    <div id="tu1">
		    	<img src="img/毕业季.png"/>
		    	<span ><a>毕业季 - - 趁青春，去旅行</a></span>
		    </div>
		    
		    <div class="tu2">
		    	<!--繁华盛开-->
		    	<div class="tu21">
			    	<img src="img/繁华盛开.jpg"/>
			    	<span ><a>于繁花盛开处等你</a></span>
		    	</div>
		    	
		    	<!--苍山洱海-->
		    	<div class="tu22">
			    	<img src="img/苍山洱海.jpg"/>
			    	<span ><a>苍山洱海</a></span>
		    	</div>
		    </div> 
		</section>
		
		<!--热门旅游攻略-->
		<section class="sec2">
		    <div class="sec21">
		    	<img src="img/111.png" >
		        <span>热门旅游攻略</span>
		    </div>
		    
		    <!--杭州-->
		    <div class="tu3">
		    	<img src="img/杭州.jpg">
		    	<span ><a href="${pageContext.request.contextPath }/travel_hz.jsp">杭州</a></span>
		    </div>

		    <!--厦门-->
		    <div class="tu4">
		    	<img src="img/厦门.jpg"/>
		    	<span ><a href="${pageContext.request.contextPath }/travel_xm.jsp">厦门</a></span>
		    </div>
		    
		    <!--青岛-->
		    <div class="tu5">
		    	<img src="img/青岛.jpg"/>
		    	<span ><a href="${pageContext.request.contextPath }/travel_qd.jsp">青岛</a></span>
		    </div>
		    
		    <!--三亚-->
		    <div class="tu6">
		    	<img src="img/三亚.jpg"/>
		    	<span ><a href="${pageContext.request.contextPath }/travel_sy.jsp" >三亚</a></span>
		    </div>
		</section>
		
		<!--第四块-->
		<div style="block">
			<section class="theme-top">
			<div class="theme-left">
				<p style="background:url(img/111.png) no-repeat;" class="theme1"><strong><a href="#">更多推荐</a></strong></p>
				<a href="#"><img src="img/主题页图片/古城.jpg" alt="古城" class="theme-left1"></a>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">古城寻梦——穿越千年的记忆...</a>
				</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href='#'>155人分享</a>&nbsp;|&nbsp;
					<a href="#">88人参与</a>
				</p>
				<a href="#"><img src="img/主题页图片/徒步去走.jpg" alt="古城" class="theme-left1"></a>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">徒步去走——享受一场灵魂的...</a>
				</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href='#'>155人分享</a>&nbsp;|&nbsp;
					<a href="#">88人参与</a>
				</p>
			</div>
			<div class="theme-right">
				<img src="img/主题页图片/小众.jpg" alt="小众" class="theme-right1">
				<div class="theme-right2">
					<a href="#">&nbsp;那些人少好玩的小众目的地&nbsp;</a>
				</div>

			</div>
			</section>
			
			<section class="theme-bottom">
			<div class="theme-bottom1">
				<img src="img/主题页图片/吃货.jpg" alt="*" class="theme-bottom-style">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">吃货必去——旅途中那些不断...</a>
				</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href='#'>155人分享</a>&nbsp;|&nbsp;
					<a href="#">88人参与</a>
				</p>
			</div>
			<div class="theme-bottom2">
				<img src="img/主题页图片/朝圣之路 .png" alt="*" class="theme-bottom-style">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">朝圣之旅——把心灵交给信仰...</a>
				</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href='#'>155人分享</a>&nbsp;|&nbsp;
					<a href="#">88人参与</a>
				</p>
			</div>
			<div class="theme-bottom2">
				<img src="img/主题页图片/杭州.jpg" alt="*" class="theme-bottom-style">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">最忆是杭州——让我们看看你...</a>
				</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href='#'>155人分享</a>&nbsp;|&nbsp;
					<a href="#">88人参与</a>
				</p>
			</div>
			<div class="theme-bottom2">
				<img src="img/主题页图片/大山大水.jpg" alt="*" class="theme-bottom-style">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">最忆是杭州——让我们看看你...</a>
				</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href='#'>155人分享</a>&nbsp;|&nbsp;
					<a href="#">88人参与</a>
				</p>
			</div>
			</section>
			</div>
			<div style="background-color: #5a5a5a; height: 100px; width :inherit ;position:absolute ; top :2500px">
				<p style="font-size: 15px;color: #a0a0a0;letter-spacing: 5px;line-height: 1.5;position: relative;left: -500px;top: 40px;">
					关于我们
				</p>
			</div>
			
		</div>
	</body>
</html>