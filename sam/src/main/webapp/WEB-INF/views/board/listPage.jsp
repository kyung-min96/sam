<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<div class="bn bn-board-bg">
	<h2>Board LIST</h2>
</div>

<section>
	<a href="/board/register" class="btn btn-primary">글작성</a>
	<table class="boardList">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>좋음/싫음</th>
				<th>댓글수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.bno}</td>
				<td><a href="/board/view?bno=${list.bno}">${list.title}</a></td>
				<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
				<%-- ${list.regDate} 를 yyyy-MM-dd 포멧으로 출력한다. --%>
				<td>${list.writer}</td>
				<td>${list.viewCnt}</td>
				<td><i class="bi bi-hand-thumbs-up-fill"></i> ${list.viewLike} / <i class="bi bi-hand-thumbs-down-fill"></i> ${list.viewHate}</td>
				<td>${list.replyCnt}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	

	<%-- Page 객체 없이 구현
	<div>
		<c:if test="${prev}">
			<span>[ <a href="/board/listPage?num=${startPageNum - 1}">이전</a> ]</span>
		</c:if>
	
		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span>
				<c:if test="${select != num}">
					<a href="/board/listPage?num=${num}">${num}</a>
				</c:if>
			</span>  
	 
			<c:if test="${select == num}">
				<b>${num}</b>
			</c:if>
		</c:forEach>
	
		<c:if test="${next}">
			<span>[ <a href="/board/listPage?num=${endPageNum + 1}">다음</a> ]</span>
		</c:if>
	</div>
	--%>
	
	<%-- Page 객체를 사용한 구현 --%>
	<ul class="pagenation">
	<%-- 이전 버튼 --%>
	<c:if test="${page.prev}">
		<li><a href="/board/listPage?num=${page.startPageNum - 1}" class="prev">이전</a></li>
	</c:if>

	<%-- 페이지 번호 버튼 --%>
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<li>
			<c:if test="${select != num}">
				<a href="/board/listPage?num=${num}">${num}</a>
			</c:if>
			<c:if test="${select == num}">
				<a href="" class="active"><strong>${num}</strong></a>
			</c:if>
		</li>
	</c:forEach>

	<c:if test="${page.next}">
		<li><a href="/board/listPage?num=${page.endPageNum + 1}" class="next">다음</a></li>
	</c:if>
	</ul>
</section>
	
<%@ include file="../includes/footer.jsp" %>