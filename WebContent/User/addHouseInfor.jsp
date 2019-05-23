<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"> 
<meta http-equiv="expires" content="0">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">

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
div.left {
	margin-left: 100px;
}
.box{
    display: table-cell;
    vertical-align: middle;    
}
.c{
	display: inline;
}
/*图片css*/
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
.img-responsive {
  display: block;
  height: 110px;
  max-width: 200px;
  float: left;
  display: inline-block;
}
.subPic{
  display: block;
  height: 110px;
  max-width: 200px;
  float: left;
  display: inline-block;
}
</style>
</head>
<body>
	<div style="text-align: center;">
		<span style="font-size: 23px; color: #FFA500;">发布租房信息</span>
	</div>
	<hr/>
	<form action="${pageContext.request.contextPath}/HouseAction_addHouseInfo?" method="post" enctype="multipart/form-data">
	<div class='left'><span style="font-size: 20px;"><b>基本信息</b></span></div>
	<div class="container-fluid left">
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>租房标题</span></div>
			<div class='col-lg-6'><input id="title" type="text" class="form-control"></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>价格</span></div>
			<div class='col-lg-2'><input id="price" type="text" class="form-control" placeholder="请输入整数"></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>押金方式</span></div>
			<div class='col-lg-2'>
				<select class="form-control" id="deposit_way">
					<option>押一付一</option>
					<option>押二付一</option>
					<option>押二付二</option>
					<option>押三付一</option>
					<option>押三付二</option>
					<option>押三付三</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>出租方式</span></div>
			<div class='col-lg-2'>
				<select class="form-control" id="rent_way">
					<option>整租</option>
					<option>单间</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>房屋类型</span></div>
			<div class='col-lg-2'>
				<select class="form-control" id="room">
					<option style="display:none;">室</option>
					<option>一室</option>
					<option>两室</option>
					<option>三室</option>
					<option>四室</option>
					<option>五室</option>
				</select>
			</div>
			<div class='col-lg-2'>
				<select class="form-control" id="hall">
					<option style="display:none;">厅</option>
					<option>一厅</option>
					<option>两厅</option>
					<option>三厅</option>
				</select>
			</div>
			<div class='col-lg-2'>
				<select class="form-control" id="toilet">
				<option style="display:none;">卫</option>
					<option>一卫</option>
					<option>两卫</option>
					<option>三卫</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>面积</span></div>
			<div class='col-lg-2'><input id="house_area" type="text" class="form-control" placeholder="请输入整数"></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>装修程度</span></div>
			<div class='col-lg-2'>
				<select class="form-control" id="decoration">
					<option>毛坯</option>
					<option>简单装修</option>
					<option>中等装修</option>
					<option>精装修</option>
					<option>豪华装修</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>所在楼层</span></div>
			<div class='col-lg-2'><input id="floor" type="text" class="form-control" placeholder="请输入整数"></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>所属区域</span></div>
			<div data-toggle="distpicker">
			
				<div class='col-lg-2'>
	 					<select class="form-control" id="province2" name="province2" data-stopPropagation="true">
	 					</select>
	 				</div>
	 				
	 				<div class='col-lg-2'>
	 					<select class="form-control" id="city2" name="city2" data-stopPropagation="true">
	 					</select>
	 				</div>
	 				
	 				<div class='col-lg-2'>
	 					<select class="form-control" id="area2" name="area2" data-stopPropagation="true">
	 					</select>
				</div>
			</div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>详细地址</span></div>
			<div class='col-lg-6'><input id="address" type="text" class="form-control"></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>房源描述</span></div>
			<div class='col-lg-6'>
				<textarea rows="4" cols="71" id="description" class="form-control"></textarea>
			</div>
		</div>
	</div>
	<br>
	<div class='left'><span style="font-size: 20px;"><b>图片信息</b></span></div>
	<br/>
	<br/>
	<div class="container-fluid" style="margin-left: 130px;">
		<div id="box" style="display: inline-block;"></div>
		<div>
			<span class="btn btn-success fileinput-button">
				<span>选择图片</span>
				<input type="file" id="file" name="file" accept="image/*" onclick="addImg(this)" multiple="multiple">
			</span>		 
		</div>
	</div>
	<br/>
	<div class="left">
		<button class="btn btn-lg btn-primary btn-block" id="button" type="submit" style="width: 300px; margin-left: 200px" onclick="addInfo()">发布信息</button>
	</div>
	</form>
			
<script type="text/javascript">
 function addImg(obj) {
	var input = document.getElementById("file");
	var div;
	//当用户上传时触发事件
	input.onchange = function() {
		readFile(obj);
	}
	//处理图片并添加到dom中的函数
	function readFile(obj) {
		//获取input里面的文件组,obj返回一个FileList对象
		var fileList = obj.files;
		//对文件组进行遍历，可以到控制台打印出FileList
		for (var i = 0; i < fileList.length; i++) {
			//console.log(fileList[i].name);
			var reader = new FileReader();
			reader.readAsDataURL(fileList[i]);// 以DataURL格式读取文件内容
			reader.fileName = fileList[i].name;
			//当文件读取成功时执行函数
			reader.onload = function(e) {  // 读取操作成功时触发
				console.log(this.fileName);
				//$("#box").html("");
				$("#box").append(
					"<div style=' display: inline-block;'>"+
					"<img src='"+this.result+"' alt='"+this.fileName+"' class='subPic' hspace='5'/>"+
					"</div>"
				);
			}
		}
	}
}

function addInfo() {
	var title = document.getElementById("title").value;//标题
	var price = document.getElementById("price").value;//价格
	var deposit_way = document.getElementById("deposit_way").value;//押金方式
	var rent_way = document.getElementById("rent_way").value;//出租方式
	var room = document.getElementById("room").value;//室
	var hall = document.getElementById("hall").value;//厅
	var toilet = document.getElementById("toilet").value;//卫
	var area = document.getElementById("house_area").value;//面积
	var decoration = document.getElementById("decoration").value;//装修程度
	var floor = document.getElementById("floor").value;//楼层
	var province2 = document.getElementById("province2").value;
 	var city2 = document.getElementById("city2").value;
 	var area2 = document.getElementById("area2").value;
	var address = document.getElementById("address").value;//详细地址
	var description = document.getElementById("description").value;//房源描述
	var house = new Array(12);
	house[0] = title;
	house[1] = price;
	house[2] = deposit_way;
	house[3] = rent_way;
	house[4] = room+hall+toilet;
	house[5] = area;
	house[6] = decoration;
	house[7] = floor;
	house[8] = city2+area2;
	house[9] = address;
	house[10] = description;
	house[11] = "${login_name}";
	var f = document.getElementsByTagName("form")[0];
	f.action=f.action+"houseArray="+house;
// 	$.ajax({
// 		url:encodeURI("${pageContext.request.contextPath}/HouseAction_addHouseInfo?houseArray="+house),
// 		type:"post",
// 		cache:false,
// 		});
	
}

</script>
</body>
</html>