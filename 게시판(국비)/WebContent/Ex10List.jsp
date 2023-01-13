<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.yg.dao.*"%>
<%@ page import="com.yg.dto.*" %>
 
 <%
 	String loginId =(String)session.getAttribute("loginID");
 
 %>
 
<%
	BoardDAO bDAO = new BoardDAO();
	ArrayList<BoardDTO> listB = bDAO.getAllBoardList();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전체 게시글 출력</title>
	<script src="js/jquery-3.6.3.min.js"></script>
	<style>
		table {
			border-collapse: collapse; 
		}
		td {
			border: 1px solid grey;
			padding: 10px;
		}
	</style>
	<script>
/* 		function btn_write_clicked() {
			alert("!");
			location.href = "https://www.naver.com";
		}
 */		
		$(function() {
			$("#btn_write").click(function() {
				location.href = "Ex10Write.jsp";
			});
			$("table tr").click(function() {
				var bno = $(this).find("td.bno").text();
				location.href = "Ex10Detail.jsp?bno="+bno;
			});
		});
	</script>
</head>
<body>
	<table>
	<h1><%= loginId %>로 로그인 되었습니다. </h1>
		<tr>
			<th>글 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일시</th>
		</tr>
		<% 
			for(BoardDTO board : listB) { 
		%>
			<tr>
				<td class="bno"><%=board.getBno() %></td>
				<td><%=board.getTitle() %></td>
				<td><%=board.getWriter() %></td>
				<td><%=board.getWritedate() %></td>
			</tr>
		<% 
			} 
		%>
	</table>
	<!-- <button onclick="btn_write_clicked()">글쓰기</button> -->
	<!-- <a href="https://www.naver.com">글쓰기</a> -->
	<button id="btn_write">글쓰기</button>
</body>
</html>


