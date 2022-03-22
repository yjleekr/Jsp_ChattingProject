<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String password = MemberDao.getmMemberDao().findpassword(id, email);
	if(password!=null){
		out.print("회원님의 패스워드는 : " + password);
	}else{
		out.print("잘못입력되었습니다. 다시입력해주세요."); 
	}
%>