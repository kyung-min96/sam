<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="bn bn-mypage-bg">
</div>
   <h3>회원 삭제</h3>
<section class="move">
   <form class="deleteform" action="/member/delete" method="post" autocomplete="off"> <%-- autocomplete 속성은 입력폼의 자동완성 활성화 여부 설정 --%>
      <ul>
         <li>
            <label for="userId">아이디 : </label>
            <input type="text" id="userId" name="userId" value="${delete.userId}" readonly>
         </li>
         <li>
            <label for="userPass">비밀번호</label>
            <input type="password" id="userPass" name="userPass" class="deform">
         </li>
         <li>
            <button type="" id="member_delete" class="btn btn-danger">회원탈퇴</button>
            <a href="/" class="btn btn-primary">HOME</a>
         </li>
      </ul>
   </form>
</section>
   <c:if test="${msg == false}">
   <p>입력한 비밀번호가 틀립니다.</p>
   </c:if>
   
   <script>
      $('#member_delete').on('click', function(e) {
         if(confirm('정말 회원탈퇴 하시겠습니까?') == true) {
            $(this).attr('type', 'submit');
         }else {
            return;
         }
      });
   </script>

<%@ include file="../includes/footer.jsp" %>