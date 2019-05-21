<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<span style="font-size: 20px; color: #FFA500;">待审核</span>
	</div>
	<hr/>
	<div>
		<table cellspacing='0' cellpadding='0' border='0' width='100%' data-toggle="table">
			<thead>
				<tr>
					<th width="75%" style="font-size: 16px;">房源信息</th>
					<th width="20%" style="font-size: 16px;">申请时间</th>
					<th width="5%" style="font-size: 16px;">状态</th>
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
$(function name() {
	$.ajax({
		url:encodeURI("${pageContext.request.contextPath}/HouseAction_findPublishInfo?flag=0"),
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
						"<td width='75%' id='title'>"+data[i].title+"</td>"+
						"<td width='20%'>"+data[i].date+"</td>"+
						"<td id='del' width='5%' style='color:#A4A4A4;'>正在审核</td>"+
					"</tr>"	
				);	
			}
		}
	});
});

</script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>