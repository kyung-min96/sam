<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<script src="/resources/ckeditor/ckeditor.js"></script>
<style>
</style>
<div class="bn bn-event-bg">
</div>
	<h3>${view.writer}님의 게시물</h3>
	<p class="subtitle-txt">${view.writer}님의 소중한게시글입니다.</p>

<section class="move">
	<div class="list-container">
	<ul class="list">
		<li>제목: ${view.title} / 조회수: ${view.viewCnt}</li>
		<li>작성자: ${view.writer}</li>
		<li>
			<div class="listform">${view.content}</div>
		</li>
		<li>
			<a href="/board/like?bno=${view.bno}" class="blit b-blit"><i class="bi bi-hand-thumbs-up-fill"></i> ${view.viewLike}</a>
			<a href="/board/hate?bno=${view.bno}" class="blit r-blit"><i class="bi bi-hand-thumbs-down-fill"></i> ${view.viewHate}</a>
			<a href="/board/listPageSearch?num=1" class="btn btn-primary">목록</a>
			<c:if test="${member != null}">
				
				<c:if test="${member.nickName == view.writer || member.userId == 'admin'}">
					<a href="/board/modify?bno=${view.bno}" class="btn btn-success">수정</a>
					<a href="" id="board_delete" class="btn btn-danger">삭제</a>
				</c:if>
				<c:if test="${member.nickName != view.writer && member.userId != 'admin'}">
					<a class="btn btn-success notsame">수정</a>
					<a class="btn btn-danger notsame">삭제</a>
				</c:if>
			</c:if>
			<c:if test="${member == null}">
				<a class="btn btn-success login_xbtn">수정</a>
				<a class="btn btn-danger login_xbtn">삭제</a>
			</c:if>
		</li>
	</ul>
	</div>
	<script>
		$('#board_delete').on('click', function(e) {
			if(confirm('정말 삭제하시겠습니까?') == true) {
				$('#board_delete').attr('href', '/board/delete?bno=${view.bno}');
			}else {
				return;
			}
		});
	</script>
	
	<form action="/reply/write" method="post">
		<input type="hidden" name="bno" value="${view.bno}">
		<ul class="list mt30 mt20">
			<li class="review">
			<div><label>댓글 작성자 : </label><input type="text" name="writer" value="${member.nickName}" readonly></div>
			<c:if test="${member == null}">
			<div><a class="btn btn-primary login_xbtn">댓글 작성</a></div>
			</c:if>
			<c:if test="${member != null}">
			<div><button type="submit" class="btn btn-primary">댓글 작성</button></div>
			</c:if>
			</li>
			<li><textarea rows="5" cols="50" name="content" id="contents"></textarea></li>
			<li></li>
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
		<c:forEach items="${reply}" var="reply">
		<li>${reply.writer} / <fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd" /></li>
		<li>
			<div class="re-text">${reply.content }</div>
			<div>
			<c:if test="${member == null}">
				<a class="btn btn-success login_xbtn">수정</a>
				<a class="btn btn-danger login_xbtn">삭제</a>
			</c:if>
			<c:if test="${member != null}">
				<c:if test="${member.nickName == reply.writer || member.userId == 'admin'}">
				<a href="/reply/modify?bno=${view.bno}&rno=${reply.rno}" class="btn btn-success">수정</a>
				<a href="/reply/delete?bno=${view.bno}&rno=${reply.rno}" class="btn btn-danger">삭제</a>
				</c:if>
				<c:if test="${member.nickName != reply.writer && member.userId != 'admin'}">
				<a class="btn btn-success notsame">수정</a>
				<a class="btn btn-danger notsame">삭제</a>
				</c:if>
				
			</c:if>
				
			</div>
		</li>
		</c:forEach>
	</ul>
	
	
	<%-- 댓글 끝 --%>
</section>

<%@ include file="../includes/footer.jsp" %>