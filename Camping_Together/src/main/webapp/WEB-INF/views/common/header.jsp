<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="/resources/css/bootStrap.css" rel="stylesheet"/>
<link href="/resources/css/default.css" rel="stylesheet"/>
<link href="/resources/css/header.css" rel="stylesheet"/> 	
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<body>	
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="/insertMessage.do" method="post">
      <div class="modal-body">
         <div class="mb-3">
            <label for="recipient-name" class="col-form-label">보내는 사람:</label>
            <input type="text" class="form-control" id="recipient-name" value="${sessionScope.m.memberId }" name="sender" readonly>
          </div>	
        	
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">받는 사람:</label>
            <input type="text" class="form-control" id="receiver-name" placeholder="아이디를 적어주세요" name="receiver">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">제목:</label>
            <input type="text" class="form-control" id="message-title" name="messageTitle">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">내용:</label>
            <textarea class="form-control" id="message-text" name="messageContent"></textarea>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Send message</button>
      </div>
        </form>
      
    </div>
  </div>
</div>
<div class="headerBox">
	<c:choose>
		<c:when test="${empty sessionScope.m }"> 
		<div class="wrapper-top" style="background-color: rgba(173, 139, 115, 1);" >
        <div class="nav-top" style="color: #fff;">
            <ul class="login">
            	<li><a class="nav-linkT" href="/noticeList.do?reqPage=1">공지사항</a></li>
                <li><a class="nav-linkT" href="/joinFrm.do">로그인</a></li>
                <li><a class="nav-linkT" href="/joinFrm.do">회원가입</a></li>
            </ul>
        </div>
    </div>
    </c:when>
		<c:otherwise>
	<div class="wrapper-top" style="background-color: rgba(173, 139, 115, 1);">
        <div class="nav-top" style="color: #fff;">
            <ul class="login">
                <!-- <li><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">쪽지보내기</button></li> -->
                <li><a href="/noticeList.do?reqPage=1">공지사항</a></li>
                <li><a href = "/messageMain.do">쪽지함</a></li>
                <c:choose>
                	<c:when test="${sessionScope.m.memberGrade eq 'c' }">
		                <li><a href = "/cmapingPayList.do?reqPage=1&memberNo=${sessionScope.m.memberNo }">[${sessionScope.m.memberName }]</a></li>
               			 <li><a href="/shopWishList.do?reqPage=1&memberId=${sessionScope.m.memberId }">장바구니</a></li>
                	</c:when>
                	<c:when test="${sessionScope.m.memberGrade eq 's' }">
		                <li><a href = "/sellList.do?reqPage=1&memberId=${sessionScope.m.memberId }">[${sessionScope.m.memberName }]</a></li>
                	</c:when>
                	<c:when test="${sessionScope.m.memberGrade eq 'a' }">
		                <li><a href = "/shopProductList.do?reqPage=1&memberId=${sessionScope.m.memberId }">[${sessionScope.m.memberName }]</a></li>
                	</c:when>
                </c:choose>
                <li><a href="/logout.do">로그아웃</a></li>
            </ul>
        </div>
    </div>
		</c:otherwise>
	</c:choose>
    <nav class="wrapper-bottom navbar navbar-expand-lg" style="background-color: rgba(255, 255, 255, 1);">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="/"><img src="/resources/image/logo/logo250x80.png" width="250px" height="80px"></a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link" href="/campingListMain.do">캠핑</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">캠핑예약</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/usedBoardList.do?reqPage=1">중고장터</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/shopMainList.do">투게더SHOP</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            	자유게시판
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="/boardFoodList.do?reqPage=1">캠핑 레시피</a></li>
	            <li><a class="dropdown-item" href="#">캠핑 Tip</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="allMemberChatFrm.do">채팅</a></li>
	            <li><a class="dropdown-item" href="/inquiryList.do?reqPage=1">문의사항</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
</div>

<!-- 로그인이 필요한 모달 창 -->
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
<!--  헤더 스크립트 -->
<script>
	
const navbarTop = document.querySelector('.wrapper-top');
const navbarBottom = document.querySelector('.navbar');
const navLinkt = document.querySelectorAll('.nav-linkT');
const navLink =  document.querySelectorAll('.nav-link');
	
	
	
	function init() {
		document.addEventListener('load', function() {
			navbarTop.style.backgroundColor = 'rgba(173, 139, 115, 0.2)';
			navbarBottom.style.backgroundColor = 'rgba(173, 139, 115, 0.2)';
			for(let i=0; i < navLink.length; i++){
	        	  navLink[i].style = 'color';
	        	  navLink[i].style.color = 'rgb(255, 255, 255)';
	        		
			}
			
		});
		
		
		
		  window.addEventListener('scroll', function() {
		      // 현재 스크롤 위치를 가져옴
		      var scrollTop = window.pageYOffset || document.documentElement.scrollTop;

		      // 현재 스크롤 위치가 300px 이상인 경우에만 실행
		      if (scrollTop >= 300) {
		        // 네비바의 배경색을 1초 동안 투명도 1로 변경
		        navbarTop.style.transition = 'background-color 1s';
		        navbarTop.style.backgroundColor = 'rgba(255, 255, 255, 1)';
		        
		      } else {
		        // 네비바의 배경색을 원래대로 복원
		        navbarTop.style.transition = 'background-color 1s';
		        navbarTop.style.backgroundColor = 'rgba(173, 139, 115, 0.2)';
		       
		      }
		      if (scrollTop >= 300) {
		          // 네비바의 배경색을 1초 동안 투명도 1로 변경
		          navbarBottom.style.transition = 'background-color 1s';
		          navbarBottom.style.backgroundColor = 'rgba(255, 255, 255, 1)';
		        } else {
		          // 네비바의 배경색을 원래대로 복원
		          navbarBottom.style.transition = 'background-color 1s';
		          navbarBottom.style.backgroundColor = 'rgba(173, 139, 115, 0.2)';
		          
		        }
		      if (scrollTop >= 300) {
		          //네비바의 컨텐츠 글자색을 흰색으로
		          for(let i=0; i < navLink.length; i++){
		        	  navLink[i].style = 'color';
		        	  navLink[i].style.color = '#AD8B73';
		          }
		          
		        } else {
		          // 네비바의 컨텐츠 글자색을 원래대로 복원
		          for(let i=0; i < navLink.length; i++){
		        	  navLink[i].style = 'color';
		        	  navLink[i].style.color = 'rgb(255, 255, 255)';
		          }
		      
		        }
		      if (scrollTop >= 300) {
		          //네비바의 컨텐츠 글자색을 흰색으로
		          for(let i=0; i < navLink.length; i++){
		        	  navLink[i].style = 'color';
		        	  navLink[i].style.color = '#AD8B73';
		          }
		          
		        } else {
		          // 네비바의 컨텐츠 글자색을 원래대로 복원
		          for(let i=0; i < navLink.length; i++){
		        	  navLink[i].style = 'color';
		        	  navLink[i].style.color = 'rgb(255, 255, 255)';
		          }
		      
		        }
		        if (scrollTop >= 300) {
			          //네비바의 컨텐츠 글자색을 흰색으로
			          for(let i=0; i < navLinkt.length; i++){
			        	  navLinkt[i].style = 'color';
			        	  navLinkt[i].style.color = '#AD8B73';
			          }
			          
			        } else {
			          // 네비바의 컨텐츠 글자색을 원래대로 복원
			          for(let i=0; i < navLinkt.length; i++){
			        	  navLinkt[i].style = 'color';
			        	  navLinkt[i].style.color = 'rgb(255, 255, 255)';
			          }
			      
			        }
		        
		      
		      
		    });
	}
	
 	
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('li:has(ul)').forEach(function(element) {
            element.addEventListener('mouseenter', function() {
                this.querySelector('ul').style.display = 'block';
            });
            element.addEventListener('mouseleave', function() {
                this.querySelector('ul').style.display = 'none';
            });
        });
    });

    
    
    
    </script>
<!-- 모달 스크립트 -->
<script>
 // 모달창 닫기 버튼 클릭 이벤트 
    $('.close').click(function() { 
    	 $('.modal').hide();
      });



    // 모달창 열기 버튼 클릭 이벤트
    $(document).ready(function() {
    	  //모달창
    	  $(".loginBtn").click(function() { // a태그, 버튼 아이디,클래스 입력
    	    $("#modalVer1").css("display", "block"); 
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
    		  $('#modalVer1').click(function() {
    		    $('#modalVer1').css('display', 'none');
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