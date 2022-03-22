
<%@page import="dto.Login"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Reply"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String r_contents = request.getParameter("r_contents");
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	
	Member logininfo = (Member)session.getAttribute("login");
	int m_no = logininfo.getM_no();
	
	Reply reply = new Reply(r_contents, m_no, b_no);
	
	// DB처리
	boolean result = BoardDao.getboardDao().replywrite(reply);
	
	if(result) {
		out.print("<script>alert('댓글 등록 되었습니다.');</script>");
		out.print("<script>location.href='../view/board/boardview.jsp?b_no="+b_no+"';</script>");
	} else {
		out.print("<script>alert('[관리자에게 문의] 댓글 등록을 실패 하였습니다.');</script>");
		out.print("<script>location.href='../view/board/boardview.jsp?b_no="+b_no+"';</script>");
	}
%>