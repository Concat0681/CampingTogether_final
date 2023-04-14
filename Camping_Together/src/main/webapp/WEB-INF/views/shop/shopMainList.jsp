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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-wrap">
		<div>
			<c:if test="${sessionScope.m.memberGrade eq 'a' }">
				<button id="insertShopBtn">물품등록</button>			
			</c:if>
		</div>
		<div class="camping-shop-wrap">
			<div>캠핑물품</div>
			<div class="camping-shop-list">
				<c:forEach items="${campingList }" var="c" varStatus="i">
					<div id="carousel-${i.index }" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carousel-${i.index }" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carousel-${i.index }" data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carousel-${i.index }" data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<c:forEach items="${c.shopPhotoList }" var="f" varStatus="j">
								<c:choose>
									<c:when test="${j.index == 0 }">
										<div class="carousel-item active">
											<img src="resources/upload/campingRoom/${f.filepath }" alt="resources/upload/camping/campingbg.jpg">
										</div>
									</c:when>
									<c:otherwise>
										<div class="carousel-item">
											<img src="resources/upload/campingRoom/${f.filepath }" alt="resources/upload/camping/campingbg.jpg">
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carousel-${i.index }" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carousel-${i.index }" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
					<div>${c.shopTitle }</div>
				</c:forEach>
			</div>
		</div>
		<div class="car-shop-wrap">
			<div>카박물품</div>
			<div class="car-shop-list">
				<c:forEach items="${list1 }" var="c">
					<div>${c.shopTitle }</div>
				</c:forEach>
			</div>
		</div>
		<div class="etc-shop-wrap">
			<div>기타물품</div>
			<div class="etc-shop-list">
				<c:forEach items="${list2 }" var="c">
					<div>${c.shopTitle }</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script>
		$("#insertShopBtn").on("click", function(){
			location.href="/insertShopFrm.do";
		})
	</script>
</body>
</html>