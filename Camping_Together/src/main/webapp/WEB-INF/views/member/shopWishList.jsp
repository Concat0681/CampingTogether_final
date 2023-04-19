<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/shop/shopWishList.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="cart-wrap">
			<div class="cart-header">
				<h2 style="padding-bottom: 30px;">WISH LIST</h2>
			</div>
			<div class="cart-mid">
				<c:forEach items="${shopList }" var="s">
					<div class="shop-wrap">
						<div class="shop">
							<div class="shop-img">
								<img src="/resources/image/usedBoard/noImg.gif">
							</div>
							<div class="shop-title">
								<span>ㅎㅇㅎㅇ</span>
							</div>
							<div class="zero"></div>
							<div class="shop-bottom">
								<div class="shop-price">
									<span>10000</span><span>원</span>
								</div>
								<span class="shop-buy">결제</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="pagenation">
	        	${navi }
        	</div>
		</div>
</body>
</html>