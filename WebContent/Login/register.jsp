<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

	<link rel="icon" href="../dist/favicon.ico">

    <!-- Bootstrap core CSS -->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
	<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug 
    <link href="../dist/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    -->

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- <script src="../dist/js/ie-emulation-modes-warning.js"></script> -->

      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-xs-3 col-sm-3"></div>
			<div class="col-lg-6 col-md-6 col-xs-6 col-sm-6"></div>
			<div class="col-lg-3 col-md-3 col-xs-3 col-sm-3" align="center">
				已有账号，立即&nbsp;<a href="${pageContext.request.contextPath}/Login/login.jsp">登录</a>
			</div>
		</div>
	</div>
	
	<div class="container">

      <form class="form-signin" action="${pageContext.request.contextPath}/WebContent/UserAction_register" method="post">
         	
        	<h2 class="form-signin-heading">Please sign up</h2>
        	<label class="sr-only">用户名</label>
        	<input type="text" id="inputUsername" name = "username" class="form-control" placeholder="Username" required autofocus>
        	<span id="msg"></span>
        	<br/>
        	<label class="sr-only">密码</label>
       		<input type="password" id="inputPassword"  name="password" class="form-control" placeholder="Password" required>
       		   
        	<br/>
        	<label class="sr-only">确认密码</label>
        	<input type="password" id="inputConfirmPassword" name="confirmPassword"class="form-control" placeholder="Confirm Password" required>
			<span id="tishi"></span>
		
       		<br/>
       		<label class="sr-only">电话号码</label>
        	<input type="text" id="inputTelephone" name="telephone" class="form-control" placeholder="Telephone" required>

			<br/>
			<label class="sr-only">邮箱</label>
        	<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email Address" required>
       		 <br/>
       		<button class="btn btn-lg btn-primary btn-block" id="button" type="submit">Sign up</button>
       		<span class="help-block" style="color:red">${error}</span>
      </form>

    </div> <!-- /container -->

	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
 
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript"><!--校验用户名-->
	$(function(){
		$("input[name='username']").blur(verifUsername)
	});
	function verifUsername(){
		 var name = document.getElementById("inputUsername").value;
		if(name==null||name==""){
			$("#msg").html("<font color='red'>用户名不能为空</font>");
			$("#button").attr("disabled","disabled");
		}
		else{
			$.ajax({
				url:encodeURI("${pageContext.request.contextPath}/UserAction_verifUsername"),
				type:"post",
				cache:false,
				data:{
					username:$("input[name='username']").val()
				},
				//cache:false,
				dataType:'json',
				success:function(msg){
					if(msg.isSuccess){
						
						$("#msg").html("<font color='red'>用户名重复</font>");
						$("#button").attr("disabled","disabled"); //红色提示不可点击button
					}
					else{
						
						$("#msg").html("<font color='green'>用户名可用</font>");
						$("#button").removeAttr("disabled");
						
					}
						
				}
			});
		}
	}
	</script> 
	
	<script type="text/javascript"><!--校验密码-->
	$(function(){
		$("input[name='confirmPassword']").blur(verifPassword)
	});<!--获取焦点-->
	function verifPassword(){
		 var pwd1 = document.getElementById("inputPassword").value;
         var pwd2 = document.getElementById("inputConfirmPassword").value;
		//对比两次输入的密码
		//alert("pwd1"); 
		if(pwd1 == pwd2) {
			 document.getElementById("tishi").innerHTML="";
		     document.getElementById("submit").disabled = false;
		  }
		  else {
		      document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
		      document.getElementById("submit").disabled = true;
		  }
	}
	</script>
</body>
</html>