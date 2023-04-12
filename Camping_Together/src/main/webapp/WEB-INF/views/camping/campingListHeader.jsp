<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/camping/campingListHeader.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
</head>
<body>
	<div class="search-input-wrap">
		<div class="search-input-box" >
			<form action="/campingList.do" method="get">
				<div class="input-group search-city-box">
					<label class="input-group-text" for="sido"><span class="material-symbols-outlined">search</span></label>
					<c:choose>
						<c:when test="${not empty campingSido }">
							<input class="form-control" id="sido" name="campingSido" type="text" value="${campingSido }" required>
						</c:when>
						<c:otherwise>
							<input class="form-control" id="sido" name="campingSido" type="text" placeholder="도" required>						
						</c:otherwise>
					</c:choose>
					<div class="hidden-sido-search">
						<ul>
							<li id="gyeonggi-do" class="sido">경기</li>
							<li id="gangwon-do" class="sido">강원</li>
							<li id="chungcheong-do" class="sido">충청</li>
							<li id="jeonla-do" class="sido">전라</li>
							<li id="gyeongsang-do" class="sido">경상</li>
							<li id="jeju-do" class="sido">제주</li>
							<li id="all" class="sido">모두보기</li>
						</ul>
					</div>
					<input class="form-control" id="searchInput" name="cityNameKR" placeholder="도시" type="text">
					<input name="cityNameEN" type="hidden">
					<div class="hidden-search">
						<ul>
							<li id="Incheon" class="cityName gyeonggi-do all">인천</li>
							<li id="seoul" class="cityName gyeonggi-do all">서울</li>
							<li id="busan" class="cityName gyeongsang-do all">부산</li>
							<li id="daegu" class="cityName gyeongsang-do all">대구</li>
							<li id="sokcho" class="cityName all">속초</li>
							<li id="ganglueng" class="cityName all">강릉</li>
						</ul>
					</div>
				</div>
				<div class="input-group search-date-box">
					<label class="input-group-text" for="search_checkin"><span class="material-symbols-outlined">calendar_month</span></label>
					<input class="form-control" type="text" id="search_checkin" name="checkIn" readonly>
					<input class="form-control" type="text" id="search_checkout" name="checkOut" readonly>			
				</div>
				<div class="input-group">
					<input class="form-control" name="pplCount" id="pplCount" type="text" value=1>
					<label  class="input-group-text" for="pplCount"><span>명</span></label>
				</div>
				<input name="reqPage" type="hidden" value="1">
				<input name="order" type="hidden" value="avgReviewRating">
				<div class="input-group search-submit-box">
					<button type="submit" class="btn searchInput-btn">검색하기</button>
				</div>
			<!-- search-content -->
			</form>
		</div>
	</div>
	<script src="resources/js/camping/campingHeader.js"></script>
</body>
</html>