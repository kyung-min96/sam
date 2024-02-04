<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<script src="/resources/ckeditor/ckeditor.js"></script>
	
<div class="bn bn-buy-bg">
</div>
	<h3>Product Modify</h3>
	<p class="subtitle-txt">상품 수정 페이지입니다.</p>
<section class="move">
	<form id="PmodifyForm" method="post">
		<div class="rg-container">
		<ul class="pd-list">
	
			<li>
				<label>상품명</label>
				<input type="text" name="productid"  value= "${view.productid}" class="rgform">
			</li>
			<li>
				<label>상품제목</label>
				<input type="text" name="title"  value= "${view.title}"class="rgform">
			</li>
			<li>
				<label>상품가격</label>
				<input type="text" name="price"  value= "${view.price}" class="rgform">
			</li>
			<li>
				<label>세일가격</label>
				<input type="text" name="sellprice"  value= "${view.sellprice}" class="rgform">
			</li>
			<li>
				<label>재고</label>
				<input type="text" name="amount"  value= "${view.amount}" class="rgform">
			</li>
			<li>
				<label>썸네일에 사용될 이미지입니다  400X300규격으로 작성해주세요</label>
				<textarea rows="5" cols="50" name="img" id="img">${view.img} </textarea>
				<script>
					var ckeditor_config = {
						width : '100%',
						height : '400px',
						resize_enaleb : false,
						enterMode : CKEDITOR.ENTER_BR,
						shiftEnterMode : CKEDITOR.ENTER_P,
						filebrowserUploadUrl : "/board/ckUpload"
						//Cotroller에서 filebrowserUploadUrl에 작성한 요청 URL을 매핑하여 이미지 파일 업로드를 구현한다.
					};
					CKEDITOR.replace("img", ckeditor_config);
				</script>
			</li>
			<li>
				<label>내용 : </label>
				<textarea cols="50" rows="5" name="content" id="contents">${view.content}</textarea>
				<script>
					var ckeditor_config = {
						width : '100%',
						height : '400px',
						resize_enaleb : false,
						enterMode : CKEDITOR.ENTER_BR,
						shiftEnterMode : CKEDITOR.ENTER_P,
						filebrowserUploadUrl : "/board/ckUpload"
					};
					   
					CKEDITOR.replace("contents", ckeditor_config);
				</script>
			</li>
			<li>
				<button id="btn_pmodify" class="btn btn-primary">글 수정</button>
				<a href="/product/list" class="btn btn-info">목록</a>
			</li>
		</ul>
		</div>
	</form>
</section>

<script>
	$('#btn_pmodify').on('click', function(e) {
		if(confirm('정말 수정하시겠습니까?') == true) {
			$('#PmodifyForm').submit();
			alert('상품수정이 완료되었습니다');
		}else {
			return;
		}
	});
</script>


<%@ include file="../includes/footer.jsp" %>