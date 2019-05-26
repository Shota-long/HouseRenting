<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/sweetalert/css/sweetalert.css" rel="stylesheet"/>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/sweetalert/js/sweetalert-dev.js"></script>
</head>
<body>
	<button type="button" onclick="test()">点击</button>
		<form name="reg_testdate">
		  <select name="YYYY" onchange="YYYYDD(this.value)">
		    <option value="">请选择 年</option>
		  </select>
		  <select name="MM" onchange="MMDD(this.value)">
		    <option value="">选择 月</option>
		  </select>
		  <select name="DD">
		    <option value="">选择 日</option>
		  </select>
		</form>

	
	
<script type="text/javascript">
	function test() {
		 //swal("Error！", "操作失败！","error");
		 swal(
                {title:"您确定要删除这条数据吗",
                    text:"删除后将无法恢复，请谨慎操作！",
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
						swal({
							title:"Success！", 
							text:"提交成功！",
							type:"success"}
							);
					}
					else{
						swal({
							title:"Fail！", 
							text:"操作已取消！",
							type:"error"}
							);
					}
				});

	}
	function YYYYMMDDstart()   
	   {   
	           MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];   
	    
	           //先给年下拉框赋内容   
	           var y  = new Date().getFullYear();   
	           for (var i = (y-30); i < (y+30); i++) //以今年为准，前30年，后30年   
	                   document.reg_testdate.YYYY.options.add(new Option(" "+ i +" 年", i));   
	    
	           //赋月份的下拉框   
	           for (var i = 1; i < 13; i++)   
	                   document.reg_testdate.MM.options.add(new Option(" " + i + " 月", i));   
	    
	           document.reg_testdate.YYYY.value = y;   
	           document.reg_testdate.MM.value = new Date().getMonth() + 1;   
	           var n = MonHead[new Date().getMonth()];   
	           if (new Date().getMonth() ==1 && IsPinYear(YYYYvalue)) n++;   
	                writeDay(n); //赋日期下拉框Author:meizz   
	           document.reg_testdate.DD.value = new Date().getDate();   
	   }   
	   if(document.attachEvent)   
	       window.attachEvent("onload", YYYYMMDDstart);   
	   else   
	       window.addEventListener('load', YYYYMMDDstart, false);   
	   function YYYYDD(str) //年发生变化时日期发生变化(主要是判断闰平年)   
	   {   
	           var MMvalue = document.reg_testdate.MM.options[document.reg_testdate.MM.selectedIndex].value;   
	           if (MMvalue == ""){ var e = document.reg_testdate.DD; optionsClear(e); return;}   
	           var n = MonHead[MMvalue - 1];   
	           if (MMvalue ==2 && IsPinYear(str)) n++;   
	                writeDay(n)   
	   }   
	   function MMDD(str)   //月发生变化时日期联动   
	   {   
	        var YYYYvalue = document.reg_testdate.YYYY.options[document.reg_testdate.YYYY.selectedIndex].value;   
	        if (YYYYvalue == ""){ var e = document.reg_testdate.DD; optionsClear(e); return;}   
	        var n = MonHead[str - 1];   
	        if (str ==2 && IsPinYear(YYYYvalue)) n++;   
	       writeDay(n)   
	   }   
	   function writeDay(n)   //据条件写日期的下拉框   
	   {   
	           var e = document.reg_testdate.DD; optionsClear(e);   
	           for (var i=1; i<(n+1); i++)   
	                e.options.add(new Option(" "+ i + " 日", i));   
	   }   
	   function IsPinYear(year)//判断是否闰平年   
	   {     return(0 == year%4 && (year%100 !=0 || year%400 == 0));}   
	   function optionsClear(e)   
	   {   
	        e.options.length = 1;   
	   }   

</script>
</body>
</html>