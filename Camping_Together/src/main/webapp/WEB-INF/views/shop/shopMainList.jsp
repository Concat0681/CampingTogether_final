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
			<div class="page-camping-header" style="height : 600px;">
				<div class="slick-content">
					<div class="slick-title">캠핑용품</div>
				</div>	
			</div>
			<div class="page-car-header" style="height : 600px;">
				<div class="slick-content">
					<div class="slick-title">카박용품</div>
				</div>
			</div>
			<div class="page-etc-header" style="height : 600px;">
				<div class="slick-content">
					<div class="slick-title">기타용품</div>
				</div>
			</div>
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
		</div>
		<div class="content-slick" id="content-slick">
			<div class="camping-wrap shop-wrap">
				<c:if test="${not empty campingList  }">
					<div class="camping-list-menu">
						<div>	
							<span class="material-symbols-outlined clicked-span">filter_alt</span>
							<div onclick="shopListOrder(this, 0, 1, 'new')">최근순</div>
						</div>
						<div>
							<span class="material-symbols-outlined">filter_alt</span>
							<div onclick="shopListOrder(this, 0, 1, 'rating')">평점순</div>
						</div>
					</div>
				</c:if>
				<div class="camping-list shop-list">
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
							</div>
						</div>
					</c:forEach>
				</div>
				<c:if test="${not empty carList }">
					<div class="shop-footer">
						${campingPageNavi }
					</div>
				</c:if>
			</div>
			<div class="car-wrap shop-wrap">
				<c:if test="${not empty carList  }">
					<div class="camping-list-menu">
						<div>	
							<span class="material-symbols-outlined clicked-span">filter_alt</span>
							<div onclick="shopListOrder(this, 1, 1, 'new')">최근순</div>
						</div>
						<div>
							<span class="material-symbols-outlined">filter_alt</span>
							<div onclick="shopListOrder(this, 1, 1, 'rating')">평점순</div>
						</div>
					</div>
				</c:if>
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
				<c:if test="${not empty carList }">
					<div class="shop-footer">
						${carPageNavi }
					</div>
				</c:if>
			</div>
			<div class="etc-wrap shop-wrap">
				<c:if test="${not empty etcList  }">
					<div class="camping-list-menu">
						<div>
							<span class="material-symbols-outlined clicked-span">filter_alt</span>
							<div onclick="shopListOrder(this, 2, 1, 'new')">최근순</div>
						</div>
						<div>
							<span class="material-symbols-outlined">filter_alt</span>
							<div onclick="shopListOrder(this, 2, 1, 'rating')">평점순</div>
						</div>
					</div>
				</c:if>
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
				<c:if test="${not empty ectList }">
					<div class="shop-footer">
						${etcPageNavi }
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<script>
		$("#insertShopBtn").on("click", function(){
			location.href="/insertShopFrm.do";
		})
		
		$(".camping-list-menu>div").on("click", function(){
			$(this).parent().find("span").removeClass("clicked-span");
			$(this).find("span").addClass("clicked-span");
		})
		
		$(function(){
			$("#page-slick").slick({
				slide: "div",
				slidesToShow: 1,
				slidesToScroll: 1,
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
		
		function shopListOrder(obj, shopCategory, reqPage, order){
			$.ajax({
				url : "/shopListByOrder.do",
				type : "get",
				data : {shopCategory : shopCategory, reqPage : reqPage, order : order},
				success : function(data){
					const shopList = $(obj).parents(".shop-wrap").find(".shop-list");
					const shopFooter =$(obj).parents(".shop-wrap").find(".shop-footer");
					shopList.empty();
					shopFooter.empty();
					data.shopList.forEach(function(c, i){
						const shopBoxDiv = $("<div>").addClass("shop").attr("onclick", "viewShop('"+c.shopNo+"');");
						shopBoxDiv.on("mouseenter", function(){
							$(this).find(".hidden-div").slideDown();
							const url = $(this).find(".secondPhoto").text();
							if(url != ""){
								$(this).find("img").attr("src", "resources/upload/shop/"+url);
							}
						})
						shopBoxDiv.on("mouseleave", function(){
							$(this).find(".hidden-div").slideUp()
							const url = $(this).find(".firstPhoto").text();
							$(this).find("img").attr("src", "resources/upload/shop/"+url);
						})
						const shopPhotoDiv = $("<div>").addClass("shop-photo");
						const img = $("<img>").attr("src", "resources/upload/shop/"+c.shopPhotoList[0].filepath)
						const secondHiddenDiv = $("<div>");
						if(c.shopPhotoList.length > 1){
							secondHiddenDiv.addClass("hidden").addClass("secondPhoto").text(c.shopPhotoList[1].filepath);
						}
						const firstHiddenDiv = $("<div>").addClass("hidden").addClass("firstPhoto").text(c.shopPhotoList[0].filepath);
						const hiddenDiv = $("<div>").addClass("hidden").addClass("hidden-div").text("Quick View");
						const shopInfoDiv = $("<div>").addClass("shop-info");
						const shopTitleDiv = $("<div>").text(c.shopTitle);
						shopPhotoDiv.append(img).append(secondHiddenDiv).append(firstHiddenDiv).append(hiddenDiv);
						shopInfoDiv.append(shopTitleDiv);
						shopBoxDiv.append(shopPhotoDiv).append(shopInfoDiv);
						shopList.append(shopBoxDiv)
					})
					shopFooter.append(data.pageNavi);
				},
				error : function(e){
					console.log(e);
				}
			})
		}
		
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
		
		function viewShop(shopNo, memberId){
			location.href="/viewShop.do?shopNo="+shopNo+"&reqPage=1&menu=0&memberId="+memberId;
		}
		
		function viewShopList(shopCategory, reqPage){
			location.href="/shopList.do?shopCategory="+shopCategory+"&reqPage="+reqPage;
		}
	</script>
</body>
</html>