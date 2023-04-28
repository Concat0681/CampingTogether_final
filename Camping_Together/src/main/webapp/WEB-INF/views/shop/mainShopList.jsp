<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/shop/mainShopList.css">
</head>
<body>
<div class="shop-wrapOnTop">
	<div class="shop-wrap">
		<div class="shop-title"><a href="/shopMainList.do">캠핑물품 인기순위</a></div>
		<div class="shop-list">
		<c:forEach items="${campingList }" var="c" varStatus="i">
	 		<div class="shop-box" onclick="viewShop(${c.shopNo},'${sessionScope.m.memberId}');">
				<div class="shop-photo">
					<img src="resources/upload/shop/${c.shopPhotoList[0].filepath}">
					<c:if test="${not empty c.shopPhotoList[1].filepath}">
						<div class="hidden secondPhoto">${c.shopPhotoList[1].filepath}</div>
					</c:if>
					<div class="hidden firstPhoto">${c.shopPhotoList[0].filepath}</div>
					<div class="hidden-div hidden">
						Quick View
					</div>
				</div>
				<div class="shop-info">
					<div>${c.shopTitle }</div>
					<div class="shop-price-info">
						<div>
							<fmt:formatNumber value="${c.shopPrice }" pattern="#,###"/> 원
						</div>
						<div class="shop-rating">
							<div>평점</div>
							<div>${c.avgRating }</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
	<div class="shop-wrap" style="display: none;">
		<div class="shop-title">차박물품 인기순위</div>
		<div class="shop-list">
		<c:forEach items="${carList }" var="c" varStatus="i">
			<div class="shop-box" onclick="viewShop(${c.shopNo});">
				<div class="shop-photo">
					<img src="resources/upload/shop/${c.shopPhotoList[0].filepath}">
					<c:if test="${not empty c.shopPhotoList[1].filepath}">
						<div class="hidden secondPhoto">${c.shopPhotoList[1].filepath}</div>
					</c:if>
					<div class="hidden firstPhoto">${c.shopPhotoList[0].filepath}</div>
					<div class="hidden-div hidden">
						Quick View
					</div>
				</div>
				<div class="shop-info">
					<div>${c.shopTitle }</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
	<div class="shop-wrap" style="display: none;">
		<div class="shop-title">기타물품 인기순위</div>
		<div class="shop-list">
		<c:forEach items="${etcList }" var="c">
			<div class="shop-box" onclick="viewShop(${c.shopNo});">
				<div class="shop-photo">
					<img src="resources/upload/shop/${c.shopPhotoList[0].filepath}">
					<c:if test="${not empty c.shopPhotoList[1].filepath}">
						<div class="hidden secondPhoto">${c.shopPhotoList[1].filepath}</div>
					</c:if>
					<div class="hidden firstPhoto">${c.shopPhotoList[0].filepath}</div>
					<div class="hidden-div hidden">
						Quick View
					</div>
				</div>
				<div class="shop-info">
					<div>${c.shopTitle }</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</div>
	<script src="resources/js/shop/mainShopList.js"></script>
</body>
</html>