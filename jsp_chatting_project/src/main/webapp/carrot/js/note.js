
//



////////////////  쪽지 보내기  //////////////
	function notesend(){
		var n_from = document.getElementById("n_from").value;
		var n_to = document.getElementById("n_to").value;
		var n_contents = document.getElementById("n_contents").value;
		n_contents = n_contents.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		if(n_to==""){
			alert("수신자를 입력해주세요");
			return;
		}
		if(n_contents==""){
			alert("내용을를 입력해주세요");
			return;
		}
		$.ajax({
			url:"../../controller/notewirtecontroller.jsp",
			data:{
				n_from: n_from,
				n_to : n_to,
				n_contents : n_contents
			},
			success : function(result){
				if(result==1){
					alert("쪽지 보냈습니다");				
					close();
				}else{
					alert("수신인을 확인해주세요");
					location.reload;
				}
			}
		})
	}
////////////////  쪽지 보내기 끝 //////////////



////////////////  쪽지 삭제 //////////////////

	function notedelete(n_no){
		var n_no = n_no*1;
		if(confirm("삭제할까요?") == true){
		$.ajax({
			url:"../../controller/notedeletecontroller.jsp",
			data:{
				n_no:n_no
			},
			success : function(re){
				if(re==1){
					alert("삭제 되었습니다");
					location.href="notelist.jsp";
				}else{
					alert("삭제오류");
					location.href="notelist.jsp";
				}
			}
		})
		}
	}


//쪽지 쓰기 팝업
function shownote(){
	var width = 500;
	var height = 500;
	
	var left = (window.screen.width / 2) - (width/2); 
	var top = (window.screen.height / 4);

	
	//연결 url
    var url = "notewrite.jsp";
	//팝업 이름
   	var name = "쪽지 보내기";
	//팝업 설정
    var option = "width = "+width+", height = "+height+", top = "+top+", left = "+left+", location = no"
	
	//연결할 url
	
	// 팝업창 올리기
	//window.open("URL", "팝업이름", "팝업 옵션");
	window.open(url, name, option);
	
}




















