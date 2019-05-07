<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="0">
<title></title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap-hover-dropdown/2.0.10/bootstrap-hover-dropdown.min.js"></script>
<!-- 城市三级联动 -->
<script src="https://cdn.bootcss.com/distpicker/2.0.3/distpicker.js"></script>	

<style type="text/css">
body{
	width:100%;
}
.img-responsive {
  display: block;
  height: 220px;
  max-width: 400px;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row-fluid" class="clearfix">
	<jsp:include page="head.jsp"></jsp:include>
	<!--  
	<div class="row-fluid" class="clearfix">
		<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4"> 
       		<a href="#">
        		<h1>HOUSERENT</h1>
      		 </a>
   		</div>
   		<div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
   			<br>
        	<div class="input-group">
           		<input type="text" class="form-control input-lg" placeholder="开始找房">
            	<span class="input-group-btn">
            		<br>
              		<button class="btn btn-default input-lg" type="button" >搜房源</button>
            	</span>
        	</div>
    	</div>
      	<div class="col-lg-3 col-md-3 col-xs-3 col-sm-3"></div>
    </div>
    -->
	</div>
</div>
<div class="container-fluid"> 
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>   
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="image/slide1.png" alt="First slide" style="height:500px">
			</div>
			<div class="item">
				<img src="image/slide2.png" alt="Second slide" style="height:500px">
			</div>
			<div class="item">
				<img src="image/slide3.png" alt="Third slide" style="height:500px">
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
<br>
<br>
<div class="container-fluid">
	<div>
		<span style="font-size: 30px">热门租房</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/houseInformation/houseInforList.jsp ">查看全部房源</a>
	</div>
	<hr>	
</div> 
<div class="container-fluid">
	<div class="row-fluid">
		<div id="box"></div>
	</div>
</div>
<script type="text/javascript">
	$(function() { //页面加载完成执行该方法
		$.ajax({
			url:encodeURI("${pageContext.request.contextPath}/HouseAction_findHouseInfo"),
			type:"post",
			cache:false,
			dataType:"json",
			contentType:"application/json;charset=utf-8",
			success:function(resultList){
				addBox(resultList);
			}
		});
	});
	function addBox(resultList) {
		var count = 0;
		$.each(resultList,function(index,obj){
			if (count<4) {
				$("#box").append(
						"<div class='col-lg-3 col-md-3 col-xs-3 col-sm-3'>"+
						"<div>"+
							"<img src='/upload/image/2019/05/05/aecb8a92dcb14fea965e6f3c3ebcf65c.jpg' class='img-responsive'>"+
							"<div>"+
								"<p style='font-size: 18px;'>"+obj['title']+"</p>"+
								"<p>"+obj['location']+"</p>"+
								"<p>"+
									"<span>"+obj['type']+"&nbsp;&nbsp;&nbsp;&nbsp;"+obj['area']+"㎡&nbsp;&nbsp;&nbsp;&nbsp;"+obj['rent_way']+"</span>"+
									
								"</p>"+
								"<p>"+
									"<span style='color: red; font-size: 20px;'>"+obj['price']+"元/月</span>"+
								"</p>"+
							"</div>"+
						"</div>"+
					"</div>"	
				);
			}
			count++;
		});
	}
</script>
</body>
</html>