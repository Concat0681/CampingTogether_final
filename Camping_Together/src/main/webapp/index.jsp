<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  
  <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
  <!-- bxSlider CSS link -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />	
  <!-- jQuery library (served from Google) link -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- bxSlider JavaScript link -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
 
	<script>
	$(document).ready(function(){
		  $('.bxslider').bxSlider({
		    minSlides: 3,
		    maxSlides: 6,
		    slideWidth: 170,
		    slideMargin: 10
		  });
		});
	</script>
  <!-- my JavaScript and CSS file --> 
  <link href="/resources/css/default.css" rel="stylesheet"/> 	
  <link href="/resources/css/usedList.css" rel="stylesheet"/> 	
  <link href="/resources/css/main.css" rel="stylesheet"/> 
   	
<style>

.search-input-wrap{
	min-width: 1200px;
}

.top-btn{	
	display:block;
	position: fixed;
	bottom: 25px;
	right: 5px;
	z-index:9999;
	margin-right: 35px;
}

.top-btn:hover{	
	cursor: pointer;
}

   	
</style>
</head>
<body onload="init()">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/modal.jsp"/>
	<div class="wrapper wrapperBox">
		<div class="wrapper wrapperTop">
			<div class="wrapper backGround">
				<!-- <img src="/resources/image/main/back1.jpg" style="width: 100%; min-width:1400px; height:1000px;">  -->
			</div>
			<div class="inputBox" style="display: block;">
				<jsp:include page="/WEB-INF/views/camping/campingListHeader.jsp" />
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
						      <div class="caption" id="busan">부산</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/incheon.jpeg"/>
						      <div class="caption" id="incheon">인천</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/seoul.jpeg" />
						      <div class="caption" id="seoul">서울</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/sokcho.jpeg" />
						      <div class="caption" id="sokcho">속초</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/ganglueng.jpeg" />
						      <div class="caption" id="ganglueng">강릉</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/jeju.jpeg"/>
						      <div class="caption" id="jeju">제주</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/seoul.jpeg" />
						      <div class="caption" id="seoul">서울</div>
						    </li>
						    <li>
						      <img src="/resources/image/camping/sokcho.jpeg" />
						      <div class="caption" id="sokcho">속초</div>
						    </li>
						  </ul>
					</div>
				</div>
			</div>
		</div>
		<div class="wrapper wrapperMiddle-notice"> 
			<div class="notice-area">
				<div class="notice-Box"> 
					<jsp:include page="/noticeMainList.do"/>
				</div>
				<div class="notice-img">
					<a href="/noticeView.do?noticeNo=101"><img src="resources/image/main/notice-beta.png"></a>
				</div>
			</div>	
		</div>
		
				
		<div class="wrapper wrapperMiddle-tradeBox">
				<jsp:include page="/usedBoardIndex.do"/>
		</div>
		<div class="wrapper wrapperMiddle-shop">
		</div>
		<div class="wrapper wrapperBottom">
			<jsp:include page="/boardMainFoodList.do"/>
		</div>
 	
	
	
	</div>
		
	<div class="buttonBox">
		<button class="btn1" style="width : 100px; height : 30px;">버튼</button>
		<button class="btn2" style="width : 100px; height : 30px;">버튼</button>
		<button class="btn3" style="width : 100px; height : 30px;">버튼</button>
	</div>

	<div class="top-btn">
		<a class="top"ref="#"><img alt="top" src="/resources/image/top.png"></a>
	</div>
	
	<a class="mainlist" href="/boardMainFoodList.do" style="display: none;"></a>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="resources/js/camping/dateRangePicker.js"></script>

<script>

$(document).ready(function() {
    const navbarTop = $('.wrapper-top');
    const navbarBottom = $('.navbar');
    const navItem = $('.nav-item');
    const navLink = $('.nav-link');
    $(".mainlist").click();
    
	
    
    navbarTop.css('backgroundColor', 'rgba(173, 139, 115, 0.2)');
    navbarBottom.css('backgroundColor', 'rgba(173, 139, 115, 0.2)');
    navLink.css('color', '#fff');
});

$(".caption").prev().on("click", function(){
	const cityNameEN = $(this).next().attr("id");
	const cityNameKR = $(this).next().text();
	location.href="/campingList.do?cityNameEN="+cityNameEN+"&cityNameKR="+cityNameKR+"&reqPage=1&order=avgReviewRating&pplCount=0";
})


const inputBox = $('.inputBox');
function checkWindowSize() {
  if (window.innerWidth <= 800) {
    inputBox.hide();
  } else {
    inputBox.show();
  }
}
$(window).on('resize', checkWindowSize);


$(".top-btn").on("click", function() {
	window.scrollTo({ top: 0, behavior: "smooth" });  
});

</script>
</html>