<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/camping/viewCamping.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
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
				<div class="type-content">
					<c:forEach items="${campingRoomList }" var="r">
						<div>${r.campingRoomType}</div>
					</c:forEach>
				</div>
			</div>
			<div class="provide-box">
				<c:forEach items="${camping.campingProvideServiceList }" var="ps">
					<div>${ps.campingService }</div>
				</c:forEach>
				<c:forEach items="${camping.campingRoomServiceList }" var="rs">
					<div>${rs.campingRoomService }</div>
				</c:forEach>
				<c:forEach items="${campingEtcList }" var="e">
					<div>${e.campingEtc }</div>
				</c:forEach>
			</div>			
		</div>
		<div class="page-content">
			<div class="content-menu">
				<div class="menu">캠핑장예약</div>
				<div class="menu">캠필장정보</div>
				<div class="menu">리뷰</div>
			</div>
			<div class="content-wrap">
				
			</div>
		</div>
		<div class="content-hidden content-box">
			<div class="content-header">
				<div class="date-range-wrap">
					<input type="text" name="date" readonly">
					<input type="hidden" name="checkIn">
					<input type="hidden" name="checkOut">
				</div>
				<div class="weather-list"></div>
			</div>
			<div class="campingRoom-list">
				<c:forEach items="${campingRoomList}" var="r">
				<div class="room-wrap"> 
					<div class="room-img-box">
						<c:forEach items="${r.fileList }" var="f">
							<img class="room-img" src="resources/upload/campingRoom/${f.filepath }">
						</c:forEach>
						<img class="room-img" src="resources/image/camping/sokcho.jpeg">
					</div>
					<div class="room-box">
						<div>${r.campingRoomTitle }</div>
						<div class="room-price-box">
							<div>가격</div>
							<div>${r.campingRoomPrice }</div>
						</div>
						<div class="room-basic-info">객실기본정보</div>
						<div class="room-btn-box">
							<button type="button">예약하기</button>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<div class="content-hidden content-box">2</div>
		<div class="content-hidden content-box">3</div>
	</div>
	<script src="resources/js/camping/dateRangePicker.js"></script>
	<script src="resources/js/weather/weather.js"></script>
	<script>
		$(".menu").on("click", function(){
			const index = $(".menu").index($(this));
			const contentBox = $(".content-box").eq(index);				
			//console.log(contentBox.text())
			$(".content-wrap").empty();
			const clone = contentBox.clone();
			if(index == 0){
				const inputDate = clone.find("input[name=date]")
				inputDate.daterangepicker({
				locale: {
				    separator: ' ~ ', // 시작일시와 종료일시 구분자
				    format: 'YYYY-MM-DD', // 일시 노출 포맷
				    applyLabel: '확인', // 확인 버튼 텍스트
				    cancelLabel: '취소', // 취소 버튼 텍스트
				    daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
				    monthNames: [
				      '1월',
				      '2월',
				      '3월',
				      '4월',
				      '5월',
				      '6월',
				      '7월',
				      '8월',
				      '9월',
				      '10월',
				      '11월',
				      '12월'
					]
					}
				})
				inputDate.on('apply.daterangepicker', function (ev, picker) {
				  $(this).val(
				    picker.startDate.format('YYYY-MM-DD') +
				      '~' +
				      picker.endDate.format('YYYY-MM-DD')
				  )
				  $('[name=checkIn]').eq(0).val(picker.startDate.format('YYYY-MM-DD'))
				  $('[name=checkOut]').eq(0).val(picker.endDate.format('YYYY-MM-DD'))
				})
				
				inputDate.on('cancel.daterangepicker', function (ev, picker) {
				  $('[name=checkIn]').val('')
				  $('[name=checkOut]').val('')
				})
			}
			clone.removeClass("content-hidden content-box").addClass("cotent-wrapper").appendTo($(".content-wrap"))
		})
		$(".menu").eq(0).click()
	</script>
</body>
</html>