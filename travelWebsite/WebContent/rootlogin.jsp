<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link href="css/admin_login.css" rel="stylesheet" type="text/css" />
    <script src="assets/js/jquery-1.11.1.min.js"></script>
</head>
<body>
<div class="admin_login_wrap">
    <h1>后台管理</h1>
    <div class="adming_login_border">
        <div class="admin_input">
                <ul class="admin_items">
                    <li>
                        <label for="user">用户名：</label>
                        <input type="text" name="name" value="" id="user" size="40" class="admin_input_style" />
                    </li>
                    <li>
                        <label for="pwd">密码：</label>
                        <input type="password" name="password" value="" id="pwd" size="40" class="admin_input_style" />
                    </li>
                    <li>
                        <input type="button" tabindex="3" value="登陆" id = "btn2" onclick = "change()" class="btn btn-primary" />
                    </li>
                </ul>
                <script type="text/javascript" src="wangEditor.min.js" src="js/jquery.min.js"></script>
    			<script type="text/javascript">
        			function change(){
        				$.ajax({
        					url:"${pageContext.request.contextPath }/RootLogin",
        					type:"post",
        					dataType:"text",
        					data:{
        						"name" : $("#user").val(),
        						"password" : $("#pwd").val()
        					},
        					success:function(result){
        						if(result=="false"){
        							alert("登陆失败，请重试")
        							return;
        						}
        						else{
        							alert("登陆成功");
            						window.location.href = "rootindex.html"
        						}
        						
        					},
        					error:function(){
        					}
        				});
        			}
    			</script>
        </div>
    </div>
</div>
</body>
</html>