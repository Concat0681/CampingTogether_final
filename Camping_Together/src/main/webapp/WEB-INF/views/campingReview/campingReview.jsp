<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="/resources/css/default.css" rel="stylesheet"/>
<link href="/resources/css/campingReview.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<div class="reviewWrap">
		<div class="reviewContentWrap">
			<div class="reviewHeader">
				<h2 style="text-align: center; padding-bottom: 50px;">최고에요</h2>
				<div class="allStar">별별별별별</div>
				<div>
					<div class="allReview">전체 리뷰 500</div>
					<div class="campingAnswer">캠핑장 답변 250</div>
				</div>
			</div>
			
			<h2>모달</h2>
        <button class="btn bc11 modal-open-btn" target="#test-modal">
          	모달1
        </button>
			
			<div id="test-modal" class="modal-bg">
		      <div class="modal-wrap">
		        <div class="modal-head">
		          <h2>모달 제목</h2>
		          <span class="material-icons close-icon modal-close">close</span>
		        </div>
		        <div class="modal-content">
		          <p>모달내용</p>
		          <p>모달내용</p>
		          <p>모달내용</p>
		          <p>모달내용</p>
		        </div>
		        <div class="modal-foot">
		          <button class="btn bc6 btn-pill">확인</button>
		          <button class="btn bc33 modal-close btn-pill">취소</button>
		        </div>
		      </div>
		    </div>
		    
		</div>
	</div>
</body>
</html>