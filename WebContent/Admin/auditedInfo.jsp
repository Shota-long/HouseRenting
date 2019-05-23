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
					<th width="60%" style="font-size: 16px;">房源信息</th>
					<th width="15%" style="font-size: 16px;">申请人/房主</th>
					<th width="15%" style="font-size: 16px;">申请时间</th>
					<th width="10%" style="font-size: 16px;">操作</th>
				</tr>
			</thead>
			<tbody id="box">
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
						"<td style='display:none;'>"+data[i][0]+"</td>"+
						"<td width='60%' id='title'>"+data[i][1]+"</a></td>"+
						"<td style='display:none;'>"+data[i][2]+"</td>"+
						"<td width='15%'>"+data[i][3]+"</td>"+
						"<td width='15%'>"+new Date(parseInt(data[i][4])).toLocaleString()+"</td>"+
						"<td id='del' width='10%' style='color:#A4A4A4;'><a href='${pageContext.request.contextPath}/Admin/detailInfo.jsp?houseId="+data[i][0]+"' target='_blank'>查看详情</a></td>"+
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