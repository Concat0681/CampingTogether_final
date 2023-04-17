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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="/resources/css/bootStrap.css" rel="stylesheet"/>
<link href="/resources/css/default.css" rel="stylesheet"/>
<link href="/resources/css/header.css" rel="stylesheet"/> 	


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
		                <li><a href = "#">[${sessionScope.m.memberName }]</a></li>
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
	          </ul>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
    
   
</body>
</html>