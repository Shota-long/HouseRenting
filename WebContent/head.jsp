<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="0">
</head>
<body>
	<div>
	<nav class="navbar navbar-default" role="navigation">
    	<div>
     		<ul class="nav navbar-nav">
            	<li><a>地点</a></li>
            	<li><a href="#">切换城市</a></li>
     	 	</ul>
        	<ul class="nav navbar-nav navbar-right">
            	<li id="login"></li>
            	<li id="register"></li>
            	<li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="50">
                                                            个人中心
                    <b class="caret"></b>
                	</a>
              		<ul class="dropdown-menu">
                		<li><a href="${pageContext.request.contextPath}/Login/login.jsp">个人中心</a></li>
                		<li class="divider" ></li>
                	    <li><a href="#" >我的账户</a></li>
                	    <li class="divider" ></li>
                	    <li><a href="#">我的浏览</a></li>
                	    <li class="divider"></li>
                    	<li><a href="#">我的收藏</a></li>
                    	<li class="divider"></li>
                    	<li><a href="#">我的举报</a></li>
               		</ul>
            	</li>
            	<li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="50">
                                                                           商家中心
                   		 <b class="caret"></b>
                	</a>
                	<ul class="dropdown-menu">
                   	 	<li><a href="#"></a></li>
                   		<li><a href="#">EJB</a></li>
                    	<li><a href="#">Jasper Report</a></li>
                    	<li class="divider"></li>
                    	<li><a href="#">分离的链接</a></li>
                    	<li class="divider"></li>
                   		<li><a href="#">另一个分离的链接</a></li>
                	</ul>
           		</li>
            	<li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="50">
                                                                       帮助中心
                    	<b class="caret"></b>
                	</a>
                	<ul class="dropdown-menu">
                    	<li><a href="#">网站建议</a></li>
                    	<li class="divider"></li>
                    	<li><a href="#">客户举报</a></li>
                	</ul>
            	</li>
        	</ul>    
  		</div>
	</nav>
	</div>
		
<script type="text/javascript">
	window.onload = function() { //页面加载完成执行该方法
		$.ajax({
			cache:false
		});
		var login_name = "${login_name}";
		if(login_name!=null && login_name != ""){
			$("#login").html("<a>${login_name}</a>");
			$("#register").html("<a href='${pageContext.request.contextPath}/index.jsp' onclick='exit()'>退出</a>");
		}
		else{
			$("#login").html("<a href='${pageContext.request.contextPath}/Login/login.jsp'><span class='glyphicon glyphicon-log-in'></span> 登录</a>");
			$("#register").html("<a href='${pageContext.request.contextPath}/Login/register.jsp'><span class='glyphicon glyphicon-user'></span> 注册</a>");
		}
	}
</script>
<!-- 监听span -->
<script type="text/javascript">
	function exit() {
		alert("${login_name}");
		$.ajax({
			url:encodeURI("${pageContext.request.contextPath}/UserAction_removeSession"),
			type:"post",
			cache:false
		});
	}
</script>
</body>
</html>