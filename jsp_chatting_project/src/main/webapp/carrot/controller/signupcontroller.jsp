<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* String folderpath = request.getSession().getServletContext().getRealPath("carrot/upload"); */
	
	String folderpath = "C:/Users/506/git/JSP_PROJECT/jsp_chatting_project/src/main/webapp/carrot/upload"; 
	MultipartRequest multi = new MultipartRequest(request, folderpath, 1024*1024*10,"UTF-8", new DefaultFileRenamePolicy());
	String id = multi.getParameter("id");
	String password = multi.getParameter("password");
	String passwordconfirm = multi.getParameter("passwordconfirm");
	String nickname = multi.getParameter("nickname");
	String name = multi.getParameter("name");
	String email = multi.getParameter("email");
	String phone = multi.getParameter("phone");
	String img = multi.getFilesystemName("myimg");
		Member member = new Member(id, nickname,password,name,email,phone,1,2,img);
		if(MemberDao.getmMemberDao().signup(member)){
			out.print("<script>alert('회원 가입 을 축하합니다');</script>");
			out.print("<script>location.href='../view/member/login.jsp';</script>");
		}else{
			out.print("<script>alert('회원 가입 실패');</script>");
			out.print("<script>location.href='../view/member/login.jsp';</script>");
		}
%>


