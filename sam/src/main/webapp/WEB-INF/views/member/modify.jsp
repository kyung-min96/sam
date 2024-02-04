<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>


   
<div class="bn bn-mypage-bg">
</div>
   <h3>Member MODIFY</h3>

<section class="move">
   <form role="form" action="/member/modify" method="post" autocomplete="off">
   <div class="md-container">
      <ul class="md-wrap">
         <li>
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" value="${modify.userId}" class="mdform" readonly>
         </li>
         <li>
            <label for="userPass">비밀번호</label>
            <input type="password" id="userPass" name="userPass" class="mdform" >
         </li>
         <li>
            <label for="userName">이 름</label>
            <input type="text" id="userName" name="userName" value="${modify.userName}" class="mdform" >
         </li>
         <li>
            <label for="nickName">닉네임</label>
            <input type="text" id="nickName" name="nickName" value="${modify.nickName}" class="mdform" readonly>
         </li>
         <li>
            <button type="" id="member_modify" class="btn btn-primary">수정</button>
            <button type="reset" class="btn btn-info">다시쓰기</button>
            <a href="/" class="btn btn-default">HOME</a>
         </li>
      </ul>
   </div>
   </form>
</section>
   
   <script>
      $('#member_modify').on('click', function(e) {
         if(confirm('정말 회원수정 하시겠습니까?') == true) {
            $(this).attr('type', 'submit');
         }else {
            return;
         }
      });
   </script>

<%@ include file="../includes/footer.jsp" %>