<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>上传头像</title>

<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>

<body>
<div class="container">
  <div class="imageBox">
		<div class="thumbBox"></div>
		<div class="spinner" style="display: none">Loading...</div>
  </div>
  <div class="action"> 
		<div class="new-contentarea tc"> 
			<a href="javascript:void(0)" class="upload-img">
				<label for="upload-file">上传图像</label>
		  </a>
		  <input type="file" class="" name="upload-file" id="upload-file" />
		</div>
		<input type="button" id="btnCrop"  class="Btnsty_peyton" value="裁切">
		<input type="button" id="btnZoomIn" class="Btnsty_peyton" value="+"  >
		<input type="button" id="btnZoomOut" class="Btnsty_peyton" value="-" >
  </div>
  <div class="cropped"></div>
 	<input type="button" class="Btnsty_peyton" value="提交" id="tijiao" style="position: relative; top: 20px; right: -230px;" />
</div>
	
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/cropbox.js"></script>
<script type="text/javascript">
	$(window).load(function() {
			var imgUrl;
			var url=window.location.search; //获取url中"?"符后的字串  
			if(url.indexOf("?")!=-1){
				imgUrl = url.substr(url.indexOf("=")+1);
			}
			var options =
			{
				thumbBox: '.thumbBox',
				spinner: '.spinner',
				imgSrc: imgUrl
			}
			var cropper = $('.imageBox').cropbox(options);
			$('#upload-file').on('change', function(){
				var reader = new FileReader();
				reader.onload = function(e) {
					options.imgSrc = e.target.result;
					cropper = $('.imageBox').cropbox(options);
				}
				reader.readAsDataURL(this.files[0]);
				this.files = [];
			})
			$('#btnCrop').on('click', function(){
				var img = cropper.getDataURL();
				$('.cropped').html('');
				$('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:64px;margin-top:4px;border-radius:64px;box-shadow:0px 0px 12px #7E7E7E;" ><p>64px*64px</p>');
				$('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:128px;margin-top:4px;border-radius:128px;box-shadow:0px 0px 12px #7E7E7E;"><p>128px*128px</p>');
				$('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:180px;margin-top:4px;border-radius:180px;box-shadow:0px 0px 12px #7E7E7E;"><p>180px*180px</p>');
			})
			$('#btnZoomIn').on('click', function(){
				cropper.zoomIn();
			})
			$('#btnZoomOut').on('click', function(){
				cropper.zoomOut();
			})	
			
			$('#tijiao').on('click',function(){
                 alert('提交成功!');			  
				 $.ajax({
				      type: "POST",
				      url: "${pageContext.request.contextPath }/headServlet",
				      dataType: "text",
				      data: { 
				      	"userFaceImg": cropper.getDataURL() 
				         },
				      success: function(result){
				      	if(result=="true"){
				      		window.location.href="${pageContext.request.contextPath }/MyServlet";
				      	}
				      },
				      error: function(){
				      }
				  });
			})	
	});
	
</script>
</body>
</html>
</body>
</html>