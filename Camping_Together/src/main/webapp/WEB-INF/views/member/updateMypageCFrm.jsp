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
<link rel="stylesheet" href="resources/css/updateMypageC.css">
</head>
<body>
	<div class="all-wrap">
		<div class= "title-wrap">
			<div class="title-list">
				<ul>
					<li><a href="#">캠핑장 결제 내역</a></li>
					<li><a href="#">캠핑용품 구매 내역</a></li>
					<li><a href="#">포인트</a></li>
					<li><a href="#">내가 쓴 리뷰</a></li>
					<li><a href="#">내가 쓴 댓글</a></li>
					<li><a href="#">개인정보 수정 및 탈퇴</a></li>
				</ul>
			</div>
		</div>
		
		<div class="input-div">
			<div class="input-title">
				<h2>개인정보 수정</h2>
			</div>
			

			
			<form action="/updateMypageC.do">
			<div class="mypage-content">
			
				<div class="image-div">
					<div class="image">
						<div class="img"></div>
					<div class="image-btn">
						<button type="button" calss="update">수정</button>
						<button type="button" calss="delete">삭제</button>
					</div>
					</div>
				</div>
				
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" class="input" name="memberId" value="${sessionScope.m.memberId }" readonly></td>
						</tr>
						<tr>
							<td>회원구분</td>
							<td><input type="text" class="input" name="memberGrade" value="${sessionScope.m.memberGrade }"></td>
						</tr>
						<tr>
							<td>새 비밀번호</td>
							<td><input type="password" class="input" name="memberPw" placeholder="새 비밀번호를 입력하세요"></td>
						</tr>
						<tr>
							<td>새 비밀번호</td>
							<td><input type="password" class="input" name="memberPwRe" placeholder="비밀번호를 재입력하세요"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" class="input" name="memberName" value="${sessionScope.m.memberName }" readonly></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" class="input" name="memberAddr" value="${sessionScope.m.memberAddr }"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" class="input" name="memberEmail" value="${sessionScope.m.memberEmail }" readonly></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" class="input" name="memberPhone" value="${sessionScope.m.memberPhone}"></td>
						</tr>
					</table>
			</div>
			<div class="btn-div">
				<input type="submit" value="수정하기" id="update-btn">
				<button type="button" class="delBtn" id="delete-btn">회원탈퇴</button>
			</div>

		</form>
	</div>
	

</body>
</html>