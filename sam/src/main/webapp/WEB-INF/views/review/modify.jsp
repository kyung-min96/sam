<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<script src="/resources/ckeditor/ckeditor.js"></script>
	
<div class="bn bn-board-bg">
	<h2>Review MODIFY</h2>
</div>

<section>
	<form action="/review/modify" method="post">
		<input type="hidden" name="pno" value="${review.pno}">
		<input type="hidden" name="rno" value="${review.rno}">
		
		<ul class="list">
			<li><label>댓글 작성자</label> <input type="text" name="writer" readonly="readonly" value="${review.writer}"></li>
			<li><label>댓글 내용</label> <textarea rows="5" cols="50" name="content" id="contents">${review.content}</textarea></li>
			<li><button type="submit" class="btn btn-primary">댓글 수정</button></li>
		</ul>
	</form>
</section>

<script>
	var ckeditor_config = {
		width : '100%',
		height : '100px',
		resize_enaleb : false,
		enterMode : CKEDITOR.ENTER_BR,
		shiftEnterMode : CKEDITOR.ENTER_P,
		filebrowserUploadUrl : "/board/ckUpload"
		//Cotroller에서 filebrowserUploadUrl에 작성한 요청 URL을 매핑하여 이미지 파일 업로드를 구현한다.
	};
	   
	CKEDITOR.replace("contents", ckeditor_config);
</script>

<%@ include file="../includes/footer.jsp" %>