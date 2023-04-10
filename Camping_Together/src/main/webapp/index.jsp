<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

    <script>
      $(document).ready(function(){
        $(".slider").bxSlider();
      });
    </script>
<link href="/resources/css/default.css" rel="stylesheet"/> 	
<link href="/resources/css/main.css" rel="stylesheet"/> 	
</head>
<body onload="init()">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="wrapper">
		<div class="wrapperTop">
			<div class="backGround">
				<img src="/resources/image/main/back1.jpg" style="width: 100%; height:1000px;">
			</div>
			<div class="inputBox" style="display: block;">
				<form action="#" method="post">
					<div class="row g-2">
					  <div class="col-md">
					    <div class="main">
					      <select class="mainSelect">
					        <option value="1">지역</option>
					        <option value="2">캠핑장</option>
					      </select>
					      
					    </div>
					  </div>
					  
					  <div class="col-md">
					    <div class="form-floating">
					      <input type="text" class="mainSearch" placeholder=" 선택한 분류에 맞게 지역 & 캠핑장을 입력해주세요">
					    </div>
					  </div>
					  
					</div>
				</form>
			</div>
			<div class="best-campingSite">
				<div class="capmingListBox">
					<h3>Camping Site</h3>	
					<div class="capmingSilder">
					<!-- 
						<ul class="bxslider">
						  <li><img src="/resources/image/camping/busan.jpeg" /> 부산</li>
						  <li><img src="/resources/image/camping/incheon.jpeg"/> 인천</li>
						  <li><img src="/resources/image/camping/seoul.jpeg" /> 서울</li>
						  <li><img src="/resources/image/camping/sokcho.jpeg" /> 속초</li>
						  <li><img src="/resources/image/camping/ganglueng.jpeg" />강릉</li>
						  <li><img src="/resources/image/camping/jeju.jpeg"/> 제주</li>
						  <li><img src="/resources/image/camping/seoul.jpeg" /> 서울</li>
						  <li><img src="/resources/image/camping/sokcho.jpeg" /> 속초</li>
						</ul>
					-->
						  <ul class="bxslider">
						    <li>
						      <img src="/resources/image/camping/busan.jpeg" />
						      <div class="caption">부산</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/incheon.jpeg"/>
						      <div class="caption">인천</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/seoul.jpeg" />
						      <div class="caption">서울</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/sokcho.jpeg" />
						      <div class="caption">속초</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/ganglueng.jpeg" />
						      <div class="caption">강릉</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/jeju.jpeg"/>
						      <div class="caption">제주</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/seoul.jpeg" />
						      <div class="caption">서울</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/sokcho.jpeg" />
						      <div class="caption">속초</div>
						    </li>
						  </ul>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="wrapperMiddle-notice"> 
			<div class="notice-area">
				<div class="notice-Box"> 
					공지사항 <span><a href="/noticeList.do?reqPage=1">+</a></span> 
					<ul class="notice-list">
						<li> 공지사항1</li>
						<li> 공지사항2</li>
						<li> 공지사항3</li>
					</ul>
				</div>
				<div class="notice-img">
					<a href="/noticeView.do?noticeNo=91"><img src="resources/image/main/notice-beta.png"></a>
				</div>
			</div>	
		</div>
		<div class="wrapperMiddle-tradeBox">
			<div class="wrapperMiddle-tradeContent">
				<div class="tradeContentBoarder">
					<div>
					<img src="/resources/image/camping/seoul.jpeg" style="width:200px;"></div>
				</div>
			</div>
			<div class="wrapperMiddle-tradeContent">
				<div class="tradeContentBoarder">
					중고거래 컨텐츠2
					<div class="tradeImg"></div>
				</div>
			</div>
			<div class="wrapperMiddle-tradeContent">
				<div class="tradeContentBoarder">
					중고거래 컨텐츠3
					<div class="tradeImg"></div>
				</div>
			</div>
		</div>
		<div class="wrapperMiddle-shop"></div>
		<div class="wrapperBottom"></div>
 	
	
	<button class="btn1" style="width : 100px; height : 30px;">버튼</button>
	<button class="btn2" style="width : 100px; height : 30px;">버튼</button>
	<button class="btn3" style="width : 100px; height : 30px;">버튼</button>

	<a href="/usedBoardList.do">중고장터</a>

	
	<a href="/noticeList.do?reqPage=1">공지사항</a>
	

</body>
<script>

$(document).ready(function() {
    const navbarTop = $('.wrapper-top');
    const navbarBottom = $('.navbar');
    const navItem = $('.nav-item');
    const navLink = $('.nav-link');

    navbarTop.css('backgroundColor', 'rgba(173, 139, 115, 0.2)');
    navbarBottom.css('backgroundColor', 'rgba(173, 139, 115, 0.2)');
});


$('.bxslider').bxSlider({
    minSlides: 3,
    maxSlides: 6,
    slideWidth: 170,
    slideMargin: 10
  });

const inputBox = $('.inputBox');

function checkWindowSize() {
  if (window.innerWidth <= 800) {
    inputBox.hide();
  } else {
    inputBox.show();
  }
}

$(window).on('resize', checkWindowSize);


</script>
</html>