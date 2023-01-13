<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yg.dao.BoardDAO"%>

<%
	BoardDAO bDao = new BoardDAO();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 쓰기</title>
	<style>
		form {
			border: 1px solid grey;
		}
	</style>
</head>
<body>
	<form action = "Ex10WriteAction.jsp" method="post">
		게시글 번호 : <%=bDao.getNextBno() %> <br/>
		제목 : <input type="text" name="title"/> <br/>
		내용 : <input type="text" name="content"/> <br/>
		작성자 : <input type="text" name="writer"/> <br/>
		<input type="submit" value="작성완료"/>
	</form>
</body>
</html>






