<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="../header.jsp" %>
	<%@include file="../friendbar.jsp" %>
	<%   
		//검색처리 :키워드 입력하고 검색 버튼을 눌렀을떄
		String key = request.getParameter("key");
		String keyword = request.getParameter("keyword");
		
		//페이지 처리[1검색이 있을경우 2. 검색일을경우]
		String pagenum = request.getParameter("pagenum"); // 클릭한 페이지번호
			if(pagenum==null){// 클릭한 페이지번호가 없으면 [게시판 첫화면]
			    pagenum="1"; // 고것을 1페이지로 설정
			}
		int lastrow =BoardDao.getboardDao().boardcount1(key, keyword); // 총게시물수
		int listsize=0;
		// 글 15 20 개 뽑기
		String listcount = request.getParameter("listsize");
		if(listcount==null){
		    listsize=10;
		}else{
			listsize=Integer.parseInt(listcount);
		}
		int lastpage =0; //3. 마지막 페이지
		if(lastrow % listsize == 0 ){ // 만약에 총게시물 페이지당 게시물 나머지가 없으면 
		    lastpage = lastrow / listsize;	// 총게시물 페이지당 게시물
		  
		}else{ 
		    lastpage = lastrow / listsize+1;}// 총게시물 페이지당 게시물~!~!
		
		int currentpage = Integer.parseInt(pagenum); // 현재 페이지 번호 입니다
		int startrow = (currentpage-1)*listsize;// 현재 페이지의 시작번호 입니다
		
		
		int type = 1;
		if(request.getParameter("type")!=null){
			type = Integer.parseInt(request.getParameter("type"));
		}
		
		// 등록 시 
		ArrayList<Board> b_no = BoardDao.getboardDao().b_nolist();
		ArrayList<Board> boards = BoardDao.getboardDao().boardlist(startrow, listsize, key, keyword , type);
		
	
	%>
	
	<div class="container">
		<h3> 자유 게시판 </h3>
		<br><br>
		<div class="row">
		<%if(type==1) {%>
		    <a href ="boardlist.jsp?type=<%=1%>"><button class="mr-2 ml-3 btn btn-outline-danger active"> 📝전체글 </button></a>
			<a href ="boardlist.jsp?type=<%=2%>"><button class="mr-2 ml-3 btn btn-outline-success"> 인기글 </button></a>
		<%}else if(type==2){%>
			<a href ="boardlist.jsp?type=<%=1%>"><button class="mr-2 ml-3 btn btn-outline-danger"> 전체글 </button></a>
			<a href ="boardlist.jsp?type=<%=2%>"><button class="mr-2 ml-3 btn btn-outline-success active"> 🔥인기글 </button></a>
		<%} %>	
		<div class="offset-7">
			<a href="boardwrite.jsp" ><button class="mr-2 ml-3 btn btn-outline-info ">글쓰기✏</button></a>
			<%if(type==1){%>
				<a href="boardlist.jsp?type=<%=1 %>&listsize=<%=15 %>" ><button class="btn btn-outline-info">15</button></a>
			<% }else if(type==2){%>
				<a href="boardlist.jsp?type=<%=2 %>&listsize=<%=15 %>" ><button class="btn btn-outline-info">15</button></a>
			<%} %>
			<%if(type==1){%>
				<a href="boardlist.jsp?type=<%=1 %>&listsize=<%=20 %>" ><button class="btn btn-outline-info">20</button></a>
			<% }else if(type==2){%>
				<a href="boardlist.jsp?type=<%=2 %>&listsize=<%=20 %>" ><button class="btn btn-outline-info">20</button></a>
			<%} %>
			</div>
		</div><br>
		
		
	<table class="table">
		<tr style="border-top: solid 2px navy; border-bottom: solid 1.5px navy;">
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>추천</th>
		</tr>
		<%
			for(Board board : boards){%>
			<tr>
				<td><%=board.getB_no() %></td>
				<td><a href ="boardview.jsp?b_no=<%=board.getB_no()%>"><%=board.getB_title() %></a></td>
				<td><%=board.getB_writer()%></td>
				<td><%=board.getB_date() %></td>
				<td><%=board.getB_view() %></td>
				<td><%=BoardDao.getboardDao().likecount(board.getB_no()) %></td>
			</tr>
		
		<%} %>
		
	
	</table>
	<!-- 페이징 시작 -->
	
		<div class="row">	<!-- 가로 배치 -->
			<div class="col-md-4 offset-4 my-3 d-flex justify-content-center">
			<ul class="pagination">
				
						<!-- 첫페이지에서 이전버튼 눌렀을때 첫페이지 고정  -->
					<%if(type==1) {%>
					<% if( currentpage == 1){ %>
						<% if( keyword == null ){ %>
						<li class="page-item"><a href="boardlist.jsp?type=<%=1 %>&pagenum=<%=currentpage%>" class="page-link"> 이전 </a> </li>
						<%}else{%>
						<li class="page-item"><a href="boardlist.jsp?type=1&pagenum=<%=currentpage%>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 이전 </a> </li>	
						<%} %>
					<%}else{ %>
						<li class="page-item"><a href="boardlist.jsp?type=1&pagenum=<%=currentpage-1 %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 이전 </a> </li>
					<%} %>										<!-- 현재페이지번호 -1  -->
					
						<!-- 게시물의 수만큼 페이지 번호 생성 -->
					<% for( int i = 1 ; i<=lastpage; i++){ %>
					
						<% if( keyword == null ){ %>
							<li class="page-item"><a href="boardlist.jsp?type=1&pagenum=<%=i %>" class="page-link"> <%=i %> </a> </li>
									<!-- i 클릭했을때 현재 페이지 이동 [ 클릭한 페이지번호 ] -->
							<%}else{%>
							<li class="page-item"><a href="boardlist.jsp?type=1&pagenum=<%=i %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> <%=i %> </a> </li>
							<%} %>
						
					<%} %>
					
						<!-- 마지막페이지에서 다음버튼 눌렀을때 마지막페이지 고정 -->
					<% if( currentpage == lastpage ){ %>
					<% if( keyword == null ){ %>
						<li class="page-item"><a href="boardlist.jsp?type=1&pagenum=<%=currentpage%>" class="page-link"> 다음 </a> </li>
						<%}else{%>
						<li class="page-item"><a href="boardlist.jsp?type=1&pagenum=<%=currentpage%>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 다음 </a> </li>	
						<%} %>
					<%}else{ %>
						<li class="page-item"><a href="boardlist.jsp?type=1&pagenum=<%=currentpage+1 %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 다음</a> </li>
					<%}} %>		
					<%if(type==2) {%>
					<% if( currentpage == 1){ %>
						<% if( keyword == null ){ %>
						<li class="page-item"><a href="boardlist.jsp?type=2&pagenum=<%=currentpage%>" class="page-link"> 이전 </a> </li>
						<%}else{%>
						<li class="page-item"><a href="boardlist.jsp?type=2&pagenum=<%=currentpage%>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 이전 </a> </li>	
						<%} %>
					<%}else{ %>
						<li class="page-item"><a href="boardlist.jsp?type=2&pagenum=<%=currentpage-1 %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 이전 </a> </li>
					<%} %>										<!-- 현재페이지번호 -1  -->
					
						<!-- 게시물의 수만큼 페이지 번호 생성 -->
					<% for( int i = 1 ; i<=lastpage; i++){ %>
					
						<% if( keyword == null ){ %>
							<li class="page-item"><a href="boardlist.jsp?type=2&pagenum=<%=i %>" class="page-link"> <%=i %> </a> </li>
									<!-- i 클릭했을때 현재 페이지 이동 [ 클릭한 페이지번호 ] -->
							<%}else{%>
							<li class="page-item"><a href="boardlist.jsp?type=2&pagenum=<%=i %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> <%=i %> </a> </li>
							<%} %>
						
					<%} %>
					
						<!-- 마지막페이지에서 다음버튼 눌렀을때 마지막페이지 고정 -->
					<% if( currentpage == lastpage ){ %>
					<% if( keyword == null ){ %>
						<li class="page-item"><a href="boardlist.jsp?type=2&pagenum=<%=currentpage%>" class="page-link"> 다음 </a> </li>
						<%}else{%>
						<li class="page-item"><a href="boardlist.jsp?type=2&pagenum=<%=currentpage%>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 다음 </a> </li>	
						<%} %>
					<%}else{ %>
						<li class="page-item"><a href="boardlist.jsp?type=2&pagenum=<%=currentpage+1 %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 다음</a> </li>
					<%}} %>		
				</ul>
			</div>
		</div>
	<!-- 검색 -->
	<%if(type==1){ %>
		<form action ="boardlist.jsp?type=<%=1 %>&pagenum=<%=currentpage%>"method="post" class="col-md-5 offset-3 input-group my-3">
			<select class="custom-select col-cmd-3" name="key">
				<option value="b_title">제목</option>
				<option value="b_no">번호</option>
				<option value="b_writer">작성자</option>
			</select>
			<input type="text" class="form-control" name="keyword"><!-- keyword 검색대상~! -->
			<input type="submit"class=btn-outline-info value="검색">
		</form>
	<%}else if(type==2){ %>
		<form action ="boardlist.jsp?type=<%=2 %>&pagenum=<%=currentpage%>"method="post" class="col-md-5 offset-3 input-group my-3">
			<select class="custom-select col-cmd-3" name="key">
				<option value="b_title">제목</option>
				<option value="b_no">번호</option>
				<option value="b_writer">작성자</option>
			</select>
			<input type="text" class="form-control" name="keyword"><!-- keyword 검색대상~! -->
			<input type="submit"class=btn-outline-info value="검색">
		</form>
	<%} %>
</div>
</body>
</html>