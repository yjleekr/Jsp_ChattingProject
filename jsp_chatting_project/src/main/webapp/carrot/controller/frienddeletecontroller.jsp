<%@page import="dto.Member"%>
<%@page import="dao.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	int f_no = Integer.parseInt(request.getParameter("f_no"));
	
	
	boolean result = FriendDao.getFriendDao().deletefriende(f_no);
	if(result){
		out.print(1);
	}else{
		out.print(2);
	}
	
%>