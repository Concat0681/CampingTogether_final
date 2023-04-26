<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="resources/css/default.css" rel="stylesheet"/>
<link rel="stylesheet" href="resources/css/mypageS.css">
<link rel="stylesheet" href="resources/css/updateMypageC.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

</head>
<body>
		<div class= "menu-wrap">
			<div class="menu-list" ">
				<ul style="padding : 0;" index="${index }">
					<li><a href="/sellList.do?reqPage=1&memberId=${sessionScope.m.memberId }">My 캠핑장</a></li>
					<!-- <li><a href="/sellProduct.do?reqPage=1&memberId=">shop상품 판매 리스트</a></li>  -->
					<li><a href="/campingReservation.do?reqPage=1&memberId=${sessionScope.m.memberId }">캠핑장 예약 현황</a></li>
					<li><a href="/mypageS.do">판매자 정보 수정</a></li>
				</ul>
			</div>
		</div>
		
		
		
		<script>
		const index = $(".menu-list>ul").attr("index");
		$(".menu-list>ul>li").eq(index).addClass("active-tab");
		</script>
		
		
		
</body>
</html>