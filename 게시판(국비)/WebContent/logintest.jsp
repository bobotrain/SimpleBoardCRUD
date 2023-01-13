<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 상세 보기</title>
	<script src="js/jquery-3.6.3.min.js"></script>
	
	<script>
	$(function() {
		$("#submit").click(function() {
 			var id = $(".id").val();
			var pw = $(".pw").val(); 
			alert(pw);
 			$.ajax({
				type: "post",
				url: "loginServlet",
				data: {"id" : id, "pw" : pw},
				datatype: "json",
				success: function(c) {
					if(c.login) {
						$("#check").text("로그인 성공");
					}
					else {
						$("#check").text("로그인 실패");
					}
				},
				error: function(r,s,e) {
					alert("에러!!");
				}
			}); 
		});
	});
	
	</script>
</head>
<body>

		ID : <input class ="id" type="text" name="id"/> <br/>
		PW : <input class ="pw" type="password" name="pw"/> <br/>
		<input id="submit" type="button" value="로그인"/>
		
		<h1 id="check"></h1>
	

	

</body>
</html>
