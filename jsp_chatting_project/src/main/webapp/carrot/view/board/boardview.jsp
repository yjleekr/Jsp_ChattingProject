<%@page import="dto.Login"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Reply"%>
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
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	System.out.println(b_no);
	
	String boardviews = logininfo.getM_id()+" : " + b_no;
	
	if(session.getAttribute(boardviews)==null) {
		BoardDao.getboardDao().boardcount(b_no);
		String boardview = logininfo.getM_id()+" : " + b_no;
		session.setAttribute(boardview, true);
		session.setMaxInactiveInterval(60*60*24);
	}
	
	Board board = BoardDao.getboardDao().getboard(b_no);
	int lastrow = BoardDao.getboardDao().replycount(b_no); // 댓글 총갯수
	int listsize=3; // 페이지당 표현할댓글수
	String replypage=request.getParameter("replypage"); // 현재 댓글 페이지
	int lastpage=0;  // 마지막페이지 설정
	if(lastrow % listsize==0){lastpage=lastrow/listsize;} 
	else{lastpage=lastrow/listsize+1;} 
	if(replypage==null){
		replypage="1";
	}
	int currentpage = Integer.parseInt(replypage); // 현재페이지
	int startrow = (currentpage-1)*listsize; // 페이지에 처음 시작할 게시물번호
	
%>

	<%@include file="../friendbar.jsp" %>
	<div class ="container">
		<div class="row">
			<div class="m-2"><a href="boardlist.jsp?type=1"><button class="form-control">📃목록</button></a></div>
			<%if(logininfo.getM_no()==board.getM_no()){%>
			<div class="m-2"><a href="boardupdate.jsp?b_no=<%=b_no %>"><button class="btn btn-primary">✓수정</button></a></div>
			<div class="m-2"><button class="btn btn-danger" onclick="boarddelete(<%=b_no%>)">✗삭제</button></div>
		<%} %>		
		</div>
		<table class="table">
			<tr>
				<td style="width: 20%"> 작성자 : <%=board.getB_writer() %></td>
				<td> 작성일 : <%=board.getB_date() %></td>
				<td> 조회수 : <%=board.getB_view()%></td>
			</tr>
			<tr>
				<td>제목  </td>
				<td colspan="2"><%=board.getB_title() %></td>
			</tr>
		
			<tr>
				<td style="height: 300px;">내용  </td>
				<td colspan="2"><%=board.getB_contents() %></td>
			</tr>
		</table>
		<div class="offset-5" style="margin-bottom: 100px;">
			<%if(BoardDao.getboardDao().likecheck(b_no, logininfo.getM_no())) {%>
				<button onclick="best();" id="btnlike" class="mr-2 ml-3 btn btn-outline-info active btn btn-default btn-lg">👍</button>
			<%}else{ %>
				<button onclick="best();" id="btnlike" class="mr-2 ml-3 btn btn-outline-info active btn btn-default btn-lg">🤜</button>
			<%} %>
			<input type="hidden" value="<%=board.getB_no()%>" id="blikebno">
			<input type="hidden" value="<%=logininfo.getM_no()%>" id="blikemno">
		</div>
		<form action="../../controller/replywritecontroller.jsp" method="post" class="input-group offset-1">
			<input type="hidden" name="b_no" value="<%=b_no%>">
				<div>
					<h6> 댓글 작성 </h6>
				</div>
				
				<div class="col-md-8">
					<input type="text" class="form-control" name="r_contents">
				</div>
				<div class="col-md-2">
					<input type="submit" value="등록" class="form-control">
				</div>
		</form>
		<table class="table m-3">
			<tr>
				<th>작성자</th><th>내용</th><th>작성일</th>
			</tr>
			<%
				ArrayList<Reply> replist = BoardDao.getboardDao().replylist(b_no,startrow,listsize);
				for(Reply reply : replist) {
			%>
			<tr>
				<td><%=reply.getR_writer() %></td>
				<td><%=reply.getR_contents() %></td>
				<td><%=reply.getR_date() %></td>
				<%if(logininfo.getM_no()==reply.getM_no()) {%>
				<td>
					<a href="../../controller/replydeletecontroller.jsp?r_no=<%=reply.getR_no()%>&b_no=<%=reply.getB_no()%>"><button class="btn btn-danger">삭제</button>	</a>
				</td>
				<%} %>
			</tr>
			<% } %>
		</table>
		<div class="text-center">
			<ul class="pagination justify-content-center">
			<%if(currentpage==1) { %>
				<li class="page-item"><a class="page-link" href="/jsp_chatting_project/carrot/view/board/boardview.jsp?b_no=<%=b_no%>&replypage=<%=currentpage%>">이전</a></li>
			<%}else{%>
				<li class="page-item"><a class="page-link" href="/jsp_chatting_project/carrot/view/board/boardview.jsp?b_no=<%=b_no%>&replypage=<%=currentpage-1%>">이전</a></li>
			<%}%>
			<%
				for(int i = 1; i<=lastpage ; i++) {
			%>
				<li class="page-item"><a class="page-link" href="/jsp_chatting_project/carrot/view/board/boardview.jsp?b_no=<%=b_no%>&replypage=<%=i %>"><%=i %></a></li>
			<%		
				}
			%>
			<%if(currentpage==lastpage) {%>
				<li class="page-item"><a class="page-link" href="/jsp_chatting_project/carrot/view/board/boardview.jsp?b_no=<%=b_no%>&replypage=<%=currentpage%>">다음</a></li>				
			<%}else{%>
				<li class="page-item"><a class="page-link" href="/jsp_chatting_project/carrot/view/board/boardview.jsp?b_no=<%=b_no%>&replypage=<%=currentpage+1%>">다음</a></li>				
			<%} %>
			</ul>
		</div>
	</div>
<%@include file="../footer.jsp" %>
</body>
</html>