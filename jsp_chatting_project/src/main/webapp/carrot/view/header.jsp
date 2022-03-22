<%@page import="dao.MemberDao"%>
<%@page import="dao.FriendDao"%>
<%@page import="dto.Friend"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심심해? 들어와! 당근</title>
	<!-- 부트스트랩 설정 4.0 버전 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<!-- css호출 -->
	<link rel="stylesheet" href="/jsp_chatting_project/carrot/css/main.css">
	<link href="/jsp_chatting_project/carrot/css/simple-sidebar.css" rel="stylesheet"> <!-- 친구목록 사이드바 css -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"> <!-- 아이콘 불러오는 css -->
		<!-- 글쓰기 호출 -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
 	 	<!-- 폰트 -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<%	
		int m_no =0;
		int m_grade=0;
		Member logininfo = (Member)session.getAttribute("login");
		// 로그인 하면 세션에 그 사람 정보가 로그인 인포에 다 들어간다
		if(session.getAttribute("login")!=null){
			m_no =	logininfo.getM_no();
			m_grade = logininfo.getM_grade();
		}
	%>
	<!-- jquery js -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- 부트스트랩 js설정 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- js 호출 -->
	<script type="text/javascript" src="/jsp_chatting_project/carrot/js/main.js"></script>
	
	<!-- 멤버 js 호출 -->
	<script type="text/javascript" src="/jsp_chatting_project/carrot/js/member.js"></script>
	<!-- 노트 js 호출 -->
	<script src="/jsp_chatting_project/carrot/js/note.js"></script>
	<!-- 채팅 js 호출 -->
	<script src="/jsp_chatting_project/carrot/js/chatting.js"></script>
	<!-- 친구목록 사이드바 js 호출 -->
	<script src="/jsp_chatting_project/carrot/js/simple-sidebar.js"></script> 
	<!-- 친구목록 js 호출 -->
	<script src="/jsp_chatting_project/carrot/js/friendbar.js"></script>
	<!-- 글쓰기 js 호출 -->
  	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<!-- 글쓰기 js 호출 -->
  	<script src="/jsp_chatting_project/carrot/js/board.js"></script>
  	
	
	<div class="container" >
		<div class="row justify-content-between align-items-center">
			<div class="col-md-3 offset-4 text-center mt-2" id="headtext" style="color: #66D965;">
				<%if(logininfo!=null){ %>
				<a href="/jsp_chatting_project/carrot/view/chatting/chattingmain.jsp" style="color: #66D965;"> <img alt="" src="/jsp_chatting_project/carrot/img/당근이.png" style="width: 20%;">당근</a>
				<%}else{ %>
				<p style="color: #66D965;"><img alt="" src="/jsp_chatting_project/carrot/img/당근이.png" style="width: 20%;">당근
				<%} %>
			</div>
			<div class="col-md-5 d-flex justify-content-end align-items-center" style="padding-top: 50px; ">
				<ul class="nav header-topmenu">	<!-- 로그인 했을때 랑 안했을때 구별해서 해야합니다. 나중에 수정해야함 (12.15 15:58)-->
					<%
						if(session.getAttribute("login")!=null) {
					%>
					<li style="color : #F5B638 " ><%
						String grade;
						if(logininfo.getM_grade()==1){
								grade = "일반회원🥕";%>
						<%=grade %>
						<%}else if(logininfo.getM_grade()==2){
							grade = "프리미엄회원👑";%>
						<%=grade %>
						<%}	%>
					</li>
					<li class="text-dark mx-2"><%=logininfo.getM_nickname() %>님</li>
					<li><a href="/jsp_chatting_project/carrot/view/board/boardlist.jsp?type=1" class="mx-2" style="color: #707070;">게시판</a></li>
					<li><a href="/jsp_chatting_project/carrot/view/member/myinfo.jsp" class="mx-2" style="color: #707070;">내정보</a></li>
					<li><a href="/jsp_chatting_project/carrot/view/note/notelist.jsp" class="mx-2" style="color: #707070;">쪽지</a></li>
					<li><a href="/jsp_chatting_project/carrot/controller/logoutcontroller.jsp?m_no=<%=logininfo.getM_no() %>" class="mx-2" style="color: #707070;">로그아웃</a></li>
					<% }else{ %>
					<li><a href="/jsp_chatting_project/carrot/view/member/login.jsp" class="mx-2" style="color: #707070;">로그인</a></li>
					<li><a href="/jsp_chatting_project/carrot/view/member/signup.jsp" class="mx-2" style="color: #707070;">회원가입</a></li>
					<%} %>
				</ul>
			</div>	
		</div>
	<br>
	</div>
	<!-- 세션에서 받아온 회원의 grade가 1이면 표시 아니면 표시안함 -->
	<%
		if(m_grade==1){
	%>
	<div id="sidead" style="position: absolute; top :180px; left: 20px;" class="col-md-2 col-sm-4 sidead">
		<div class="carousel slide" data-ride="carousel" data-interval="3500">
			<div class="carousel-inner">
				<div class="carousel-item active"><img src="/jsp_chatting_project/carrot/img/광고1.jpg"></div>
				<div class="carousel-item"><img src="/jsp_chatting_project/carrot/img/광고2.jpg"></div>
				<div class="carousel-item"><img src="/jsp_chatting_project/carrot/img/광고3.jpg"></div>
				<div class="carousel-item"><img src="/jsp_chatting_project/carrot/img/광고4.jpg"></div>
			</div>
		</div>
	</div>
	<%} %>
</body>
</html>