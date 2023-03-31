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
	<h1>마이페이지</h1>
	<div class="all-wrap">
		<div class= "title-wrap">
			<div class="title">
				<h2>마이페이지</h2>
			</div>
			<div class="title-list">
				<ul>
					<li>캠핑장 결제 내역</li>
					<li>캠핑용품 구매 내역</li>
					<li>포인트</li>
					<li>내가 쓴 리뷰 및 댓글</li>
					<li>개인정보 수정 및 탈퇴</li>
				</ul>
			</div>
		</div>
		
		<div class="input-div">
			<div class="input-title">
				<h2>개인정보 수정</h2>
				<p>회원님의 정보를 안전하게 보하기 위해 비밀번호를 재입력해주세요.</p>
			</div>
			<form action="/updateMypageC.do">
				<div class="input-content">
					<table border="1">
						<tr>
							<td>아이디</td>
							<td><input type="text" class="id-input" name="memberId" value="${sessionScope.m.memberName }" readonly></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" class="pw-input" name="membePw"></td>
						</tr>
					</table>
				</div>
				<input type="submit" value="확인">
			</form>
		</div>
		
	</div>
</body>
</html>