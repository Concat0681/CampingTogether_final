<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a{
		font-family: ng-bold;
	}

</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="resources/css/default.css" rel="stylesheet"/>
<link rel="stylesheet" href="resources/css/mypageC.css">
<link rel="stylesheet" href="resources/css/updateMypageC.css">
</head>
<body>
		<div class= "title-wrap">
			<div class="title-list">
				<ul style="padding : 0;" index="${index }">
					<li><a href="/cmapingPayList.do?reqPage=1&memberNo=${sessionScope.m.memberNo }">캠핑장 결제 내역</a></li>
					<li><a href="/productPayList.do?reqPage=1&memberId=${sessionScope.m.memberId }">투게더shop 구매 내역</a></li>
					<li><a href="/myRiview.do?reqPage=1&memberId=${sessionScope.m.memberId }">내가 쓴 캠핑장 리뷰</a></li>
					<li><a href="#">찜한 캠핑장</a></li>
					<li><a href="/usedWishList.do?reqPage=1&memberId=${sessionScope.m.memberId }">찜한 중고상품</a></li>
					<li><a href="/mypageC.do">개인정보 수정 및 탈퇴</a></li>
				</ul>
			</div>
		</div>
		
		
		
		<script>
		const index = $(".title-list>ul").attr("index");
		$(".title-list>ul>li").eq(index).addClass("active-tab");
		</script>
		
		
</body>
</html>



