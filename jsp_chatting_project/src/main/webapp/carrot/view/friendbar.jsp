<%@page import="dao.NoteDao"%>
<%@page import="dao.FriendDao"%>
<%@page import="dto.Friend"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 부트스트랩 설정 4.0 버전 -->
</head>
<body>
	<%
		Member logininfo2 = (Member)session.getAttribute("login");
		int m_no2 =	logininfo2.getM_no();
		int m_grade2 = logininfo2.getM_grade();
		//친추 목록
		ArrayList<Friend> friendinvite = FriendDao.getFriendDao().getfriendelist(m_no2, 3);
		//친구 목록
		ArrayList<Friend> friends = FriendDao.getFriendDao().getfriendelist(m_no2 ,1);
		//친구 정보
		ArrayList<Member> friendsinfolist = new ArrayList<>();
		//친구목록 받아와서
		for(Friend temp : friends){
			if(temp.getM_no1()==m_no2){
				Member member = MemberDao.getmMemberDao().getinfo(temp.getM_no2());
				friendsinfolist.add(member);
			}else if (temp.getM_no2()==m_no2){
				Member member = MemberDao.getmMemberDao().getinfo(temp.getM_no1());
				friendsinfolist.add(member);
			}
		}
		
	%>
	<div class="sidebar">
    <span class="sidebar-brand">
    	<br><br><br><br>
        <a href="javascript:void(0)" data-toggle="sidebar"><i class="glyphicon glyphicon-arrow-left"></i> HIDE</a><br>
        <%if(m_grade2==2){%>
        <span>친구 목록</span>
    </span>
    <ul class="sidebar-nav">
        <li>
            <a href="javascript:void(0)" data-toggle="collapse" data-target="#menu-collapse-1">접속중인 친구</a>
            <ul id="menu-collapse-1" class="collapse in">
            	<%for(Member loginM : friendsinfolist) {%>
            	<%if(loginM.getM_logincheck()==1){ %>
                <li>
                	<div class="row">
	                	<div class="col-md-7 offset-1" style="font-size: 0.95em;">
	                		<span><%=loginM.getM_nickname() %></span><span style="color: #3BA55D;"><i class="fas fa-circle"></i></span>
	                	</div>
                		<div class="col-md-1">
	                		<button class="btn btn-outline-danger" onclick="deletefriend(<%=loginM.getM_no()%>)">X</button>
	                	</div>
	                	<div class="col-md-2 ml-1">
	                		<a href="/jsp_chatting_project/carrot/view/note/notelist.jsp?n_from=<%=loginM.getM_no()%>">
	                		<button class="btn btn-outline-dark"><i class="far fa-sticky-note"></i><span class="text-danger">
	                		<%if(NoteDao.getNoteDao().countN_check(loginM.getM_no(), m_no2)!=0)out.print(NoteDao.getNoteDao().countN_check(loginM.getM_no(), m_no2)); %> 
	                		</span></button></a>
	                	</div>
                	</div>
                </li>
                <%}} %>
            </ul>
        </li>
        <li>
            <a href="javascript:void(0)" data-toggle="collapse" data-target="#menu-collapse-2">
               미접속 친구
            </a>
            <ul id="menu-collapse-2" class="collapse in">
            	<%for(Member logoutM : friendsinfolist) {%>
            	<%if(logoutM.getM_logincheck()==2){ %>
                <li>
                	<div class="row">
	                	<div class="col-md-7 offset-1">
	                		<span><%=logoutM.getM_nickname() %></span><span style="color: #747F8D;"><i class="far fa-circle"></i></span>
	                	</div>
	                	<div class="col-md-1">
	                		<button class="btn btn-outline-danger"  onclick="deletefriend(<%=logoutM.getM_no()%>)">X</button>
	                	</div>
	                	<div class="col-md-2 ml-1">
	                		<a class="message" href="/jsp_chatting_project/carrot/view/note/notelist.jsp?n_from=<%=logoutM.getM_no()%>">
	                		<button class="btn btn-outline-dark"><i class="far fa-sticky-note"></i><span class="text-danger">
	                		<%if(NoteDao.getNoteDao().countN_check(logoutM.getM_no(), m_no2)!=0)out.print(NoteDao.getNoteDao().countN_check(logoutM.getM_no(), m_no2)); %> 
	                		</span></button></a>
	                	</div>
                	</div>
                </li>
                <%} }%>
            </ul>
        </li>
        <li>
    		<a href="javascript:void(0)" data-toggle="collapse" data-target="#menu-collapse-3">친구추가하기</a>	
    		<ul id="menu-collapse-3" class="collapse in">
    			<li>
   					<div class="row">
   						<div class="col-md-7 offset-1">
   							<input class="form-control" type="text" placeholder="추가할아이디" id="inviteid">
   						</div>
	   						<button class="btn btn-primary" onclick="friendinvite()">친구요청</button>
   					</div>
    			</li>
    		</ul>
    	</li>
    	<li>
    		<a href="javascript:void(0)" data-toggle="collapse" data-target="#menu-collapse-4">친구요청 <span style="color: red;"><%=FriendDao.getFriendDao().countinvite(m_no2)%></span></a>	
    		<ul id="menu-collapse-4" class="collapse in">
    			<li>
   					<div class="row">
   						 <%for(Friend friend : friendinvite){ %>
   						 <div class="col-md-4 offset-1"> <%=MemberDao.getmMemberDao().getmemberid(friend.getM_no2()) %> </div>
   						 <div class="text-right"> <button class="btn btn-success" onclick="friendCh(1,<%=friend.getF_no()%>)">수락</button> <button class="btn btn-danger" onclick="friendCh(2,<%=friend.getF_no()%>)">거절</button></div>   						 	
   						 <%} %>

   					</div>
    			</li>
    		</ul>
    	</li>
        <li>
       		<img src="/jsp_chatting_project/carrot/img/adimg1.jpg" style="max-width: 290px;">
        </li>
    </ul>
    <%}else{ %>
    	<p class="text-dark">친구기능은 프리미엄회원을 위한 기능입니다.<br>이용하시려면 아래 이용하기버튼을 눌러주세요.</p>
    	<a href="/jsp_chatting_project/carrot/view/payment.jsp"><button class="btn btn-outline-primary">이용하기</button></a>
    <%} %>
</div>

<!-- 사이드바 열기 버튼 -->
<!-- 결제한 사람이면 바로 친구목록 아니면 결제페이지 이동 --> 
<a href="javascript:void(0)" data-toggle="sidebar" style="margin: auto; position: fixed; top: 120px; right:230px; z-index: 10;">
	<button class="btn"><i class="fas fa-users fa-2x" style="color: #3f7d1b;"></i></button>
</a>
 

</body>

</html>