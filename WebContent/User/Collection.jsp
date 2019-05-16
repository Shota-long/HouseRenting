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

<title>Insert title here</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap-hover-dropdown/2.0.10/bootstrap-hover-dropdown.min.js"></script>
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
		<span style="font-size: 20px; color: #FFA500;">我的收藏</span>
	</div>
	<hr/>
	<div>
		<table cellspacing='0' cellpadding='0' border='0' width='100%' data-toggle="table">
			<thead>
				<tr>
					<th width="75%" style="font-size: 16px;">房源信息</th>
					<th width="20%" style="font-size: 16px;">更新时间</th>
					<th width="5%" style="font-size: 16px;">操作</th>
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
</body>
<script type="text/javascript">
$(function name() {
	$.ajax({
		url:encodeURI("${pageContext.request.contextPath}/CollectionAction_findCollectMsg"),
		cache:false,
		type:"post",
		data:{"login_name":"${login_name}"},
		dataType:"json",
		//contentType:"application/json;charset=utf-8",
		success:function(data){
			for (var i = 0; i < data.length; i++) {
				$("#box").append(
					"<tr width='100%'>"+
						"<td style='display:none;'>"+data[i].house_id+"</td>"+
						"<td width='75%' id='title'><a href='${pageContext.request.contextPath}/houseInformation/houseInfor.jsp?house_id="+data[i].house_id+"' target='_Blank'>"+data[i].title+"</a></td>"+
						"<td width='20%'>"+data[i].collect_time+"</td>"+
						"<td id='del' width='5%' style='color:#1E90FF;' onclick='deleteMsg(this)'>删除</td>"+
					"</tr>"	
				);	
			}
		}
	});
});

function deleteMsg(obj) {
	var houseId = $(obj).parents('tr').children('td').eq(0).text();
	console.log(houseId);
	$.ajax({
		url:encodeURI("${pageContext.request.contextPath}/CollectionAction_deleteCollection"),
		cache:false,
		type:"post",
		data:{"house_id":houseId,"login_name":"${login_name}"},
		//dataType:"json",
		//contentType:"application/json;charset=utf-8",
		success:function(data){
			//alert("11111");
			if (data == "delSuccess") {
				add();
			}
		}
	});
}
function add() {
	$.ajax({
		url:encodeURI("${pageContext.request.contextPath}/CollectionAction_findCollectMsg"),
		cache:false,
		type:"post",
		data:{"login_name":"${login_name}"},
		dataType:"json",
		//contentType:"application/json;charset=utf-8",
		success:function(data){
			$("#box").html("");
			if(data != null){
				for (var i = 0; i < data.length; i++) {
					$("#box").append(
						"<tr width='100%'>"+
							"<td style='display:none;'>"+data[i].house_id+"</td>"+
							"<td width='75%' id='title'><a href='${pageContext.request.contextPath}/houseInformation/houseInfor.jsp?house_id="+data[i].house_id+"' target='_Blank'>"+data[i].title+"</a></td>"+
							"<td width='20%'>"+data[i].collect_time+"</td>"+
							"<td id='del' width='5%' style='color:#1E90FF;' onclick='deleteMsg(this)'>删除</td>"+
						"</tr>"	
					);	
				}
			}
			
		}
	});
}
</script>
</html>