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
	<link rel="stylesheet" href="/resources/css/member.css">
	<link rel="stylesheet" href="/resources/css/board.css">
	<link rel="stylesheet" href="/resources/css/iyagi.css">
	<link rel="stylesheet" href="/resources/css/menu.css">
	<link rel="stylesheet" href="/resources/css/startup.css">
	<link rel="stylesheet" href="/resources/bxslider/jquery.bxslider.css">
	<link rel="stylesheet" href="/resources/flexslider/flexslider.css">
	<link rel="stylesheet" href="/resources/owlcarousel/css/owl.carousel.min.css">
	<script src="/resources/js/jquery-1.12.4.min.js"></script>
	<script src="/resources/js/common.js"></script> 
	<script src="/resources/bxslider/jquery.bxslider.js"></script>
	<script src="/resources/flexslider/jquery.flexslider.js"></script>
	<script src="/resources/owlcarousel/js/owl.carousel.js"></script>
	<script>
        
        $(function(){
            $('#box').bxSlider({
                auto:true,
                autoControls:true,
                autoHover:true
            });
                var width = $(window).width();
                
                if (width >= 1450) {
                    $('#carousel').bxSlider({
                        slideWidth: 400, 
                        maxSlides: 4,
                        slideMargin: 50
                    });
                } else if (width >= 1050 && width < 1450) {
                    $('#carousel').bxSlider({
                        slideWidth: 400,
                        maxSlides: 3,
                        slideMargin: 100
                    });
                } else if (width >= 600 && width < 1050) {
                    $('#carousel').bxSlider({
                        slideWidth: 285,
                        maxSlides: 2,
                        slideMargin: 15
                    });
                } else if (width < 600) {
                    $('#carousel').bxSlider({
                        slideWidth: 285,
                        maxSlides: 1,
                        slideMargin: 55
                    });
                }
        });
        $(function(){
            $('.flexslider').flexslider({
    			autoplay : true,
                animation: "slide"
            }); 
    	});
        $(function(){
            $('.owl-carousel').owlCarousel({
                loop: true,
                nav: true,
                responsiveClass: true,
                responsive: {
                    0: { items: 1 },
                    600: {
                        items: 2,
                        margin: 20
                    },
                    1050: {
                        items: 3,
                        margin: 25
                    },
                    1450: {
                        items: 4,
                        margin: 50
                    }
                }
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
                    <a href="">쌈이야기</a>
                    <ul class="sub-menu">
                        <li><a href="/sub/iyagi">쌈이란?</a></li>
                        <li><a href="">쌈종류</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">메뉴</a>
                    <ul class="sub-menu">
                        <li><a href="/sub/menu">점심 메뉴</a></li>
                        <li><a href="">저녁 메뉴</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">창업문의</a>
                    <ul class="sub-menu">
                        <li><a href="/sub/startup">창업 가이드</a></li>
                        <li><a href="">창업 문의</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">커뮤니티</a>
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
	
	
	
	
	
	
	
	
	
	