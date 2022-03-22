<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member = (Member)session.getAttribute("login");
	// 세션에서 받아온 m_grade 가 1이면 결제 가능 else이면 이미 결제한 사람
	boolean result = MemberDao.getmMemberDao().gradeupdate(member.getM_no());
	if(result){
		member = MemberDao.getmMemberDao().getinfo(member.getM_no());
		session.setAttribute("login", member);
		out.print("1");
	}
	else
	out.print("0");
 
%>