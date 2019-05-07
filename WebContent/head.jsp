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
            	<li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
            	<li ><a id="location">未知城市</a></li>
            	<li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                            切换城市
                    <b class="caret"></b>
                	</a>
              		<ul class="dropdown-menu">          
						<li>
							<div class="container" style="width: 450px;">
								<div class="row">
									<div>
									城市选择
									</div>
									<div data-toggle="distpicker">
  										<select id="province" name="province" data-stopPropagation="true"></select>
  										<select id="city" name="city" data-stopPropagation="true"></select>
  										<select id="area" name="area" data-stopPropagation="true" onclick="show()"></select>
									</div>
								</div>  
							</div>
						</li>     
               		</ul>
            	</li>
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
                		<li><a href="#">个人中心</a></li>
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
		var addre = "${location}";
		if(login_name!=null && login_name != ""){
			$("#login").html("<a>${login_name}</a>");
			$("#register").html("<a href='${pageContext.request.contextPath}/index.jsp' onclick='exit()'>退出</a>");
		}
		else{
			$("#login").html("<a href='${pageContext.request.contextPath}/Login/login.jsp'><span class='glyphicon glyphicon-log-in'></span> 登录</a>");
			$("#register").html("<a href='${pageContext.request.contextPath}/Login/register.jsp'><span class='glyphicon glyphicon-user'></span> 注册</a>");
		}
		if(addre != null && addre != ""){
			document.getElementById("location").innerHTML = addre;
		}
	}
	
	 //下拉框查询组件点击查询栏时不关闭下拉框
   		$('.dropdown-menu a.removefromcart').click(function(e) {
   		 e.stopPropagation();
		});
	 
   		$(function() {
   		    $("ul.dropdown-menu").on("click", "[data-stopPropagation]", function(e) {
   		        e.stopPropagation();
   		    });
   		});
   	//显示地址
   	function show() {
   		var province = document.getElementById("province").value;
   		var city = document.getElementById("city").value;
   		var area = document.getElementById("area").value;
   		if (area != "") {
   			$("#area").attr("data-stopPropagation","false");
   			var address = city+"-"+area;
   			$.ajax({
   				url:encodeURI("${pageContext.request.contextPath}/LocationAction_toSession"),
   				type:"post",
   				data:{"address":address},
   				cache:false
   			});
   			setTimeout(function() {
   				window.location.reload(true);
			},200);
   			
		}
   		
	}
</script>
<!-- 监听span -->
<script type="text/javascript">
	function exit() {
		$.ajax({
			url:encodeURI("${pageContext.request.contextPath}/UserAction_removeSession"),
			type:"post",
			cache:false
		});
		window.location.reload(true);
	}
</script>
<!-- 城市三级联动 -->
<script src="https://cdn.bootcss.com/distpicker/2.0.3/distpicker.js"></script>
</body>
</html>