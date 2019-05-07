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
<style type="text/css">
body{
	width:100%;
}

.img-responsive {
  display: block;
  height: 110px;
  max-width: 200px;
}
a{
	color: black;
	text-decoration: none;
}

a:hover {
	color: red;
	text-decoration: underline;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row-fluid" class="clearfix">
	<jsp:include page="../head.jsp"></jsp:include>
	<!--  
	<div class="row-fluid" class="clearfix">
		<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4"> 
       		<a href="${pageContext.request.contextPath}/index.jsp">
        		<h1>HOUSERENT</h1>
      		 </a>
   		</div>
   		<div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
   			<br>
        	<div class="input-group">
           		<input type="text" class="form-control input-lg" placeholder="开始找房">
            	<span class="input-group-btn">
            		<br>
              		<button class="btn btn-default input-lg" type="button" onclick="findHouseInfo()">搜房源</button>
            	</span>
        	</div>
    	</div>
      	<div class="col-lg-3 col-md-3 col-xs-3 col-sm-3"></div>
    </div>
    -->
	</div>
</div>
<div class="container-fluid">
	<div class="row-fluid">
	<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
		<dl class="dl-horizontal">
			<dt>租金：</dt>
			<dd>
				<label><input type="radio" name="rent" checked="checked">不限</label>
				<label><input type="radio" name="rent">500元以下</label>
				<label><input type="radio" name="rent">500-1000元</label>
				<label><input type="radio" name="rent">1000-1500元</label>
				<label><input type="radio" name="rent">1500-2000元</label>
				<label><input type="radio" name="rent">2000-3000元</label>
				<label><input type="radio" name="rent">3000-4500</label>
				<label><input type="radio" name="rent">4500以上</label>
			</dd>
		</dl>
	</div>
	</div>
	<div class="row-fluid">
	<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
		<dl class="dl-horizontal">
			<dt>厅室：</dt>
			<dd>
				<label><input type="radio" name="room" checked="checked">不限</label>
				<label><input type="radio" name="room">一室</label>
				<label><input type="radio" name="room">两室</label>
				<label><input type="radio" name="room">三室</label>
				<label><input type="radio" name="room">四室</label>
				<label><input type="radio" name="room">四室以上</label>
			</dd>
		</dl>
	</div>
	</div>
	<div class="row-fluid">
	<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
		<dl class="dl-horizontal">
			<dt>方式：</dt>
			<dd>
				<label><input type="radio" name="rent_way" checked="checked">不限</label>
				<label><input type="radio" name="rent_way">整套出租</label>
				<label><input type="radio" name="rent_way">单间出租</label>
			</dd>
		</dl>
	</div>
	</div>
	<div class="row-fluid">
	<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
		<dl class="dl-horizontal">
			<dt>装修程度：</dt>
			<dd>
				<label><input type="radio" name="decoration" checked="checked">不限</label>
				<label><input type="radio" name="decoration">毛坯</label>
				<label><input type="radio" name="decoration">简单装修</label>
				<label><input type="radio" name="decoration">中等装修</label>
				<label><input type="radio" name="decoration">精装修</label>
				<label><input type="radio" name="decoration">豪华装修</label>
			</dd>
		</dl>
	</div>
	</div>
</div>
<div id = "box"></div>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:encodeURI("${pageContext.request.contextPath}/HouseAction_findHouseInfo"),
		type:"get",
		cache:false,
		dataType:"json",
		contentType:"application/json;charset=utf-8",
		success:function(resultList){
			addBox(resultList);
		}
	});
});
function addBox(resultList){
	$.each(resultList,function(index,obj){
		
		$("#box").append(
				"<hr>"+
				"<div class='container-fluid'>"+
				 "<div class='row-fluid'>"+
				 	"<div class='col-lg-2 col-md-2 col-xs-2 col-sm-2' >"+
				 		"<a href='#' class = 'img-responsive'>"+
				 		"<img src='/upload/image/2019/05/05/aecb8a92dcb14fea965e6f3c3ebcf65c.jpg' class='img-responsive'>"+
				 		"</a>"+
				 	"</div>"+
				 	"<div class='col-lg-8 col-md-8 col-xs-8 col-sm-8'>"+
			 		"<div class='media-body'>"+
			                "<h3 class='media-heading'>"+
			                    "<a href='#'>"+obj['title']+"</a>"+	
			                "</h3>"+
			                "<p>"+obj['type']+"&nbsp;&nbsp;&nbsp;&nbsp;"+obj['area']+"㎡"+"&nbsp;&nbsp;&nbsp;&nbsp;"+obj['rent_way']+"</p>"+
			                "<p>"+obj['location']+"</p>"+
			                "<p>经纪人："+obj['username']+"</p>"+
			            "</div>"+
				 	"</div>"+
				 	"<div class='col-lg-2 col-md-2 col-xs-2 col-sm-2'>"+
				 		"<div class='media-body'>"+
			               "<h3 class='media-heading' style='color: red;'>"+obj['price']+"元/月</h3>"+
							"<h4>评分："+obj['grade']+"</h4>"+
			            "</div>"+
				 	"</div>"+
				 "</div>"+
			"</div>"+
			"<br/>"+
			"<br/>"
		);
		
	});
}

</script>
</body>
</html>