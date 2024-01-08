<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.LoginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		요청 URL
			localhost/comm/board/delete.jsp?no=100000&page=3
			localhost/comm/board/delete.jsp?no=100000&page=3&error=deny
		요청파라미터
			no=xxx&page=xxx&error=xxx
			* error는 삭제/수정 작업 시 오류가 발생했을 때 추가되는 요청파라미터
	*/
	
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
	if (loginUser == null) {
		response.sendRedirect("/comm/loginfrom.jsp?error=deny");
		return;
	}
	
	// 1. 요청파라미터값 조회
	int no = Integer.valueOf(request.getParameter("no"));
	int currentPage = Integer.valueOf(request.getParameter("page"));
	
	// 2. COMM_BOARDS에 대한 CRUD 기능이 구현된 BoardDao 객체 생성하기
	BoardDao boardDao = new BoardDao();
	
	// 3. 삭제할 게시글 상세정보 조회하기
	Board savedBoard = boardDao.getBoardByNo(no);
	
	// 로그인사용자가 작성한 게시글이 아닌 경우 삭제할 수 없다.
	if (savedBoard.getUser().getNo() != loginUser.getNo()) {
		response.sendRedirect("detail.jsp?no=" + no + "&page=" + currentPage + "&error=deny");
		return;
	}
	
	// 4. 게시글의 삭제여부를 "Y"로 변경하기
	savedBoard.setDeleted("Y");
	
	// 5. 변경된 내용이 포함된 Board객체를 전달해서 updateBoard(Board board) 메소드를
	//    실행시켜서 테이블에 변경된 내용이 반영되게 하기
	boardDao.updateBoard(savedBoard);
	
	// 7. 게시글 목록을 재요청하는 URL을 응답으로 보내기
	response.sendRedirect("list.jsp?page=" + currentPage);
%>