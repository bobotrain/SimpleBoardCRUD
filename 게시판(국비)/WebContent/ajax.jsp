<%@page import="com.yg.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>제이쿼리</title>
	<script src ="js/jquery-3.6.3.min.js"></script>
	
	<script>
		$(function() {
			$("#btn1").click(function() {
				$.ajax({
					type: "post", 
					
					//파라미터에 num 이라는 파라미터로 55 전달
					data : {"num":55 },
					datetype: "json",
					url: "ajaxtestServlet" , 
					success: function(d) {
						alert( d.result );
					} , 
					
					//function오류 확인
					error: function(request,status,error) {
						alert("code:"+request.status+"\n"
								+"message:"+request.responseText+"\n"
								+"error:" + error);
						
					}
					
				});
				
			});
		});
	
	</script>
	
</head>
<body>
	<button id = "btn1">버튼!</button>
</body>
</html>

    