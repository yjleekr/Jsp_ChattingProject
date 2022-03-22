<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String enter = request.getParameter("enter");
	String close = request.getParameter("close");
	MemberDao.getmMemberDao().outroom(close);
	boolean result = MemberDao.getmMemberDao().enterroom(enter);
	if(result){
		out.print(1);
	}else{
		out.print(2);
	}

%>    