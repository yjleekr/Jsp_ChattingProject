<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

	<%
		String nickname = request.getParameter("you");
		String id = MemberDao.getmMemberDao().getidfromnick(nickname);
		int from_num = MemberDao.getmMemberDao().getmembernum(id);
		Member member = MemberDao.getmMemberDao().getinfo(from_num);
		
	%>

	<div class="container" style="background-color: #FFD19B;">
		<div class="text-center" style="width: 300px; height: 400px;">
		<br>
			<div>
				<img style="max-height: 200px; border-radius: 70%; padding-top: 25px; border-color: " src="/jsp_chatting_project/carrot/upload/<%=member.getM_img() %>">
				<p style="padding-top: 10px; font-weight: bold; "><span style="font-size: 1.6rem;"><%=member.getM_nickname() %></span><br>
					ID: <%=member.getM_id() %><br>
			</div>
			<div class="row">
				<div class="col-sm-1">
					<button class="btn" style="background-color: #66D965; color: white;" onclick="friendinvite('<%=id%>')">친구추가</button>			
					<button class="btn" style="background-color: #C76B4E; color: white;" onclick="block('<%=id%>')">차단하기</button>			
				</div>
			</div>
		</div>	
	</div>

		<!-- jquery js -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- 부트스트랩 js설정 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    	<!-- 채팅 js 호출 -->
	<script src="/jsp_chatting_project/carrot/js/chatting.js"></script>
		
</body>
</html>