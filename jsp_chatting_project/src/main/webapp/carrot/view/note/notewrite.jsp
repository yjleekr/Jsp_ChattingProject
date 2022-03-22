<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<!-- 쪽지 페이지 -->
	<div class="container">
		<%
			//로그인 회원 번호		
			Member logininfo = (Member)session.getAttribute("login");
			int n_from = logininfo.getM_no();
		%>
		<input type="hidden" id="n_from" value="<%=n_from%>">
		<div class="row">
			<div class="p-3" style="height: 600px; width: 500px;">
				<div class="bg-secondary text-white p-1" style="padding-left: 3px;">
					<p class="px-2"> 새 쪽지 </p>
				</div>
				<div style="border-bottom: solid 1px #000000;">
					<input class="form-control" type="text" id="n_to" placeholder="수신자 ID">
				</div>
				<div>
					<textarea rows="18" cols="" id="n_contents" class="form-control" placeholder="내용"></textarea>
				</div>
				<div>
					<button class="btn btn-primary float-right" onclick="notesend()"> 보내기 </button>
				</div>
			</div>
		</div>
	</div>
		<!-- jquery js -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- 부트스트랩 js설정 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    	<!-- 노트 js 호출 -->
	<script src="/jsp_chatting_project/carrot/js/note.js"></script>
</body>
</html>