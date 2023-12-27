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
	
	// 요청파라미터 값 조회
	String jobId = request.getParameter("id");

	// JobDao 객체 생성
	JobDao dao = new JobDao();
	
	// Job 상세정보 조회
	Job job = dao.getJobById(jobId);
%>
	<dl>
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