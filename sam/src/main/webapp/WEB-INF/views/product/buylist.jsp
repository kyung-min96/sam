<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../includes/header.jsp" %>
<div class="bn bn-mypage-bg">
</div>
	<h3>주문 내역</h3>

<body>
<section class="move">
	
	
	<table class="boardList">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문자</th>
				<th>배송지</th>
				<th>상품</th>
				<th>가격</th>
				<th>개수</th>
				<th>주문일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${olist}" var="olist">
			<c:if test="${olist.ouserid eq member.userId}">
                    <tr>
                    	<td><a href="/product/buyview?onum=${olist.onum}">${olist.onum}</a></td>
                        <td>${olist.oname}</td>
                        <td>${olist.address}</td>
                        <td>${olist.oproductid}</td>
                        <td>${olist.oprice}</td>
                        <td>${olist.ocount}</td>
                        <td><fmt:formatDate value="${olist.oregdate}" pattern="yyyy-MM-dd" /></td>
                    </tr>
                </c:if>
			</c:forEach>
		</tbody>
	</table>
</section>


<%@ include file="../includes/footer.jsp" %>