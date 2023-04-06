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
				<c:forEach items="${campingRoomList}" var="r" varStatus="i">
				<div class="room-wrap"> 
					<div class="room-img-box">
						<div id="carousel-${i.index }" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carousel-${i.index }" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carousel-${i.index }" data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carousel-${i.index }" data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<div class="carousel-inner">
								<c:forEach items="${r.fileList }" var="f" varStatus="j">
									<c:choose>
										<c:when test="${j.index == 0 }">
											<div class="carousel-item active">
												<img src="resources/upload/campingRoom/${f.filepath }" class="d-block w-100" alt="resources/upload/camping/campingbg.jpg">
											</div>
										</c:when>
										<c:otherwise>
											<div class="carousel-item">
												<img src="resources/upload/campingRoom/${f.filepath }" class="d-block w-100" alt="resources/upload/camping/campingbg.jpg">
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
				
						<!-- 객실 정보 모달 -->
				<div class="modal fade" id="modal-${i.index}" tabindex="-1" aria-labelledby="modal-${i.index}Label" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
						    <div class="modal-header">
							    <h1 class="modal-title fs-5" id="modal-${i.index}Label">Modal title</h1>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">${r.campingRoomTitle}</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-primary">Save changes</button>
			    	        </div>
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
				
				const carousel = clone.find(".carousel");
				carousel.each(function(i, c){
					const id = $(c).attr("id");
					new bootstrap.Carousel('#'+id)
				})
				
				const modal = clone.find(".modal")
				const roomInfo = clone.find(".room-basic-info");
				roomInfo.each(function(i,r){
					$(r).attr("data-bs-toggle","modal").attr("data-bs-target", "#"+modal.eq(i).attr("id"))
				})
			}
			clone.removeClass("content-hidden content-box").addClass("cotent-wrapper").appendTo($(".content-wrap"))
		})
		
		$(".menu").eq(0).click()
		
	</script>
</body>
</html>