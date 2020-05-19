<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>青岛</title>
		<link rel="stylesheet" href="css/travel-qd.css" >
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<script src="assets/js/jquery-1.11.1.min.js"></script>
	</head>
	<body>
		<div id="main-div">	
		
		<%@ include file="/nav.jsp" %>
		
			<!--段一-->
			<section class="qd1">
				<div class="qd11">
					<img src="img/五月的风.jpg" >
				</div>
				
				<div class="qd12">
					<div class="qd121">
						<a href="getQDMap.html" style="color:black;text-decoration:none;"><h1>青岛</h1></a>
						<img src="img/五颗星.jpg">
						
						<p>青岛是中国首批优秀旅游城市，位于山东半岛南端，是中国东部沿海地区重要的交通枢纽和海外游客人出入中国的主要口岸。青岛三面环海、气候宜人，加上特殊的历史沉淀，使青岛早在20世纪初就成为中国著名的旅游胜地。</p>
					</div>
					<div class="qd122">
						<p style="position: relative; top: 45px; left: 20px; font-size: 30px; color: darkgrey;"><a style="font-size: 40px; color: black;">174</a>人去过</p>
						
						<!--想去图标，可点击-->
						<div id="form1">
							<img style="width: 60px; height: 55px; position: absolute; top: 45px; left: 260px;" src="img/想去图标.png" />
						</div>
						<span style="position: absolute; top: 55px; left: 330px; font-size: 30px; color: darkgray">想去</span>
						
						<!--去过图标，可点击-->
						<div id="form1">
							<img style="width: 65px; height: 55px; position: absolute; top: 45px; left: 420px;" src="img/去过图标.png" />
						</div>
						<span style="position: absolute; top: 55px; left: 490px; font-size: 30px; color: darkgray;">去过</span>
					</div>
				</div>
			</section>
			
			<!--段2-->
			<section>
				<div class="qd2">
					<div class="qd21">
						<p>1、到青岛大多要去栈桥，青岛栈桥是青岛海滨风景区的景点之一，国家4A级景区，始建于光绪十八年1892年。它位于青岛火车站南端。</p>
						
						<!--点赞图标-->
						<div id="form1">
							<img style="width: 65px; height: 55px; position: absolute; bottom: 40px; right: 0;" src="img/点赞图标1.jpg" />
						</div>
						<span style="position: absolute; bottom: 42px; right: 60px; font-size: 30px; "><a style="color: black;">294</a></span>
					</div>
					
					<div class="qd22">
						<img src="img/栈桥.jpg"/>
					</div>
					
					<div class="qd23">
						<img src="img/八大关.jpg" />
					</div>
					
					<div class="qd24">
						<p>2、八大关号称中国最美的城区之一，具有红瓦绿树，碧海蓝天特点的风景区。此处是著名的别墅区，有200多栋建筑包括俄国、英国、法国、德国、美国、日本和丹麦等20多个国家的建筑风格，人称万国建筑博物馆。位置在青岛市市南区，汇泉角东北部。</p>
						
						<!--点赞图标-->
						<div id="form1" >
							<img style="width: 65px; height: 55px; position: absolute; bottom: 40px; left: 0;" src="img/点赞图标2.jpg" />
						</div>
						<span style="position: absolute; bottom: 43px; left: 65px; font-size: 30px; "><a style="color: black;">302</a></span>
					</div>
					
					<div class="qd25">
						<p>3、青岛奥帆中心，2008年第29届奥运会帆船项目在这里举行。与五四广场比邻，2018年上合峰会在这里举办。现如今向游人开放。位于青岛市东部，浮山湾畔。</p>
						
							
						<!--点赞图标-->
						<div id="form1">
							<img style="width: 65px; height: 55px; position: absolute; bottom: 40px; right: 0;" src="img/点赞图标1.jpg" />
						</div>
						<span style="position: absolute; bottom: 42px; right: 60px; font-size: 30px; "><a style="color: black;">244</a></span>
					</div>
					
					<div class="qd26">
						<img src="img/奥帆中心.jpg" />
					</div>
					
					<div class="qd27">
						<img src="img/崂山.jpg" />
					</div>
					<div class="qd28">
						<p>4、青岛崂山风景区是国家重点旅游景区，5a级景区、道教名山，它历史悠久，游览需要门票。位于青岛市崂山区。</p>
							
						<!--点赞图标-->
						<div id="form1" >
							<img style="width: 65px; height: 55px; position: absolute; bottom: 40px; left: 0;" src="img/点赞图标2.jpg" />
						</div>
						<span style="position: absolute; bottom: 43px; left: 65px; font-size: 30px; "><a style="color: black;">231</a></span>
					</div>
					<h1 style="top: 100px;">推荐攻略</h1>
				</div>
			</section>
			
			<!--段三-->
			<section>
				<div class="qd3">
					<img src="img/推荐栏-杭州.jpg"/>
					<img src="img/推荐栏-厦门.jpg" />
					<img src="img/推荐栏-三亚.jpg"/>
				</div>
			</section>
		
		<!--关于我们-->
			<div style="background-color: #5a5a5a; height: 100px;">
				<p style="font-size: 15px;color: #a0a0a0;letter-spacing: 5px;line-height: 1.5;position: relative;right: -50px;top: 40px;">
					关于我们
				</p>
			</div>
		</div>
	</body>
</html>
