<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="/resources/css/default.css" rel="stylesheet"/>
<link href="/resources/css/campingReview.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />



</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="reviewWrap">
		<div class="reviewContentWrap">
			<div class="reviewHeader">
				<h2 style="text-align: center; padding-bottom: 50px;">최고에요</h2>
				<div class="allStar">
					<span class="material-symbols-outlined">star</span>
					<span class="material-symbols-outlined">star</span>
					<span class="material-symbols-outlined">star</span>
					<span class="material-symbols-outlined">star</span>
					<span class="material-symbols-outlined">star</span>
				</div>
				<div>
					<div class="allReview">전체 리뷰 500</div>
					<div class="campingAnswer">캠핑장 답변 250</div>
				</div>
			</div>
			
	        <button class="btn1 modal-open-btn" target="#test-modal">
	          	리뷰작성
	        </button>
		    
		    <div id="test-modal" class="modal-bg" style="z-index: 1000;">
			  <div class="modal-wrap">
			    <div class="modal-head">
			      <h2>리뷰 작성</h2>
			      <span class="material-icons close-icon modal-close">close</span>
			    </div>
			    <div class="modal-content">
			    	<form action="/campingReviewWrite.do" method="post" enctype="multipart/form-data">
				      	<table>
				      		<tr>
				      			<td colspan="2">만족하셨나요?</td>
				      		</tr>
				      		<tr>
							    <td>
							      <div class="star-wrap star-wrap2">
							        <span class="material-symbols-outlined">star</span>
							        <span class="material-symbols-outlined">star</span>
							        <span class="material-symbols-outlined">star</span>
							        <span class="material-symbols-outlined">star</span>
							        <span class="material-symbols-outlined">star</span>
							        <div class="star-on">
							          <div class="star-wrap star-on-wrap">
							            <span class="material-symbols-outlined">star</span>
							            <span class="material-symbols-outlined">star</span>
							            <span class="material-symbols-outlined">star</span>
							            <span class="material-symbols-outlined">star</span>
							            <span class="material-symbols-outlined">star</span>
							          </div>
							        </div>
							      </div>
							    </td>
							    <td>
							      <input type="text" name="campingReviewRating">
							      <button type="button" id="starBtn">별점입력</button>
							    </td>
							</tr>
				      		<tr>
				      			<td>제목</td>
				      			<td>
				      				<input type="text" name="campingReviewTitle">
				      			</td>
				      		</tr>
				      		<tr>
				      			<td colspan="2">
				      				<textarea name="campingReviewContent"></textarea>
				      			</td>
				      		</tr>
				      		<tr>
				      			<td>사진 등록</td>
				      			<td>
				      				<input type="file" onchange="loadImg(this);" name="campingReviewFilepath" multiple>
				      			</td>
				      		</tr>
				      		<tr>
				      			<td>
				      				<div id="img-viewer">
		        			
		                    		</div>
				      			</td>
				      		</tr>
				      	</table>
				    </div>
				    <div class="modal-foot">
				      <button class="reviewBtn bc1">등록</button>
				      <button class="btn bc1 modal-close">취소</button>
				    </div>
			    </form>
			  </div>
			</div>
			
			<div style="margin-top: 50px;">
		        <ul class="posting-comment">
		          <li>
		            <span class="material-icons">account_box</span>
		          </li>
		          <li>
		            <p class="comment-info">
		              <span>리뷰제목</span>
		            </p>
		            <p>
		            	<span style="padding-left: 10px;">별별별별별</span>
		            </p>
		            <p class="comment-content">댓글내용댓글내용댓글내용</p>
		            <p class="comment-link">
		              <a href="#">수정</a>
		              <a href="#">삭제</a>
		              <a href="#">답글달기</a>
		            </p>
		            
		            <!-- 캐러셀 컨테이너 정의 -->
					<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="width: 500px;">
					  <!-- 캐러셀 내용 정의 -->
					  <div class="carousel-inner" style="width: 500px; height: 500px;">
					    <div class="carousel-item active">
					      <img src="resources/upload/campingRoom/도라.jfif" class="d-block w-100" alt="..." style="width: 500px;">
					    </div>
					    <div class="carousel-item">
					      <img src="resources/upload/campingRoom/도라.jfif" class="d-block w-100" alt="..." style="width: 500px;">
					    </div>
					    <div class="carousel-item">
					      <img src="resources/upload/campingRoom/도라.jfif" class="d-block w-100" alt="..." style="width: 500px;">
					    </div>
					  </div>
					  
					  <!-- 이전/다음 버튼 정의 -->
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">이전</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">다음</span>
					  </button>
					</div>
		            
		          </li>
		        </ul>
      		</div>
      		
      		
		    
		</div>
	</div>
	
	<script>
	$(document).ready(function() {
		  $('.modal-open-btn').click(function() {
		    $('#test-modal').css('display', 'flex');
		  });

		  $('.modal-close').click(function() {
		    $('#test-modal').css('display', 'none');
		  });
		});
	</script>
	
	<script>
		$(function() {
		  $("#starBtn").on("click",function() {
		    const campingReviewRating = $("[name=campingReviewRating]").val();
		    const starScore = campingReviewRating * 30;
		    $(".star-on-wrap").css("width", starScore + "px");
		  });
		});
	</script>
	
	<script>
		function loadImg(input) {
		  // 기존에 있는 이미지 삭제
		  $('#img-viewer img').remove();
		  
		  if (input.files && input.files.length > 0) {
		    for (let i = 0; i < input.files.length; i++) {
		      const reader = new FileReader();
		      reader.readAsDataURL(input.files[i]);
		      reader.onload = function(e) {
		        $("<img>").attr("src", e.target.result).attr("id", "img-" + i).appendTo("#img-viewer"); // 이미지를 보여줄 DOM 엘리먼트에 추가
		      }
		    }
		  }
		}
	</script>
	
	<script>
		$(".reviewBtn").on("click",function(){
			const campingReviewRating = $("[name=campingReviewRating]").val();
			const campingReviewTitle = $("[name=campingReviewTitle]").val();
			const campingReviewContent = $("[name=campingReviewContent]").val();
			if(!(campingReviewRating != "" && campingReviewTitle != "" && campingReviewContent != "")){
				alert("입력란을 모두 확인해주세요.")
				return false;
			}
		});
	</script>
</body>
</html>