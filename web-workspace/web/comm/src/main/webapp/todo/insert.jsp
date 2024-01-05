<%@page import="vo.TodoCategory"%>
<%@page import="dao.TodoDao"%>
<%@page import="vo.User"%>
<%@page import="vo.Todo"%>
<%@page import="dto.LoginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 0. 로그인여부 체크
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
	if (loginUser == null) {
		response.sendRedirect("../loginform.jsp?error=deny");
		return;
	}
	
	// 1. 요청파라미터값 조회
	int no = Integer.parseInt(request.getParameter("categoryNo"));
	String title = request.getParameter("title");
	String expectedDate = request.getParameter("expectedDate");
	String content = request.getParameter("content");
	
	// 2. VO객체 생성
	Todo todo = new Todo();
	
	// 3. 요청파라미터값 저장
	TodoCategory todoCategory = new TodoCategory();
	todoCategory.setNo(no);
	todo.setCategory(todoCategory);
	
	todo.setTitle(title);
	todo.setExpectedDate(expectedDate);
	todo.setContent(content);
	
	// 4. 로그인된 사용자정보에서 사용자번호 조회 후 VO객체에 저장
	User user = new User();
	user.setNo(loginUser.getNo());
	
	todo.setUser(user);
	
	// 5. DAO객체를 생성하고, 새 일정을 등록시키는 메소드 실행
	TodoDao todoDao = new TodoDao();
	todoDao.insertTodo(todo);
	
	// 6. 일정목록 재요청하는 URL을 응답으로 보내기
	response.sendRedirect("list.jsp");
	
	
%>