<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="/resources/css/camping/campingListMain.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-wrap">
		<div class="page-header" style="height: 600px; position : fixed; margin-top : 0px">
		</div>
		<div class="page-content">
			<div class="page-wrap page-content-header" style="background-image:none; z-index : 2; margin-top : 0px; width : 100%; height: 600px;">
				<div class="page-header-title" style="font-size: 70px; font-family: aggro-bold;">캠핑가자</div>
				<jsp:include page="/WEB-INF/views/camping/campingListHeader.jsp" />
			</div>
			<div class="city-menu">
				<div class="city-title list-title">대한민국 내 인기있는 지역</div>
				<div class="city-wrap">
					<div class="city" id="seoul">
						<img class="city-img" src="/resources/image/camping/seoul.jpeg">
						<div>서울</div>
					</div>
					<div class="city" id="busan">
						<img class="city-img" src="/resources/image/camping/busan.jpeg">
						<div>부산</div>
					</div>
					<div class="city" id="jeju">
						<img class="city-img" src="/resources/image/camping/jeju.jpeg">
						<div>제주</div>
					</div>
					<div class="city" id="sokcho">
						<img class="city-img" src="/resources/image/camping/sokcho.jpeg">
						<div>속초</div>
					</div>
					<div class="city" id="incheon">
						<img class="city-img" src="/resources/image/camping/incheon.jpeg">
						<div>인천</div>
					</div>
					<div class="city" id="ganglueng">
						<img class="city-img" src="/resources/image/camping/ganglueng.jpeg">
						<div>강릉</div>
					</div>
				</div>
			</div>
			<div class="camping-list-wrap">
				<div class="rating-camping-title list-title">인기 캠핑장</div>
				<div class="camping-list">
				<c:forEach items="${ratingCampingList }" var="c">
					<div class="camping-box" onclick="viewCamping(${c.campingNo});">
						<div class="camping-photo">
							<img src="resources/upload/camping/${c.filepath}">
							<div class="hidden-div hidden">
								Quick View
							</div>
						</div>
						<div class="camping-info">
							<div>${c.campingTitle }</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<div class="camping-list-wrap">
				<div class="new-camping-title list-title">신규 캠핑장</div>
				<div class="camping-list">
				<c:forEach items="${newCampingList }" var="c">
					<div class="camping-box" onclick="viewCamping(${c.campingNo});">
						<div class="camping-photo">
							<img src="resources/upload/camping/${c.filepath}">
							<div class="hidden-div hidden">
								Quick View
							</div>
						</div>
						<div class="camping-info">
							<div>${c.campingTitle }</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(".city").on("click", function(){
			const cityNameEN = $(this).attr("id");
			const cityNameKR = $(this).find("div").text();
			location.href="/campingList.do?cityNameEN="+cityNameEN+"&cityNameKR="+cityNameKR+"&reqPage=1&order=avgReviewRating&pplCount=0";
		})
		function viewCamping(campingNo){
			location.href = "/viewCamping.do?campingNo="+campingNo;
		}
		$(".camping-box").on("mouseenter", function(){
			$(this).find(".hidden-div").slideDown();
		})
		
		$(".camping-box").on("mouseleave", function(){
			$(this).find(".hidden-div").slideUp()
		})
	</script>
	<script src="resources/js/camping/dateRangePicker.js"></script>
</body>
</html>