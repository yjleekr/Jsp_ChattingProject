<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="../header.jsp" %>
	<div class="container loginpage">
		<div class="row">
			<div class="card offset-3 col-md-6" style="max-width: 350px; margin:0 auto;">
				<div class="text-center">
					<img src="/jsp_chatting_project/carrot/img/당근이.png" style="max-height: 100%">
				</div>
				<div style="text-align: center; ">
					<h3><a href="/jsp_chatting_project/carrot/view/member/findid.jsp">아이디</a>/<a href="/jsp_chatting_project/carrot/view/member/findpassword.jsp">비밀번호</a> 찾기</h3>
				</div>
				<div class="my-2">
					<input type="text" placeholder="아이디를 입력하세요." class="form-control" id="id" onchange="findpasswordcheck();">			
				</div>
				<div class="my-2">
					<input type="text" placeholder="이메일을 입력하세요." class="form-control" id="email" onchange="findpasswordcheck();">			
				</div>
				<div>
					<span id="emailresult"></span>
				</div>
				<div class="my-2">
					<button id="findpassword" class="btn btn-lg btn-block" style="background: #3f7d1b; color: #ffaa21;">비밀번호찾기</button>
				</div>
				<div style="text-align: center; padding-bottom: 10px;">
					<a href="/jsp_chatting_project/carrot/view/member/login.jsp" style="font-size: 1rem;">로그인</a> | <a href="/jsp_chatting_project/carrot/view/member/signup.jsp" style="font-size: 1rem;">회원가입</a> 
				</div>
			</div>
		</div>
	</div>
	
	<br><br><br><br>
	
	<%@include file="../footer.jsp" %>

</body>
</html>