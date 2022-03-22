<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="../header.jsp" %>
	<%
		if(logininfo!=null) {
			out.print("<script>alert('로그인이 되어 있습니다');</script>>");
			out.print("<script>location.href='/jsp_chatting_project/carrot/view/chatting/chattingmain.jsp';</script>");
		}
	
		if(request.getParameter("logout")!=null){
			 session.invalidate();
		}
	%>
	<div class="container loginpage">
		<div class="row">
			<div class="card offset-3 col-md-6" style="max-width: 350px; margin:0 auto;">
				<div class="text-center">
					<img src="/jsp_chatting_project/carrot/img/당근이.png" style="max-height: 100%">
				</div>
				<div style="text-align: center;">
					<h3>로그인</h3>
				</div>
				<div class="my-2"> 
					<input type="text" id="m_id" placeholder="아이디를 입력하세요" class="form-control">			
				</div>
				<div class="my-2">
					<input type="password" id="m_password" placeholder="비밀번호를 입력하세요" class="form-control">			
				</div>
				<div style="text-align: right;">
					<a href="/jsp_chatting_project/carrot/view/member/findid.jsp" style="font-size: 0.7rem;">아이디/비밀번호 찾기</a> 
				</div>
				<div class="my-2">
					<button class="btn btn-lg btn-block" onclick="login()" style="background: #3f7d1b; color: white;">로그인</button>
				</div>
				<div style="text-align: center; ">
					<p style="font-size: 1rem;">당근회원이 아니신가요?<a href="signup.jsp" style="font-size: 1.0rem;">회원가입</a> 
				</div>
			</div>
		</div>
	</div>
	<br><br>
	<%@include file="../footer.jsp" %>
</body>
</html>