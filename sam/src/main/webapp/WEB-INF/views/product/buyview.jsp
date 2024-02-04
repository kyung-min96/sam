<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<div class="bn bn-mypage-bg">
</div>
	<section class="move">
	<div class="member-container m-c-p">
	<p>주문번호 : ${bview.onum}</p>
	<p>주문자 아이디 : ${bview.ouserid}</p>
	<p> 이름 : ${bview.oname}</p>
	<p> 주소 : ${bview.address}</p>
	<p> 주문 품목 : ${bview.oproductid}</p>
	<p> 가격 : ${bview.oprice}</p>
	<p> 개수 : ${bview.ocount}</p>
	<p> 주문 일자 : <fmt:formatDate value="${bview.oregdate}" pattern="yyyy-MM-dd" /></p>
	<a href="" id="order_delete" class="btn btn-danger">주문취소</a>
	</div>
<script>
		$('#order_delete').on('click', function(e) {
			if(confirm('주문 취소 하시겠습니까?') == true) {
				$('#order_delete').attr('href', '/product/cancel?onum=${bview.onum}');  
			}else {
				return;
			}
		});
	</script>
</section>
<%@ include file="../includes/footer.jsp" %>