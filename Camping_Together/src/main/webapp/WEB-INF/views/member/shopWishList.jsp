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
				 <c:if test="${empty shopList}">
				    <h2 style="text-align: center; padding-top: 50px;">장바구니가 비어있습니다.</h2>
        			<p style="text-align: center;">원하는 상품을 담아보세요!</p>
        			<div style="text-align: center; padding-bottom: 60px;">
	        			<span class="material-symbols-outlined">arrow_downward</span>
        			</div>
        			<div style="text-align: center; border-bottom: 1px solid  #AD8B73; padding-bottom: 50px;">
        				<a href="/shopMainList.do" class="moveShop">
		        			<span class="material-symbols-outlined" style="font-size: 300px; color: rgba(173, 139, 115, 1);">shopping_cart</span>
	        			</a>
        			</div>
				 </c:if>
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
											</c:forEach>
											<c:if test="${s.shopPhotoList.size() > 1 }">
												  <!-- 이전/다음 버튼 정의 -->
												  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls-${i.index }" data-bs-slide="prev">
												    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
												    <span class="visually-hidden">이전</span>
												  </button>
												  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls-${i.index }" data-bs-slide="next">
												    <span class="carousel-control-next-icon" aria-hidden="true"></span>
												    <span class="visually-hidden">다음</span>
												  </button>
											  </c:if>
										</div>
									</div>
							</div>
							<div class="shop-title" onclick="location.href='/viewShop.do?shopNo=${s.shopNo}&reqPage=1&menu=0'">
								<span>${s.shopTitle }</span>
							</div>
							<div class="zero"></div>
							<div class="shop-bottom">
								<div class="shop-price">
									<span>${s.shopPrice }</span><span>원</span>
								</div>
								<a href="javascript:void(0)" class="shop-delete" onclick="deleteShop(this,'${sessionScope.m.memberId }','${s.shopNo }')">
									<span class="material-symbols-outlined">close</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<c:if test="${empty shopList}">
			    <div class="pagenation" style="display:none;">
			        ${navi}
			    </div>
			</c:if>
			<c:if test="${not empty shopList}">
			    <div class="pagenation">
			        ${navi}
			    </div>
			</c:if>
		</div>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		function deleteShop(obj,memberId,shopNo){
			if(confirm("장바구니에서 삭제하시겠습니까?")){
				location.href="/deleteWishList.do?memberId="+memberId+"&shopNo="+shopNo;
			}
		}
	</script>
</body>
</html>