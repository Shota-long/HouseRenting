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
<meta name="viewport" content="width=device-width,initial-scale=1.0">
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
	text-decoration: none;
}

div.overflow{
	overflow: hidden;  /* 额外部分隐藏*/
}

img{  
  cursor: pointer;  
  transition: all 0.5s; /* 所有的属性变化在0.5s的时间段内完成 */
}  

img:hover{  
  transform: scale(1.2); /* 鼠标放到图片上的时候图片按比例放大1.5倍   */
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
	<div class="col-lg-12 center">
		<dl class="dl-horizontal">
			<dt>租金：</dt>
			<dd>
				<label><input type="radio" name="rent" value="-1" checked="checked" onclick="check()">不限</label>
				<label><input type="radio" name="rent" value="499" onclick="check()">500元以下</label>
				<label><input type="radio" name="rent" value="500-999" onclick="check()">500-999元</label>
				<label><input type="radio" name="rent" value="1000-1499" onclick="check()">1000-1499元</label>
				<label><input type="radio" name="rent" value="1500-1999" onclick="check()">1500-1999元</label>
				<label><input type="radio" name="rent" value="2000-2999" onclick="check()">2000-2999元</label>
				<label><input type="radio" name="rent" value="3000-4499" onclick="check()">3000-4499</label>
				<label><input type="radio" name="rent" value="4500" onclick="check()">4500以上</label>
			</dd>
		</dl>
	</div>
	</div>
	<div class="row-fluid">
	<div class="col-lg-12 center">
		<dl class="dl-horizontal">
			<dt>厅室：</dt>
			<dd>
				<label><input type="radio" name="room" value="" checked="checked" onclick="check()">不限</label>
				<label><input type="radio" name="room" value="一室" onclick="check()">一室</label>
				<label><input type="radio" name="room" value="两室" onclick="check()">两室</label>
				<label><input type="radio" name="room" value="三室" onclick="check()">三室</label>
				<label><input type="radio" name="room" value="四室" onclick="check()">四室</label>
				<label><input type="radio" name="room" value="五室" onclick="check()">五室</label>
			</dd>
		</dl>
	</div>
	</div>
	<div class="row-fluid">
	<div class="col-lg-12 center">
		<dl class="dl-horizontal">
			<dt>方式：</dt>
			<dd>
				<label><input type="radio" name="rent_way" value="" checked="checked" onclick="check()">不限</label>
				<label><input type="radio" name="rent_way" value="整租" onclick="check()">整套出租</label>
				<label><input type="radio" name="rent_way" value="单间" onclick="check()">单间出租</label>
			</dd>
		</dl>
	</div>
	</div>
	<div class="row-fluid">
	<div class="col-lg-12 center">
		<dl class="dl-horizontal">
			<dt>装修程度：</dt>
			<dd>
				<label><input type="radio" name="decoration" value="" checked="checked" onclick="check()">不限</label>
				<label><input type="radio" name="decoration" value="毛坯" onclick="check()">毛坯</label>
				<label><input type="radio" name="decoration" value="简单装修" onclick="check()">简单装修</label>
				<label><input type="radio" name="decoration" value="中等装修" onclick="check()">中等装修</label>
				<label><input type="radio" name="decoration" value="精装修" onclick="check()">精装修</label>
				<label><input type="radio" name="decoration" value="豪华装修" onclick="check()">豪华装修</label>
			</dd>
		</dl>
	</div>
	</div>
</div>
<div id = "box"></div>
<script type="text/javascript">
//获取租房信息列表
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
//把数据添加到组件
function addBox(resultList){
	$('#box').html('');
	$.each(resultList,function(index,obj){
		var picName = obj.picList[0].fileFileName;
		var picPath = obj.picList[0].filePath;
		var picSrc = picPath+picName;
		//alert(obj['house_id']);
		$("#box").append(
				"<hr>"+
				"<div class='container-fluid'>"+
				 "<div class='row-fluid'>"+
				 	"<div class='col-lg-2 center' class='overflow'>"+
				 		"<a href='houseInfor.jsp?house_id="+obj['house_id']+"' class='img-responsive'>"+
				 		"<img src="+picSrc+" class='img-responsive'>"+
				 		"</a>"+
				 	"</div>"+
				 	"<div class='col-lg-8 center'>"+
			 		"<div class='media-body'>"+
			                "<h3 class='media-heading'>"+
			                    "<a href='houseInfor.jsp?house_id="+obj['house_id']+"'>"+obj['title']+"</a>"+	
			                "</h3>"+
			                "<p>"+obj['type']+"&nbsp;&nbsp;&nbsp;&nbsp;"+obj['area']+"㎡&nbsp;&nbsp;&nbsp;&nbsp;"+obj['decoration']+"&nbsp;&nbsp;&nbsp;&nbsp;"+obj['rent_way']+"</p>"+
			                "<p>"+obj['location']+"</p>"+
			                "<p>经纪人："+obj.user.username+"</p>"+
			            "</div>"+
				 	"</div>"+
				 	"<div class='col-lg-2 center'>"+
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

//获取筛选条件
function check(){
	var price = null;
	var minprice = null;
	var maxprice = null;
	var type = null;
	var rent_way = null;
	var decoration = null;
	price = $("input:radio[name='rent']:checked").val();
	type = $("input:radio[name='room']:checked").val();
	rent_way = $("input:radio[name='rent_way']:checked").val();
	decoration = $("input:radio[name='decoration']:checked").val();
	if (price == "-1") {
		minprice = null;
		maxprice = null;
	}
	if (price == "499") {
		minprice = 0;
		maxprice = 499;
	}
	if (price == "500-999") {
		minprice = 500;
		maxprice = 999;
	}
	if (price == "1000-1499") {
		minprice = 1000;
		maxprice = 1499;
	}
	if (price == "1500-1999") {
		minprice = 1500;
		maxprice = 1999;
	}
	if (price == "2000-2999") {
		minprice = 2000;
		maxprice = 2999;
	}
	if (price == "3000-4499") {
		minprice = 3000;
		maxprice = 4499;
	}
	if (price == "4500") {
		minprice = 4500;
		maxprice = 5000;
	}
	$.ajax({
		url:encodeURI("${pageContext.request.contextPath}/HouseAction_findHouseInfo"),
		type:"get",
		cache:false,
		dataType:"json",
		//contentType:"application/json;charset=utf-8",
		data:{"minprice":minprice,"maxprice":maxprice,"type":type,"rent_way":rent_way,"decoration":decoration},
		success:function(resultList){
			addBox(resultList);
		}
		
	});
}
</script>
</body>
</html>