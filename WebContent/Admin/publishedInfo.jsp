<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="0">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">

<title></title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
a{
	color: black;
	text-decoration: none;
}

a:hover {
	color: #FF7F50;
	text-decoration: none;
}
tr{
	height:40px;
}
.table_list_box{
   table-layout:fixed !important;
}
</style>
</head>
<body>
	<div>
		<span style="font-size: 20px; color: #FFA500;">已发布</span>
	</div>
	<hr/>
	<div>
			<div data-toggle="distpicker">
				<div class='col-lg-2'>
	 					<select class="form-control" id="province" name="province" data-stopPropagation="true">
	 					</select>
	 				</div>
	 				
	 				<div class='col-lg-2'>
	 					<select class="form-control" id="city" name="city" data-stopPropagation="true">
	 					</select>
	 				</div>
	 				
	 				<div class='col-lg-2'>
	 					<select class="form-control" id="area" name="area" data-stopPropagation="true">
	 					</select>
				</div>
			</div>
			<div class='col-lg-2'>
				<input type="text" id="houseOwner" class = "form-control" placeholder="房主名" >
			</div>
			<div class='col-lg-2'>
				<button id="select" class="layui-btn layui-btn-radius layui-btn-normal" onclick="select()">查询</button>
			</div>
	</div>
	<br>
	<hr/>
	<div>
		<table cellspacing='0' cellpadding='0' border='0' width='100%' data-toggle="table">
			<thead>
				<tr>
					<th width="60%" style="font-size: 16px;">房源信息</th>
					<th width="15%" style="font-size: 16px;">发布人/房主</th>
					<th width="15%" style="font-size: 16px;">发布时间</th>
					<th width="10%" style="font-size: 16px;">操作</th>
				</tr>
			</thead>
			<tbody id="box">
<!-- 				<tr> -->
<!-- 					<th id="msg"><a>豪华住宅，拎包入住</a></th> -->
<!-- 					<th id="time">2019-05-18 18:18:56</th> -->
<!-- 					<th id="operation" style="color:#1E90FF;" onclick="delete()">删除</th> -->
<!-- 				</tr> -->
			</tbody>
		</table>
	</div>
	
<script type="text/javascript">
function select() {
	var houseOwner = document.getElementById("houseOwner").value;
	var city = document.getElementById("city").value;
	var area = document.getElementById("area").value;
	console.log("houseOwner="+houseOwner+"location="+city+area);
	$.ajax({
		url:encodeURI("${pageContext.request.contextPath}/HouseAction_findPublishInfo?flag=1"),
		cache:false,
		type:"post",
		data:{"login_name":"${login_name}","houseOwner":houseOwner,"location":city+area},
		dataType:"json",
		//contentType:"application/json;charset=utf-8",
		success:function(data){
			$("#box").html("");
			for (var i = 0; i < data.length; i++) {
				$("#box").append(
					"<tr width='100%'>"+
						"<td style='display:none;'>"+data[i][0]+"</td>"+
						"<td width='60%' id='title'><a href='${pageContext.request.contextPath}/houseInformation/houseInfor.jsp?house_id="+data[i][0]+"' target='_Blank'>"+data[i][1]+"</a></td>"+
						"<td style='display:none;'>"+data[i][2]+"</td>"+
						"<td width='15%'>"+data[i][3]+"</td>"+
						"<td width='15%'>"+new Date(parseInt(data[i][4])).toLocaleString()+"</td>"+
						"<td id='del' width='10%' style='color:#00FF00;'>已发布</td>"+
					"</tr>"	
				);	
			}
		}
	});
}

</script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 城市三级联动 -->
<script src="https://cdn.bootcss.com/distpicker/2.0.3/distpicker.js"></script>	
</body>
</html>