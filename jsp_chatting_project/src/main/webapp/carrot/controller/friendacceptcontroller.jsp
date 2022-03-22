<%@page import="dao.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	int type = Integer.parseInt(request.getParameter("type")) ;
	int f_no = Integer.parseInt(request.getParameter("f_no"));
	System.out.print(type);
	System.out.print(f_no);
	boolean check = FriendDao.getFriendDao().friendaccept(type, f_no);
	
	if(check){
		out.print(1);
	}else{
		out.print(2);
	}

%>    