<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/adminMenu.css">
</head>
<body>
	<div class="menu-div">
		<div class="menu-title">
			<h2>관리자 메뉴</h2>
		</div>
	</div>
		<div class="menu-list">
			<ul index="${index }">
				<li><a href="/shopProductList.do?reqPage=1&memberId=${sessionScope.m.memberId }">SHOP 판매 상품</a></li>
				<li><a href="/allMember.do?reqPage=1">전체 회원</a></li>
				<li><a href="/blackMemberList.do?reqPage=1">신고 회원</a></li>
				<li><a href="/adminMember.do?memberId=${sessionScope.m.memberId }">관리자 정보</a></li>
			</ul>
		</div>
	
		<script>
			const index = $(".menu-list>ul").attr("index");
			console.log(index);
			$(".menu-list>ul>li").eq(index).addClass("active-tab");
		</script>
	
	
</body>
</html>