<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<script src="/resources/ckeditor/ckeditor.js"></script>

<div class="bn bn-buy-bg">
</div>
	<h3>Product Info</h3>
	<p class="subtitle-txt">${view.productid}의 상세설명입니다.</p>

<section class="move">
	
	<ul class="list view sumnail">
		<li>${view.img}</li>
		<li>Product Info <span>_ 제품정보</span></li>
		<li>${view.productid} / 
			<span>관심고객수: ${view.viewcnt}</span>
			<a href="/product/like?pno=${view.pno}" class="blit b-blit"><i class="bi bi-hand-thumbs-up-fill"></i> ${view.viewlike}</a>
		</li>		
		<li>${view.title}</li>
		<li><div></div></li>
		<li>가격: ${view.price} / 세일가 : ${view.sellprice}</li>
		<li>
			<a href="/product/like?pno=${view.pno}" class="blit b-blit"><i class="bi bi-hand-thumbs-up-fill"></i> ${view.viewlike}</a>
			<c:if test="${member != null}">
			<a href="/product/buy?pno=${view.pno}" class="btn btn-info">구매</a>
			</c:if>
			<c:if test="${member == null}">
			<a class="btn btn-info login_xbtn">구매</a>
			</c:if>
			<a href="/product/list" class="btn btn-primary">목록</a>
			<c:if test="${member.userId == 'admin'}">
			<a href="/product/modify?pno=${view.pno}" class="btn btn-success">수정</a>
			<a href="" id="board_delete" class="btn btn-danger">삭제</a>
			</c:if>
		</li>
	</ul>
	<script>
		$('#board_delete').on('click', function(e) {
			if(confirm('정말 삭제하시겠습니까?') == true) {
				$('#board_delete').attr('href', '/product/delete?pno=${view.pno}');
			}else {
				return;
			}
		});
	</script>
	<script>
   		$(function(){
      		$('.view img').removeAttr('style');
  		 });
	</script>
	
	<style>
   		.sumnail img {width:500px; height:350px; }
   		.review-row { margin-top:100px; padding-top:50px; font-size:36px; font-family:'Roboto Slab', serif;
   		border-top:2px dashed #343541;}
   		.view-content { display :flex; justify-content:center;}
   	
	</style>
	<div class="view-content view" >${view.content}</div>
	<div class="review-row">Buy Review ( ${view.reviewcnt} )</div>
	<form action="/review/write" method="post">
		<input type="hidden" name="pno" value="${view.pno}">
		<ul class="list mt30 mt20">
			<li class="review">
				<div><label>리뷰 작성자 : </label> <input type="text" name="writer" value="${member.nickName}" readonly></div>
				<c:if test="${member == null}">
				<div><a class="btn btn-primary login_xbtn">댓글 작성</a></div>
				</c:if>

				<c:if test="${member != null}">
				<div><button type="submit" class="btn btn-primary">댓글 작성</button></div>
				</c:if>
				
			</li>
			<li><textarea rows="5" cols="50" name="content" id="contents"></textarea></li>
			
		</ul>
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
	</form>
	<ul class="re-list mt30">
		<c:forEach items="${review}" var="review">
		<li>${review.writer} / <fmt:formatDate value="${review.regdate}" pattern="yyyy-MM-dd" /></li>
		<li>
			<div class="re-text">${review.content}</div>
			<c:if test="${member == null}">
			<div>
				<a class="btn btn-success login_xbtn">수정</a>
				<a class="btn btn-danger login_xbtn">삭제</a>
			</div>
			</c:if>
			
			<c:if test="${member != null}">
			<c:if test="${member.nickName == review.writer || member.userId == 'admin'}">
			<div>
				<a href="/review/modify?pno=${view.pno}&rno=${review.rno}" class="btn btn-success">수정</a>
				<a href="/review/delete?pno=${view.pno}&rno=${review.rno}" class="btn btn-danger">삭제</a>
			</div>
			</c:if>
			<c:if test="${member.nickName != review.writer && member.userId != 'admin'}">
			<div>
				<a class="btn btn-success notsame">수정</a>
				<a class="btn btn-danger notsame">삭제</a>
			</div>
			</c:if>
			
			</c:if>
			
			
		</li>
		</c:forEach>
	</ul>
	
	
	<%-- 댓글 끝 --%>
</section>

<%@ include file="../includes/footer.jsp" %>