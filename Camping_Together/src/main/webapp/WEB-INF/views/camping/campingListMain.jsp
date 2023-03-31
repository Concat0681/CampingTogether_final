<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="/resources/css/camping/campingListHeader.css" rel="stylesheet">
<link href="/resources/css/camping/campingListMain.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<div class="page-wrap">
		<div class="page-header">
			<div class="page-header-title">캠핑가자</div>
			<div class="search-input-wrap">
				<form action="/campingList.do" method="get">
					<div class="search-input-box"  style="position : relative">
					<input id="searchInput" name="cityNameKR" type="text" placeholder="어디로 떠나실건가요?" required>
					<input name="cityNameEN" type="hidden">
					<!-- search-content -->
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
					<div class="search-input-box">
						<input id="reservationDate" type="text" name="date" readonly>
						<input type="hidden" name="checkIn">
						<input type="hidden" name="checkOut">
						<input name="pplCount" type="text" value="1">
						<input name="reqPage" type="hidden" value="1">
						<input name="order" type="hidden" value="avgReviewRating">
						<button type="submit" class="searchInput-btn">검색하기</button>
					</div>
				</form>
			</div>
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
			location.href="/campingList.do?cityNameEN="+cityNameEN+"&cityNameKR="+cityNameKR+"&reqPage=1&order=avgReviewRating";
		})
		
		$("#searchInput").on("click", function(){
			$(".hidden-search").show();
		})
		
		$("#searchInput").on("blur", function(){
			setTimeout(() => {
				$(".hidden-search").hide();
			  }, 200);
		})
		
		$(".cityName").on("click", function(){
			$("#searchInput").val($(this).text())
			$("[name=cityNameEN]").val($(this).attr("id"));
		})

		$("#reservationDate").daterangepicker({
			locale: {
			    "separator": " ~ ",                     // 시작일시와 종료일시 구분자
			    "format": 'YYYY-MM-DD',   				// 일시 노출 포맷
			    "applyLabel": "확인",                    // 확인 버튼 텍스트
			    "cancelLabel": "취소",                   // 취소 버튼 텍스트
			    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
			    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
			    }
		});


		$("#reservationDate").on('apply.daterangepicker', function(ev, picker) {
		      $(this).val(picker.startDate.format('YYYY-MM-DD') + "~" + picker.endDate.format("YYYY-MM-DD"));
		      $("[name=checkIn]").val(picker.startDate.format('YYYY-MM-DD'));
		      $("[name=checkOut]").val(picker.endDate.format("YYYY-MM-DD"));
		  });
	
		$("#reservationDate").on('cancel.daterangepicker', function(ev, picker) {
			$(this).val('');
			$("[name=checkIn]").val("");
		    $("[name=checkOut]").val("");
		});

	</script>
</body>
</html>