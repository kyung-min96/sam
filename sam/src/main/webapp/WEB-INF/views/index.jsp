<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 날짜 포멧 형식을 변경하기 위해 사용한다. --%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SSAM</title>
	<link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	<script src="https://kit.fontawesome.com/11390cb447.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/common.css">
	<link rel="stylesheet" href="/resources/css/index.css">
	<link rel="stylesheet" href="/resources/fullpage/jquery.fullPage.css">
	<script src="/resources/js/jquery-1.12.4.min.js"></script>
	<script src="/resources/js/common.js"></script> 
	<script src="/resources/fullpage/jquery.fullPage.min.js"></script>
	<script>
	$(function(){
	    $('.fullpage-plugin').fullpage({
	    });
	});
	</script>
</head>
<body>
	<header>
		<nav>
		<a href="/" class="logo"><img src="/resources/imgs/logo.png" alt="logo" class="lg-im"> S<span>)</span>AM</a>
		<label class="trigger">
                <input type="checkbox">
                <svg viewBox="0 0 32 32">
                  <path class="line line-top-bottom" d="M27 10 13 10C10.8 10 9 8.2 9 6 9 3.5 10.8 2 13 2 15.2 2 17 3.8 17 6L17 26C17 28.2 18.8 30 21 30 23.2 30 25 28.2 25 26 25 23.8 23.2 22 21 22L7 22"></path>
                  <path class="line" d="M7 16 27 16"></path>
                </svg>
              </label>	
			<ul id="main-menu">
                <li>
                    <a href="#">쌈이야기</a>
                    <ul class="sub-menu">
                        <li><a href="/sub/iyagi">쌈이란?</a></li>
                        <li><a href="">쌈종류</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">메뉴</a>
                    <ul class="sub-menu">
                        <li><a href="/sub/menu">점심 메뉴</a></li>
                        <li><a href="">저녁 메뉴</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">창업문의</a>
                    <ul class="sub-menu">
                        <li><a href="/sub/startup">창업 가이드</a></li>
                        <li><a href="">창업 문의</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">커뮤니티</a>
                    <ul class="sub-menu">
                        <li><a href="/board/listPageSearch?num=1">음식점후기</a></li>
                        <li><a href="/product/list">밀키트판매</a></li>
                    </ul>                
                    </li>
            </ul>	
			<div>
				<c:if test="${member == null}">
				
				<ul id="dt" class="top-menu">
                <li><a href="/member/login">로그인</a></li>
                <li><a href="/member/register">회원가입</a></li>
	            </ul>
	            <ul id="mb" class="top-menu">
	                <li><a href="/member/login"><i class="bi bi-person"></i></a></li>
	                <li><a href="/member/register""><i class="bi bi-person-add"></i></a></li>
	            </ul>
				</c:if>
				
				<c:if test="${member != null}">
				<ul id="dt" class="top-menu">
					<c:if test="${member.userId == 'admin'}">
					<li><a href="/admin/list">관리자모드</a></li>
					</c:if>
            	    <li><a href="/member/view?userId=${member.userId}">마이페이지</a></li>
              		 <li><a href="/member/logout">로그아웃</a></li>
	            </ul>
	            <ul id="mb" class="top-menu">
	           		<c:if test="${member.userId == 'admin'}">
					<li><a href="/member/list"><i class="bi bi-person-lines-fill"></i></a></li>
					</c:if>
	                <li><a href="/member/view?userId=${member.userId}"><i class="bi bi-person-gear"></i></a></li>
               		<li><a href="/member/logout"><i class="bi bi-box-arrow-right"></i></a></li>
	            </ul>
				
				</c:if>
			</div>
		</nav>
	</header>
	
	<div id="nav-drop"></div>
	

    <div class="fullpage-plugin">
        <div class="section page1" id="bubble">
            <section>
    
                <div class="page1-txt">
                    <p>복을 싸다.
                    <br>건강을 싸다.
                    <br>소망과 행복을 싸다.</p>
                </div>
                <div class="page1-sbtxt">
                    <p>우리 선인들은 산과 들에서 나는 채소들이 가진 고유의 쓴맛,매운맛,떫은맛,신맛의 향미에다양한 음식을 조화시켜 먹음으로써 풀 한 포기, 나무 순 하나하나에건강과 행복에 대한 소망의 마음을 담았습니다.</P>
                    <P>'쌈밥'은 채소 가운데 잎이 커서 밥을 싸기 편한 것을 쌈의 재료로 하고 채소 위에 밥을 놓은 후 쌈장을 얹어 손으로 동그랗게 모아 싸서 먹는 우리나라 고유의 음식입니다.
                    원조쌈밥집에서 다양한 쌈채소로 건강한 쌈밥을 즐겨보세요.</p>
                </div>
                <canvas id="spirit"></canvas>
            </section>
        </div>
        
        <div class="section page2">
            <section>
                <ul class="article">
                    <li class="at at1">
                        <div class="page2-txt">
                        <h4>원조쌈밥집의 시작</h4>
                        <p class="fade">1993년 4월 고객들의 건강과 맛을 모두 만족 시켜 드리기 위한 설렘으로 원조쌈밥집이 첫 발을 내디뎠습니다.
                            20여 가지의 신선한 각종 쌈과 우연히 발견하게 된 원조쌈밥집의 대패삼겹살로 건강과 행복을 모두 느껴 보시기를 바랍니다.</p>
                        <a href="" class="btn btn-primary">더보기</a>
                        </div>
                        <div class="at-bg at1-bg"></div>
                    </li>
                    <li class="at at2">
                        <div class="page2-txt">
                        <h4>건강하고 푸짐한 쌈채소</h4>
                        <p>쌈을 싸먹는 것은 건강과 소망을 담은 음식이란 의미를 갖는 우리 선인들의 문화입니다.
                            원조쌈밥집은 신선한 쌈을 푸짐하게 드실 수 있도록 특별히 개발한 쌈채반에 담아 쌈을 제공합니다.</p>
                        <a href="" class="btn btn-primary">더보기</a>
                        </div>
                        <div class="at-bg at2-bg"></div>
                    </li>
                    <li class="at at3">
                        <div class="page2-txt">
                        <h4>원조쌈밥집의 메뉴</h4>
                        <p>가장 대표적인 쌈밥정식, 차돌박이와 함께 먹는 차돌쌈밥정식 그리고 원조쌈밥집에서만 맛 볼수 있는 특제 쌈장인 해물쌈장까지 즐기실 수 있습니다.</p>
                        <a href="" class="btn btn-primary">더보기</a>
                        </div>
                        <div class="at-bg at3-bg"></div>
                    </li>
                </ul>
            </section>
        </div>

        <div class="section page3">
            <div class="slide page3-bg1">
                <section>
                    <h4>자연에서 찾는 <span>즐거움</span></h4>
                    <h5><span>S</span>INCE 1993</h5>
                    <p>20여가지 신선한 쌈 채소로 즐기는 건강한 한 상!
                        원조쌈밥집은 건강하고 푸짐한 쌈밥을 드리기 위해
                        항상 노력하고 있습니다.</p>
                </section>
            </div>
            <div class="slide page3-bg2">
                <section>
                    <h4>균형잡힌 <span>건강한식단</span></h4>
                    <h5><span>S</span>INCE 1993</h5>
                    <p>건강에 좋은 것이 자연에도 좋습니다.인간과 자연을 함께 사랑하는
                        원조쌈밥집이 권하는 건강밥상．
                    </p>
                </section>
            </div>
            <div class="slide page3-bg3">
                <section>
                <h4>맛있는 <span>음식</span></h4>
                <h5><span>S</span>INCE 1993</h5>
                <p>20 여 가지 신선한 쌈과 대패삼겹살 다양한
                    반찬이 제공되는 푸짐한 한 상!</p>
                </section>
            </div>
        </div>
    </div>

</body>

</html>
<script src="/resources/js/rAF.js"></script>
<script src="/resources/js/spirit.js"></script>