<%@page import="dao.MemberDao"%>
<%@page import="dto.Room"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	if(title!=null){
		out.print(title);
	}
	String makeroom = request.getParameter("makeroom");
	ArrayList<Room> roomlist = MemberDao.getmMemberDao().getroom(null);
	boolean check = true;
	for(Room room : roomlist){
		if(room.getR_name().equals(makeroom)){
			System.out.println("받아온값 : "+makeroom+"리스트값"+room.getR_name());
			out.print(2);
			check = false;
			break;
		}
	}
	if(check){
		MemberDao.getmMemberDao().makeroom(makeroom);
		out.print(1);
	}
	
	
%>