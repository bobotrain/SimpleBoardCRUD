<%@page import="com.yg.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");  //쿠키에 저장해달라는 요청 받음
 	int pw = Integer.parseInt(request.getParameter("pw") );
 	
 	MemberDAO mDAO = new MemberDAO();
 	if( mDAO. loginCheck(id, pw) ){
 		//로그인 성공 시.
 		
 		
 		//쿠키에 저장할때는 왜 response이고 세션에 저장할 때는 왜 setAttribute인지.
 		
 		//1.쿠키로 하는 법
 		//Cookie c = new Cookie("loginId", id);
 		//response.addCookie(c);  -응답과 관련된 코드 (쿠키 저장해! 라는 코드)
 		
 		//2.세션으로 하는 법
 		session.setAttribute("loginID", id); //세션영역에 저장만 하면되니까 ( 요청에 대한 응답이 아님.. setAttribute 쓰면 끝 /  response 아님)
 		//jsessionid : 어떤 클라이언트가 접속했는지 같이 담긴 쿠키 식별을 하기위해 요청이날라갈때마다 식별 키를 제공하는 쿠키임.  없는채로 왔으면 만들어준다!  //  
%>
		<script> 
		alert("로그인 성공!"); 
		location.href="Ex10List.jsp";
		</script>
<%  		
 		
 		
 	}else {
 		//로그인 실패 시.
%>
		<script> alert("잘못돤 아이디 또는 비밀번호입니다!");</script>

<% 		
 	}


%>