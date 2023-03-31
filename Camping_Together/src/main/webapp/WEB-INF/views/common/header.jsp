<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/default.css" rel="stylesheet">
<link href="/resources/css/header.css" rel="stylesheet"/> 	
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<div class="wrapper">
    <div class="wrapper-top">
        <div class="nav-top">
            <ul class="login">
                <li><a href="/join.do">로그인</a></li>
                <li><a href="/joinfrm.do">회원가입</a></li>
            </ul>
        </div>
    </div>
    <div class="wrapper-bottom">
            <div class="nav-bottom">
                <ul class="nav-list">
                    <li class="header-logo">
                        <a href="#"> 
                            <h1 class="header-logo">LOGO </h1>
                        </a>
                    </li>
                    <li><a href="#">캠핑</a></li>
                    <li><a href="#">캠핑예약</a></li>
                    <li><a href="#">중고거래</a></li>
                    <li><a href="#">투게더shop</a></li>
                    <li><a href="#">자유게시판</a>
                        <ul class="freeboard" style="display: none;">
                            <li><a href="#">채팅</a></li>
                            <li><a href="#">캠핑팁</a></li>
                            <li><a href="#">캠핑음식</a></li>
                            
                        </ul>
                    </li>
                </ul>
            </div>

    </div>
    </div>
    <script>
    
    $(document).scroll(function() {
        const scrollTop = $(this).scrollTop();
        if (scrollTop == 0) {
          $('.wrapper-top').addClass('scroll-top');
          $('.wrapper-bottom').addClass('scroll-top');
        } else {
          $('.scroll-top').removeClass('scroll-top').addClass('wrapper-top');
          $('.scroll-top').removeClass('scroll-top').addClass('wrapper-bottom');
        }
      });
    
    $(window).on('resize', function() {
        var windowWidth = $(window).width();
        if (windowWidth < 1500) {
          $('.header-logo').css({
            'width': '120px',
            'height': '60px'
          });
          $('.login>li').css({
            'height': '40px',
            'width': '80px'
          });
          $('.nav-list>li').css({
            'height': '24px',
            'width': '150px'
          });
          $('.nav-bottom').css('width', '1200px');
          $('.freeboard').css({
            'width': '120px',
            'height': '120px'
          });
          $('.nav-list>li>a').css('font-size', '12px');
        } else {
          $('.header-logo').css({
            'width': '160px',
            'height': '80px'
          });
          $('.login>li').css({
            'height': '50px',
            'width': '100px'
          	
          });
          $('.nav-list>li').css({
            'height': '30px',
            'width': '200px'
          });
          $('.nav-bottom').css('width', '1200px');
          $('.freeboard').css({
            'width': '150px',
            'height': '150px'
          });
          $('.nav-list>li>a').css('font-size', '18px');
        }
      });
    
   
    
    
    </script>
    
    
</body>
</html>