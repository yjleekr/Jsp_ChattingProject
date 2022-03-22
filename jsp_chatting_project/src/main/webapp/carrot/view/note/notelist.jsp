 <%@page import="dao.MemberDao"%>
<%@page import="dto.Note"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@include file="/carrot/view/friendbar.jsp" %>
	<%
		//보낸사람 번호
		int n_from = 0;
		if(request.getParameter("n_from")!=null){
			n_from = Integer.parseInt(request.getParameter("n_from")) ;
		}
		String pagenum = request.getParameter("pagenum");
		if(pagenum==null){
			pagenum="1";
		}
		
		int lastrow = NoteDao.getNoteDao().notecount(n_from,m_no);
		int listsize = 5;	
		int lastpage = 0;
		
		if(lastrow % listsize == 0 ){
			lastpage = lastrow / listsize;	
		}else{
			lastpage = lastrow / listsize+1;
		}
		
		int currentpage = Integer.parseInt(pagenum);
		int startrow = (currentpage-1)*listsize; 
		ArrayList<Note> noteList = NoteDao.getNoteDao().notelist(startrow, listsize ,m_no,n_from);
	%>
	
	<div class="container">
		<h3 style="color : navy;"> 쪽지함 </h3>
		<br><br>
		<button class="btn-primary btn my-3 float-right" onclick="shownote()">쪽지보내기</button>
		<table class="table">
			<tr style="border-top: solid 2px navy; border-bottom: solid 1.5px navy;">
				<th> 확인 </th> <th> 내용 </th> <th> 보낸사람 </th> <th> 작성일 </th> <th> 삭제 </th>
			</tr>
			<%if(noteList.size()==0){ %>	
				<tr>
				<td colspan="5"> 메시지가 없습니다  </td>
				</tr>
			<%} %>
			<%for(int i=0; i<noteList.size(); i++ ){%>
			<tr>
				<td><%if(noteList.get(i).getN_check()==1)out.print("안읽음");else out.print("읽음");%></td>
				<%if(noteList.get(i).getN_check()==1){ %>
				<td> <a href="noteview.jsp?n_no=<%=noteList.get(i).getN_no()%>&n_check=2"><%=noteList.get(i).getN_contents() %></a> </td>
				<%}else{ %>
				<td> <a style="color: #B6B6B6" href="noteview.jsp?n_no=<%=noteList.get(i).getN_no()%>"><%=noteList.get(i).getN_contents() %></a> </td>
				<%} %>
				<td><%=MemberDao.getmMemberDao().getnickname(noteList.get(i).getN_from())%></td>
				<td><%=noteList.get(i).gettime() %></td>
				<td> <button class="btn btn-danger" onclick="notedelete(<%=noteList.get(i).getN_no()%>)">삭제</button> </td>	
			</tr>		
			<% }%>		
		</table>
		<div class="row">
			<div class="col-md-4 offset-4">
				<ul class="pagination d-flex justify-content-center">
					<%if(currentpage==1){ %>
						<li class="page-item"><a href="notelist.jsp?pagenum=<%=currentpage%>&n_from=<%=n_from %>" class="page-link"> 이전 </a> </li>
					<%}else{ %>
						<li class="page-item"><a href="notelist.jsp?pagenum=<%=currentpage-1%>&n_from=<%=n_from %>" class="page-link"> 이전 </a> </li>
					<%} %>
					<%for(int i = 1 ; i<=lastpage; i++){ %>
						<li class="page-item"><a href="notelist.jsp?pagenum=<%=i %>&n_from=<%=n_from %>" class="page-link"> <%=i %> </a> </li>
					<%} %>
					<%if(currentpage == lastpage){ %>
						<li class="page-item"><a href="notelist.jsp?pagenum=<%=currentpage%>&n_from=<%=n_from %>" class="page-link"> 다음 </a> </li>
					<%}else{ %>
						<li class="page-item"><a href="notelist.jsp?pagenum=<%=currentpage+1 %>&n_from=<%=n_from %>" class="page-link"> 다음 </a> </li>
					<%} %>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>