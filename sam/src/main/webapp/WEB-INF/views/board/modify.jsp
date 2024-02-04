<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<style>
   .titleform:focus {
   border-color:#4caf50;
   outline:none;
}
</style>

<script src="/resources/ckeditor/ckeditor.js"></script>
   
<div class="bn bn-event-bg">
   
</div>
   <h3>Board Modify</h3>
   <p class="subtitle-txt">게시물 수정페이지입니다</p>
<section class="move">
   <form id="modifyForm" method="post">
      <ul class="list">
         <li class="lr">
         <div>
            <label>제목 : </label>
            <input type="text" name="title"  value="${view.title}" class="valueform titleform">
         </div>
         <div>         
            <label>작성자 :${member.nickName} </label>
            <input type="hidden" name="writer"  value="${view.writer}" readonly>
         </div>
         </li>
         <li>
            <label>내용</label>
            <textarea cols="50" rows="5" name="content" id="contents">${view.content}</textarea>
            <script>
               var ckeditor_config = {
                  width : '100%',
                  height : '400px',
                  resize_enaleb : false,
                  enterMode : CKEDITOR.ENTER_BR,
                  shiftEnterMode : CKEDITOR.ENTER_P,
                  filebrowserUploadUrl : "/board/ckUpload"
               };
                  
               CKEDITOR.replace("contents", ckeditor_config);
            </script>
         </li>
         <li>
            <c:if test="${member != null}"><button id="btn_modify" class="btn btn-primary">글 수정</button></c:if>
            <a href="/board/listPageSearch?num=1" class="btn btn-info">목록</a>
         </li>
      </ul>
   </form>
</section>

<script>
   $('#btn_modify').on('click', function(e) {
      if(confirm('정말 수정하시겠습니까?') == true) {
         $('#modifyForm').submit();
      }else {
         return;
      }
   });
</script>


<%@ include file="../includes/footer.jsp" %>