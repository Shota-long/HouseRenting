<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
<meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
<meta http-equiv="pragma" content="no-cache"/> 
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/> 
<meta http-equiv="expires" content="0"/>
<title></title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
 <link href="../dist/css/swiper.min.css" rel="stylesheet"/>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap-hover-dropdown/2.0.10/bootstrap-hover-dropdown.min.js"></script>
<!-- 城市三级联动 -->
<script src="https://cdn.bootcss.com/distpicker/2.0.3/distpicker.js"></script>	
<script src="../dist/js/swiper.min.js"></script>
<style type="text/css">
	.left{
		margin-left: 117px;
		margin-right: 70px;
	}
	.swiper-container {
    width: 628px;
    height: 100px;
	}
	.swiper-slide{
		width:120px;height:90px;margin:0px;padding:0px;
	}
	.top{
		margin-top: 15px	
	}
   #div1 img{width:630px;height:400px; margin-top: 30px;}
   #div2 img{width:120px;height:90px;margin:0px;padding:0px;}
   body{
   		margin-bottom: 50px;
   }
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=693bdK8566ezLSAGGRwpGMmYVACB0eG5&v=1.1&services=true"></script>

</head>
<body>
<div>
	<div>
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="container-fuild">
			<div id="title" class="left" style="font-size: 20pt;">总统套房，环境优美，欢迎入住</div>
			<div style="float:right;">
			<span id="star" class="glyphicon glyphicon-star-empty" style="font-size: 25px;color: #2894FF;" onclick="toStar()"></span>
			<span id="star_content">加入收藏</span>
			</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div id="div1" style="margin-left: 15px;"><div id = "bigPic"></div></div>
  				<div class="container" style="margin-top: 10px">
  					<div class="row">
  						<div id="div2" class="col-lg-6">
  							<div class="swiper-container">
   	 							<div class="swiper-wrapper" id="smallPic">
   	 							</div>
  		  						<!-- 如果需要导航按钮 
    							<div class="swiper-button-prev"></div>
    							<div class="swiper-button-next"></div>
    							-->
  							</div>
  						</div>
  					</div>
  				</div>
  			</div>
  			<div class="col-lg-1"></div>
  			<div class="col-lg-5">
  				<br/>
  				<br/>
  				<div><span style="font-weight: bold;">租房金额：</span><h1 style="display: inline;" id="price"></h1>元/月 </div>
  				<div class="top"><span style="font-weight: bold;">押金方式：</span><span id="deposit_way"></span></div>
  				<div class="top"><span style="font-weight: bold;">房屋类型：</span><span id="type"></span></div>
  				<div class="top"><span style="font-weight: bold;">房屋面积：</span><span id="area1"></span></div>
  				<div class="top"><span style="font-weight: bold;">装修程度：</span><span id="decoration"></span></div>
  				<div class="top"><span style="font-weight: bold;">出租方式：</span><span id="rent_way"></span></div>
  				<div class="top"><span style="font-weight: bold;">所属区域：</span><span id="location1"></span></div>
  				<div class="top"><span style="font-weight: bold;">具体地址：</span><span id="address"></span></div>
  				<div class="top"><span style="font-weight: bold;">所在楼层：</span><span id="floor"></span></div>
  				<div class="top"><span style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;经纪人：</span><span id="username"></span></div>
  				<div class="top"><span style="font-weight: bold;">联系电话：</span><span id="telephone"></span></div>
  			</div>
  		</div>
  	</div>
  	<div style="font-size: 25px" class="left">房源具体描述</div>
  	<div style="margin-left: 150px; margin-right: 300px" id="description"></div>
  	<div style="font-size: 25px" class="left">小区地图</div>
  	<div style="margin-left: 150px; margin-bottom: 50px">
		 <div style="width:900px;height:550px;border:#ccc solid 1px;" id="dituContent"></div>
	</div>
</div>
<script type="text/javascript">
//根据house_id获取房源信息
$(function name() {
	//获取house_id
	var houseId = GetQueryString("house_id");
	//var url = window.location.href;
	$.ajax({
		url:encodeURI("${pageContext.request.contextPath}/HouseAction_findHouseInfo"),
		cache:false,
		type:"post",
		data:{"house_id":houseId},
		dataType:"json",
		//contentType:"application/json;charset=utf-8",
		success:function(data){
			getCoordinate(data);
			addBox(data);
		}
	});
	setTimeout("photo()",1000);
	if("${login_name}"!=""){
		$.ajax({
			url:encodeURI("${pageContext.request.contextPath}/CollectionAction_findCollection"),
			cache:false,
			type:"post",
			data:{"house_id":houseId,"login_name":"${login_name}"},
			//dataType:"json",
			//contentType:"application/json;charset=utf-8",
			success:function(data){
				if (data == "exist") {
					$("#star").removeClass("glyphicon glyphicon-star-empty");
					$("#star").addClass("glyphicon glyphicon-star");
					document.getElementById("star_content").innerHTML="取消收藏";
					document.getElementById("star_content").style.color = "#2894FF";
				}
			}
		});
	}
	
});
//获取house_id
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);//search,查询？后面的参数，并匹配正则
     if(r!=null)return  unescape(r[2]); return null;
}

//图片切换
var mySwiper = new Swiper ('.swiper-container', {
	centeredSlides:false,//不居中
	slidesPerView:'auto',
	spaceBetween:8,    //每个slide间隔8px
	//loop: true, // 循环模式选项
	//loopedSlides:8,
    //slidesPerView:5,
    observer:true,//修改swiper自己或子元素时，自动初始化swiper 
    observeParents:true,//修改swiper的父元素时，自动初始化swiper
   // 如果需要前进后退按钮
   navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev', 
  },
}); 

function getCoordinate(data){
	
	address = data[0]['location']+data[0]['address'];
	$.ajax({
		url:encodeURI("${pageContext.request.contextPath}/LocationAction_getCoordinate"),
		cache:false,
		type:"post",
		data:{"address":address},
		dataType:"json",
		success:function(data){
			initMap(parseFloat(data[0]),parseFloat(data[1]));//创建和初始化地图
		}
	});
}

//////////////////
 //创建和初始化地图函数：
    function initMap(lng,lat){
        createMap(lng,lat);//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMarker(lng,lat);//向地图中添加marker
    }
    
    //创建地图函数：
    function createMap(lng,lat){
    	console.log("lng:"+lng+"lat:"+lat);
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(lng,lat);//定义一个中心点坐标
        map.centerAndZoom(point,18);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        //map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
		var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
		map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
		var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
		map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
		var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
		map.addControl(ctrl_sca);
    }
    
    //标注点数组
    var markerArr = [{title:"",content:"",point:"",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}];
   
    //创建marker
    function addMarker(lng,lat){
        for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = lng;
            var p1 = lat;
            var point = new BMap.Point(p0,p1);
			var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
			marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                        borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"
            });
			
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.addEventListener("click",function(){
				    this.openInfoWindow(_iw);
			    });
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				label.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
        }
    }
    //创建InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("http://map.baidu.com/image/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    //动态修改html
    function addBox(data) {
    	var obj = null;
		$("#title").html(data[0].title);
		//console.log(data[0].picList[0].filePath+data[0].picList[0].fileFileName);
		$("#bigPic").html("<img src='"+data[0].picList[0].filePath+data[0].picList[0].fileFileName+"' id='big'/>");
		for (var i = 0; i < data[0].picList.length; i++) {
			var picSrc = data[0].picList[i].filePath+data[0].picList[i].fileFileName;
			console.log("picAddress:"+picSrc);
			$("#smallPic").append("<div class='swiper-slide'>"+
									"<img src='"+picSrc+"'/>"+
									"</div>"
								);		
		}
		$("#price").html(data[0].price);
		$("#deposit_way").html(data[0].deposit_way);
		$("#type").html(data[0].type);
		$("#area1").html(data[0].area+"㎡");
		$("#decoration").html(data[0].decoration);
		$("#rent_way").html(data[0].rent_way);
		$("#location1").html(data[0].location);
		$("#address").html(data[0].address);
		$("#floor").html(data[0].floor+"楼");
		$("#username").html(data[0].user.username);
		$("#telephone").html(data[0].user.telephone);
		$("#description").html(data[0].description);
    }
    //function photo(picSrc){
    	//console.log(document.getElementById("smallPic").getElementsByTagName("img")[0].src);
    	//console.log(document.getElementById("big").src);
    	//document.getElementById("big").src = document.getElementById("smallPic").getElementsByTagName("img")[3].src;
   // }
//点击小图片替换大图片
function photo(){ 
	//alert("11111");
    var imgs=document.getElementById("smallPic").getElementsByTagName("img");//获取所有<img>元素
    var imgBig=document.getElementById("big");//获取对应元素
    var i = null;
    //console.log(document.getElementById("smallPic").getElementsByTagName("img")[0].src);
	//console.log(document.getElementById("big").src);
    for(i=0;i<imgs.length;i++){
     	imgs[i].onclick=function(){  //触发图片点击事件
     		imgBig.src=this.src;   //小图片地址代替大图片地址
     	}
    }
}

function toStar() {
	var houseId = GetQueryString("house_id");
	if ("${login_name}"=="") {
		window.open("${pageContext.request.contextPath}/Login/login.jsp");
	}
	else{
		if (document.getElementById("star").className == "glyphicon glyphicon-star-empty") {
			
			$.ajax({
				url:encodeURI("${pageContext.request.contextPath}/CollectionAction_addCollection"),
				cache:false,
				type:"post",
				data:{"house_id":houseId,"login_name":"${login_name}"},
				//dataType:"json",
				//contentType:"application/json;charset=utf-8",
				success:function(data){
					if (data == "addSuccess") {
						$("#star").removeClass("glyphicon glyphicon-star-empty");
						$("#star").addClass("glyphicon glyphicon-star");
						document.getElementById("star_content").innerHTML="取消收藏";
						document.getElementById("star_content").style.color = "#2894FF";
					}
				}
			});
			/*
			$("#star").removeClass("glyphicon glyphicon-star-empty");
			$("#star").addClass("glyphicon glyphicon-star");
			document.getElementById("star_content").innerHTML="取消收藏";
			document.getElementById("star_content").style.color = "#2894FF";
			*/
		}
		else if (document.getElementById("star").className == "glyphicon glyphicon-star") {
			
			$.ajax({
				url:encodeURI("${pageContext.request.contextPath}/CollectionAction_deleteCollection"),
				cache:false,
				type:"post",
				data:{"house_id":houseId,"login_name":"${login_name}"},
				//dataType:"json",
				//contentType:"application/json;charset=utf-8",
				success:function(data){
					if (data == "delSuccess") {
						$("#star").removeClass("glyphicon glyphicon-star");
						$("#star").addClass("glyphicon glyphicon-star-empty");
						document.getElementById("star_content").innerHTML="加入收藏";
						document.getElementById("star_content").style.color = "black";
					}
				}
			});
			/*
			$("#star").removeClass("glyphicon glyphicon-star");
			$("#star").addClass("glyphicon glyphicon-star-empty");
			document.getElementById("star_content").innerHTML="加入收藏";
			document.getElementById("star_content").style.color = "black";
			*/
		}
	}
}
</script>
</body>
</html>