
function makeroom(){
	var makeroom = document.getElementById("makeroom").value;
	var m_grade = document.getElementById("m_grade").value*1;
	if(m_grade==1){
		if(confirm("프리미엄이되시면 누리실수있습니다. 가입하시겠습니까?")==true){
			location.href="/jsp_chatting_project/carrot/view/payment.jsp";
			return;
		}else{
			return;
		}
	}
	if(makeroom==""){
		alert("방제목을 입력해주세요");
		return;
	}
	if(confirm("방을 생성하시겠습니까?")==true){
		$.ajax({
			url : "/jsp_chatting_project/carrot/controller/makeroomcontroller.jsp",
			data : {
				makeroom : makeroom
				},
			success : function(result){
				if(result==1){
					alert("방이 개설되었습니다");
					location.href="chattingmain.jsp?roomname="+makeroom;
				}else{
					alert("동일한 이름의 방이 존재합니다");
					location.href="chattingmain.jsp";
				}
			}
		})
	}	
}
	
	function enterroom(enter,close){
		if(confirm("방을 입장하시겠습니까?")==true){
			$.ajax({
				url : "/jsp_chatting_project/carrot/controller/enterroomcontroller.jsp",
				data : {
					enter : enter,
					close : close
					},
				success : function(result){
					if(result==1){
						location.href="chattingmain.jsp?roomname="+enter;
						document.querySelector(".background").className = "background show";
					}else{
						alert("방이 가득찼습니다");
						location.href="chattingmain.jsp";
					}
					
					
				}
			})
		}
	}
	function outroom(makeroom){
		if(confirm("방을 나가시겠습니까?")==true){
			$.ajax({
				url : "/jsp_chatting_project/carrot/controller/outroomcontroller.jsp",
				data : {
					makeroom : makeroom
					},
				success : function(result){
					if(result==1){
						alert("채팅을종료합니다.");
						location.href="chattingmain.jsp";
					}else{
						alert("방을나갑니다.");
						location.href="chattingmain.jsp";
					}
			}
		});
	}
}
	//빠른입장
	function quickenter() {
		
		$.ajax({
			url : "/jsp_chatting_project/carrot/controller/quickentercontroller.jsp",
		});
				
	}
	
	//차단하기
	function blockuser(){
		
		var you = document.getElementById("you").innerText;
			
		var url = "block.jsp?you="+you;
        var name = "popup test";
        var option = "width = 330, height = 401, top = 100, left = 200, location = no"

        window.open(url, name, option);
	}
	
		//친구 초대
	function friendinvite(inviteid){
			var inviteid = inviteid;
			
		$.ajax({
			url : "../../controller/friendinvitecontroller.jsp",
			data : {
				inviteid : inviteid
			},
			success : function(result){
				if(result==1){
					alert("친구요청을 보냈습니다");
				}
				else if(result==3){
					alert("존재하지 않는 아이디입니다");
				}
				else if(result==2){
					alert("이미 친구인 회원입니다");
				}
				else if(result==4){
					alert("차단 중인 회원입니다");
				}
				else if(result==5){
					alert("초대 중인 회원입니다");
				}

				
			}
		}) 
	}
	
	//차단하기 
	function block(id){
		
		$.ajax({
			url : "../../controller/blockcontroller.jsp",
			data : {
				id : id
			},
			success : function(result){
				if(result==1){
					alert("차단되었습니다");
				}else if(result==2){
					alert("이미 차단된 회원입니다");
				}else{
					alert("차단 오류");
				}
				
				
			}
			
		})
	}
	







































