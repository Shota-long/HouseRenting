<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="../dist/css/swiper.min.css" rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap-hover-dropdown/2.0.10/bootstrap-hover-dropdown.min.js"></script>
<script src="../dist/js/swiper.min.js"></script>

<style type="text/css">
.swiper-container {
    width: 600px;
    height: 100px;
} 
.img-responsive {
  display: block;
  height: 110px;
  max-width: 200px;
  float: left;
  display: inline-block;
}

/*外层div*/
.input-file-box{
	border: 1px solid gray;
    width: 150px;
    height: 150px;
    position: relative;
    text-align: center;
    vertical-align:middle;
    border-radius: 8px;
}
/*文字描述*/
.input-file-box > span{
	display: block;
    width: 100px;
    height: 30px;
    position: absolute;
    top: 0px;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
    color: gray;
}
/*input框*/
.input-file-box #fi{
	opacity: 0;
    width: 100%;
    height: 100%;
    cursor: pointer;
}
.fileinput-button {
    position: relative;
  	display: inline-block;
    overflow: hidden;
 }

 .fileinput-button input{
     position: absolute;
     left: 0px;
     top: 0px;
     opacity: 0;
}
</style>

</head>
<body>
<div id="box" style="display: inline-block;"></div>
<div style="display: inline-block;">
	<form action="uploadPicAction_uploadPic" method="post" enctype="multipart/form-data">
	<span class="btn btn-success fileinput-button">
		<span>上传图片</span>
		<input type="file" id="file" name="file" accept="image/*" multiple>
	</span>
	</form>
</div>
<script type="text/javascript">
window.onload = function() {
	var input = document.getElementById("file");
	var div;
	//当用户上传时触发事件
	input.onchange = function() {
		readFile(this);
	}
	//处理图片并添加到dom中的函数
	var readFile = function(obj) {
		//获取input里面的文件组,obj返回一个FileList对象
		var fileList = obj.files;
		//console.log(fileList);
		//对文件组进行遍历，可以到控制台打印出FileList
		for (var i = 0; i < fileList.length; i++) {
			var reader = new FileReader();
			reader.readAsDataURL(fileList[i]);// 以DataURL格式读取文件内容
			//当文件读取成功时执行函数
			reader.onload = function(e) {  // 读取操作成功时触发
				//console.log(this.result);
				$("#box").append(
					"<div style=' display: inline-block;'>"+
					"<img src='"+this.result+"' class='img-responsive'  hspace='5'/>"+
					"</div>"
				);
			}
		}
	}
}

</script>
















<!-- <div class="swiper-container"> -->
<!--     <div class="swiper-wrapper"> -->
<!--         <div class="swiper-slide" ><img src="/upload/image/2019/05/05/201905081811.jpg" class="img-responsive"/></div> -->
<!--         <div class="swiper-slide" ><img src="/upload/image/2019/05/05/201905081812.jpg" class="img-responsive"/></div> -->
<!--         <div class="swiper-slide" ><img src="/upload/image/2019/05/05/201905081814.jpg" class="img-responsive"/></div> -->
<!-- 		<div class="swiper-slide" ><img src="/upload/image/2019/05/05/201905081815.jpg" class="img-responsive"/></div> -->
<!--         <div class="swiper-slide" ><img src="/upload/image/2019/05/05/201905081816.jpg" class="img-responsive"/></div> -->
<!--         <div class="swiper-slide" ><img src="/upload/image/2019/05/05/201905081817.jpg" class="img-responsive"/></div>     -->
<!--     </div> -->
<!--     如果需要导航按钮 -->
<!--     <div class="swiper-button-prev"></div> -->
<!--     <div class="swiper-button-next"></div> -->
<!-- </div> -->
<!-- <script>         -->
<!--    var mySwiper = new Swiper ('.swiper-container', { -->
<!--     loop: true, // 循环模式选项 -->
<!--     slidesPerView:5, -->
<!--      // 如果需要前进后退按钮 -->
<!--      navigation: { -->
<!--       nextEl: '.swiper-button-next', -->
<!--       prevEl: '.swiper-button-prev', -->
<!--      }, -->
<!--    })         -->
<!--   </script> -->
</body>
</html>