<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="../header.jsp" %>
	<div class="container">
		<form id ="signupform" action="/jsp_chatting_project/carrot/controller/signupcontroller.jsp" enctype="multipart/form-data" method="post" onsubmit="return signupcheck()">
			<div class="row">
				<div class="card offset-3 col-md-6" style="max-width: 350px; margin:0 auto;">
					<div class="mt-3" style="text-align: center;">
						<h3>당근 회원가입</h3>
					</div>
					<div class="my-2">
						<input type="text" placeholder="사용하실 ID를 입력해주세요." class="form-control" id="id" onchange="signupcheck();" name="id" >			
					</div>
					<div>
						<span id="idresult"></span>
					</div>
					<div class="my-2">
						<input type="password" placeholder="사용하실 비밀번호를 입력해주세요." class="form-control" id="password" onchange="signupcheck();" name="password">			
					</div>
					<div class="my-2">
						<input type="password" placeholder="패스워드를 다시 입력해주세요." class="form-control" id="passwordconfirm" onchange="signupcheck();" name="passwordconfirm">			
					</div>
					<div>
	                	<span id="pwresult"></span>
	               	</div>
	               	<div class="my-2">
						<input type="text" placeholder="사용하실 nickname를 입력해주세요." class="form-control" id="nickname" onchange="signupcheck();" name="nickname" >			
					</div>
					<div>
						<span id="nicknameresult"></span>
					</div>	
					<div class="my-2">
						<input type="text" placeholder="이름을 입력하세요." class="form-control" id="name" onchange="signupcheck();" name="name">			
					</div>
					<div>
	                	<span id="nameresult"></span>
	                </div>
					<div class="my-2">
						<input type="text" placeholder="email 형식으로 입력해주세요." class="form-control" id="email" onchange="signupcheck();" name="email" >			
					</div>
					<div>
						<span id="emailresult"></span>
					</div>
					<div class="my-2">
						<input type="text" placeholder="-제외한11자리번호를입력하세요." class="form-control" id="phone" onchange="signupcheck();" name="phone" >			
					</div>
					<div>
	                	<span id="phoneresult"></span>
	               	</div>
					<div class="my-2">
						<label style="font-weight: bold;">프로필 사진 선택하기</label>
						<input type="file" class="form-control" name="myimg">
					</div>
					<div class="p-2 my-2">
						<input type="submit" value="가입하기" class="btn btn-lg btn-block" style="background: #3f7d1b; color: #ffaa21;" >
					</div>
					<div class="my-2 text-center">
						<button class="btn btn-outline-success">뒤로가기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<br><br><br><br>
	<%@include file="../footer.jsp" %>

</body>
</html>