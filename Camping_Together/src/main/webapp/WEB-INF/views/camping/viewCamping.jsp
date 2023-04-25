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
				<div id="campingAddr" class="camping-addr">${camping.campingAddr }</div>
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
					<c:choose>
							<c:when test="${empty sessionScope.m }">
								<button id="sendInquiryBtn" class="btn3 loginBtn">문의하기</button>
							</c:when>
							<c:otherwise>
								<button id="sendInquiryBtn" class="btn3" data-bs-toggle="modal" data-bs-target="#exampleModal">문의하기</button>
							</c:otherwise>
						</c:choose>
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
				<div class="menu"><button class="btn1">캠핑리뷰</button></div>
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
										<button onclick="changeDate();">찾기</button>
									</c:when>
									<c:otherwise>
										<input class="form-control" type="text" id="search_checkin" name="checkIn" readonly>
										<input class="form-control" type="text" id="search_checkout" name="checkOut" readonly>	
										<button onclick="changeDate();">찾기</button>
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
								</div>
								<div class="room-box">
									<div>${r.campingRoomTitle }</div>
									<div class="room-price-box">
										<div>가격</div>
										<div>${r.campingRoomPrice }</div>
									</div>
									<div class="room-basic-info">
										<a>
											<span>객실기본정보</span>
											<span class="material-symbols-outlined">chevron_right</span>
										</a>
									</div>
									<div class="room-btn-box">
										<%--결제하기 캠핑 정보 --%>
										<form action="reservationFrm.do?checkIn=${checkIn }&checkOut=${checkOut}" method="post">
											<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
											<input type="hidden" name="campingRoomNo" value="${r.campingRoomNo }">
											<input type="text" name="checkIn1"  value="${checkIn }">
											<input type="text" name="checkOut1" value="${checkOut }">
											<input type="hidden" name="campingTitle" value="${camping.campingTitle } ">
											<input type="hidden" name="campingType" value="${r.campingRoomTitle }">
											<input type="hidden" name="price" value="${r.campingRoomPrice }">
											<input type="hidden" name="addr" value="${camping.campingAddr }">
											<c:forEach items="${reservationList}" var="rl" varStatus="j">
											<c:if test="${rl.campingReservationNo eq null and  i.index eq j.index}">
    											<button type="submit" class="btn2 reservationBtn" style="width: 100%;">예약하기</button>
											</c:if>
    										<c:if test="${r.campingRoomNo eq rl.campingRoomNo}">
        										<div class="reservation" style="background-color: #e3e4e5; width: 100%; border-radius: 5px; color: white; text-align: center;">예약완료</div>
    										</c:if>
											</c:forEach>
										</form>
									</div>
								</div>
							</div>
							
									<!-- 객실 정보 collapse -->
							<div class="room-info-content collapse" id="collapse-${i.index}" style=" border-top : 1px solid #dedede;">
								<div class="card card-body" style="border: none; border-radius: 0; width : 80%; margin : 0 auto">
									<div class="card-title">
										<button type="button" class="btn-close"></button>
									</div>
									<div class="card-content">
										<div>
											<div>캠핑방 내용</div>
											<div>${r.campingRoomContent }</div>
										</div>
										<div class="room-detail-info">
											<div>
												<div>캠핑방 가격</div>
												<div>${r.campingRoomPrice } 원</div>
											</div>
											<div>
												<div>캠핑방 최대인원</div>
												<div>${r.campingRoomMaxPplCount } 명</div>
											</div>
											<div>
												<div>캠핑방 유형</div>
												<div>${r.campingRoomType }</div>
											</div>
										</div>
									</div>
					 		    </div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="content-hidden content-box">
				<div class="campingInfoWrap">
					<div class="campingInfo-campingAddr">
						<div>캠핑장 주소</div>
						<div>${camping.campingAddr }</div>
					</div>
					<div class="campingInfo-campingAddrDetail">
						<div>캠핑장 상세주소</div>					
						<div>${camping.campingAddrDetail }</div>
					</div>
					<div class="campingInfo-campingContent">
						<div>캠핑장 내용</div>
						<textarea readonly>${camping.campingContent }</textarea>
					</div>
				</div>
				<div class="campingInfoMap">
					<div>캠핑장 위치</div>
					<div id="map" style="width:100%; height:500px;"></div>
				</div>
			</div>
			<div class="content-hidden content-box">
				<div class="reviewWrap">
					<div class="reviewContentWrap">
						<div class="reviewHeader">
							<h2 style="text-align: center; padding-bottom: 30px; padding-top: 30px;">${camping.campingTitle }</h2>
							<div class="allStar">
							    <c:choose>
							        <c:when test="${campingReviewRatingAvg > 0}">
							            <c:forEach begin="1" end="${campingReviewRatingAvg}">
							                <span class="material-symbols-outlined filled-star" style="color: gold;">star</span>
							            </c:forEach>
							        </c:when>
							        <c:otherwise>
							            <p>등록된 리뷰가 없습니다</p>
							        </c:otherwise>
							    </c:choose>
							</div>
							<div>
								<div class="allReview">전체 리뷰 ${campingReviewCount-campingReviewCommentCount }</div>
								<div class="campingAnswer">캠핑장 답변 ${campingReviewCommentCount }</div>
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
						    		<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
							      	<table>
							      		<tr>
							      			<td colspan="2" style="text-align: center;">만족하셨나요?</td>
							      		</tr>
							      		<tr>
										    <td colspan="2" style="padding-bottom: 25px;">
										      <div class="star-wrap star-wrap2">
										        <span class="material-symbols-outlined filled-star" style="padding-left: 175px;">star</span>
										        <span class="material-symbols-outlined filled-star">star</span>
										        <span class="material-symbols-outlined filled-star">star</span>
										        <span class="material-symbols-outlined filled-star">star</span>
										        <span class="material-symbols-outlined filled-star">star</span>
										    </div>
										    </td>
										</tr>
										<tr>
										    <td>
										      <input type="hidden" name="campingReviewRating" id="campingReviewRating">
										    </td>
									    </tr>
							      		<tr>
							      			<td style="padding-bottom: 20px; padding-left: 20px; width: 114px;"">리뷰제목</td>
							      			<td style="padding-bottom: 20px;">
							      				<input type="text" name="campingReviewTitle" style="width: 100%">
							      			</td>
							      		</tr>
							      		<tr>
							      			<td colspan="2" style="padding-bottom: 10px;">
							      				<textarea name="campingReviewContent" placeholder="솔직한 리뷰를 남겨주세요!"></textarea>
							      			</td>
							      		</tr>
							      		<tr>
										  <td style="padding-left: 20px;">사진 등록</td>
										  <td>
										    <input type="file" onchange="loadImg(this);" id="campingReviewFilepath" name="campingReviewFilepath" style="display: none;" multiple>
										    <label for="campingReviewFilepath">
										    	<span class="material-symbols-outlined photoCamera" style="font-size: 50px;">photo_camera</span>
										    </label>
										  </td>
										</tr>
							      	</table>
							      		<div id="img-viewer" style="padding-top: 20px;">
										    
									    </div>
							   		</div>
							    <div class="review-modal-foot">
							      <button type="submit" class="reviewBtn bc1" style="border: none; background-color: transparent;">등록</button>
							      <button type="button" class="btn bc1 review-modal-close">취소</button>
							    </div>
						    </form>
						  </div>
						</div>
						
					<c:forEach items="${campingReview }" var="cr" varStatus="i">
							<div style="margin-top: 50px;">
						        <ul class="posting-comment">
						          <li style="padding-left: 90px;">
						            <span class="material-icons">account_box</span>
						          </li>
						          <li>
						            <p class="comment-info" style="margin-bottom: 0;">
						              <span style="font-size: 20px;font-weight: 900;">${cr.campingReviewTitle }</span>
						            </p>
						            <p style="padding-left: 10px;">
						            	<c:forEach begin="1" end="${cr.campingReviewRating }" var="star">
										    <span class="material-symbols-outlined filled-star" style="color: gold;">star</span>
										</c:forEach>
						            </p>
						            <p class="comment-content">${cr.campingReviewContent }</p>
						            
						            
						            <!-- 캐러셀 컨테이너 정의 -->
									<div id="carouselExampleControls-${i.index }" class="carousel slide" data-bs-ride="carousel" style="width: 500px;">
									  <!-- 캐러셀 내용 정의 -->
									  	<div class="carousel-inner" style="${empty cr.fileList ? 'height:0;' : ''}">
									  		<c:forEach items="${cr.fileList }" var="f" varStatus="j">
												<c:choose>
													<c:when test="${j.index == 0 }">
														<div class="carousel-item active">
															<img src="resources/upload/campingReview/${f.filepath }" style="width: 500px; height: 500px;">
														</div>
													</c:when>
													<c:otherwise>
														<div class="carousel-item">
															<img src="resources/upload/campingReview/${f.filepath }" style="width: 500px; height: 500px;">
														</div>
													</c:otherwise>
												</c:choose>
											<c:if test="${cr.fileList.size() > 1 }">
											  <!-- 이전/다음 버튼 정의 -->
											  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls-${i.index }" data-bs-slide="prev">
											    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">이전</span>
											  </button>
											  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls-${i.index }" data-bs-slide="next">
											    <span class="carousel-control-next-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">다음</span>
											  </button>
											 </c:if>
											</c:forEach>	
										</div>
									  
									</div>
						            <p class="comment-link">
						            <c:if test="${not empty sessionScope.m && cr.memberId eq sessionScope.m.memberId }">
						              <button class="review-modal-open-btn2" target="#update-modal"  onclick="openReviewModal(${cr.campingReviewNo})">
							          	수정
							          </button>
						              <a href="javascript:void(0)" onclick="deleteComment(this,${cr.campingReviewNo },${camping.campingNo })">삭제</a>
						            </c:if>
						              
					                <c:if test="${not empty sessionScope.m && camping.memberId eq sessionScope.m.memberId }">
						              <a href="javascript:void(0)" class="recShow"><span class="material-symbols-outlined">sms</span></a>
						            </c:if>
						            </p>
									    <div id="update-modal" class="review-modal-bg2" style="z-index: 1000;">
										  <div class="review-modal-wrap2">
										    <div class="review-modal-head2">
										      <h2>리뷰 수정</h2>
										      <span class="material-icons close-icon review-modal-close2">close</span>
										    </div>
										    <div class="review-modal-content2">
										    	<form action="/updateCampingReview.do" method="post" enctype="multipart/form-data">
										    		<input type="hidden" name="campingNo" value="${camping.campingNo }">
										    		<input type="hidden" name="campingReviewNo">
											      	<table>
											      		<tr>
											      			<td colspan="2" style="text-align: center;">만족하셨나요?</td>
											      		</tr>
											      		<tr>
														    <td colspan="2" style="padding-bottom: 25px;">
														      <div class="star-wrap1 star-wrap22">
														        <span class="material-symbols-outlined filled-star" style="padding-left: 175px;">star</span>
														        <span class="material-symbols-outlined filled-star">star</span>
														        <span class="material-symbols-outlined filled-star">star</span>
														        <span class="material-symbols-outlined filled-star">star</span>
														        <span class="material-symbols-outlined filled-star">star</span>
														      </div>
														    </td>
														</tr>
														<tr>
														    <td>
										      				  <input type="hidden" name="campingReviewRating" id="campingReviewRating2">
														    </td>
													    </tr>
											      		<tr>
											      			<td style="padding-bottom: 20px; padding-left: 20px; width: 114px;">리뷰제목</td>
											      			<td style="padding-bottom: 20px;">
											      				<input type="text" name="campingReviewTitle" style="width: 100%">
											      			</td>
											      		</tr>
											      		<tr>
											      			<td colspan="2" style="padding-bottom: 10px;">
											      				<textarea name="campingReviewContent"></textarea>
											      			</td>
											      		</tr>
											      		<tr>
											      			<td style="padding-left: 20px;">사진 추가</td>
											      			<td>
											      				<input type="file" onchange="loadImg2(this);" id="campingReviewFilepath2" name="campingReviewFilepath" multiple style="display: none;">
											      				<label for="campingReviewFilepath2">
															    	<span class="material-symbols-outlined photoCamera" style="font-size: 50px;">photo_camera</span>
															    </label>
											      			</td>
											      		</tr>
											      	</table>
											      	<div id="img-viewer2" style="padding-top: 20px;">
									        			
						                    		</div>
											    </div>
											    <div class="review-modal-foot2">
											      <button type="submit" class="reviewBtn2 bc1" style="border: none; background-color: transparent;">수정</button>
											      <button type="button" class="btn bc1 review-modal-close2">취소</button>
											    </div>
										    </form>
										  </div>
										</div>
						          </li>
						        </ul>
					        	
					        	<c:forEach items="${campingReviewComment }" var="crc">
					        		<c:if test="${crc.campingReviewRef == cr.campingReviewNo }">
								        <ul class="posting-comment reply">
								          <li style="padding-left: 90px;">
								            <span class="material-icons">subdirectory_arrow_right</span>
								            <span class="material-icons">account_box</span>
								          </li>
								          <li>
								            <p class="comment-info">
								              <span>${crc.memberId }</span>
								            </p>
								            <p class="comment-content">${crc.campingReviewContent }</p>
								            <textarea name="campingReviewContent" class="input-form hide-textarea" style="min-height:96px;display:none;width: 930px;">${crc.campingReviewContent }</textarea>
								            <p class="comment-link">
								            <c:if test="${not empty sessionScope.m && crc.memberId eq sessionScope.m.memberId }">
								              <a href="javascript:void(0)" onclick="updateComment2(this,${crc.campingReviewNo },${camping.campingNo })">수정</a>
								              <a href="javascript:void(0)" class="deleteComment2" onclick="deleteComment2(this,${crc.campingReviewNo },${camping.campingNo })">삭제</a>
								              </c:if>
								            </p>
								          </li>
								        </ul>
							        </c:if>
						        </c:forEach>
				      		</div>
			      		
			      		<div class="inputCommentBox inputRecommentBox">
							<form action="/insertReviewComment.do" method="post">
								<ul class="comment-ul">
									<li>
										<span class="material-icons" style="font-size:100px;">subdirectory_arrow_right</span>
									</li>
									<li>
										<input type="hidden" name="memberId" value="user01">
										<input type="hidden" name="campingNo" value="${camping.campingNo }">
										<input type="hidden" name="campingReviewRef" value="${cr.campingReviewNo }">
										<textarea name="campingReviewContent" class="input-form" style="min-height: 100px;" placeholder="댓글을 입력해주세요" required></textarea>
									</li>
									<li>
										<button type="submit" class="btn bc1 bs2">등록</button>
									</li>
								</ul>
							</form>
						</div>
					</c:forEach>
					    
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/camping/dateRangePicker.js"></script>
	<script>
		let map;
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
		
		function changeDate(){
			const checkIn = $("#search_checkin").val()
			const checkOut = $("#search_checkout").val()
			const campingNo = $("input[name=campingNo]").val();
			location.href="/viewCamping.do?campingNo="+campingNo+"&checkIn="+checkIn+"&checkOut="+checkOut;
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
			if(index == 1){
				map.autoResize();
			}
		})

		$(".menu>button").eq(0).click()
		
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
		
		const carousel = $(".carousel");
		carousel.each(function(i, c){
			const id = $(c).attr("id");
			new bootstrap.Carousel('#'+id, {
				ride : false
			})
		})
		
		$(function(){
			carousel.carousel('pause'); 
		})
		
		const roomInfoContent = $(".room-info-content")
		const roomInfo = $(".room-basic-info");
		roomInfo.each(function(i,r){
			$(r).find("a").attr("data-bs-toggle","collapse").attr("href", "#"+roomInfoContent.eq(i).attr("id"));
			roomInfoContent.find("button").eq(i).attr("data-bs-toggle","collapse").attr("href", "#"+roomInfoContent.eq(i).attr("id"));
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
			      resp.list.forEach(r =>  {
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
		
		/* 네이버 지도 api */
		function startMap(){
			const campingAddr = $("#campingAddr").text();
			
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
		        
		        map = new naver.maps.Map("map",{
					center : new naver.maps.LatLng(lat, lng),
					zoom : 10,
					zoomControl : true,
					zoomControlOptions : {
						position : naver.maps.Position.TOP_RIGHT,
						style : naver.maps.ZoomControlStyle.SMALL
					}
		        });
		        
		        const marker = new naver.maps.Marker({
					position : new naver.maps.LatLng(lat, lng), 
					map : map
				})
				
				naver.maps.Event.addListener(marker,"click",function(e){
					//생성된 infoWindow를 map의 marker위치에 생성
					infoWindow.open(map, marker);
				})
		        
		    });	
		}
		
		$(function(){
			startMap();
		})
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
		
		const stars = $(".star-wrap2>span");
		stars.on("mouseover",function(){
		    stars.css("color","lightgray");
		    const index = stars.index(this);
		    for(let i=0;i<=index;i++){
		        stars.eq(i).css("color","gold");
		    }
		    $("[name=campingReviewRating2]").val(index+1 + "점");
		    $("#campingReviewRating").val(index+1);
		});
		
		const stars2 = $(".star-wrap1>span");
		stars2.on("mouseover",function(){
		    stars2.css("color","lightgray");
		    const index = stars2.index(this);
		    for(let i=0;i<=index;i++){
		        stars2.eq(i).css("color","gold");
		    }
		    $("#campingReviewRating2").val(index+1);
		});
	</script>
	
	<script>
		function loadImg(input) {
			  
			  if (input.files && input.files.length > 0) {
			    for (let i = 0; i < input.files.length; i++) {
			      const reader = new FileReader();
			      reader.readAsDataURL(input.files[i]);
			      reader.onload = function(e) {
			    	  const imgWrapper2 = $("<div>").addClass("img-wrapper2");
				        const img2 = $("<img>").attr("src", e.target.result)
				                              .addClass("review-img2");
				        const deleteBtn2 = $("<button>").text("삭제")
				                                        .addClass("delete-btn2")
				                                        .attr("type", "button").attr("onclick", "delNewPhoto(this)");
				        imgWrapper2.append(img2).append(deleteBtn2).appendTo("#img-viewer");
				        
				        deleteBtn2.on("click", function() {
				        	
				        	  $(this).parent().remove();
				        	});
			        
			      }
			    }
			  }
			}campingReviewFilepath
		
		
	</script>
	
	<script>
		function delNewPhoto(obj){
			const fileNum = $(".img-wrapper2").index($(obj).parent());
			const dataTransfer = new DataTransfer();
		    
		    let files = $('#campingReviewFilepath')[0].files;	//사용자가 입력한 파일을 변수에 할당
		    
		    let fileArray = Array.from(files);	//변수에 할당된 파일을 배열로 변환(FileList -> Array)
		    
		    fileArray.splice(fileNum, 1);	//해당하는 index의 파일을 배열에서 제거
		    
		    fileArray.forEach(file => { dataTransfer.items.add(file); });
		    //남은 배열을 dataTransfer로 처리(Array -> FileList)
		    
		    $('#campingReviewFilepath')[0].files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
		   console.log($(obj).parent())
		    $(obj).parent().remove();
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
		$(".recShow>span").on("click",function(){
			const idx = $(".recShow>span").index(this);
			if($(this).text()=="sms"){
				$(this).text("close");
			}else{
				$(this).text("sms");
			}
			$(".inputRecommentBox").eq(idx).toggle();
			$(".inputRecommentBox").eq(idx).find("textarea").focus();
		});
	</script>
	
	<script>
		function deleteComment(obj,campingReviewNo,campingNo){
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href="/deleteCampingReview.do?campingReviewNo="+campingReviewNo+"&campingNo="+campingNo;
			}
		}
		
	</script>
	
	<script>
		function deleteComment2(obj,campingReviewNo,campingNo){
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href="/deleteCampingReviewComment.do?campingReviewNo="+campingReviewNo+"&campingNo="+campingNo;
			}
		}
		
	</script>
	
	<script>
		$(document).ready(function() {
			  $('.review-modal-open-btn2').click(function() {
			    $('#update-modal').css('display', 'flex');
			  });
	
			  $('.review-modal-close2').click(function() {
			    $('#update-modal').css('display', 'none');
			  });
			});
	</script>
	
	<script>
		$(".updateStar").on("input", function() {
		  var value = $(this).val();
		  var newValue = value.replace(/[^\d]/g, "");
		  if (newValue > 5) {
		    newValue = "";
		  }
		  $(this).val(newValue);
		});
	</script>
	
	<script>
		$(function() {
		  $("#starBtn2").on("click",function() {
		    const campingReviewRating = $(".updateStar").val();
		    const starScore = campingReviewRating * 30;
		    $(".star-on-wrap2").css("width", starScore + "px");
		  });
		});
	</script>
	
	<script>
		function updateComment2(obj, campingReviewNo, campingNo){
			//숨겨놓은 textarea를 화면에 보여줌
			$(obj).parents("li").eq(0).find("textarea").show();
			//화면에 있던 댓글내용(p태그)를 숨김
			$(obj).parent().next().next().hide();
			//수정 -> 수정완료
			$(obj).text("수정완료");
			$(obj).attr("onclick","modifyComplete(this,"+campingReviewNo+","+campingNo+")");
			//삭제 -> 수정취소
			$(".deleteComment2").text("수정취소");
			$(".deleteComment2").attr("onclick","modifyCancel(this,"+campingReviewNo+","+campingNo+")");
			//답글달기버튼 삭제
			$(obj).next().next().hide();
		}
		
		function modifyCancel(obj,campingReviewNo, campingNo){
			$(".hide-textarea").hide();
			$("show-content").show();
			//수정완료 -> 수정
			$(obj).prev().text("수정");
			$(obj).prev().attr("onclick","updateComment2(this,"+campingReviewNo+","+campingNo+")");
			//수정취소 -> 삭제
			$(obj).text("삭제");
			$(obj).attr("onclick","deleteComment2(this,"+campingReviewNo+","+campingNo+")");
			//답글달기 버튼 다시 보여줌
			$(obj).next().show();
		}
		
		function modifyComplete(obj,campingReviewNo, campingNo){
			//form태그를 생성해서 전송
			//댓글내용, 댓글번호, 공지사항번호
			//1. form태그 생성
			const form=$("<form style='display:none;' action='/updateReviewComment.do' method='post'></form>");
			//2. input태그 2개 숨김
			const campingReviewNoInput = $("<input type='text' name='campingReviewNo'>");
			campingReviewNoInput.val(campingReviewNo);
			const campingNoInput = $("<input type='text' name='campingNo'>");
			campingNoInput.val(campingNo);
			//3. textarea
			const campingReviewContent = $(obj).parents("li").eq(0).find("textarea").clone();
			//4. form태그에 input, textarea를 모두 포함
			form.append(campingReviewNoInput).append(campingNoInput).append(campingReviewContent);
			//5. 생성된 form태그를 body태그에 추가
			$("body").append(form);
			//form태그를 전송
			form.submit();
		}
	</script>
	
	<script>
	function loadImg2(input) {
		  
		  if (input.files && input.files.length > 0) {
		    for (let i = 0; i < input.files.length; i++) {
		      const reader = new FileReader();
		      reader.readAsDataURL(input.files[i]);
		      reader.onload = function(e) {
		        const imgWrapper = $("<div>").addClass("img-wrapper");
		        const img = $("<img>").attr("src", e.target.result)
		                              .addClass("review-img");
		        const deleteBtn = $("<button>").text("삭제")
		                                        .addClass("delete-btn")
		                                        .attr("type", "button").attr("onclick", "delNewPhoto2(this)");
		        imgWrapper.append(img).append(deleteBtn).appendTo("#img-viewer2");
		        
		        deleteBtn.on("click", function() {
		        	
		        	  $(this).parent().remove();
		        	});
		      }
		    }
		  }
		}
	
	function delNewPhoto2(obj){
		const fileNum = $(".img-wrapper").index($(obj).parent());
		const dataTransfer = new DataTransfer();
	    
	    let files = $('#campingReviewFilepath2')[0].files;	//사용자가 입력한 파일을 변수에 할당
	    
	    let fileArray = Array.from(files);	//변수에 할당된 파일을 배열로 변환(FileList -> Array)
	    
	    fileArray.splice(fileNum, 1);	//해당하는 index의 파일을 배열에서 제거
	    
	    fileArray.forEach(file => { dataTransfer.items.add(file); });
	    //남은 배열을 dataTransfer로 처리(Array -> FileList)
	    
	    $('#campingReviewFilepath2')[0].files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
	   console.log($(obj).parent())
	    $(obj).parent().remove();
	}
	
	
	function openReviewModal(campingReviewNo) {
		var modal = $("#update-modal");
		var form = modal.find("form");
		console.log(campingReviewNo);
		
		// campingReviewNo를 이용하여 리뷰 정보를 가져온다.
		$.ajax({
			url: "/getReviewInfo.do",
			type: "get",
			data: {
				campingReviewNo: campingReviewNo
			},
			dataType: "json",
			success: function(result) {
				console.log(result);
				form.find(".star-on-wrap2 span").removeClass("star-on");  // 모든 요소에서 star-on 클래스 제거
				form.find(".star-on-wrap2 span:lt(" + result.campingReviewRating + ")").addClass("star-on");  // 입력된 별점 값에 해당하는 index까지 star-on 클래스 추가
				form.find("input[name='campingReviewRating']").val(result.campingReviewRating);  // 별점 값을 input 태그에 설정
				form.find("input[name='campingReviewTitle']").val(result.campingReviewTitle);
				form.find("input[name='campingReviewNo']").val(result.campingReviewNo);
				form.find("textarea[name='campingReviewContent']").val(result.campingReviewContent);
				// 이미지 뷰어 초기화
				var imgViewer = form.find("#img-viewer2");
				imgViewer.empty();
				// 등록된 이미지가 있으면 이미지 뷰어에 추가한다.
				var fileList = result.fileList;
				if (fileList != null && fileList.length > 0) {
					 for (let i = 0; i < fileList.length; i++) {
					        var imgWrapper = $("<div>").addClass("img-wrapper");
					        var img = $("<img>").attr("src", "resources/upload/campingReview/" + fileList[i].filepath).addClass("review-img");
					        var deleteBtn = $("<button>").text("삭제").addClass("delete-btn").attr("type", "button").attr("campingReviewPhotoNo", fileList[i].campingReviewPhotoNo)
			                  																					   .attr("filepath", fileList[i].filepath);
					        imgWrapper.append(img).append(deleteBtn);
					        imgViewer.append(imgWrapper);
					        
					    }
					 $(".delete-btn").on("click", function() {
						  var fileNo = $(this).attr("campingReviewPhotoNo");
						  var filepath = $(this).attr("filepath");
				          $(this).parent().remove();
				          var fileNoInput = $("<input>").attr("type", "hidden")
                          .attr("name", "campingReviewPhotoNo")
                          .val(fileNo);
							var filepathInput = $("<input>").attr("type", "hidden")
							                            .attr("name", "filepath")
							                            .val(filepath);
							
							// form 태그에 input 태그 추가
							$("form").append(fileNoInput).append(filepathInput);
					    });
				}
				const rating = parseInt($("#campingReviewRating2").val());

				  // 가져온 값만큼 별점을 금색으로 채움
				  const stars = $(".star-wrap22>span");
				  for (let i = 0; i < rating; i++) {
				    stars.eq(i).css("color", "gold");
				  }
				// 모달을 띄운다.
				modal.show();
			},
			error: function(error) {
				console.log(error);
				alert("리뷰 정보를 가져오지 못했습니다.");
			}
		});
	}
	
	
	// 모달 닫기
	$(".review-modal-close2").on("click", function() {
		$(this).parents(".review-modal-bg2").hide();
	});
	
</script>
<script>
	//결제
 		var memberId = $(".memberId").val();
		var memberPhone = $(".memberPhone").val();
		var memberEmail = $(".memberEmail").val();
		var campingTitle = $(".camping-title").text();
		var campingType = $(".camping-Type").text();
		var price = $(".price").text();
		$(".reservationBtn").on("click",function(){
		var checkIn = $("[name=checkIn]").val();
		$("[name=checkIn1]").val(checkIn);
		var checkOut = $("[name=checkOut]").val();
		$("[name=checkOut1]").val(checkOut);
					
		});
	
		$("[name=checkOut]").on("change",function(){
		var checkIn = $("[name=checkIn]").val();
		var checkOut = $("[name=checkOut]").val();
		$("[name=checkIn1]").val(checkIn);
		$("[name=checkOut1]").val(checkOut);
					
		});
		
		$(".reservation").on("click",function(){
			alert("예약완료");
		});
	</script>
</body>
</html>