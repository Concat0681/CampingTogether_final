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
		<div class="page-header">
			<div class="page-header-title">캠핑가자</div>
			<jsp:include page="/WEB-INF/views/camping/campingListHeader.jsp" />
		</div>
		<div class="page-content">
			<div class="city-menu">
				<div class="city-title">대한민국 내 인기있는 지역</div>
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
		</div>
	</div>
	<script>
		$(".city").on("click", function(){
			const cityNameEN = $(this).attr("id");
			const cityNameKR = $(this).find("div").text();
			location.href="/campingList.do?cityNameEN="+cityNameEN+"&cityNameKR="+cityNameKR+"&reqPage=1&order=avgReviewRating&pplCount=0";
		})
	</script>
	<script src="resources/js/camping/dateRangePicker.js"></script>
</body>
</html>