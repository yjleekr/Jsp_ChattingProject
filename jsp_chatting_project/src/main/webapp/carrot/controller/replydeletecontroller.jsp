<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int r_no = Integer.parseInt(request.getParameter("r_no"));
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	
	boolean result = BoardDao.getboardDao().replydelete(r_no);
	
	if(result) {
		out.print("<script>alert('댓글삭제 되었습니다');</script>");
		out.println("<script>location.href='../view/board/boardview.jsp?b_no="+b_no+"';</script>");
	} else {
		out.print("<script>alert('[관리자 문의] 댓글삭제 오류');</script>");
		out.println("<script>location.href='../view/board/boardview.jsp?b_no="+b_no+"';</script>");
	}
%>