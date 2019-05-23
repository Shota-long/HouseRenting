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
</script>
</body>
</html>