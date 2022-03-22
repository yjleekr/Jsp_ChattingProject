/*회원가입 유효성 검사 start */
	function signupcheck(){
		//1. 폼 가져오기 [폼에 id 존재] //document.getElementById("signupform")
		//2.폼내 아이디 입력 input 가져오기
		var id = document.getElementById("signupform").id.value;
		var password= document.getElementById("signupform").password.value;
		var passwordconfirm=document.getElementById("signupform").passwordconfirm.value;
		var nickname=document.getElementById("signupform").nickname.value;
		var name=document.getElementById("signupform").name.value;
		var email=document.getElementById("signupform").email.value;
		var phone =document.getElementById("signupform").phone.value;
		
		//3. 유효성 검사 [정규식 표현: 텍스트 패턴검사]
		var idj = /^[a-z0-9]{5,15}$/;		// 아이디 정규표현식	[ 소문자 숫자 5~15]
		var pwj = /^[A-Za-z0-9]{5,15}$/;	// 비밀번호 정규표현식[ 대,소문자 숫자 5~15]
		var phonej = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; // 연락처
		var nicknamej = /^[A-Za-z0-9가-힣]{1,15}$/; //닉네임 정규 표현식
		var namej = /^[A-Za-z0-9가-힣]{1,15}$/;	// 이름 정규표현식
		var emailj = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;//이메일 정규 표현식
		//아이디[정규식에 어긋나면 html뜸]
		if(!idj.test(id)){// 혹여나 패턴이 다르면
			document.getElementById("idresult").innerHTML="아이디는 소문자와 숫자조합 5~15사이만 가능합니다.";
			document.getElementById("idresult").style.color="red";	
			return false; //form submit 불가하디요	
		}else{
			document.getElementById("idresult").innerHTML="사용가능한 아이디 입니다.";
			document.getElementById("idresult").style.color="blue";
		}
		//패스워드[두패스워드가 동일한지..검사]
		if(!pwj.test(password)||!pwj.test(passwordconfirm)){
			document.getElementById("pwresult").innerHTML="대소문자 조합 5~15사이만 가능합니다.";return false;
			
		}else if(password != passwordconfirm){
			document.getElementById("pwresult").innerHTML="패스워드가 동일하지 않습니다.";return false;
			
		}else{
			document.getElementById("pwresult").innerHTML="사용가능한 패스워드 입니다."
		}
		//닉네임
		if(!nicknamej.test(nickname)){
			document.getElementById("nicknameresult").innerHTML="닉네임을 입력해주세요[특수문자는 제외]";return false;
		}else{
			document.getElementById("nicknameresult").innerHTML="사용가능한 닉네임 입니다.";
		}
		
		//이름
		if(!namej.test(name)){
			document.getElementById("nameresult").innerHTML="이름을 입력해주세요[특수문자는 제외]";return false;
		}else{
			document.getElementById("nameresult").innerHTML="사용가능한 이름 입니다.";
		}
		//이메일
		if(!emailj.test(email)){
			document.getElementById("emailresult").innerHTML="이메일 형식으로 재입력해주세요.";return false;
		}else{
			document.getElementById("emailresult").innerHTML="사용 가능한 이메일입니다.";
		}
		//전화번호
		if(!phonej.test(phone)){
			document.getElementById("phoneresult").innerHTML="전화번호 형식으로 입력해주세요.";return false;
		}else{
			document.getElementById("phoneresult").innerHTML="사용 가능한 전화번호 입니다."
		}
	
	}//function signupcheck()끝
/*회원가입 유효성 검사 end */
/* 결제 start*/
function payment(){
	var IMP = window.IMP; // 생략 가능
    IMP.init("imp96520987"); // 예: imp00000000
     // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",							
          pay_method: "card",	
          merchant_uid: "ORD20180131-0000011",
          name: "당근프리미엄",
          amount: 3900,
          buyer_email: "gildong@gmail.com",
          buyer_name: "가입시받아온이름",
          buyer_tel: "가입시받아온폰",
          buyer_addr: "주소",
          buyer_postcode: "상세주소"
      }, function (rsp) {
          if(rsp.success) {
	
          }else{// 결제 실패했을시
          		// 테스트 : 결제 성공이라고 생각
          		$.ajax({
					url : "/jsp_chatting_project/carrot/controller/paymentcontroller.jsp",
					success : function(result){
						if(result==1){
						alert("당근 프리미엄 회원이 되셨습니다.");
							// 결제완료 페이지						
							location.href="/jsp_chatting_project/carrot/view/chatting/chattingmain.jsp";
						}else{
							alert("결제 오류");
							location.href="payment.jsp";
						}
					}
				});
          }
      });
}
/*결제 end*/
/*사이드광고 start*/
function sideadtoggle(){
	$("#adtoggle").click(function(){
		$("#sidead").toggleClass("toggled");
	});
}
/*사이드광고 end*/

