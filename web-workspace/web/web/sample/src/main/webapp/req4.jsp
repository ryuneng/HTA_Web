<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼데이터 요청객체2 - 20231227</title>
</head>
<body>
	<h1>요청객체 연습4</h1>
	
<%
	// POST 방식으로 전달된 요청파라미터값 조회
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
	<p>아이디:<%=id %></p>
	<p>비밀번호:<%=pwd %></p>
</body>
</html>