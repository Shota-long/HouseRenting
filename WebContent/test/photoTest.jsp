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
	margin-left: 70px;
	margin-right: 70px;
	height: 90px;
	width: 110px;
} 
</style>

</head>
<body>
<div>
	<form action="uploadPicAction_uploadPic" method="post" enctype="multipart/form-data">
		<input type="file" id="file" name="file" accept="image/*">
		<input type="submit" value="提交">
	</form>
</div>
<div class="swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide" ><img src="/upload/image/2019/05/05/201905081811.jpg" class="img-responsive"/></div>
        <div class="swiper-slide" ><img src="/upload/image/2019/05/05/201905081812.jpg" class="img-responsive"/></div>
        <div class="swiper-slide" ><img src="/upload/image/2019/05/05/201905081814.jpg" class="img-responsive"/></div>
		<div class="swiper-slide" ><img src="/upload/image/2019/05/05/201905081815.jpg" class="img-responsive"/></div>
        <div class="swiper-slide" ><img src="/upload/image/2019/05/05/201905081816.jpg" class="img-responsive"/></div>
        <div class="swiper-slide" ><img src="/upload/image/2019/05/05/201905081817.jpg" class="img-responsive"/></div>    
    </div>
    <!-- 如果需要导航按钮 -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
</div>
<script>        
  var mySwiper = new Swiper ('.swiper-container', {
    loop: true, // 循环模式选项
    slidesPerView:5,
    // 如果需要前进后退按钮
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  })        
  </script>
</body>
</html>