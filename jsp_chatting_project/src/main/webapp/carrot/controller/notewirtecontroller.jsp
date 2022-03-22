<%@page import="dao.NoteDao"%>
<%@page import="dto.Note"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	int n_from = Integer.parseInt(request.getParameter("n_from")) ;
	String n_to = request.getParameter("n_to") ;
	String n_contents = request.getParameter("n_contents");
	int m_no = MemberDao.getmMemberDao().getm_no(n_to);
	
	
	Note note = new Note(n_contents,n_from,m_no,1);
	
	boolean result = NoteDao.getNoteDao().notewrite(note);
	if(result){
		out.print("1");
	}else{
		out.print("0");
	}
	
%>    





