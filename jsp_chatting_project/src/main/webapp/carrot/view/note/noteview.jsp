<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@page import="dao.NoteDao"%>
<%@page import="dto.Note"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%
		//노트 번호
		int n_no = Integer.parseInt(request.getParameter("n_no"));
		//노트 정보 찾기
		Note note = NoteDao.getNoteDao().getnote(n_no);
		//보낸사람 정보
		Member member = MemberDao.getmMemberDao().getinfo(note.getN_from());
		//메시지 확인 체크
		int n_check = 0;
		if(request.getParameter("n_check")!=null){
			n_check = Integer.parseInt(request.getParameter("n_check"));
		}
		if(n_check==2){
			NoteDao.getNoteDao().updaten_check(n_no);
		}
	%>
	<!-- 쪽지 확인 -->
	<br><br><br>
	<div class="container">
		<div class="row">
			<div class="card offset-3 col-md-6" style="height: 400px;">
				<table class="table">
					<tr class="text-center" style="height: 40px; ">
						<th colspan="4">쪽지보기</th>
					</tr>
					<tr>
						<th>보낸사람</th><td colspan="3"><%=MemberDao.getmMemberDao().getmemberid(note.getN_from()) %></td>
					</tr>
					<tr>
						<th>보낸날짜</th><td colspan="3"><%=note.getN_date() %></td>
					</tr>
					<tr>
						<th>내용</th><td colspan="3"  style="height: 200px;"><%=note.getN_contents() %></td>
					</tr>
					<tr>
						<td colspan="3" class="text-right"><a class="text-info" style="font-weight: bold;" href="/jsp_chatting_project/carrot/view/note/notelist.jsp?n_from=<%=note.getN_from()%>">뒤로가기</a></td>
					</tr>
				</table>
			</div>
			<div>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
</body>
</html>