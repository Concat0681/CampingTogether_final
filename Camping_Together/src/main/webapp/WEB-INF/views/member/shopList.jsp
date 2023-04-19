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
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<div class="menu-div">
		<div class="menu-title">
			<h2>Admin Menu</h2>
		</div>
	</div>
	
	<div class="content-wrap">
		<div class="menu-list">
			<ul>
				<li><a href="#">SHOP 판매 상품</a></li>
				<li><a href="#">전체 회원</a></li>
				<li><a href="#">신고 회원</a></li>
			</ul>
		</div>
		
		<div class="admin-content">
			<div class="admin-title">
				<h3>SHOP 판매 상품</h3>
			</div>
		</div>
	
	</div>
</body>
</html>