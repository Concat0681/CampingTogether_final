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
				<c:forEach items="${shopList }" var="s" varStatus="i">
					<div class="shop-wrap">
						<div class="shop">
							<div class="shop-img">
								<div id="carouselExampleControls-${i.index }" class="carousel slide" data-bs-ride="carousel">
									  <!-- 캐러셀 내용 정의 -->
									  	<div class="carousel-inner">
									  		<c:forEach items="${s.shopPhotoList }" var="f" varStatus="j">
												<c:choose>
													<c:when test="${j.index == 0 }">
														<div class="carousel-item active">
															<img src="resources/upload/shop/${f.filepath }" style="width: 100%; height: 230px; border: 1px solid #ccc; border-radius: 5px;">
														</div>
													</c:when>
													<c:otherwise>
														<div class="carousel-item">
															<img src="resources/upload/shop/${f.filepath }" style="width: 100%; height: 230px; border: 1px solid #ccc; border-radius: 5px;">
														</div>
													</c:otherwise>
												</c:choose>
											  <!-- 이전/다음 버튼 정의 -->
											  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls-${i.index }" data-bs-slide="prev">
											    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">이전</span>
											  </button>
											  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls-${i.index }" data-bs-slide="next">
											    <span class="carousel-control-next-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">다음</span>
											  </button>
											</c:forEach>	
										</div>
									  
									</div>
							</div>
							<div class="shop-title">
								<span>${s.shopTitle }</span>
							</div>
							<div class="zero"></div>
							<div class="shop-bottom">
								<div class="shop-price">
									<span>${s.shopPrice }</span><span>원</span>
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