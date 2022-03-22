<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	
		String folderpath ="C:/Users/505/git/JSP_PROJECT/jsp_chatting_project/src/main/webapp/carrot/upload";
		String path = request.getSession().getServletContext().getRealPath("carrot/upload");
		
		MultipartRequest multi = new MultipartRequest( request ,  path , 
		1024*1024*10 ,"UTF-8" , new DefaultFileRenamePolicy() );

		
		String file = multi.getFilesystemName("file");
		
		System.out.print(file);

%>    