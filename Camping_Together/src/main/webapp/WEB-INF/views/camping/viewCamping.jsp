<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=n8k40j998a&submodules=geocoder"></script>
<link rel="stylesheet" href="resources/css/camping/viewCamping.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="/resources/css/campingReview.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
				<div class="camping-detail">
					<div>
						<div>캠핑 기본정보</div>
						<button type="button" onclick="openCampingContent(this);">더보기</button>
					</div>
					<div class="camping-content">
						${camping.campingContent }
					</div>
				</div>
				<div>
					<button id="sendInquiryBtn" class="btn3" data-bs-toggle="modal" data-bs-target="#exampleModal">문의하기</button>
					<input type="hidden" id="campingMemberId" value="${camping.memberId }" >
				</div>
			</div>
		</div>
		<div class="service-info">
			<div class="provide-box">
				<div class="provice-service-wrap">
					<div class="provide-title">공용시설</div>
					<div class="provice-service-box">
						<c:forEach items="${camping.campingProvideServiceList }" var="ps">
							<div class="provide-service-list">
								<span class="material-symbols-outlined"></span>
								<div>${ps.campingService }</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="room-service-wrap">
					<div class="provide-title">객실내 시설</div>
					<div class="room-service-box">
						<c:forEach items="${camping.campingRoomServiceList }" var="rs">
							<div class="room-service-list">
								<span class="material-symbols-outlined"></span>
								<div>${rs.campingRoomService }</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="etc-list-wrap">
					<div class="provide-title">기타</div>
					<div class="etc-list-box">
						<c:forEach items="${camping.campingEtcList }" var="e">
							<div class="etc-list">
								<span class="material-symbols-outlined"></span>
								<div>${e.campingEtc }</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>			
		</div>
		<div class="page-content">
			<div class="content-menu">
				<div class="menu"><button class="btn1">캠핑장예약</button></div>
				<div class="menu"><button class="btn1">캠핑장정보</button></div>
				<div class="menu"><button class="btn1">캠핑예약</button></div>
			</div>
			<div class="content-wrap">
				<div class="content-box">
					<div class="content-header">
						<div class="date-input-wrap">
							<div class="input-group date-input-box">
								<label class="input-group-text" for="search_checkin"><span class="material-symbols-outlined">calendar_month</span></label>
								<c:choose>
									<c:when test="${not empty checkIn }">
										<input class="form-control" type="text" id="search_checkin" name="checkIn" value="${checkIn }" readonly>
										<input class="form-control" type="text" id="search_checkout" name="checkOut" value="${checkOut }" readonly>	
									</c:when>
									<c:otherwise>
										<input class="form-control" type="text" id="search_checkin" name="checkIn" readonly>
										<input class="form-control" type="text" id="search_checkout" name="checkOut" readonly>	
									</c:otherwise>
								</c:choose>
							</div>
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
							<div class="modal room-info-modal fade" id="modal-${i.index}" tabindex="-1" aria-labelledby="modal-${i.index}Label" aria-hidden="true">
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
			</div>
			<div class="content-hidden content-box">2</div>
			<div class="content-hidden content-box">
				<div class="reviewWrap">
					<div class="reviewContentWrap">
						<div class="reviewHeader">
							<h2 style="text-align: center; padding-bottom: 50px;">최고에요</h2>
							<div class="allStar">
								<span class="material-symbols-outlined">star</span>
								<span class="material-symbols-outlined">star</span>
								<span class="material-symbols-outlined">star</span>
								<span class="material-symbols-outlined">star</span>
								<span class="material-symbols-outlined">star</span>
							</div>
							<div>
								<div class="allReview">전체 리뷰 500</div>
								<div class="campingAnswer">캠핑장 답변 250</div>
							</div>
						</div>
						
				        <button class="btn1 review-modal-open-btn" target="#test-modal">
				          	리뷰작성
				        </button>
					    
					    <div id="test-modal" class="review-modal-bg" style="z-index: 1000;">
						  <div class="review-modal-wrap">
						    <div class="review-modal-head">
						      <h2>리뷰 작성</h2>
						      <span class="material-icons close-icon review-modal-close">close</span>
						    </div>
						    <div class="review-modal-content">
						    	<form action="/campingReviewWrite.do" method="post" enctype="multipart/form-data">
						    		<input type="hidden" name="campingNo" value="${camping.campingNo }">
							      	<table>
							      		<tr>
							      			<td colspan="2">만족하셨나요?</td>
							      		</tr>
							      		<tr>
										    <td>
										      <div class="star-wrap star-wrap2">
										        <span class="material-symbols-outlined">star</span>
										        <span class="material-symbols-outlined">star</span>
										        <span class="material-symbols-outlined">star</span>
										        <span class="material-symbols-outlined">star</span>
										        <span class="material-symbols-outlined">star</span>
										        <div class="star-on">
										          <div class="star-wrap star-on-wrap">
										            <span class="material-symbols-outlined">star</span>
										            <span class="material-symbols-outlined">star</span>
										            <span class="material-symbols-outlined">star</span>
										            <span class="material-symbols-outlined">star</span>
										            <span class="material-symbols-outlined">star</span>
										          </div>
										        </div>
										      </div>
										    </td>
										    <td>
										      <input type="text" name="campingReviewRating">
										      <button type="button" id="starBtn">별점입력</button>
										    </td>
										</tr>
							      		<tr>
							      			<td>제목</td>
							      			<td>
							      				<input type="text" name="campingReviewTitle">
							      			</td>
							      		</tr>
							      		<tr>
							      			<td colspan="2">
							      				<textarea name="campingReviewContent"></textarea>
							      			</td>
							      		</tr>
							      		<tr>
							      			<td>사진 등록</td>
							      			<td>
							      				<input type="file" onchange="loadImg(this);" name="campingReviewFilepath" multiple>
							      			</td>
							      		</tr>
							      		<tr>
							      			<td>
							      				<div id="img-viewer">
					        			
					                    		</div>
							      			</td>
							      		</tr>
							      	</table>
							    </div>
							    <div class="review-modal-foot">
							      <button type="submit" class="reviewBtn bc1">등록</button>
							      <button type="button" class="btn bc1 review-modal-close">취소</button>
							    </div>
						    </form>
						  </div>
						</div>
						
						<div style="margin-top: 50px;">
					        <ul class="posting-comment">
					          <li style="padding-left: 90px;">
					            <span class="material-icons">account_box</span>
					          </li>
					          <li>
					            <p class="comment-info">
					              <span>리뷰제목</span>
					            </p>
					            <p>
					            	<span style="padding-left: 10px;">별별별별별</span>
					            </p>
					            <p class="comment-content">댓글내용댓글내용댓글내용</p>
					            
					            
					            <!-- 캐러셀 컨테이너 정의 -->
								<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="width: 500px;">
								  <!-- 캐러셀 내용 정의 -->
								  <div class="carousel-inner" style="width: 500px; height: 500px;">
								    <div class="carousel-item active">
								      <img src="resources/upload/campingRoom/도라.jfif" class="d-block w-100" alt="..." style="width: 500px; height: 500px;">
								    </div>
								    <div class="carousel-item">
								      <img src="resources/upload/campingRoom/도라.jfif" class="d-block w-100" alt="..." style="width: 500px; height: 500px;">
								    </div>
								    <div class="carousel-item">
								      <img src="resources/upload/campingRoom/도라.jfif" class="d-block w-100" alt="..." style="width: 500px; height: 500px;">
								    </div>
								  </div>
								  
								  <!-- 이전/다음 버튼 정의 -->
								  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">이전</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">다음</span>
								  </button>
								</div>
					            <p class="comment-link">
					              <a href="#">수정</a>
					              <a href="#">삭제</a>
					              <a href="#">답글달기</a>
					            </p>
					          </li>
					        </ul>
					        <ul class="posting-comment reply">
					          <li style="padding-left: 90px;">
					            <span class="material-icons">subdirectory_arrow_right</span>
					            <span class="material-icons">account_box</span>
					          </li>
					          <li>
					            <p class="comment-info">
					              <span>user01</span>
					            </p>
					            <p class="comment-content">댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용</p>
					            <p class="comment-link">
					              <a href="#">수정</a>
					              <a href="#">삭제</a>
					            </p>
					          </li>
					        </ul>
			      		</div>
					    
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/camping/dateRangePicker.js"></script>
	<script>
		var provideServiceIcon = {
				  '인터넷': 'signal_cellular_alt',
				  '주차장': 'local_parking',
				  '라운지': 'weekend',
				  '전기사용기능': 'power',
				  'BBQ': 'outdoor_grill',
				  '개수대' : 'countertops',
				  '공용샤워실': 'shower',
				  '매점' : 'storefront',
				  '공용화장실' : 'wc',
				  '물놀이시설' : 'pool',
				  '카페' : 'local_cafe',
				  '편의점' : 'local_convenience_store',
				  '카페' : 'local_cafe',
				  '노래방' : 'music_note',
				  '주방/식당' : 'soup_kitchen',
				  '세탁기' : 'local_laundry_service',
				  '건조기' : 'dry_cleaning',
				  '탈수기' : 'dry_cleaning',
				  '공용PC' : 'computer',
				  '전자레인지' : 'microwave',
				  '취사가능' : 'cooking'
		}
		
		var roomServiceIcon = {
				  '객실샤워실': 'shower',
				  '드라이기': 'mode_fan',
				  '와이파이': 'wifi',
				  'TV': 'tv',
				  '욕실용품': 'soap',
				  '미니바' : 'nightlife',
				  '에어컨': 'air',
				  '냉장고' : 'kitchen',
				  '욕조' : 'bathtub',
				  '다리미' : 'iron',
				  '전기밥솥' : 'cooking',
				  '객실스파' : 'hot_tub',
				  '세면도구' : 'self_care'
		}
		var etcIcon = {
				  '장비대여': 'architecture',
				  '사이트주차': 'local_parking',
				  '카드결제': 'credit_card',
				  '조식포함': 'local_dining',
				  '객실내흡연': 'smoking_rooms',
				  '발렛파킹' : 'local_parking',
				  '반려견동반': 'pets',
				  '객실내취사' : 'restaurant_menu',
				  '픽업가능' : 'airport_shuttle',
				  '캠프파이어' : 'fireplace',
				  '금연' : 'smoke_free'
		}
		
		const serviceList = $(".provide-service-list")
		serviceList.each(function(i, s){
			const value = $(s).find("div").text();
			const icon = provideServiceIcon[value];
			$(s).find("span").text(icon)
		})
		
		const roomServiceList = $(".room-service-list")
		roomServiceList.each(function(i, s){
			const value = $(s).find("div").text();
			const icon = roomServiceIcon[value];
			$(s).find("span").text(icon)
		})
		
		const etcList = $(".etc-list")
		etcList.each(function(i, s){
			const value = $(s).find("div").text();
			const icon = etcIcon[value];
			$(s).find("span").text(icon)
		})
		
		$(".menu>button").on("click", function(){
			const index = $(".menu>button").index($(this));
			$(".menu").removeClass("clicked")
			$(".menu").eq(index).addClass("clicked")
			const contentBoxList = $(".content-box");
			contentBoxList.hide();
			const contentBox = $(".content-box").eq(index);	
			contentBox.show();
		})
		
		function openCampingContent(obj){
			$(".camping-content").toggleClass("opened");
			if($(".camping-content").hasClass("opened")){
				$(obj).text("접기")
			} else {
				$(obj).text("더보기")
			}
		}
		
		$("#sendInquiryBtn").on("click", function(){
			const receiver = $("#campingMemberId").val()
			$("#receiver-name").val(receiver)
		})
		
		const inputDate = $("input[name=date]")
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
		
		const carousel = $(".carousel");
		carousel.each(function(i, c){
			const id = $(c).attr("id");
			new bootstrap.Carousel('#'+id)
		})
		
		const modal = $(".room-info-modal")
		const roomInfo = $(".room-basic-info");
		roomInfo.each(function(i,r){
			$(r).attr("data-bs-toggle","modal").attr("data-bs-target", "#"+modal.eq(i).attr("id"));
		})
		
		var weatherIcon = {
		  '01': 'sunny',
		  '02': 'cloudy',
		  '03': 'cloudy',
		  '04': 'cloudy',
		  '09': 'rainy',
		  10: 'rainy',
		  11: 'thunderstorm',
		  13: 'cloudy_snowing',
		  50: 'fas fa-smog'
		}
		
		const campingAddr = $(".camping-addr").text();
		
		naver.maps.Service.geocode({
	        address: campingAddr
	    }, function(status, response) {
	        if (status !== naver.maps.Service.Status.OK) {
	            return alert('Something wrong!');
	        }
	
	        var result = response.result, // 검색 결과의 컨테이너
	        items = result.items; // 검색 결과의 배열
	        const lng = items[1].point.x;
	        const lat = items[1].point.y;
	        
			var apiURI =
			  'https://api.openweathermap.org/data/2.5/forecast?lat='+lat+'&lon='+lng+'&appid=d8d8cf6db7ad526a7ec43b51070a4d75'
			$(function () {
			  $.ajax({
			    url: apiURI,
			    dataType: 'json',
			    type: 'GET',
			    async: 'false',
			    success: function (resp) {
			      const date = new Date()
			      const hours = date.getHours()
			      const compareHours = Math.floor(hours / 3) * 3
			      resp.list.forEach(r => {
			        if (r.dt_txt.substr(11, 2) == compareHours) {
			          const div1 = $('<div>').addClass('weather-info')
			          const icon = r.weather[0].icon.substr(0, 2)
			          const temp = Math.floor(r.main.temp - 273.15) + 'º'
			          const div2 = $('<div>').addClass('weather-temp').append(temp)
			          const date = r.dt_txt.substr(5, 6)
			          const div3 = $('<div>').addClass('weather-date').append(date)
			          const span =
			            '<span class=material-symbols-outlined>' +
			            weatherIcon[icon] +
			            '</span>'
			          div1.append(span).append(div2).append(div3)
			          $('.weather-list').append(div1)
			        }
			      })
			    }
			  })
			})
	    });	
		
		$(".menu").eq(0).click()
		
	</script>
	
	
	
	
	<script>
		$(function() {
		  $("#starBtn").on("click",function() {
		    const campingReviewRating = $("[name=campingReviewRating]").val();
		    const starScore = campingReviewRating * 30;
		    $(".star-on-wrap").css("width", starScore + "px");
		  });
		});
	</script>
	
	<script>
		function loadImg(input) {
		  // 기존에 있는 이미지 삭제
		  $('#img-viewer img').remove();
		  
		  if (input.files && input.files.length > 0) {
		    for (let i = 0; i < input.files.length; i++) {
		      const reader = new FileReader();
		      reader.readAsDataURL(input.files[i]);
		      reader.onload = function(e) {
		        $("<img>").attr("src", e.target.result).attr("id", "img-" + i).appendTo("#img-viewer"); // 이미지를 보여줄 DOM 엘리먼트에 추가
		      }
		    }
		  }
		}
	</script>
	
	<script>
		$(".reviewBtn").on("click",function(){
			const campingReviewRating = $("[name=campingReviewRating]").val();
			const campingReviewTitle = $("[name=campingReviewTitle]").val();
			const campingReviewContent = $("[name=campingReviewContent]").val();
			if(!(campingReviewRating != "" && campingReviewTitle != "" && campingReviewContent != "")){
				alert("입력란을 모두 확인해주세요.")
				return false;
			}
		});
	</script>
	<script>
	$(document).ready(function() {
		  $('.review-modal-open-btn').click(function() {
		    $('#test-modal').css('display', 'flex');
		  });

		  $('.review-modal-close').click(function() {
		    $('#test-modal').css('display', 'none');
		  });
		});
	</script>
	
	<script>
		$("input[name='campingReviewRating']").on("input", function() {
		  var value = $(this).val();
		  var newValue = value.replace(/[^\d]/g, "");
		  if (newValue > 5) {
		    newValue = 5;
		  }
		  $(this).val(newValue);
		});
	</script>
</body>
</html>