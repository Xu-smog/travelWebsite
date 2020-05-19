<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript" src="js/modernizr.min.js"></script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="rootindex.html">首页</a></li>
                <li><a href="index.html" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="rootlogin.jsp">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="rootuser.jsp"><i class="icon-font">&#xe000;</i>用户管理</a></li>
                        <li><a href="rootarticle.jsp"><i class="icon-font">&#xe005;</i>文章管理</a></li>
                        <li><a href="rootcomment.jsp"><i class="icon-font">&#xe012;</i>评论管理</a></li>
                    </ul>
                </li>
                <!--
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
                    <ul class="sub-menu">
                        <li><a href="system.html"><i class="icon-font">&#xe017;</i>系统设置</a></li>
                        <li><a href="system.html"><i class="icon-font">&#xe037;</i>清理缓存</a></li>
                        <li><a href="system.html"><i class="icon-font">&#xe046;</i>数据备份</a></li>
                        <li><a href="system.html"><i class="icon-font">&#xe045;</i>数据还原</a></li>
                    </ul>
                </li>
                -->
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="rootindex.html">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">用户管理</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form role="form" action=" ${pageContext.request.contextPath}/RootArticle" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="70">用户 ID：</th>
                            <td><input class="common-text" placeholder="用户 ID..." name="keywords" value="" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th class="tc" width="5%"></th>
                            <th>ID</th>
                            <th>审核状态</th>
                            <th>发表用户</th>
                            <th>文章标题</th>
                            <th>内容路径</th>
                            <th>发表时间</th>
                            <th>操作</th>
                        </tr>
                        <%int i=0; %>
                        <c:forEach items="${userAll}" var="U" >
                        <tr>
                            <td class="tc"><input name="id[]" value="59" type="checkbox"></td>
                            <td  id = <%="article_id"+i %> >${U.article_id }</td>
                            <td></td>
                            <td>${U.user_id }</td>
                            <td>${U.title }</td>
                            <td>${U.content}</td>
                            
                            <td>
                                <input class="btn btn-primary btn2" name="sub" id=<%="btn2"+i %> value="删除" type="button">
                                <script type="text/javascript" src="js/jquery.min.js"></script>
                     			<script type="text/javascript">
                     				document.getElementById('<%="btn2"+i %>').addEventListener('click', function (){
         								// 读取 text
         								var tdobj = document.getElementById('<%="article_id"+i %>');
										//alert(tdobj.innerText);
										$.post("${pageContext.request.contextPath}/RootDelete",
         								{	
         					 				article_id: tdobj.innerText						      
         								});
										$(this).parent().parent().remove()
         							}, false)
                     			</script>
                            </td>
                        </tr>
                        <%i=i+1; %>
                        </c:forEach>
                    </table>
                    <div class="list-page"> 1/1 页</div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>