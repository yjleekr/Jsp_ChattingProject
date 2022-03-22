<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	String roomname = request.getParameter("makeroom");
	boolean result = MemberDao.getmMemberDao().outroom(roomname);
	if(result){
		out.print(1);
	}else{
		out.print(2);
	}	

%>    