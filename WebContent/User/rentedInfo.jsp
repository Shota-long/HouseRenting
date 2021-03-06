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
		<span style="font-size: 20px; color: #FFA500;">已出租</span>
	</div>
	<hr/>
	<div>
		<table cellspacing='0' cellpadding='0' border='0' width='100%' data-toggle="table">
			<thead>
				<tr>
					<th width="35%" style="font-size: 16px;">租房编号</th>
					<th width="15%" style="font-size: 16px;">出租人</th>
					<th width="15%" style="font-size: 16px;">承租人</th>
					<th width="15%" style="font-size: 16px;">租赁时间</th>
					<th width="15%" style="font-size: 16px;">到期时间</th>
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
	
<script type="text/javascript">
$(function name() {
	$.ajax({
		url:encodeURI("${pageContext.request.contextPath}/RentRecordAction_selectRecord?flag=1"),
		cache:false,
		type:"post",
		data:{"login_name":"${login_name}"},
		dataType:"json",
		//contentType:"application/json;charset=utf-8",
		success:function(data){
			for (var i = 0; i < data.length; i++) {
				$("#box").append(
					"<tr width='100%'>"+
						"<td style='display:none;'>"+data[i].rentId+"</td>"+
						"<td width='35%' id='title'>"+data[i].houseId+"</a></td>"+
						"<td width='15%'>"+data[i].lessor+"</td>"+
						"<td width='15%'>"+data[i].lessee+"</td>"+
						"<td width='15%'>"+data[i].startDate+"</td>"+
						"<td width='15%'>"+data[i].endDate+"</td>"+
						"<td id='del' width='5%' style='color:#FF7F50;'>已出租</td>"+
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