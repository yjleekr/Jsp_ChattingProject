<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int b_no = Integer.parseInt(request.getParameter("b_no"));

	boolean result = BoardDao.getboardDao().boaderdelete(b_no);

	if(result){
		out.print(1);
	} else {
		out.print(0);
	}
%>