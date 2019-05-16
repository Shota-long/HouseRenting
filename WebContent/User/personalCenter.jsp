<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="0">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">

<title>Insert title here</title>
<link rel="stylesheet" href="../layui/css/layui.css">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap-hover-dropdown/2.0.10/bootstrap-hover-dropdown.min.js"></script>
<!-- 城市三级联动 -->
<script src="https://cdn.bootcss.com/distpicker/2.0.3/distpicker.js"></script>	
<script src="../layui/layui.js"></script>
<style type="text/css">
a:hover {
	text-decoration: none;
}
a{
	text-decoration: none;
}
</style>

</head>
<body>
<div class="layui-layout layui-layout-admin"> 
 <div class="layui-header">
	<jsp:include page="../head.jsp"></jsp:include>
</div>
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a href="javascript:;">我的账户</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:funcShow(0);">个人资料</a></dd>
            <dd><a href="javascript:funcShow(1);;">修改密码</a></dd>
            <dd><a href="javascript:funcShow(2);;">消息管理</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="javascript:funcShow(3);;">我的收藏</a></li>
        <li class="layui-nav-item"><a href="javascript:funcShow(4);;">我的浏览</a></li>
        <li class="layui-nav-item"><a href="javascript:funcShow(5);;">我的评价</a></li>
        <li class="layui-nav-item"><a href="javascript:funcShow(6);;">发布信息</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div id="content" style="padding: 15px;"></div>
  </div>
</div>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
});
function funcShow(id){
	switch(id){
	case 0:
		
		break;
	case 1:
		
		break;
	case 2:
		
		break;
	case 3:
		path = "Collection.jsp";
		break;
	
	case 4:
		
		break;
	
	case 5:
		
		break;
	case 6:
		path = "addHouseInfor.jsp";
		break;
	}
	$("#content").load(path);
}
</script>
</body>
</html>