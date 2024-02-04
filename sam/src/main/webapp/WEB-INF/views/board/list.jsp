<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="bn bn-board-bg">
</div>
	<h3>Review Event</h3>
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
</section>

<%@ include file="../includes/footer.jsp" %>