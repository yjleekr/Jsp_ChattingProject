<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String id = MemberDao.getmMemberDao().findid(name, email);
	if(id!=null){
		out.print("회원님의 아이디는 : " + id);
	}else{
		out.print("잘못입력되었습니다. 다시입력해주세요."); 
	}
	
%>