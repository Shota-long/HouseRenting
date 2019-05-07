<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	.header{
		margin-top: 30px;
	}
</style>
</head>
<body>
<div>
	<div class="container">
		<div class="row">
			<div class="header">
				<div class="col-md-1">
					城市选择
				</div>
				<div class="col-md-6" data-toggle="distpicker">
  					<select></select>
  					<select></select>
  					<select></select>
  					
				</div>
			</div>
			<div class="col-md-5"></div>
		</div>
	</div>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 城市三级联动 -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/distpicker/2.0.3/distpicker.js"></script>
</body>
</html>