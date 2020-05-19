<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>杭州</title>
		<link rel="stylesheet" href="css/travel-hz.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<script src="assets/js/jquery-1.11.1.min.js"></script>
	</head>

	<body>
		<div id="main-div">
		
		<%@ include file="/nav.jsp" %>
		
			<!--段一-->
			<section class="qd1">
				<div class="qd11">
					<img src="img/杭州/第一张图.jpg">
				</div>

				<div class="qd12">
					<div class="qd121">
						<a href="getHZMap.html" style="color:black;text-decoration:none;"><h1>杭州</h1></a>
						<img src="img/五颗星.jpg">

						<p>自古以来就有“上有天堂，下有苏杭”之说，可见杭州的美并不是现代社会才有的，而是自古流传，坐落于南方的杭州不仅经济十分的发达，景色也是别有一番韵味，也是我国知名的旅游城市，随着人们生活水平的提高，旅游也成了家常便饭，如果你选择去杭州旅游，这几个地方绝对不容错过。</p>
					</div>
					<div class="qd122">
						<p style="position: relative; top: 45px; left: 20px; font-size: 30px; color: darkgrey;">
							<a style="font-size: 40px; color: black;">684</a>人去过</p>

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
						<p>1、西湖无疑是杭州之美的代表，著名的“西湖十景”环绕湖边，自然与人文相互映衬，组成了杭州旅行的核心地带。西湖概览游玩西湖可以步行、坐游船、乘电瓶车，也可以自驾或者骑行。其中，电瓶车是最方便省力的，环西湖有招手即停的游览车，线路正好绕西湖一圈。</p>

						<!--点赞图标-->
						<div id="form1">
							<img style="width: 65px; height: 55px; position: absolute; bottom: 40px; right: 0;" src="img/点赞图标1.jpg" />
						</div>
						<span style="position: absolute; bottom: 42px; right: 60px; font-size: 30px; "><a style="color: black;">294</a></span>
					</div>

					<div class="qd22">
						<img src="img/杭州/西湖.jpg" />
					</div>

					<div class="qd23">
						<img src="img/杭州/灵隐寺.jpg" />
					</div>

					<div class="qd24">
						<p>2、灵隐寺又称“云林寺”，坐落于西湖西面的灵隐山麓。寺内环境清幽，是杭州最早的名刹，留存着各朝代众多精美文物。这里是济公的出家地，据说求愿很灵验，每天来礼佛祈福的香客络绎不绝。一千七百年的风雨，使灵隐寺成为历史与文化的宝库：天王殿上悬“云林禅寺”匾额，为清康熙帝所题。</p>

						<!--点赞图标-->
						<div id="form1">
							<img style="width: 65px; height: 55px; position: absolute; bottom: 40px; left: 0;" src="img/点赞图标2.jpg" />
						</div>
						<span style="position: absolute; bottom: 43px; left: 65px; font-size: 30px; "><a style="color: black;">302</a></span>
					</div>

					<div class="qd25">
						<p>3、宋城位于杭州西南市郊，是一座大型宋代文化主题乐园。充满宋代风情的仿古茶楼、杂货铺、打铁铺、酒坊等随处可见。街上有木偶戏、皮影戏、打擂台等表演，还会遇到披甲士兵巡街或是缉拿逃犯，给人一种奇妙的穿越感。来了宋城就一定要看《宋城千古情》，通过大型的歌舞秀，你会看到良渚古人的生活、宋朝皇宫的辉煌、岳家军的惨烈以及《梁祝》、《白蛇传》的千古绝唱，体验一回心灵的震撼。</p>

						<!--点赞图标-->
						<div id="form1">
							<img style="width: 65px; height: 55px; position: absolute; bottom: 40px; right: 0;" src="img/点赞图标1.jpg" />
						</div>
						<span style="position: absolute; bottom: 42px; right: 60px; font-size: 30px; "><a style="color: black;">244</a></span>
					</div>

					<div class="qd26">
						<img src="img/杭州/宋城.jpg" />
					</div>
					<h1 style="top: 100px;">推荐攻略</h1>
				</div>
			</section>

			<!--段三-->
			<section>
				<div class="qd3">
					<a href="#"><img src="img/青岛/青岛.jpg" /></a>
					<a href="#"><img src="img/青岛/推荐栏-厦门.jpg" /></a>
					<a href="#"><img src="img/青岛/推荐栏-三亚.jpg" /></a>
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