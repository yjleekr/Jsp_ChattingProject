<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="dao.FriendDao"%>
<%@page import="dto.Friend"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Member logininfo = (Member)session.getAttribute("login");
	int m_no = logininfo.getM_no();
	String t_id = request.getParameter("id");
	int t_num = MemberDao.getmMemberDao().getm_no(t_id);
	
	//차단 목록
	ArrayList<Friend> arrayList2 = FriendDao.getFriendDao().getfriendelist(m_no, 4);
	
	for(Friend friend : arrayList2){ 
		if(friend.getM_no2()==t_num){
			out.print(2);
			return;
		}
	}
	boolean check = FriendDao.getFriendDao().blockid(m_no, t_num);
	if(check){
		out.print(1);
	}else{
		out.print(3);
	}
	

%>