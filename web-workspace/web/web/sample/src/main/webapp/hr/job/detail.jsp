<%@page import="hr.vo.Job"%>
<%@page import="hr.dao.JobDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직종 상세 - 20231227</title>
</head>
<body>
	<h1>직종 상세 정보</h1>
<%
	// 요청URL : http://localhost/sample/hr/job/detail.jsp?id=xxx
	
	// 요청파라미터값(상세정보를 조회할 직종아이디) 조회
	String jobId = request.getParameter("id"); // getParameter 괄호 안에 들어간 "id"는 요청URL의 파라미터값(name)과 동일해야 함

	// JOBS 테이블에 대한 CRUD작업이 구현된 JobDao 객체 생성
	JobDao dao = new JobDao();
	
	// 직종아이디를 전달받아서 직종상세정보를 반환하는 getJobById(String jobId) 실행
	Job job = dao.getJobById(jobId);
%>
	<dl>
		<!-- 조회된 직종 상세정보를 응답으로 보내기 -->
		<dt>아이디</dt><dd><%=job.getId() %></dd>
		<dt>제목</dt><dd><%=job.getTitle() %></dd>
		<dt>최저급여</dt><dd><%=job.getMinSalary() %></dd>
		<dt>최고급여</dt><dd><%=job.getMaxSalary() %></dd>
	</dl>
	
	<div>
		<a href="list.jsp">목록</a>
	</div>
</body>
</html>