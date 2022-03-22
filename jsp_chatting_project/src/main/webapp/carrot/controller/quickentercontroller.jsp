<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String roomname = MemberDao.getmMemberDao().quickenter();
	if(roomname!=null){
		MemberDao.getmMemberDao().enterroom(roomname);
		out.print("<script>alert'랜덤방으로 입장합니다.'</script>");
		out.print("<script>location.href='/jsp_chatting_project/carrot/view/chatting/chattingmain.jsp?roomname="+roomname+"'</script>");
	}else{
		out.print("<script>alert'빈방이없습니다.'</script>");
		out.print("<script>location.href='/jsp_chatting_project/carrot/view/chatting/chattingmain.jsp'</script>");
	}
	
%>