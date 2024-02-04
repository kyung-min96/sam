<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
	
<script>
    function validateForm() {
        var address = document.forms["buyForm"]["address"].value;

        if (address === "") {
            alert("배송지를 입력해주세요.");
            return false; // 폼 제출 방지
        }
       

        return true; // 폼 제출 허용
    }
    $(document).ready(function(){

        $('#num2').change(function(){
            var num1 = $('#num1').val();
            var num2 = $('#num2').val();
            var result = parseInt(num1) * parseInt(num2);
            $('#result').val(result);
        });
    });
</script>

$('#num2').change(function(){
                // val()는 선택한 입력폼의 값을 얻어온다.
                // val(값)는 선택한 입력폼에 값을 설정한다.
                var num1 = $('#num1').val();
                var num2 = $('#num2').val();
                var result = parseInt(num1) + parseInt(num2);
                $('#result').val(result);
            });

<div class="bn bn-buy-bg">
</div>
	<h3>BUY List</h3>
<p class="subtitle-txt">${view.productid}의 구매페이지입니다.</p>


<section class="move">
<form role="form" method="post" class="buyform" name="buyForm" onsubmit="return validateForm()">
		<ul class="list buylist">
			<li>
			<h4>주문자 정보</h4>
			</li>
			<li>
				<p>주문하시는분 : ${member.nickName}</p>
				<input type="hidden" name="ouserid" value="${member.userId}">
				<input type="hidden" name="oname" value="${member.userName}">
			</li>
			<li>
				<p>배송지 입력</p>
				<input type="text" name="address"  class="vform vaddr">
			</li>
			<li>
			<h4>상품 정보</h4>
			</li>
			
			<li>
				<p>상품 : ${view.productid}</p>
				<input type="hidden" name="oproductid" value="${view.productid}">
			</li>
			<li>
				<p>가격 : <span class="line">${view.price}</span> ${view.sellprice}</p>
				<input type="hidden" name="oprice" value="${view.sellprice}" id="num1">
			</li>
			<li>
				<p>구매 수량 : </p>
				<input type="number" name="ocount" class="vform vnum" value=1 id="num2">
			</li>
			<li><p>결제금액 : </p><input type="text" id="result" class="result"><p>원</p></li>
			<li>

				<button type="submit" class="btn btn-success">구매</button>
				<a href="/product/list"class="btn btn-primary">목록</a>
			</li>
		</ul>
	</form>
</section>
<%@ include file="../includes/footer.jsp" %>