<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/shop/shopMainList.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
	<div class="page-wrap">
		<div>
			<c:if test="${sessionScope.m.memberGrade eq 'a' }">
				<button id="insertShopBtn">물품등록</button>			
			</c:if>
		</div>
		<div class="page-slick" id="page-slick">
			<div class="page-camping-header" style="height : 400px;">
				<div class="slick-content">
				</div>	
			</div>
			<div class="page-car-header" style="height : 400px;">
				<div class="slick-content">
				</div>
			</div>
			<div class="page-etc-header" style="height : 400px;">
				<div class="slick-content">
				</div>
			</div>
		</div>
		<div class="content-slick" id="content-slick">
			<button id="prevPageBtn" class="slick-btn s1_arrow left">
				<div class="scroll-arrow"></div>
				<div class="scroll-arrow"></div>
				<div class="scroll-arrow"></div>
			</button>
			<button id="nextPageBtn" class="slick-btn s1_arrow right-s1">
				<div class="scroll-arrow"></div>
				<div class="scroll-arrow"></div>
				<div class="scroll-arrow"></div>
			</button>
			<div class="camping-wrap shop-wrap">
				<div class="slick-title">캠핑용품</div>
				<div class="camping-list shop-list">
					<c:forEach items="${campingList }" var="c" varStatus="i">
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
				<div class="shop-footer">
					${campingPageNavi }
				</div>
			</div>
			<div class="car-wrap shop-wrap">
				<div class="slick-title">카박용품</div>
				<div class="car-list shop-list">
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
				<div class="shop-footer">
					${cargPageNavi }
				</div>
			</div>
			<div class="etc-wrap shop-wrap">
				<div class="slick-title">기타용품</div>
				<div class="etc-list shop-list">
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
				<div class="shop-footer">
					${etcPageNavi }
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#insertShopBtn").on("click", function(){
			location.href="/insertShopFrm.do";
		})
		
		$(function(){
			$("#page-slick").slick({
				slidesToShow: 1,
				slidesToScroll: 1,
				autoplay: false,
				arrows: false,
				fade: true,
				asNavFor: '#content-slick'
			});
			
			$("#content-slick").slick({
				slide: "div",
				slidesToShow: 1,
				slidesToScroll: 1,
				autoplay: false,
				arrows: true,
				fade: true,
				prevArrow: $('#prevPageBtn'),
				nextArrow: $('#nextPageBtn'),
				asNavFor: '#page-slick'
			});
		})
		
		$(".shop-box").on("mouseenter", function(){
			$(this).find(".hidden-div").slideDown();
			const url = $(this).find(".secondPhoto").text();
			if(url != ""){
				$(this).find("img").attr("src", "resources/upload/shop/"+url);
			}
		})
		
		$(".shop-box").on("mouseleave", function(){
			$(this).find(".hidden-div").slideUp()
			const url = $(this).find(".firstPhoto").text();
			$(this).find("img").attr("src", "resources/upload/shop/"+url);
		})
		
		function viewShop(shopNo){
			location.href="/viewShop.do?shopNo="+shopNo+"&reqPage=1&menu=0";
		}
		
		function viewShopList(shopCategory, reqPage){
			location.href="/shopList.do?shopCategory="+shopCategory+"&reqPage="+reqPage;
		}
	</script>
</body>
</html>