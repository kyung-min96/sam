<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
	
	<script src="/resources/ckeditor/ckeditor.js"></script>

<div class="bn bn-event-bg">
</div>
	<h3>Reivew Register</h3>
	<p class="subtitle-txt">게시물 등록페이지입니다</p>

<section class="move">
	<form role="form" method="post">
		<ul class="list">
			<li class="lr">
				<div>
				<label>제목</label>
				<input type="text" name="title" class="valueform titleform">
				</div>
				<div>
				<label>작성자 :${member.nickName} </label>
				<input type="hidden" name="writer" value="${member.nickName}"readonly>
				</div>
			</li>
			<li>
				<label>내용</label>
				<textarea rows="5" cols="50" name="content" id="contents"></textarea>
				<script>
					var ckeditor_config = {
						width : '100%',
						height : '400px',
						resize_enaleb : false,
						enterMode : CKEDITOR.ENTER_BR,
						shiftEnterMode : CKEDITOR.ENTER_P,
						filebrowserUploadUrl : "/board/ckUpload"
						//Cotroller에서 filebrowserUploadUrl에 작성한 요청 URL을 매핑하여 이미지 파일 업로드를 구현한다.
					};
					   
					CKEDITOR.replace("contents", ckeditor_config);
				</script>
			</li>
			<li>
				<c:if test="${member != null}"><button type="submit"class="btn btn-success">글 작성</button></c:if>
				<a href="/board/listPageSearch?num=1"class="btn btn-primary">목록</a>
			</li>
		</ul>
	</form>
</section>
<%@ include file="../includes/footer.jsp" %>

<%--
※ CKEditor4 스프링 프로젝트에 적용

1. CKEditor 패키지 선택 및 다운로드
	https://ckeditor.com/cke4/builder에서 CKEditor 패키지를 선택한 후 다운로드 한다.
	
	① 패키지 선택
		Choose preset에서 패키지를 선택한다.
		★ 패키지를 선택할 때 반응형 웹 구현 시 basic 선택을 권장한다.
		★ 패키지를 선택할 때 반응형 웹 구현 배제 시 standard를 권장한다.
		
	② 플러그인 및 스킨 선택
		Select your plugins and skin 오른쪽 있는 Available plugins 에서 플러그인을 선택한 후 [ < ] 버튼을 클릭하여 Selected plugins 항목에 추가한다.
		★ 패키지를 선택할 때 basic 선택했을 때 추가할 플러그인
			CKAwesome(폰트어썸), Font Size and Family(글자 서체/크기), Color Button(글자 색상/마커)
			Image(이미지 업로드), File Browser(파일 업로드), Table, Table Resizer(Row and Column), Youtube Plugin
		★ 패키지를 선택할 때 basic 선택했을 때 제거할 플러그인: About CKEditor
		※ CKAwesome 플러그인을 사용할 경우 폰트어썸 4.7.0 버전의 font-awesome.min.css 파일을 html 문서에 추가해야한다.
		
	③ 스킨 선택
		Available skins에서 스킨을 선택한다.
		★ Monno-Lisa 선택을 권장한다.
		
	④ 언어 선택: Finalize and download 오른쪽에 있는 Languages to chose 에서 Korean을 선택한 후 [ < ] 버튼을 클릭하여 Your editor’s language 항목에 추가한다.
	
	⑤ 동의한 후 [Download CKEditor 4.21.0] 버튼을 클릭하여 다운로드한다.
	
	
2. 스프링 프로젝트에 적용

	① ckeditor 폴더를 스프링 프로젝트에 추가	
		다운로드 받은 파일을 압축 해제한 후 ckeditor 폴더를 스프링 프로젝트의 src/main/webapp/resources 폴더에 붙여넣는다.
	
	② 글쓰기와 글수정에 CKEditor 적용
		- write.jsp와 modify.jsp 파일 상단에 <script src="/resources/ckeditor/ckeditor.js"></script> 코드를 추가한다.
		- 텍스트에리어 요소에 id="contents" 코드를 추가한다.
			<textarea rows="5" cols="50" name="content" id="contents"></textarea>
		- 텍스트에리어 요소 아래에 다음 스크립트 코드를 추가한다.
			<script>
				var ckeditor_config = {
					width : '100%',
					height : '350px',
					resize_enaleb : false,
					enterMode : CKEDITOR.ENTER_BR,
					shiftEnterMode : CKEDITOR.ENTER_P,
					filebrowserUploadUrl : "/board/ckUpload"
					//Cotroller에서 filebrowserUploadUrl에 작성한 요청 URL을 매핑하여 이미지 파일 업로드를 구현한다.
				};
				   
				CKEDITOR.replace("contents", ckeditor_config);
			</script>


※ CKEditor4 이미지 업로드 구현

1. pom.xml 에 CKEditor4 이미지 업로드 구현에 관련된 API 주입
	① commons-lang3 아파치에서 만든 문자열 비교를 쉽게 해줄수 있는 API 이다.
	② commons-fileupload 파일 업로드 API이다.
	③ gson은 json을 쉽게 쓸수 있도록 만든API이다.
	
	<dependency>
		<groupId>org.apache.commons</groupId>
		<artifactId>commons-lang3</artifactId>
		<version>3.4</version>
	</dependency>
           
	<dependency>
		<groupId>commons-fileupload</groupId>
		<artifactId>commons-fileupload</artifactId>
		<version>1.3.3</version>
	</dependency>
       
	<dependency>
		<groupId>com.google.code.gson</groupId>
		<artifactId>gson</artifactId>
		<version>2.8.5</version>
	</dependency>
	
	
2. CKEditor4 이미지 업로드 구현에 관련된 빈 등록
	servlet-context.xml 파일에 아래 코드를 추가한다.
	
	<beans:bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
		<!-- 최대 업로드 가능한 바이트 크기(바이트 단위), -1은 제한이 없음을 의미 -->
		<beans:property name="maxUploadSize" value="10485760" />
		<!-- 업로드 요청을 변환할 때 사용할 문자 인코딩 방식 -->
		<beans:property name="defaultEncoding" value="utf-8" />
	</beans:bean>
	
	
3. BoardController 에 CKEditor4 이미지 업로드 구현에 관련된 코드 추가
	※ CKEditor 4.8.0부터 파일 전달 방식이 json으로 바뀌었다.

	@ResponseBody
	@RequestMapping(value = "/ckUpload")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject jsonObject = new JsonObject(); //json을 사용하기 객체 생성한다. 
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) { //파일이 존재하면
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) { //파일 사이즈가 0 보다 크고 파일 이름이 있으면(파일 이름이 null 또는 공백이 아니면)
				if(file.getContentType().toLowerCase().startsWith("image/")) { //startsWith()로 image인 것만 등록한다.
				    try{
						//파일명, 파일 크기, 저장 경로를 얻는다. ★/resources/images/board 폴더를 생성한다.
			            String fileName = file.getOriginalFilename(); //파일명을 얻는다.
			            byte[] bytes = file.getBytes(); //파일 크기를 얻는다.
			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/board"); //저장 경로를 얻는다.
			            System.out.println("uploadPath:"+uploadPath);

						//저장 경로가 없으면 저장 경로를 생성한다.
			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) { uploadFile.mkdir(); }
			            
			            //덮어쓰기 방지를 위해 랜덤한 파일명 형식을 생성한 후 저장 경로에 추가한다.
			            String uuidFileName = UUID.randomUUID().toString(); //랜덤한 값을 얻는다.
			            uploadPath = uploadPath + "/" + uuidFileName + fileName; //랜덤한 값을 파일명 앞에 추가한다.
			            //resources/images/board/uuid 랜덤값+파일명 형식으로 파일 저장 경로를 설정한다.
			            
			            out = new FileOutputStream(new File(uploadPath)); //파일 저장 경로를 설정한 File 객체를 쓰기(출력) 위한 객체로 생성한다.
			            out.write(bytes); //File 객체를 기록한다.
			            
			            //클라이언트에서 Servlet으로 요청이 들어오면 요청(Request)을 파악한 후 응답(Response)한다.
			            //File 객체를 요청한 곳으로 전달하기 위해 PrintWriter 객체를 얻고 파일 URL을 만든다.
			            printWriter = resp.getWriter(); //ServletResponse의 getWriter() 메소드를 호출하여 java.io의 PrintWriter 객체를 얻는다.
			            String fileUrl = req.getContextPath() + "/resources/images/board/" + uuidFileName + fileName; //파일 URL을 만든다.
			            System.out.println("fileUrl :" + fileUrl);
			            
			            //객체를 Json 객체로 변경하여 클라이언트로 전달한다.
			            JsonObject json = new JsonObject(); //JsonObject는 객체(주로 String)를 Json객체로 바꾸거나 Json객체를 새로 생성한다.
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			 
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally { //메모리 자원관리를 위해 다쓴 객체는 close()로 닫아준다.
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}
			}
		}
	}
	

※ CKEditor4 한글 글씨체 추가

1. CKEditor4 압축 파일을 해제하면 ckeditor 폴더에 ckeditor.js 파일이 있다.
2. ckeditor.js 파일을 에디터로 열고 [Ctrl]+[F]를 눌러 CKEDITOR.config.font_names를 찾는다.
3. CKEDITOR.config.font_names의 값으로 서체를 추가하면 된다.
	서체를 추가하는 형식은 다음과 같다.
	- 맑은 고딕/맑은 고딕,Malgun Gothic,sans-serif;
	- 나눔명조/나눔명조,NanumMyeongjo,serif;
	
	서체를 추가한 코드는 아래와 같다.
	CKEDITOR.config.font_names="맑은 고딕/맑은 고딕,Malgun Gothic,sans-serif;나눔고딕/나눔고딕,NanumGothic,ng,sans-serif;나눔스퀘어/나눔스퀘어,NanumSquare,sans-serif;나눔명조/나눔명조,NanumMyeongjo,serif;Arial/Arial, Helvetica, sans-serif;Comic Sans MS/Comic Sans MS, cursive;Courier New/Courier New, Courier, monospace;Georgia/Georgia, serif;Lucida Sans Unicode/Lucida Sans Unicode, Lucida Grande, sans-serif;Tahoma/Tahoma, Geneva, sans-serif;Times New Roman/Times New Roman, Times, serif;Trebuchet MS/Trebuchet MS, Helvetica, sans-serif;Verdana/Verdana, Geneva, sans-serif";
--%>