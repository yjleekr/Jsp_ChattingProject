<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="../header.jsp" %>
	<%@include file="../friendbar.jsp" %>
	<%
		//차단 목록
		friends = FriendDao.getFriendDao().getfriendelist(m_no,4);
		//차단 받아와서
		ArrayList<Member> blocklist = new ArrayList<>();
		for(Friend temp : friends){
			Member member = MemberDao.getmMemberDao().getinfo(temp.getM_no2());
			blocklist.add(member);
		}
	
	%>
	<div class="container">
		<div class="row">
			<div class="card col-md-6 offset-3 " style="max-width: 700px; margin:0 auto;">
				<div style="text-align: center;">
					<h3 class="pt-3">내정보</h3>
					<br>
				</div>
				<form action="/jsp_chatting_project/carrot/controller/myinfoupdatecontroller.jsp" method="post" enctype="multipart/form-data">
					<table class="table text-center">
						<tr>
							<td>아이디</td><td><%=logininfo.getM_id() %></td><td><input type="hidden" name="m_id" value="<%=logininfo.getM_id() %>"></td>
						</tr>
						<tr>
							<td>닉네임</td><td> <input class="form-control" type="text" placeholder="바꿀닉네임을입력하세요!" name="m_nickname"></td>
						</tr>
						<tr>
							<td>비밀번호</td><td> <input class="form-control" type="password" name="m_password"></td>						
						</tr>
						<tr>
							<td>프로필사진</td><td><input type="file" class="form-control" name="newfile"><input type="hidden" name="oldfile" value="<%=logininfo.getM_img()%>"> </td>
						</tr>
						<tr>
							<td>이름</td><td><%=logininfo.getM_name() %> </td><td></td>
						</tr>
						<tr>
							<td>이메일</td><td><%=logininfo.getM_email() %> </td><td></td>
						</tr>
						<tr>
							<td>핸드폰번호</td><td><%=logininfo.getM_phone() %> </td><td></td>
						</tr>
						<tr>
							<%
							String grade;
							if(logininfo.getM_grade()==1){
									grade = "일반회원";		%>
							<td>회원등급</td><td><%=grade %> </td><td></td>
							<%}else if(logininfo.getM_grade()==2){
								grade = "프리미엄회원";%>
							<td>회원등급</td><td><%=grade %> </td><td></td>
							<%
							}
							%>
						</tr>
					</table>
					<input class="btn btn-success btn-block" type="submit" value="수정하기">
				</form>
				<br>
				<button class="btn btn-secondary" onclick="blocktablebtn();">차단목록</button>
				<table class="table text-center table-hover" id="blocktable" style="display: none;">
					<tr class="table-warning">
						<th>차단한닉네임</th><th>삭제하기</th>
					</tr>
					<%for(int i = 0 ; i<blocklist.size();i++){ %>
					<tr>
						<td><%=blocklist.get(i).getM_nickname() %></td>
						<td><button class="btn" onclick="frienddelete()">
						<span class="text-danger">X</span></button>
						<input type="hidden" id="f_no" value=<%=friends.get(i).getF_no()%>>
						</td>
					</tr>
					<%} %>
				</table>
				
			</div>
		</div>
		<br><br>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>