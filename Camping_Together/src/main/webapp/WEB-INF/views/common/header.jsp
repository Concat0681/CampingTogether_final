<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<c:choose>
		<c:when test="${empty sessionScope.m }"> 
		<div class="wrapper-top">
        <div class="nav-top">
            <ul class="login">
                <li><a href="/loginFrm.do">로그인</a></li>
                <li><a href="/joinFrm.do">회원가입</a></li>
            </ul>
        </div>
    </div>
    </c:when>
		<c:otherwise>
					<div class="wrapper-top">
        <div class="nav-top">
            <ul class="login">
                <li><a href="#">쪽지함</a></li>
                <li><a href = "/mypageC.do">[${sessionScope.m.memberName }]</a></li>
                <li><a href="/logout.do">로그아웃</a></li>
            </ul>
        </div>
    </div>
		</c:otherwise>
	</c:choose>
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
                    <li><a href="/usedBoardList.do">중고거래</a></li>
                    <li><a href="#">투게더shop</a></li>
                    <li><a href="#">자유게시판</a>
                        <ul class="freeboard" style="display: none;">
                            <li><a href="/allMemberChat.do">채팅</a></li>
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
        if (windowWidth > 1500) {
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
          $('.nav-list>li>a').css('font-size', '18px');
          
          $('.wrapper-top').css({
      		'display' : 'flex'
      	});
          $('.wrapper-bottom').css({
      		'display' : 'flex'
      	});
        }else if(windowWidth < 800){
        	$('.wrapper-top').css({
        		'display' : 'none'
        	});
            $('.wrapper-bottom').css({
        		'display' : 'none'
        	});
        	
        }else {
        	$('.wrapper-top').css({
        		'display' : 'flex'
        	});
            $('.wrapper-bottom').css({
        		'display' : 'flex'
        	});
        	
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
            'width': '150px'
          });
          $('.nav-bottom').css('width', '900px');
          $('.freeboard').css({
            'width': '150px',
            'height': '150px'
          });
          $('.nav-list>li>a').css('font-size', '14px');
        }
      });
    	
    $(document).ready(function(){
        $("li:has(ul)").hover(
            function(){
                $(this).children("ul").slideDown(250);
            },
            function(){
                $(this).children("ul").slideUp(250);
            }
        );
    });
    </script>
    
    
</body>
</html>