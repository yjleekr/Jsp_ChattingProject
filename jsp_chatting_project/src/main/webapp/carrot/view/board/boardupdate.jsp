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
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		Board board = BoardDao.getboardDao().getboard(b_no);
	%>
	<br>
	
	<div class="container">
	<form action="/jsp_chatting_project/carrot/controller/boardupdatecontroller.jsp" method="POST" enctype="multipart/form-data">
		<div class="form-group">
		<input type="hidden" name="b_no" value="<%=b_no%>">
			<label for="title">Title : </label>
			<input type="text" class="form-control" id="title" name="title" value="<%=board.getB_title() %>">
		</div>
		<div class="form-group">
			<label for="content">Content :</label>
			<textarea class="form-control" rows="5" id="summernote" name="content">
			<%= board.getB_contents()%>
			</textarea>
		</div>
		<div class ="text-right">
			<button type="submit" class="btn btn-primary">수정 완료</button>
		</div>
	</form>
	
</div>

  <script>
    $('#summernote').summernote({
      placeholder:'<%=board.getB_contents() %>',
      tabsize:2, //탭 두번
      height:400
    });
  </script>


<%@include file="../footer.jsp" %>

</body>
</html>