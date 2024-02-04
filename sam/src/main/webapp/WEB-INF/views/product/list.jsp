<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<script>
   		$(function(){
      		$('.p-view img').removeAttr('style');
  		 });
</script>
<style>
	.p-view img {width:300px; height:300px; }
</style>
<div class="bn bn-buy-bg">
</div>
	<h3>MealKit Buy List </h3>
	<p class="subtitle-txt">정성을담아 만들었습니다</p>


<section>
	<c:if test="${member.userId == 'admin'}"><a href="/product/register" class="btn btn-primary">상품등록</a></c:if>
	<ul id="prow" >
		<c:forEach items="${list}" var="list">
		<li class="card">
			<a href="/product/view?pno=${list.pno}" class="p-view">${list.img}</a>
			<p>상품제목: ${list.title}</p>
			<p>상품가격: ${list.price} / 세일가격: ${list.sellprice}</p>
			<p>조회수: ${list.viewcnt} / <i class="bi bi-hand-thumbs-up-fill"></i> ${list.viewlike} / <i class="bi bi-card-text"></i>후기  ${list.reviewcnt}</p>

		</li>
		</c:forEach>
	</ul>
</section>
<%@ include file="../includes/footer.jsp" %>
