<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<script src="/resources/ckeditor/ckeditor.js"></script>
	
<div class="bn bn-mypage-bg">
</div>
	<h3>Member VIEW</h3>

<section>
	<div class="member-container">
	<ul class="member-wrap">
		<li>아이디: ${view.userId}</li>
		<li>이름: ${view.userName}</li>
		<li>닉네임: ${view.nickName}</li>
		<li>가입일: <fmt:formatDate value="${view.regDate}" pattern="yyyy-MM-dd" /></li>
		<li>수정일: <fmt:formatDate value="${view.updateDate}" pattern="yyyy-MM-dd" /></li>
		<li>
			<c:if test="${member != null}">
			<c:if test="${member.userId == 'admin'}">
			<a href="/admin/list" class="btn btn-info">관리자모드</a>
			</c:if>
			<c:if test="${member.userId != 'admin'}">
			<a href="/product/buylist" class="btn btn-info">주문내역</a>
			</c:if>
			<a href="/member/modify?userId=${view.userId}" class="btn btn-success">정보수정</a>
			<a href="/member/delete?userId=${view.userId}" class="btn btn-danger">회원탈퇴</a>
			</c:if>
		</li>
	</ul>
	</div>
</section>
<%@ include file="../includes/footer.jsp" %>