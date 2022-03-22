<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String folderpath = request.getSession().getServletContext().getRealPath("carrot/upload");
	MultipartRequest multi = new MultipartRequest(request, folderpath, 1024*1024*10, "utf-8", new DefaultFileRenamePolicy());
	
	
	String title = multi.getParameter("title");
	String contents = multi.getParameter("content");
	
	title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\S)*(/)?", "");
	
	int b_no = Integer.parseInt(multi.getParameter("b_no"));
	Board board = new Board(b_no, title, contents);
	boolean result = BoardDao.getboardDao().boardupdate(board);
	
	if(result) {
		out.print("<script>alert('게시글이 수정 되었습니다.')</script>");
		out.print("<script>location.href='/jsp_chatting_project/carrot/view/board/boardview.jsp?b_no="+b_no+"';</script>");
	} else {
		out.print("<script>alert('[관리자 문의] 게시글 수정 실패')</script>");
	}
	
%>