<%@page import="dao.MemberDao"%>
<%@page import="dao.FriendDao"%>
<%@page import="dto.Friend"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%
	Member logininfo = (Member)session.getAttribute("login");
	int m_no = logininfo.getM_no();
	String inviteid = request.getParameter("inviteid");
	int inviteNo = MemberDao.getmMemberDao().getm_no(inviteid);
	ArrayList<Friend> arrayList = FriendDao.getFriendDao().getfriendelist(m_no, 1);
	ArrayList<Friend> arrayList2 = FriendDao.getFriendDao().getfriendelist(m_no, 2);
	ArrayList<Friend> arrayList3 = FriendDao.getFriendDao().getfriendelist(m_no, 3);
	
	if(m_no==inviteNo){
		out.print(2);
		return;
	}
	
	if(inviteNo==0){
		out.print(3);
		return;
	}
	for(Friend friend : arrayList3){
		if(friend.getM_no1()==inviteNo||friend.getM_no2()==inviteNo){
			out.print(5);
			return;
		}
	}
	
	for(Friend friend : arrayList2){
		if(friend.getM_no1()==inviteNo||friend.getM_no2()==inviteNo){
			out.print(4);
			return;
		}
	}
	
	for(Friend friend : arrayList){
		if(friend.getM_no1()==inviteNo||friend.getM_no2()==inviteNo){
			out.print(2);
			return;
		}
	}
	
	FriendDao.getFriendDao().friendinvite(m_no, inviteNo);
	out.print(1);
	
	
	
	
	
	
	
	


%>    