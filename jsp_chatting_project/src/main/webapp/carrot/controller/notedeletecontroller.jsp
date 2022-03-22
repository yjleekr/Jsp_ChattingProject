<%@page import="dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int n_no = Integer.parseInt(request.getParameter("n_no")) ;
	boolean result = NoteDao.getNoteDao().notedelete(n_no);
	if(result){
		out.print("1");
	}else{
		out.print("0");
	}




%>
