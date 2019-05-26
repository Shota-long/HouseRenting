<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="0">  
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>管理员后台</title>
<link rel="stylesheet" href="https://cdn.90so.net/layui/2.4.5/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">HouseRenting后台管理</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
        	管理员
        </a>
      </li>
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/Login/login.jsp" onclick="exit()">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item">
          <a class="" href="javascript:;">房源管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:funcShow(0);">已发布</a></dd>
            <dd><a href="javascript:funcShow(1);">待审核</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">用户管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;" id ="content" ></div>
  </div>
  
</div>
<script src="https://cdn.90so.net/layui/2.4.5/layui.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script>
	//JavaScript代码区域
	layui.use('element', function(){
	  var element = layui.element;
	  
	});
	function funcShow(id){
	switch(id){
	case 0:
		path = "publishedInfo.jsp";
		break;
	case 1:
		path = "auditedInfo.jsp";
		break;
	}
	$("#content").load(path);
}
</script>
<script type="text/javascript">
function exit() {
	$.ajax({
		url:encodeURI("${pageContext.request.contextPath}/UserAction_removeSession"),
		type:"post",
		cache:false
	});
	//window.location.reload(true);
}
</script>
</body>
</html>