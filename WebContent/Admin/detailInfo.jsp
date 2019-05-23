<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
.box{
    display: table-cell;
    vertical-align: middle;    
}
.c{
	display: inline;
}
/*图片css*/
.fileinput-button {
    position: relative;
  	display: inline-block;
    overflow: hidden;
 }

.fileinput-button input{
     position: absolute;
     left: 0px;
     top: 0px;
     opacity: 0;
}
.img-responsive {
  display: block;
  height: 110px;
  max-width: 200px;
  float: left;
  display: inline-block;
}
.subPic{
  display: block;
  height: 110px;
  max-width: 200px;
  float: left;
  display: inline-block;
}
</style>
</head>
<body>
	<div style="text-align: center;">
		<span style="font-size: 23px; color: #FFA500;">个体租房信息</span>
	</div>
	<hr/>
	<div class='left'><span style="font-size: 20px;"><b>基本信息</b></span></div>
	<div class="container-fluid left">
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>租房标题</span></div>
			<div class='col-lg-6'><input id="title" type="text" class="form-control"></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>价格</span></div>
			<div class='col-lg-6'><input id="price" type="text" class="form-control" ></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>押金方式</span></div>
			<div class='col-lg-6'><input id="deposit_way" type="text" class="form-control" ></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>出租方式</span></div>
			<div class='col-lg-6'><input id="rent_way" type="text" class="form-control" ></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>房屋类型</span></div>
			<div class='col-lg-6'><input id="type" type="text" class="form-control" ></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>面积</span></div>
			<div class='col-lg-6'><input id="area" type="text" class="form-control" ></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>装修程度</span></div>
			<div class='col-lg-6'><input id="decoration" type="text" class="form-control" ></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>所在楼层</span></div>
			<div class='col-lg-6'><input id="floor" type="text" class="form-control"></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>详细地址</span></div>
			<div class='col-lg-6'><input id="address" type="text" class="form-control"></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>房源描述</span></div>
			<div class='col-lg-6'>
				<textarea rows="4" cols="71" id="description" class="form-control"></textarea>
			</div>
	</div>
	</div>	
	<br>
	<div class='left'><span style="font-size: 20px;"><b>图片信息</b></span></div>
	<div class="container-fluid" style="margin-left: 130px;">
		<div id="box" style="display: inline-block;"></div>
	</div>
	<br/>
	<br/>
	<div class="container-fluid" style="margin-left: 130px;">
		<div id="box" style="display: inline-block;"></div>
	</div>
	<div class='left'><span style="font-size: 20px;"><b>用户基本信息</b></span></div>
	<div class="container-fluid left">
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>房主名</span></div>
			<div class='col-lg-6'><input id="owner" type="text" class="form-control"></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>联系方式</span></div>
			<div class='col-lg-6'><input id="telephone" type="text" class="form-control" ></div>
		</div>
		<div class="row" style="margin: 10px;">
			<div class="col-lg-2 box" style="font-size: 15px;"><span style="color: red;">*</span><span>邮箱</span></div>
			<div class='col-lg-6'><input id="email" type="text" class="form-control" ></div>
		</div>
	</div>
	<br/>
	<div class="left" style="margin-bottom: 60px;">
		<div class="col-lg-1">
			<button class="btn btn-md btn-primary btn-block" id="button" type="submit" style="width: 100px; margin-left: 260px;display: inline-block;" onclick="allow()">允许发布</button>
		</div>
		<div class="col-lg-1">
			<button class="btn btn-md btn-primary btn-block" id="button" type="submit" style="width: 100px; margin-left: 300px" onclick="refuse()">拒绝发布</button>
		</div>
	</div>
	<br/>
	<br/>
			
<script type="text/javascript">
$(function selectInfo() {
	//获取house_id
	var houseId = GetQueryString("houseId");
	$.ajax({
		url:encodeURI("${pageContext.request.contextPath}/HouseAction_findHouseInfo?flag=0"),
		cache:false,
		type:"post",
		data:{"house_id":houseId},
		dataType:"json",
		//contentType:"application/json;charset=utf-8",
		success:function(data){
			$(this).val("");
			$("#title").val(data[0].title);
			$("#price").val(data[0].price);
			$("#deposit_way").val(data[0].deposit_way);
			$("#rent_way").val(data[0].rent_way);
			$("#type").val(data[0].type);
			$("#area").val(data[0].area);
			$("#decoration").val(data[0].decoration);
			$("#floor").val(data[0].floor);
			$("#address").val(data[0].location+data[0].address);
			$("#description").val(data[0].description);
			for (var i = 0; i < data[0].picList.length; i++) {
				$("#box").append(
						"<div style=' display: inline-block;'>"+
						"<img src='"+data[0].picList[i].filePath+data[0].picList[i].fileFileName+"' class='subPic' hspace='5'/>"+
						"</div>"
				);
			}
			$("#owner").val(data[0].user.username);
			$("#telephone").val(data[0].user.telephone);
			$("#email").val(data[0].user.email);
		}
	});
	
});
//获取house_id
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);//search,查询？后面的参数，并匹配正则
     if(r!=null)return  unescape(r[2]); return null;
}
//允许发布
function allow(){
	swal(
            {title:"您确定要提交这条数据吗",
                text:"请谨慎操作！",
                type:"warning",
                showCancelButton:true,
                confirmButtonColor:"#DD6B55",
                confirmButtonText:"确定！",
                cancelButtonText:"取消",
                closeOnConfirm:false,
                closeOnCancel:false
            },
            function(isConfirm) {
				if(isConfirm){
					var houseId = GetQueryString("houseId");
					console.log("允许发布");
					$.ajax({
						url:encodeURI("${pageContext.request.contextPath}/HouseAction_updateHouseInfo?flag=1"),
						cache:false,
						type:"post",
						data:{"house_id":houseId},
						success:function(data){
							if(data=="1"){
								swal({
									title:"Success", 
									text:"操作成功",
									type:"success"},
									function(){
									window.location.href = "${pageContext.request.contextPath}/Admin/adminPage.jsp";
									});
							}else {
								swal({
									title:"Fail！", 
									text:"操作失败！",
									type:"error"},
									function(){
									window.location.href = "${pageContext.request.contextPath}/Admin/adminPage.jsp";
									});
							}
						}
					});
				}else{
					swal({
						title:"Fail！", 
						text:"操作已取消！",
						type:"error"}
						);
				}
			});
}
//拒绝
function refuse(){
	
	 swal(
             {title:"您确定要提交这条数据吗",
                 text:"请谨慎操作！",
                 type:"warning",
                 showCancelButton:true,
                 confirmButtonColor:"#DD6B55",
                 confirmButtonText:"确定！",
                 cancelButtonText:"取消",
                 closeOnConfirm:false,
                 closeOnCancel:false
             },
             function(isConfirm) {
				if(isConfirm){
					var houseId = GetQueryString("houseId");
					console.log("拒绝发布");
					$.ajax({
						url:encodeURI("${pageContext.request.contextPath}/HouseAction_updateHouseInfo?flag=3"),
						cache:false,
						type:"post",
						data:{"house_id":houseId},
						success:function(data){
							if(data=="1"){
								swal({
									title:"Success", 
									text:"操作成功",
									type:"success"},
									function(){
									window.location.href = "${pageContext.request.contextPath}/Admin/adminPage.jsp";
									});
							}else {
								swal({
									title:"Fail！", 
									text:"操作失败！",
									type:"error"},
									function(){
									window.location.href = "${pageContext.request.contextPath}/Admin/adminPage.jsp";
									});
							}
						}
					});
				}else{
					swal({
						title:"Fail！", 
						text:"操作已取消！",
						type:"error"}
						);
				}
			});
}

</script>
</body>
</html>