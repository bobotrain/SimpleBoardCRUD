<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.yg.dto.*"%>
<%@ page import="com.yg.dao.*"%>

<%
	request.setCharacterEncoding("UTF-8");   // post방식 한글깨짐 해결.
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	
	// BoardDAO 이용,
	BoardDAO bDao = new BoardDAO(); 
	// insert 수행.
	BoardDTO bDto = new BoardDTO();
	bDto.setTitle(title);
	bDto.setContent(content);
	bDto.setWriter(writer);
	
	bDao.insertBoard(bDto);
%>								
<script>
	alert("게시글이 등록되었습니다.");
	location.href = "Ex10List.jsp";
</script>











