<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>
	
<script>
	$(function(){
		$('#search').keyup(function(){
			var value = $(this).val().toLowerCase(); // 검색폼에 입력한 값을 얻는다.
			
			$('#row > li').filter(function(){
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
			});
		});
		/*
		$('#search').keyup(function(){
			var value = $(this).val().toLowerCase();
			
			$('#row > tr').filter(function(){
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
			});
		});
		*/
	});
</script>
	
<div class="bn bn-member-bg">
</div>
	<h3>Member LIST</h3>

<section>
	<div class="search-wrap">
		<input type="search" id="search" class="valueform" placeholder="검색어 입력">
		<a href="/member/register" class="btn btn-primary">회원등록</a>
		<a href="/admin/list" class="btn btn-primary">관리자모드</a>
	</div>
	
	<ul id="row">
		<c:forEach items="${list}" var="list">
		<li>
			<h4><a href="/member/view?userId=${list.userId}">${list.userId}</a></h4>
			<p>이름: ${list.userName}</p>
			<p>닉네임: ${list.nickName}</p>
			<p>등록일: <fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></p>
			<p>수정일: <fmt:formatDate value="${list.updateDate}" pattern="yyyy-MM-dd" /></p>
		</li>
		</c:forEach>
	</ul>
</section>
<%--
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>가입일</th>
				<th>수정일</th>
			</tr>
		</thead>
		
		<tbody id="row">
			<c:forEach items="${list}" var="list">
			<tr>
				<td><a href="/member/view?userId=${list.userId}">${list.userId}</a></td>
				<td>${list.userName}</td>
				<td>${list.nickName}</td>
				<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatDate value="${list.updateDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
--%>

<%@ include file="../includes/footer.jsp" %>
