<%@page import="java.net.URL"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* String folderpath = request.getSession().getServletContext().getRealPath("carrot/upload"); */ 
	String folderpath = "C:/Users/505/git/JSP_PROJECT/jsp_chatting_project/src/main/webapp/carrot/upload";
	MultipartRequest multi = new MultipartRequest(request,folderpath,1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());
	
	request.setCharacterEncoding("UTF-8");
	String m_id = multi.getParameter("m_id");
	String m_nickname = multi.getParameter("m_nickname");
	String m_password = multi.getParameter("m_password");
	String newfile = multi.getFilesystemName("newfile");
	if(newfile==null){
		newfile = multi.getParameter("oldfile");
	}
	Member member = new Member(m_id,m_nickname,m_password,newfile);
	boolean result = MemberDao.getmMemberDao().memberupdate(member);
	if(result){
		Member memberinfo = MemberDao.getmMemberDao().getmemberinfo(m_id, m_password);
		session.setAttribute("login", null);
		session.setAttribute("login", memberinfo);
		out.print("<script>alert('회원정보가 수정되었습니다.')</script>");
		out.print("<script>location.href='/jsp_chatting_project/carrot/view/member/myinfo.jsp'</script>");
	}else{
		out.print("<script>alert('회원정보가 수정실패했습니다.')</script>");
	}

	
%>