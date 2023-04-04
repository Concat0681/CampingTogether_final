<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/camping/viewCamping.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-wrap">
		<div class="header-wrap">
			<div class="img-wrap">
				<img src="resources/upload/camping/campingbg.jpg">
			</div>
			<div class="camping-info">
				<div class="camping-title">${camping.campingTitle }</div>
				<div class="camping-addr">${camping.campingAddr }</div>
				<div class="camping-content">${camping.campingContent }</div>
				<a><button>문의하기</button></a>
			</div>
		</div>
		<div class="service-info">
			<div class="type-box">
				<div class="type-title">캠핑유형</div>
				<c:forEach items="${campingRoomList }" var="r">
					<div>${r.campingRoomType}</div>
				</c:forEach>
			</div>
			<div class="provide-box">
				<c:forEach items="${campingProvideList }" var="p">
					<c:forEach items="${p.campingService }" var="s">
						<div>${s }</div>
					</c:forEach>
					<c:forEach items="${p.campingRoomService }" var="rs">
						<div>${rs }</div>
					</c:forEach>
					<c:forEach items="${p.campingEtc }" var="e">
						<div>${e }</div>
					</c:forEach>
				</c:forEach>
			</div>			
		</div>
		<div class="page-content">
			<div class="content-menu">
				<div class="menu">캠핑장 예약</div>
				<div class="menu">캠필장 정보</div>
				<div class="menu">리뷰</div>
			</div>
			<div class="content-wrap"></div>
		</div>
		
		<div class="hidden content-box">1</div>
		<div class="hidden content-box">2</div>
		<div class="hidden content-box">3</div>
	</div>
	<script>
		$(".menu").on("click", function(){
			console.log($(this).index());
			console.log($(".content-box").eq(0).text());
			console.log($(".content-box").eq(1).text());
			console.log($(".content-box").eq(2).text());
			const contentBox = $(".content-box").eq($(this).index());
			$(".content-wrap").empty();
			const clone = contentBox.clone();
			clone.removeClass("hidden").appendTo($(".content-wrap"))
		})
	</script>
</body>
</html>