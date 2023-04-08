<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/camping/campingListHeader.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<body>
	<div class="search-input-wrap">
		<div class="search-input-box" >
			<form action="/campingList.do" method="get">
				<div class="input-group search-city-box">
					<label class="input-group-text" for="searchInput"><span class="material-symbols-outlined">search</span></label>
					<input class="form-control" id="searchInput" name="cityNameKR" type="text" placeholder="어디로 떠나실건가요?" required>
					<input name="cityNameEN" type="hidden">
					<div class="hidden-search">
						<ul>
							<li id="incheon" class="cityName">인천</li>
							<li id="seoul" class="cityName">서울</li>
							<li id="jeju" class="cityName">제주</li>
							<li id="sokcho" class="cityName">속초</li>
							<li id="ganglueng" class="cityName">강릉</li>
						</ul>
					</div>
				</div>
				<div class="input-group search-date-box">
					<label class="input-group-text" for="search_checkin"><span class="material-symbols-outlined">calendar_month</span></label>
					<input class="form-control" type="text" id="search_checkin" name="date" readonly>
					<input class="form-control" type="text" id="search_checkout" name="date" readonly>
					<input type="hidden" name="checkIn">
					<input type="hidden" name="checkOut">				
				</div>
				<div class="input-group">
					<input class="form-control" name="pplCount" id="pplCount" type="text" value=1>
					<label  class="input-group-text" for="pplCount"><span>명</span></label>
				</div>
				<input name="reqPage" type="hidden" value="1">
				<input name="order" type="hidden" value="avgReviewRating">
				<div class="input-group search-submit-box">
					<button type="submit" class="btn btn-outline-secondary searchInput-btn">검색하기</button>
				</div>
			<!-- search-content -->
			</form>
		</div>
	</div>
	<script src="resources/js/camping/campingHeader.js"></script>
</body>
</html>