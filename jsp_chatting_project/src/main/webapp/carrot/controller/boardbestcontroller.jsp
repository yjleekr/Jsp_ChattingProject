<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int b_no =Integer.parseInt(request.getParameter("b_no")) ;
	int m_no =Integer.parseInt(request.getParameter("m_no")) ;
	
	out.print(BoardDao.getboardDao().blike(b_no, m_no));
	







%>