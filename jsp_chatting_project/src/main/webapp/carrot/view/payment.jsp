<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="/carrot/view/friendbar.jsp" %>
	<!-- 결제 API  -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<input type="hidden" id="logininfo" value="<%=logininfo%>"> <!-- 세션에서멤버넘버 가져오거나 멤버에서 가져오면될듯 -->
	<div class="container">
		<div class="text-center">
			<img src="/jsp_chatting_project/carrot/img/당근프리미엄.png"  style="max-width: 100%">
			<p style="font-size: 2rem;">당근프리미엄에서 광고없는 채팅,<br> 친구기능 그리고 채팅방 만들기</p>
			<button class="btn btn-primary p-2 mb-3" onclick="payment();">당근프리미엄 가입하기</button>
			<p style="color:#ff7915; font-size: 2rem;"> 3,900원
			<p style="font-size: 1.7rem;">한번 결제로 · 평생 누리세요</p>
			<p class="text-secondary mb-3">프리미엄 가입후 즉시 해지는 청약 철회 가능하지만<br> 기능을 이용하셨을 경우 청약철회는 제한됩니다.</p>  
		</div>
		<div class="row text-center">
			<div class="col-md-4 mt-3"><img src="/jsp_chatting_project/carrot/img/당근친구만들기.png"></div>
			<div class="col-md-4 mt-3"><img src="/jsp_chatting_project/carrot/img/무제한빠른입장.png"></div>
			<div class="col-md-4 mt-3"><img src="/jsp_chatting_project/carrot/img/방만들기.png"></div>
		</div>
	</div>
	<br><br><br>
	<%@include file="footer.jsp" %>
</body>
</html>