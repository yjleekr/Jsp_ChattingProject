<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="/carrot/view/header.jsp" %>
	<%@include file="/carrot/view/friendbar.jsp" %>
	<br>
	<div class="container">
	<form action="../../controller/boardwritecontroller.jsp" method="post" enctype="application/x-www-form-urlencoded">
		<input type="hidden" value="<%=logininfo.getM_no() %>" name="m_no">
		<div class="form-group">
			<label for="title">Title :</label>
			<input type="text" class="form-control" placeholder="title" id="title" name="b_title">
		</div>
		<div class="form-group">
			<label for="content">Content :</label>
			<textarea class="form-control" rows="5" id="summernote" name="b_content"></textarea>
		</div>
			<button type="submit" class="btn btn-primary">등록</button>
		<br>
	</form> 
</div>
<script>
	$('#summernote').summernote({
	placeholder:'내용을 작성해주세요',
	tabsize:2, //탭 두번
	height:400
    });
</script>
<%@include file="../footer.jsp" %>
</body>
</html>
