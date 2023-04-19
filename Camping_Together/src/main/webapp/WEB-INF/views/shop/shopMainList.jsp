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
					<div class="slick-title">캠핑용품</div>
				</div>	
			</div>
			<div class="page-car-header" style="height : 400px;">
				<div class="slick-content">
					<div class="slick-title">카박용품</div>
				</div>
			</div>
			<div class="page-etc-header" style="height : 400px;">
				<div class="slick-content">
					<div class="slick-title">기타용품</div>
				</div>
			</div>
			<button id="prevPageBtn" class="slick-btn"><span class="material-symbols-outlined">arrow_back_ios</span></button>
			<button id="nextPageBtn" class="slick-btn"><span class="material-symbols-outlined">arrow_forward_ios</span></button>
		</div>
		<div class="content-slick" id="content-slick">
			<div class="camping-wrap shop-wrap">
				<div class="camping-list shop-list">
					<c:forEach items="${campingList }" var="c" varStatus="i">
						<div class="shop-box">
							<div id="carousel-camping-${i.index }" class="carousel slide" data-bs-ride="carousel">
								<div class="carousel-inner">
									<c:forEach items="${c.shopPhotoList }" var="f" varStatus="j">
										<c:choose>
											<c:when test="${j.index == 0 }">
												<div class="carousel-item active">
													<img src="resources/upload/shop/${f.filepath }" alt="resources/upload/camping/campingbg.jpg">
												</div>
											</c:when>
											<c:otherwise>
												<div class="carousel-item">
													<img src="resources/upload/shop/${f.filepath }" alt="resources/upload/camping/campingbg.jpg">
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								<div class="carousel-indicators">
									<c:forEach items="${c.shopPhotoList }" var="f" varStatus="j">
										<c:choose>
											<c:when test="${j.index == 0 }">
												<button type="button" data-bs-target="#carousel-camping-${j.index }" data-bs-slide-to="${j.index }" class="active" aria-current="true" aria-label="Slide 1"></button>
											</c:when>
											<c:otherwise>
												<button type="button" data-bs-target="#carousel-camping-${i.index }" data-bs-slide-to="${j.index }" aria-label="Slide ${j.index+1 }"></button>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								<div class="carousel-caption hidden" onclick="viewShop(${c.shopNo});">
									<div>${c.shopTitle }</div>
							      </div>
								<button class="carousel-control-prev" type="button" data-bs-target="#carousel-camping-${i.index }" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button" data-bs-target="#carousel-camping-${i.index }" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="shop-footer">
					${campingPageNavi }
				</div>
			</div>
			<div class="car-wrap shop-wrap">
				<div class="car-list shop-list">
					<c:forEach items="${carList }" var="c" varStatus="i">
						<div class="shop-box">
							<div id="carousel-car-${i.index }" class="carousel slide" data-bs-ride="carousel">
								<div class="carousel-inner">
									<c:forEach items="${c.shopPhotoList }" var="f" varStatus="j">
										<c:choose>
											<c:when test="${j.index == 0 }">
												<div class="carousel-item active">
													<img src="resources/upload/shop/${f.filepath}" alt="resources/shop/${f.filepath}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="carousel-item">
													<img src="resources/upload/shop/${f.filepath}" alt="resources/upload/shop/${f.filepath}">
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								<div class="carousel-indicators">
									<c:forEach items="${c.shopPhotoList }" var="f" varStatus="j">
										<c:choose>
											<c:when test="${j.index == 0 }">
												<button type="button" data-bs-target="#carousel-car-${i.index }" data-bs-slide-to="${j.index }" class="active" aria-current="true" aria-label="Slide 1"></button>
											</c:when>
											<c:otherwise>
												<button type="button" data-bs-target="#carousel-car-${i.index }" data-bs-slide-to="${j.index }" aria-label="Slide ${j.index+1 }"></button>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								 <div class="carousel-caption hidden" onclick="viewShop(${c.shopNo});">
									<div>${c.shopTitle }</div>
							      </div>
								<button class="carousel-control-prev" type="button" data-bs-target="#carousel-car-${i.index }" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button" data-bs-target="#carousel-car-${i.index }" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="shop-footer">
					${cargPageNavi }
				</div>
			</div>
			<div class="etc-wrap shop-wrap">
				<div class="etc-list shop-list">
					<c:forEach items="${etcList }" var="c">
						<div class="shop-box">
							<div id="carousel-etc-${i.index }" class="carousel slide" data-bs-ride="carousel">
								<div class="carousel-inner">
									<c:forEach items="${c.shopPhotoList }" var="f" varStatus="j">
										<c:choose>
											<c:when test="${j.index == 0 }">
												<div class="carousel-item active">
													<img src="resources/upload/shop/${f.filepath}" alt="resources/shop/${f.filepath}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="carousel-item">
													<img src="resources/upload/shop/${f.filepath}" alt="resources/upload/shop/${f.filepath}">
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								<div class="carousel-indicators">
									<c:forEach items="${c.shopPhotoList }" var="f" varStatus="j">
										<c:choose>
											<c:when test="${j.index == 0 }">
												<button type="button" data-bs-target="#carousel-etc-${j.index }" data-bs-slide-to="${j.index }" class="active" aria-current="true" aria-label="Slide 1"></button>
											</c:when>
											<c:otherwise>
												<button type="button" data-bs-target="#carousel-etc-${i.index }" data-bs-slide-to="${j.index }" aria-label="Slide ${j.index+1 }"></button>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								<div class="carousel-caption hidden" onclick="viewShop(${c.shopNo});">
									<div>${c.shopTitle }</div>
							      </div>
								<button class="carousel-control-prev" type="button" data-bs-target="#carousel-etc-${i.index }" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button" data-bs-target="#carousel-etc-${i.index }" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
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
				slide: "div",
				slidesToShow: 1,
				slidesToScroll: 1,
				dots: true,
				autoplay: false,
				arrows: true,
				fade: true,
				prevArrow: $('#prevPageBtn'),
				nextArrow: $('#nextPageBtn'),
				asNavFor: '#content-slick'
			});
			
			$("#content-slick").slick({
				slidesToShow: 1,
				slidesToScroll: 1,
				autoplay: false,
				arrows: false,
				fade: true,
				asNavFor: '#page-slick'
			});
		})
		
		const carousel = $(".carousel");
		carousel.each(function(i, c){
			const id = $(c).attr("id");
			new bootstrap.Carousel('#'+id, {
				ride : false
			})
		})
		
		$(function(){
			carousel.carousel('pause'); 
		})
		
		$(".carousel").on("mouseenter", function(){
			$(this).find(".carousel-caption").slideDown();
		})
		
		$(".carousel").on("mouseleave", function(){
			$(this).find(".carousel-caption").slideUp();
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