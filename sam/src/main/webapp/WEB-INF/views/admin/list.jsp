<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/tap.css">

<script>
	$(function(){
		$('#m-search').keyup(function(){
			var value = $(this).val().toLowerCase();
			
			$('#m-row > tr').filter(function(){
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
			});
		});
		$('#b-search').keyup(function(){
			var value = $(this).val().toLowerCase();
			
			$('#b-row > tr').filter(function(){
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
			});
		});
		$('#p-search').keyup(function(){
			var value = $(this).val().toLowerCase();
			
			$('#p-row > tr').filter(function(){
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
			});
		});
		$('#o-search').keyup(function(){
			var value = $(this).val().toLowerCase();
			
			$('#o-row > tr').filter(function(){
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
			});
		});
	});
</script>

<section>
	
		<div class="container">
        <input id="tabtn-1" type="radio" name="radio-set" class="tab-selector-1" checked>
        <label for="tabtn-1" class="tab-label-1">유저 관리</label>
        <input id="tabtn-2" type="radio" name="radio-set" class="tab-selector-2">
        <label for="tabtn-2" class="tab-label-2">게시판 관리</label>
        <input id="tabtn-3" type="radio" name="radio-set" class="tab-selector-3">
        <label for="tabtn-3" class="tab-label-3">상품 관리</label>
        <input id="tabtn-4" type="radio" name="radio-set" class="tab-selector-4">
        <label for="tabtn-4" class="tab-label-4">주문 관리</label>

        <!-- <div class="tabtn-bar"></div> -->

        <div class="content">
            <div class="content-1">
			<input type="search" id="m-search"  placeholder="검색어 입력" class="searchform">
			<table class="tap-list boardList">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>가입일</th>
						<th>수정일</th>
					</tr>
				</thead>
				
				<tbody id="m-row">
					<c:forEach items="${mlist}" var="member">
					<tr>
						<td><a href="/member/view?userId=${member.userId}">${member.userId}</a></td>
						<td>${member.userName}</td>
						<td>${member.nickName}</td>
						<td><fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${member.updateDate}" pattern="yyyy-MM-dd" /></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
                
            <div class="content-2">
                <input type="search" id="b-search"  placeholder="검색어 입력" class="searchform">
			<table class="tap-list boardList">
				<thead>
					<tr>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>좋아요</th>
						<th>싫어요</th>
						<th>댓글수</th>
					</tr>
				</thead>
				
				<tbody id="b-row">
					<c:forEach items="${blist}" var="board">
					<tr>
						<td><a href="/board/view?bno=${board.bno}">${board.title}</a></td>
						<td>${board.writer}</td>
						<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></td>
						<td>${board.viewCnt}</td>
						<td>${board.viewLike}</td>
						<td>${board.viewHate}</td>
						<td>${board.replyCnt}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
                
            <div class="content-3">
            
           	<input type="search" id="p-search"  placeholder="검색어 입력" class="searchform">
			<table class="tap-list boardList">
				<thead>
					<tr>
						<th>상품명</th>
						<th>상품제목</th>
						<th>가격</th>
						<th>세일가격</th>
						<th>재고</th>
						<th>조회수</th>
						<th>좋아요</th>
						<th>리뷰수</th>
					</tr>
				</thead>
			<tbody id="p-row">
					<c:forEach items="${plist}" var="product">
					<tr>
						<td><a href="/product/view?pno=${product.pno}" >${product.productid}</a></td>
						<td>${product.title}</td>
						<td>${product.price}</td>
						<td>${product.sellprice}</td>
						<td>${product.amount}</td>
						<td>${product.viewcnt}</td>
						<td>${product.viewlike}</td>
						<td>${product.reviewcnt}</td>
					</tr>
					</c:forEach>
				</tbody>
				</table>
            </div>
                
            <div class="content-4">
      		  <input type="search" id="o-search"  placeholder="검색어 입력" class="searchform">
			<table class="tap-list boardList">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문자</th>
						<th>주소</th>
						<th>상품</th>
						<th>가격</th>
						<th>개수</th>
						<th>주문일</th>
						
					</tr>
				</thead>
			<tbody id="o-row">
					<c:forEach items="${olist}" var="order">
					<tr>
						<td><a href="/product/buyview?onum=${order.onum}">${order.onum}</a></td>
						<td>${order.oname}</td>
						<td>${order.address}</td>
						<td>${order.oproductid}</td>
						<td>${order.oprice}</td>
						<td>${order.ocount}</td>
						<td><fmt:formatDate value="${order.oregdate}" pattern="yyyy-MM-dd" /></td>
						
					</tr>
					</c:forEach>
				</tbody>
				</table>
     
            </div>
           
        </div>
    </div>
	
			
</section>

<%@ include file="../includes/footer.jsp" %>