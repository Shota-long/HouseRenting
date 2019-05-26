<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"> 
<meta http-equiv="expires" content="0">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">

<title></title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- 引入SweetAlert -->
<link href="${pageContext.request.contextPath}/sweetalert/css/sweetalert.css" rel="stylesheet"/>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap-hover-dropdown/2.0.10/bootstrap-hover-dropdown.min.js"></script>
<script src="${pageContext.request.contextPath}/sweetalert/js/sweetalert-dev.js"></script>
<style type="text/css">
	div.left {
	margin-left: 100px;
}
</style>
</head>
<body>
	<div class='left'><span style="font-size: 20px;"><b>密码设置</b></span></div>
	<br>
	<div class="container-fluid left"> 
			<div class="row" style="margin: 10px;">
				<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;"></span><span>用户名</span></div>
				<div class='col-lg-3'><input id="price" type="text"  disabled="disabled" class="form-control" value="${login_name}" placeholder="请输入整数" /></div>
			</div>
			<div class="row" style="margin: 10px;">
				<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>新密码</span></div>
				<div class='col-lg-3'><input id="password" type="password" class="form-control" placeholder="6-16个字符" required="required"></div>
			</div>
			<div class="row" style="margin: 10px;">
				<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>确认密码</span></div>
				<div class='col-lg-3'><input id="confirmPwd" type="password" class="form-control" placeholder="确认密码" required="required"></div>
			</div>
			<div style="margin-left: 185px;"><span id="tishi"></span></div>
			<br/>
			<div>
				<button id="submit" type="button" class="btn btn-md btn-primary btn-block" style="height:40px ; width: 100px; margin-left: 130px;" onclick="changePwd()">确认修改</button>
			</div>
	</div>
	<script type="text/javascript">
	$(function(){
		document.getElementById("submit").disabled = true;
		$("input[id='confirmPwd']").blur(verifPassword);
		
	});<!--获取焦点-->
	function verifPassword(){
		 var pwd1 = document.getElementById("password").value;
        var pwd2 = document.getElementById("confirmPwd").value;
		//对比两次输入的密码
		//alert("pwd1"); 
		if(pwd1==null||pwd1.indexOf(" ")>=0||pwd1==""){
			 document.getElementById("tishi").innerHTML="<font color='#FE642E'>密码不能为空</font>";
			 document.getElementById("submit").disabled = true;
		}
		else if(pwd1 == pwd2) {
			 document.getElementById("tishi").innerHTML="";
		     document.getElementById("submit").disabled = false;
		  }
		  else {
		      document.getElementById("tishi").innerHTML="<font color='#FE642E'>两次密码不相同</font>";
		      document.getElementById("submit").disabled = true;
		  }
	}
	
	function changePwd() {
		var pwd = document.getElementById("password").value;
		$.ajax({
			url:encodeURI("${pageContext.request.contextPath}/UserAction_updatePwd"),
			cache:false,
			type:"post",
			data:{"username":"${login_name}","password":pwd},
			dataType:"json",
			success:function(data){
				if(data=="1"){
					swal({
						title:"Success", 
						text:"操作成功",
						type:"success"},
						function(){
						window.location.reload(true);
						});
				}
				else {
					swal({
						title:"Fail", 
						text:"操作失败",
						type:"error"},
						function(){
						//window.location.reload(true);
						});
				}
			}
		});
		
	}
	</script>
</body>
</html>