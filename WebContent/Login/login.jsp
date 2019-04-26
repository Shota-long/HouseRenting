<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
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

    
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug 
    <link href="../dist/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    -->

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/Login/signin.css" rel="stylesheet">

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
				未有账号？立即&nbsp;<a href="${pageContext.request.contextPath}/Login/register.jsp">注册</a>
			</div>
		</div>
	</div>
	<div class="container">

      <form class="form-signin" action="${pageContext.request.contextPath}/WebContent/UserAction_login" method = "post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputUsername" class="sr-only">用户名</label>
        <input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
       	<br>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
        <span class="help-block" style="color:red">${error}</span>
       <!-- <span class="glyphicon glyphicon-remove form-control-feedback"></span> --> 
     
          <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
    </div> <!-- /container -->

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug 
    <script src="../dist/js/ie10-viewport-bug-workaround.js"></script>
    -->
<!--<script type="text/javascript">
	window.onload = function () {
		$.ajax({
			url:encodeURI("${pageContext.request.contextPath}/UserAction_removeSession"),
			type:"post",
			cache:false
		});
	}
</script>-->
</body>
</html>