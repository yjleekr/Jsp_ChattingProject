/*차단목록 온오프버튼 start*/
function blocktablebtn(){
	document.getElementById("blocktable").style.display="";
}
/*차단목록 온오프버튼 end*/
/*차단목록 삭제버튼 start*/
function blockdeletebtn(){
	// 나중에 추가해도될듯
}
/*차단목록 삭제버튼 end*/
/*아이디 비번찾기 유효성 검사 start*/
function findidcheck(){
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var emailj = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;//이메일 정규 표현식
	//이메일
	if(!emailj.test(email)){
		document.getElementById("emailresult").innerHTML="이메일 형식으로 재입력해주세요.";
		document.getElementById("emailresult").style.color="red";
		return false;
	}else{
		document.getElementById("emailresult").innerHTML="";
	}
}
function findpasswordcheck(){
	var id = document.getElementById("id").value;
	var email = document.getElementById("email").value;
	var emailj = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;//이메일 정규 표현식
	//이메일
	if(!emailj.test(email)){
		document.getElementById("emailresult").innerHTML="이메일 형식으로 재입력해주세요.";
		document.getElementById("emailresult").style.color="red";
		return false;
	}else{
		document.getElementById("emailresult").innerHTML="";
	}
}
/*아이디 비번찾기 유효성 검사 end*/
/*아이디 비번찾기 start*/
$(function(){
	$("#findid").click(function(){
		$.ajax({
			url : "/jsp_chatting_project/carrot/controller/findidcontroller.jsp",
			data : {name:document.getElementById("name").value,
					email:document.getElementById("email").value
			},
			success : function(result){
				alert(result);
				location.reload();
			}
		});
	});	
});
$(function(){
	$("#findpassword").click(function(){
		$.ajax({
			url : "/jsp_chatting_project/carrot/controller/findpasswordcontroller.jsp",
			data : {id:document.getElementById("id").value,
					email:document.getElementById("email").value},
			success : function(result){
				alert(result);
				location.reload();
			}
		});
	});	
});
/*아이디 비번찾기 end*/
/* 로그인 Start */
function login(){
	var m_id = document.getElementById("m_id").value;
	var m_password = document.getElementById("m_password").value;
	$.ajax({
		url: "../../controller/logincontroller.jsp",
		data: {m_id:m_id, m_password:m_password},
		success: function(result){
			if(result==1){
				alert("로그인이 되셨습니다.");
				location.href="../chatting/chattingmain.jsp";
			} else {
				alert("아이디, 비밀번호가 잘못 되었습니다.");
				location.reload();
			}
		}
	});
}
/* 로그인 End */




































