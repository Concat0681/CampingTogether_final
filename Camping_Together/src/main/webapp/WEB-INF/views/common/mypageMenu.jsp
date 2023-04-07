<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="/resources/css/default.css" rel="stylesheet"/>
<link rel="stylesheet" href="resources/css/mypageC.css">
</head>
<body>
		<div class= "title-wrap">
			<div class="title-list">
				<ul>
					<li><a href="/cmapingPayList.do?reqPage=1&memberNo=${sessionScope.m.memberNo }">캠핑장 결제 내역</a></li>
					<li><a href="#">캠핑용품 구매 내역</a></li>
					<li><a href="#">포인트</a></li>
					<li><a href="#">내가 쓴 리뷰</a></li>
					<li><a href="#">내가 쓴 댓글</a></li>
					<li><a href="#">개인정보 수정 및 탈퇴</a></li>
				</ul>
			</div>
		</div>
</body>
</html>