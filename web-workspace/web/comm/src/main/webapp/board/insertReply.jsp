<%@page import="vo.User"%>
<%@page import="vo.Board"%>
<%@page import="vo.Reply"%>
<%@page import="dao.ReplyDao"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.LoginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
	if (loginUser == null) {
		response.sendRedirect("/comm/loginform.jsp?error=deny");
		return;
	}
	
	/*
		요청 URL
			localhosat/comm/board/insertReply.jsp
		요청 파라미터
			boardNo=xxx&page=xxx&content=xxxx
			* 요청메시지의 바디부에 포함되어 있다.
	*/
	
	// 1. 요청메시지 조회하기
	int boardNo = Integer.valueOf(request.getParameter("boardNo"));
	int currentPage = Integer.valueOf(request.getParameter("page"));
	String content = request.getParameter("content");
	
	// 2. 객체를 생성해서 조회된 요청파라미터 정보를 저장한다.
	Reply reply = new Reply();
	reply.setContent(content);
	
	Board board = new Board();
	board.setNo(boardNo);
	reply.setBoard(board);
	
	User user = new User();
	user.setNo(loginUser.getNo());
	reply.setUser(user);
	
	// 3. BoardDao와 ReplyDao객체를 생성한다.
	BoardDao boardDao = new BoardDao();
	ReplyDao replyDao = new ReplyDao();
	
	// 4. ReplyDao의 insertReply(Reply reply)를 실행해서 댓글을 등록시킨다.
	replyDao.insertReply(reply);
	
	// 5. 게시글의 댓글수 증가시키기
	// 6. BoardDao의 getBoardByNo(int no)를 실행해서 게시글 정보 조회하기
	Board savedBoard = boardDao.getBoardByNo(boardNo);
	// 7. 조회된 게시글정보의 댓글수 증가시키기
	savedBoard.setReplyCnt(savedBoard.getReplyCnt() + 1);
	// 8. BoardDao의 updateBoard(Board board)를 실행시켜서 변경된 내용 반영시키기
	boardDao.updateBoard(savedBoard);
	
	// 9. 게시글 상세정보를 재요청하는 URL를 응답으로 보내기
	response.sendRedirect("detail.jsp?no=" + boardNo + "&page=" + currentPage);
%>