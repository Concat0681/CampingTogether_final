<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>

@font-face {
  font-family: ng-extra-bold;
  src: url(../font/Nanum_Gothic/NanumGothic-ExtraBold.ttf);
}

</style>
<style>

/* 모달창 스타일 */
.modal {
  display: none; /* 모달창 기본적으로는 안 보이도록 지정 */
  position: fixed; 
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto; 
  background-color: rgba(0,0,0,0.4); /* 배경 반투명 */
  z-index: 999;
  text-align: center;
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 400px;
  height: 250px;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
.modal-login{
	width: 110px;
	height: 50px;
	border-radius: 5px;
	background-color: #AD8B73;
	border: none;
	color: #fff;
	font-family: ng-extra-bold;
	
}
.modal-login{
	margin: auto;
}
.circle-container span {
  font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 48;
  font-weight: normal;
  opacity: 0;
  transition: opacity 0.5s ease-in-out;
  
}

.circle-container span.active {
  font-weight: bold;
  opacity: 1;
  color: #E3CAA5;
}

</style>
</head>

<body>
 
 
 
<!-- 모달 창 -->
	<div id="modalVer1" class="modal">
	  <div class="modal-content">
	    <div class="closeBox">
	    <span class="close">&times;</span>
	    </div>
	    <h3>로그인이 필요한 서비스입니다.</h3>
	    <span class="five-second"></span>
		    <div class="circle-container">
			    <span class="material-symbols-outlined">circle</span>
			    <span class="material-symbols-outlined">circle</span>
			    <span class="material-symbols-outlined">circle</span>
			    <span class="material-symbols-outlined">circle</span>
			    <span class="material-symbols-outlined">circle</span>
		    </div>
	    <button type="button" class="modal-login">로그인하기</button>
	  </div>
	</div>
	
	
	
<script>
// 모달창 닫기 버튼 클릭 이벤트 
$('.close').click(function() { 
	 $('.modal').hide();
  });



// 모달창 열기 버튼 클릭 이벤트
$(document).ready(function() {
	  //모달창
	  $(".btn3").click(function() { // a태그, 버튼 아이디,클래스 입력
	    $("#modalVer1Ver1").css("display", "block"); 
	    const circles = $('.circle-container span');
		  let index = 0;

		  setInterval(function() {
		    circles.eq(index).addClass('active');
		    index++;
		    if (index >= circles.length) {
		      clearInterval();
		    }
		  }, 1000);

		  const countdown = $('.five-second');
		  let count = 5; // 5초로 설정
			
		  const interval = setInterval(function() {
		    countdown.text(count);
		    countdown.css('opacity', count / 5);
		    count--;

		    if (count < 0) {
		      clearInterval(interval);
		      location.href = '/joinFrm.do';
		      circles.removeClass('active');
		    }
		  }, 1000); //end interval , 1초로 설정
		  
		// 로그인 버튼 클릭 시 카운트다운 리셋
		  $(".modal-login").click(function() {
		    circles.removeClass('active');
		    clearInterval(interval);
		    count = 5;
		    interval = setInterval(function() {
		      countdown.text(count);
		      countdown.css('opacity', count / 5);
		      count--;

		      if (count < 0) {
		        clearInterval(interval);
		        location.href = '/joinFrm.do';
		      }
		    }, 1000);
		  });
		// 모달 창이 닫혀있을 때 카운트 리셋
		  $('#modalVer1Ver1').click(function() {
		    $('#modalVer1Ver1').css('display', 'none');
		    clearInterval(interval);
		    count = 5;
		    circles.removeClass('active');
		  });
	  
	  });

	  // 모달창 닫기
	  $(".close").click(function() {
	    $(".modal").css("display", "none");
	  });

	  // 모달창 이외의 영역 클릭 시 모달창 닫기
	  $(window).click(function(event) {
	    if (event.target == $("#modalVer1")[0]) {
	      $(".modal").css("display", "none");
	    }
	  });
});

	
$(".modal-login").click(function () {
	location.href = '/joinFrm.do';		
});

</script>
</body>
</html>