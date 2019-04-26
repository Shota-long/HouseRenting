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
	width:1350px;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row-fluid" class="clearfix">
	<jsp:include page="../head.jsp"></jsp:include>
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
              		<button class="btn btn-default input-lg" type="button" >搜房源</button>
            	</span>
        	</div>
    	</div>
      	<div class="col-lg-3 col-md-3 col-xs-3 col-sm-3"></div>
    </div>
	</div>
</div>