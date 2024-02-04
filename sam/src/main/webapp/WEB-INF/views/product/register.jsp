<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

	
<script src="/resources/ckeditor/ckeditor.js"></script>
	
<div class="bn bn-buy-bg">
</div>
	<h3>Product register</h3>
	<p class="subtitle-txt">상품 등록페이지입니다.</p>

<section class="move">
	<form role="form" method="post">
		<div class="rg-container">
         <ul class="pd-list">
			<li>
				<label>상품명</label>
				<input type="text" name="productid"class="rgform">
			</li>
			<li>
				<label>상품제목</label>
				<input type="text" name="title" class="rgform">
			</li>
			<li>
				<label>상품가격</label>
				<input type="text" name="price" class="rgform">
			</li>
			<li>
				<label>판매가격</label>
				<input type="text" name="sellprice" class="rgform">
			</li>
			<li>
				<label>재고</label>
				<input type="text" name="amount" class="rgform">
			</li>
			<li>
				<p>썸네일에 사용될 이미지 입니다.</p>
				<textarea rows="5" cols="50" name="img" id="img"></textarea>
				<script>
					var ckeditor_config = {
						width : '100%',
						height : '200px',
						resize_enaleb : false,
						enterMode : CKEDITOR.ENTER_BR,
						shiftEnterMode : CKEDITOR.ENTER_P,
						filebrowserUploadUrl : "/board/ckUpload"
						//Cotroller에서 filebrowserUploadUrl에 작성한 요청 URL을 매핑하여 이미지 파일 업로드를 구현한다.
					};
					CKEDITOR.replace("img", ckeditor_config);
				</script>
			</li>
			
			<li class="move">
				<label>상품 내용</label>
				<textarea rows="5" cols="50" name="content" id="contents"></textarea>
				<script>
					var ckeditor_config = {
						width : '100%',
						height : '800px',
						resize_enaleb : false,
						enterMode : CKEDITOR.ENTER_BR,
						shiftEnterMode : CKEDITOR.ENTER_P,
						filebrowserUploadUrl : "/board/ckUpload"
						//Cotroller에서 filebrowserUploadUrl에 작성한 요청 URL을 매핑하여 이미지 파일 업로드를 구현한다.
					};
					CKEDITOR.replace("contents", ckeditor_config);
				</script>
			</li>
			
			<li>
				<c:if test="${member != null}"><button type="submit" class="btn btn-success">상품 등록</button></c:if>
				<a href="/product/list"class="btn btn-primary">목록</a>
			</li>
		</ul>
		</div>
	</form>
</section>
<%@ include file="../includes/footer.jsp" %>