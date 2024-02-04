<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
   
<style>
section { width:600px;}
</style>
<div class="bn bn-mypage-bg">
</div>
   <h3>Register</h3>
   <p class="subtitle-txt">여기는 회원가입페이지입니다</p>
<section>
   <form class="mbship"  role="form" method="post" autocomplete="off">
      <div class="mb-container">
          <ul class="join-mb">
              <li>
                  <input type="text" id="userId" name="userId" placeholder="아이디 입력" class="valueform" required>
                  <button type="button" id="idCheck" class="btn btn-default">아이디 중복 확인</button>
                  <p id="idCheckMsg">아이디 중복 확인을 하세요.</p>
              </li>
              <li><input type="password" name="userPass" placeholder="비밀번호 입력" class="valueform" required></li>
          </ul>
      </div>
      <div class="nm-container">
         <ul class="join-nm">
            <li>
               <input type="text" id="nickName" name="nickName" placeholder="닉네임 입력" class="valueform" required>
               <button type="button" id="nickNameCheck" class="btn btn-default">닉네임 중복 확인</button>
               <p class="nickNameCheckMsg">닉네임 중복 확인 해주세요.</p>
               
            </li>
            <li>
               <input type="text" name="userName" placeholder="이름 입력" class="valueform" required>
            </li>
            <li>
               <button type="submit" id="submit" disabled="disabled" class="btn btn-primary">회원가입</button>
               <button type="reset" class="btn btn-info">다시쓰기</button>
               <a href="/" class="btn btn-success">로그인</a>
            </li>
         </ul>
      </div>
   </form>
   </section>
   <script>
      $('#idCheck').click(function(){
         var query = {userId : $('#userId').val()};
         
         $.ajax({
            url : '/member/idCheck',
            type : 'post',
            data : query,
            success : function(data) { // Controller의 결과값이 data로 전달된다.
               if (data === "success") {
                  $('#idCheckMsg').text('아이디가 중복 되어 사용할 수 없습니다.');
                  $('#userId').focus();
                  $('#submit').attr('disabled', 'disabled');
               } else {
                  $('#idCheckMsg').text('사용 가능한 아이디입니다.');
                  $('#submit').removeAttr('disabled');
               }
            }
         });
         
      });
      
      
      $('#nickNameCheck').click(function(){
         var query = {nickName : $('#nickName').val()};
         
         $.ajax({
            url : '/member/nickNameCheck',
            type : 'post',
            data : query,
            success : function(data) { //Controller에서 반환된 결과값을 data가 받는다.
               if (data === "success") { //닉네임 중복
                  $('.nickNameCheckMsg').text('닉네임이 중복 되어 사용할 수 없습니다.');
                  $('#nickName').focus();
                  $('#submit').attr('disabled', 'disabled');
               } else {
                  $('.nickNameCheckMsg').text('사용 가능한 닉네임입니다.');
                  $('#submit').removeAttr('disabled');
               }
            }
         });
         
      });
   </script>

<%@ include file="../includes/footer.jsp" %>