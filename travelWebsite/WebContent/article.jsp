<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/travel.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<script src="assets/js/jquery-1.11.1.min.js"></script>
		<style type="text/css">
        .toolbar {
            border: 0px solid #ccc;
        }
        .text1 {
            border: 1px solid #ccc;
            height: 40px;
        }
        .text2 {
        	border: 1px solid #ccc;
            height: 600px;
        }
   		</style>
	</head>
	<body>
		<div id="main-div">
		
			<%@ include file="/nav.jsp" %>
			
			<div style="width: 800px; padding: 50px;">
				<img src="<%=request.getSession().getAttribute("userFaceImg")%>" style="width: 200px; border-radius: 50%;" align="left"/>
				<table style="width: 300px; height: 200px; position: relative; right: -40px; font-size: 16px;">
					<tr>
						<td> 用户：<%=(String) request.getSession().getAttribute("userName")%> </td>
					</tr>
					<tr>
						<td> 个性签名: <%=(String) request.getSession().getAttribute("about_me")%></td>
					</tr>
					<tr>
						<td> 点赞：233 </td>
					</tr>
				</table>
			</div>

				<div style="padding-top: 30px; padding-bottom: 20px;"></div>
   				<div id="editor2" class="text1" >
   				<p>你可以在这里输入你的标题 . . .</p>
   				</div>
   				<div style="padding: 5px;"></div>
   				<div id="editor1" class="toolbar">
				</div>
   				<div style="padding: 5px;"></div>
   				<div id="editor3" class="text2" >
   				<p>你可以在这里输入你的正文 . . .</p>
   				</div>
    			<div style="padding: 20px;"></div>
    			<hr />
    			<div style="padding-bottom: 30px; text-align: center;">
    				<input type="button" id="btn2" value = "提交"  style="align:center ;background-color: #5a5a5a; height: 40px; width: 100px; border: none; color: white;"/>
    			</div>
    		   			 <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
    			<script type="text/javascript" src="wangEditor.min.js" src="js/jquery.min.js"></script>
    			<script type="text/javascript">
      		 		var E = window.wangEditor
       		 		var editor = new E('','#editor2')
        			editor.create()
					var editor1 = new E('#editor1','#editor3')
      		 		editor1.customConfig.uploadImgShowBase64 = true
      		 		editor1.create()
        			document.getElementById('btn2').addEventListener('click', function () {
                		var formData = new FormData();
                		formData.append("title", editor.txt.text());
                		formData.append("content", editor1.txt.html());
                		
                		/*
                		$.ajax({
        					type: "POST",
        					url: "${pageContext.request.contextPath }/ArticleSubmit",
        					dataType: "text",
        					data: { 
        						"title":  title,
        	                	"content":  content
        				    },
        					success: function(result){
        						window.location.href='${pageContext.request.contextPath }/DisplayArticel'
        					},
        					error: function(){
        						alert("图片上传过大...")
        				    }
        				});*/
                		$.ajax({
                		    url: "${pageContext.request.contextPath }/ArticleSubmit",
                		    type: 'POST',
                		    cache: false,
                		    data: formData,
                		    processData: false,
                		    contentType: false
                		}).done(function(res) {
                			window.location.href='${pageContext.request.contextPath }/DisplayArticel';
                		}).fail(function(res) {
                			
                		});
        				
           			}, false)            			
    			</script>
    		<div style="background-color: #5a5a5a; height: 100px;">
				<p style="font-size: 15px;color: #a0a0a0;letter-spacing: 5px;line-height: 1.5;position: relative;right: -50px;top: 40px;">
					关于我们
				</p>
			</div>
		</div>
		
	</body>
</html>
