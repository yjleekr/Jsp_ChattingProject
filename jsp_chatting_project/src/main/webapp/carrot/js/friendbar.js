/**
 * 
 */
	
	//setInterval(dbload, 1000);
	
	function dbload(){
		$.ajax({ 
			url :  "/jsp_chatting_project/carrot/view/chatting/chattingmain.jsp" ,
	});
	}
	
	//차단 취소
	function frienddelete(){
		var f_no = document.getElementById("f_no").value;
		alert(f_no);
		if(confirm("차단을 취소할까요?")==true){
		$.ajax({
			url : "../../controller/frienddeletecontroller.jsp",
			data : {
				f_no : f_no
			},
			success : function(result){
				alert(result);
				if(result==1){
					alert("삭제 되었습니다");
					location.reload();	
				}else{
					alert("삭제 오류");
					location.reload();
				}
			}
		})
		}
	}
	
	//친구 초대
	function friendinvite(){
		var inviteid = document.getElementById("inviteid").value;
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

	//친구 초대 수락
	function friendCh(type,f_no){
		$.ajax({
			url : "../../controller/friendacceptcontroller.jsp",
			data : {
				type : type,
				f_no : f_no
			},
			success : function(re){
				if(re==1){
					alert("친구요청을 수락하셨습니다");
					location.reload();
				}else{
					alert("친구요청을 거절하셨습니다");
					location.reload();
				}
			}
		})
	}
	
	//친구 삭제
	function deletefriend(m_no){
			if(confirm("친구를 삭제할까요?")==true){
				$.ajax({
					url : "../../controller/frienddeletecontroller.jsp",
					data : {
						m_no : m_no
					},
					success : function(re){
						if(re==1){
							alert("친구삭제 되었습니다");
							location.reload();
						}else{
							alert("친구삭제 오류");
							location.reload();
						}
					}
				})				
			}

	}




















