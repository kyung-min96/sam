<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/login.css">

<section>
	<div class="login-box">
   <form action="/member/login" method="post" autocomplete="off">
		<div class="user-box">
            <input type="text" name="userId" required>
            <label>Username</label>
          </div>
          <div class="user-box">
            <input type="password" name="userPass" required>
            <label>Password</label>
          </div>
          <div class="login-btn-wrap">
          <button type="submit" href="#">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            Login
          </button>
          <button type="reset" href="#">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
           ReSet
          </button>
        </div>
	</form>
   
<c:if test="${member != null}">
	<script>
	alert('${member.nickName}님 반가워요');
	location.href="/";
	</script>
</c:if>

<c:if test="${msg == false}">
<script>
	alert('로그인에 실패했습니다. 아이디 또는 비밀번호를 다시 입력하세요.');
</script>
</c:if>
</div>
</section>

<%@ include file="../includes/footer.jsp" %>
<style>
footer {
width:100%;
position: absolute; bottom:0; left:50%;
transform:translate(-50%,0);
}
</style>