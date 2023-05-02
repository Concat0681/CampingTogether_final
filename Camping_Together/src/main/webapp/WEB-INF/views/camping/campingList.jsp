<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=jx1rdgburv&submodules=geocoder"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="/resources/css/camping/campingList.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-wrap">
		<input type="hidden" id="memberId" value=${sessionScope.m.memberId }>
		<c:choose>
			<c:when test="${not empty cityNameEN }">
				<div class="page-header" style="background-image: url(/resources/image/camping/${cityNameEN }.jpg); height: 600px;">
					<div class="page-header-title">${cityNameKR } 캠핑가자</div>
					<jsp:include page="/WEB-INF/views/camping/campingListHeader.jsp" />
				</div>
			</c:when>
			<c:otherwise>
				<div class="page-header" style="background-image: url(/resources/image/camping/sido/${campingSido }.jpg); height: 600px;">
					<div class="page-header-title">${campingSido }도 캠핑가자</div>
					<jsp:include page="/WEB-INF/views/camping/campingListHeader.jsp" />
				</div>
			</c:otherwise>
		</c:choose>
		<div class="page-content">
			<div class="sidebar-menu">
				<div class="menu">
					<div class="menu-title">날짜</div>
					<div class="input-group date-input-wrap">
						<label class="input-group-text" for="detail_search_checkin"><span class="material-symbols-outlined">calendar_month</span></label>
						<c:choose>
							<c:when test="${not empty checkIn }">
								<input class="form-control" type="text" id="detail_search_checkin" name="checkIn" value="${checkIn }" >
								<input class="form-control" type="text"  id="detail_search_checkout" name="checkOut" value="${checkOut }">
							</c:when>
							<c:otherwise>
								<input class="form-control" type="text" id="detail_search_checkin" name="checkIn">
								<input class="form-control" type="text"  id="detail_search_checkout" name="checkOut">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="menu">
					<div class="menu-title">상세조건</div>
					<input type=hidden id="cityAddr" name="cityAddr" value="${cityNameKR }">
					<input type=hidden id="campingSido" name="campingSido" value="${campingSido }">
					<div class="box button-wrap">
						<button class="btn2" type="button" onclick="resetInputs();">초기화</button>
						<button class="btn3" type="button" onclick="sendDetailSearch(null, 1);">적용</button>
					</div>
					<div class="sub-menu">
						<div class="menu-title">캠핑유형</div>
						<div class="checkbox-wrap">
							<div class="input-box">
								<input id="autoCamping" type="checkbox" name="campingType" value="오토캠핑">
								<label for="autoCamping">오토캠핑</label>
							</div>
							<div class="input-box">
								<input id="glenCamping" type="checkbox" name="campingType" value="글램핑">
								<label for="glenCamping">글램핑</label>
							</div>
							<div class="input-box">
								<input id="caraban" type="checkbox" name="campingType" value="카라반">
								<label for="caraban">카라반</label>
							</div>
						</div>
					</div>
					<div class="sub-menu">
						<div class="ppl-count-wrap box">
							<div class="menu-title sub-menu-title">인원</div>
							<div class="ppl-count-input-wrap">
								<span id="minus" class="material-symbols-outlined">remove</span>
								<c:choose>
									<c:when test="${not empty pplCount }">
										<input type="text" name="ppl_count" value=${pplCount }>
									</c:when>
									<c:otherwise>
										<input type="text" name="ppl_count" value=1>
									</c:otherwise>
								</c:choose>
								<span id="plus" class="material-symbols-outlined">add</span>
							</div>
						</div>
					</div>
				</div>
				<div class="menu">
					<div class="menu-title">공용시설</div>
					<div class="box input-wrap">
						<div class="input-box">
							<input id="electric" type="checkbox" name="campingService" value="전기사용가능">
							<label for="electric">전기사용가능</label>
						</div>
						<div class="input-box">
							<input id="BBQ" type="checkbox" name="campingService" value="BBQ">
							<label for="BBQ">BBQ</label>
						</div>
						<div class="input-box">
							<input id="개수대" type="checkbox" name="campingService" value="개수대">
							<label for="개수대">개수대</label>
						</div>
						<div class="input-box">
							<input id="공용샤워실" type="checkbox" name="campingService" value="공용샤워실">
							<label for="공용샤워실">공용샤워실</label>
						</div>
						<div class="input-box">
							<input id="인터넷" type="checkbox" name="campingService" value="인터넷">
							<label for="인터넷">인터넷</label>
						</div>
						<div class="input-box">
							<input id="매점" type="checkbox" name="campingService" value="매점">
							<label for="매점">매점</label>
						</div>
						<div class="input-box">
							<input id="공용화장실" type="checkbox" name="campingService" value="공용화장실">
							<label for="공용화장실">공용화장실</label>
						</div>
						<div class="input-box">
							<input id="물놀이시설" type="checkbox" name="campingService" value="물놀이시설">
							<label for="물놀이시설">물놀이시설</label>
						</div>
						<div class="input-box">
							<input id="카페" type="checkbox" name="campingService" value="카페">
							<label for="카페">카페</label>
						</div>
						<div class="input-box">
							<input id="편의점" type="checkbox" name="campingService" value="편의점">
							<label for="편의점">편의점</label>
						</div>
						<div class="input-box">
							<input id="노래방" type="checkbox" name="campingService" value="노래방">
							<label for="노래방">노래방</label>
						</div>
						<div class="input-box">
							<input id="주방/식당" type="checkbox" name="campingService" value="주방/식당">
							<label for="주방/식당">주방/식당</label>
						</div>
						<div class="input-box">
							<input id="세탁기" type="checkbox" name="campingService" value="세탁기">
							<label for="세탁기">세탁기</label>
						</div>
						<div class="input-box">
							<input id="건조기" type="checkbox" name="campingService" value="건조기">
							<label for="건조기">건조기</label>
						</div>
						<div class="input-box">
							<input id="탈수기" type="checkbox" name="campingService" value="탈수기">
							<label for="탈수기">탈수기</label>
						</div>
						<div class="input-box">
							<input id="공용PC" type="checkbox" name="campingService" value="공용PC">
							<label for="공용PC">공용PC</label>
						</div>
						<div class="input-box">
							<input id="주차장" type="checkbox" name="campingService" value="주차장">
							<label for="주차장">주차장</label>
						</div>
						<div class="input-box">
							<input id="라운지" type="checkbox" name="campingService" value="라운지">
							<label for="라운지">라운지</label>
						</div>
						<div class="input-box">
							<input id="전자레인지" type="checkbox" name="campingService" value="전자레인지">
							<label for="전자레인지">전자레인지</label>
						</div>
						<div class="input-box">
							<input id="취사가능" type="checkbox" name="campingService" value="취사가능">
							<label for="취사가능">취사가능</label>
						</div>
					</div>
				</div>
				<div class="menu">
					<div class="menu-title">객실내시설</div>
					<div class="box input-wrap">
						<div class="input-box">
							<input type="checkbox" id="serviceCheck21" name="campingRoomService" value="객실샤워실">
        					<label for="serviceCheck21">객실샤워실</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck22" name="campingRoomService" value="드라이기">
        					<label for="serviceCheck22">드라이기</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck23" name="campingRoomService" value="와이파이">
        					<label for="serviceCheck23">와이파이</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck24" name="campingRoomService" value="TV">
        					<label for="serviceCheck24">TV</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck25" name="campingRoomService" value="욕실용품">
        					<label for="serviceCheck25">욕실용품</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck26" name="campingRoomService" value="미니바">
       						<label for="serviceCheck26">미니바</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck27" name="campingRoomService" value="에어컨">
       						<label for="serviceCheck27">에어컨</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck28" name="campingRoomService" value="냉장고">
       						<label for="serviceCheck28">냉장고</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck29" name="campingRoomService" value="욕조">
       						<label for="serviceCheck29">욕조</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck30" name="campingRoomService" value="다리미">
       						<label for="serviceCheck30">다리미</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck31" name="campingRoomService" value="전기밥솥">
       						<label for="serviceCheck31">전기밥솥</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck32" name="campingRoomService" value="객실스파">
       						<label for="serviceCheck32">객실스파</label>
						</div>
						<div class="input-box">
							<input type="checkBox" id="serviceCheck33" name="campingRoomService" value="세면도구">
       						<label for="serviceCheck33">세면도구</label>
						</div>
					</div>
				</div>
				<div class="menu">
					<div class="menu-title">기타</div>
					<div class="box input-wrap">
						<div class="input-box">
							<input type="checkbox" id="serviceCheck34" name="campingEtc" value="장비대여">
       						<label for="serviceCheck34">장비대여</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck35" name="campingEtc" value="사이트주차">
       						<label for="serviceCheck35">사이트주차</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck36" name="campingEtc" value="카드결제">
       						<label for="serviceCheck36">카드결제</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck37" name="campingEtc" value="조식포함">
       						<label for="serviceCheck37">조식포함</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck38" name="campingEtc" value="객실내흡연">
       						<label for="serviceCheck38">객실내흡연</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck39" name="campingEtc" value="발렛파킹">
       						<label for="serviceCheck39">발렛파킹</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck40" name="campingEtc" value="반려견동반">
       						<label for="serviceCheck40">반려견동반</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck41" name="campingEtc" value="객실내취사">
       						<label for="serviceCheck41">객실내취사</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck42" name="campingEtc" value="픽업가능">
       						<label for="serviceCheck42">픽업가능</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck43" name="campingEtc" value="캠프파이어">
       						<label for="serviceCheck43">캠프파이어</label>
						</div>
						<div class="input-box">
							<input type="checkbox" id="serviceCheck44" name="campingEtc" value="금연">
       						<label for="serviceCheck44">금연</label>
						</div>
					</div>
				</div>
			</div>
			<div class="campingList-content">
				<div class="campingList-header">
					<button class="order-menu clicked" type="button" id="avgReviewRating" onclick="sendOrder(this, 1);">평점순</button>
					<button class="order-menu btn1" type="button" id="maxRoomPrice" onclick="sendOrder(this, 1);">가격순</button>
					<button class="order-menu btn1" type="button" name="viewByMap">지도로 보기</button>
				</div>
				<div class="campingList-box">
					<div class="list-by-review">
						<c:if test="${empty list }">
							<div class="no-result-wrap">
								<img src="/resources/image/logo/logo250x80.png">
								<h3>검색결과가 없습니다</h3>
							</div>
						</c:if>
						<c:forEach items="${list }" var="c">
							<div class="camping-box" onclick="viewCamping('${c.campingNo }','${checkIn }','${checkOut }')">
								<div>
									<img src="resources/upload/camping/${c.filepath}">	
								</div>
								<div>
									<div class="camping-room-info">
										<div class="campingTitle">${c.campingTitle }</div>
										<div class="campingAddr">${c.campingAddr }</div>
										<div>${c.avgReviewRating } 점</div>
									</div>
									<div>
										<div>${c.maxRoomPrice } 원</div>
									</div>
								</div>
							</div>
						</c:forEach>	
						<div class="pagination">${pageNavi }</div>
					</div>
					<div class="hidden list-by-map">
						<div id="map" style="width:100%; height:700px;"></div>
					</div>
					<div id="allList" class="hidden">
						<c:forEach items="${allList }" var="c">
								<div class="allCampingNo">${c.campingNo }</div>
								<div class="allCampingPhoto">${c.filepath }</div>			
								<div class="allCampingTitle"><a href="/viewCamping.do?campingNo=${c.campingNo }&checkIn=${checkIn}&checkOut=${checkOut}">${c.campingTitle }</a></div>				
								<div class="allCampingAddr">${c.campingAddr }</div>
								<div class="allCampingAvgRating">${c.avgReviewRating }</div>
								<div class="allCampingCountRating">${c.countReviewRating }</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		let map;
		$("#minus").on("click", function(){
			const number = $("input[name=ppl_count]").val();
			if(number >= 1){
				$("input[name=ppl_count]").val(number -1);	
			}			
		})
		$("#plus").on("click", function(){
			const number = $("input[name=ppl_count]").val();
			if(number <= 100){
				$("input[name=ppl_count]").val(number - 1 + 2);	
			}			
		})
		
		function sendOrder(obj , reqPage){
			const order = $(obj).attr("id");
			$(".list-by-map").addClass("hidden")
			$(".list-by-review").removeClass("hidden")
			sendDetailSearch(order, reqPage);
		}
		
		$(".order-menu").on("click", function(){
			$(".order-menu").removeClass("clicked").removeClass("btn1").addClass("btn1");
			$(this).addClass("clicked").removeClass("btn1")
		})
		
		function sendNavi(reqPage){
			const order = $(".clicked").attr("id")
			sendDetailSearch(order, reqPage);
		}
		
		$("[name=viewByMap]").on("click", function(){
			$(".list-by-map").removeClass("hidden")
			$(".list-by-review").addClass("hidden");
			map.autoResize();
		})
		
		function resetInputs(){
			$("input[name=campingType]").prop("checked", false);
			$("input[name=campingService]").prop("checked", false);
			$("input[name=campingRoomService]").prop("checked", false);
			$("input[name=campingEtc]").prop("checked", false);
			$("input[name=ppl_count]").val(1);	
			$("#detail_search_checkin").val("");
			$("#detail_search_checkout").val("");
		}
		
		/* 네이버 지도 api */
		function startMap(){
			const cityAddr = $("#cityAddr").val();
			const sido = $("#campingSido").val();
			var zoomMap = null;
			var searchAddr = null;
			if(cityAddr == ""){
				searchAddr = sido;
				zoomMap = 9;
			} else {
				searchAddr = cityAddr;
				zoomMap = 11;
			}
			naver.maps.Service.geocode({
		        address: searchAddr
		    }, function(status, response) {
		        if (status !== naver.maps.Service.Status.OK) {
		            return alert('Something wrong!');
		        }
		
		        var result = response.result, // 검색 결과의 컨테이너
		        items = result.items; // 검색 결과의 배열
		        const cityLng = items[1].point.x;
		        const cityLat = items[1].point.y;
		        
		        map = new naver.maps.Map("map",{
					center : new naver.maps.LatLng(cityLat, cityLng),
					zoom : zoomMap,
					zoomControl : true,
					zoomControlOptions : {
						position : naver.maps.Position.TOP_RIGHT,
						style : naver.maps.ZoomControlStyle.SMALL
					}
		        });
		        
				const addrList = $(".allCampingAddr");
				addrList.each(function(i, addr){
					naver.maps.Service.geocode({
				        address: $(addr).text()
				    }, function(status, response) {
				        if (status !== naver.maps.Service.Status.OK) {
				            return alert('Something wrong!');
				        }
				
				        var result = response.result, // 검색 결과의 컨테이너
				        items = result.items; // 검색 결과의 배열
				        const lng = items[1].point.x;
				        const lat = items[1].point.y;
				        
				        const marker = new naver.maps.Marker({
							position : new naver.maps.LatLng(lat, lng), 
							map : map
						})
				        const campingNo = $(".allCampingNo").eq(i).text();
				        const campingPhoto = $(".allCampingPhoto").eq(i).text();
				       	const campingTitle = $(".allCampingTitle").eq(i).find("a").text();
				       	const checkIn = $("#detail_search_checkin").val();
						const checkOut = $("#detail_search_checkout").val();
						const campingAvgRating = $(".allCampingAvgRating").eq(i).text()
						const campingCountRating = $(".allCampingCountRating").eq(i).text();
				        let contentString = [
							"<div class='camping-map-box' onclick='viewCamping(\""+campingNo+"\",\""+checkIn+"\",\""+checkOut+"\");'>",
							"	<div class='camping-map-photo'>",
							"  		<img src='resources/upload/camping/"+campingPhoto+"'>",
							"	</div>",
							"	<div class='camping-map-info'>",
							"		<div>"+campingTitle+"</div>",
							"		<div>"+$(addr).text()+"</div>",
							"		<div>",
							"			<div>평점</div>",
							"			<div>"+campingAvgRating+" 점</div>",
							"			<div>"+campingCountRating+" 개</div>",
							"		</div>",
							"	</div>",
							"</div>"
						].join("");
						let infoWindow = new naver.maps.InfoWindow();
						
						naver.maps.Event.addListener(marker,"click",function(e){
							infoWindow = new naver.maps.InfoWindow({
								content : contentString
							});
							//생성된 infoWindow를 map의 marker위치에 생성
							infoWindow.open(map, marker);
						})
						
						naver.maps.Event.addListener(map,"click",function(e){
							map.setCenter(e.coord)
							if(infoWindow.getMap()){
								infoWindow.close();
							}
						})
				    });		
				})
		    });	
		}
		
		function sendDetailSearch(order, reqPage){
			const campingType = [];
			const campingService = [];
			const campingRoomService = [];
			const campingEtc = [];
			
			if(order == null){
				order = $(".clicked").attr("id")
				if(order == null){
					order = "avgReviewRating"
				}
			}
			$('input:checkbox[name=campingType]').each(function (index) {
				if($(this).is(":checked")==true){
			    	campingType.push($(this).val())
			    }
			})
			$('input:checkbox[name=campingService]').each(function (index) {
				if($(this).is(":checked")==true){
					campingService.push($(this).val())
			    }
			})
			$('input:checkbox[name=campingRoomService]').each(function (index) {
				if($(this).is(":checked")==true){
					campingRoomService.push($(this).val())
			    }
			})
			$('input:checkbox[name=campingEtc]').each(function (index) {
				if($(this).is(":checked")==true){
					campingEtc.push($(this).val())
			    }
			})
			const pplCount = $("[name=ppl_count]").val();
			const campingTypeStr = campingType.join(",");
			const campingServiceStr = campingService.join(",");
			const campingRoomServiceStr = campingRoomService.join(",");
			const campingEtcStr = campingEtc.join(",");
			const cityAddr = $("#cityAddr").val();
			const campingSido = $("#campingSido").val();
			const checkIn = $("#detail_search_checkin").val();
			const checkOut = $("#detail_search_checkout").val();
			$.ajax({
				url : "/detailSearchCamping.do",
				data : {order : order, campingTypeStr : campingTypeStr , campingServiceStr : campingServiceStr, campingRoomServiceStr : campingRoomServiceStr, campingEtcStr : campingEtcStr, pplCount : pplCount, cityAddr : cityAddr, campingSido : campingSido, reqPage : reqPage, checkIn : checkIn, checkOut : checkOut },
				success : function(data){
					$(".list-by-review").empty();
					if(data.list.length == 0){
						const div = $("<div>").addClass("no-result-wrap");
						const img = $("<img>").attr("src","/resources/image/logo/logo250x80.png");
						const h3 = $("<h3>").text("검색결과가 없습니다");
						div.append(img).append(h3);
						$(".list-by-review").append(div)
					} else {
						data.list.forEach(function(c,i){
							const div = $("<div>").addClass("camping-box").attr("onclick", "viewCamping('"+c.campingNo+"','"+data.checkIn+"','"+data.checkOut+"')");
							const imgDiv = $("<div>");
							const img = $("<img>").attr("src","/resources/upload/camping/"+c.filepath+"")
							imgDiv.append(img);
							const div2 = $("<div>").addClass("camping-room-info")
							const div3 = $("<div>").addClass("campingTitle");
							div3.append(c.campingTitle)
							const div4 = $("<div>").addClass("campingAddr");
							div4.append(c.campingAddr);
							const div5 = $("<div>").append(c.avgReviewRating.toFixed(1)+" 점")
							div2.append(div3).append(div4).append(div5)
							const div6 = $("<div>").append(c.maxRoomPrice+" 원")
							const div7 = $("<div>").append(div6)
							const div8 = $("<div>")
							div8.append(div2).append(div7)
							div.append(imgDiv).append(div8)
							$(".list-by-review").append(div)
						})
						const pagination = $("<div>").addClass("pagination");
						pagination.append(data.pageNavi);
						$(".list-by-review").append(pagination)
						$("#allList").empty();
						data.allList.forEach(function(c,i){
							const div = $("<div>").addClass("allCampingTitle").attr("id", c.campingNo);
							const a = $("<a>");
							a.attr("href", "/viewCamping.do?campingNo="+c.campingNo+"&checkIn="+data.checkIn+"&checkOut="+data.checkOut);
							a.append(c.campingTitle);
							div.append(a);
							const div2 = $("<div>").addClass("allCampingAddr");
							div2.append(c.campingAddr);
							$("#allList").append(div).append(div2);
						})
						startMap();
					}
				},
				error : function(){
					
				}
			})
		}
		
		if ($('#detail_search_checkin, #detail_search_checkout').length) {
		  // check if element is available to bind ITS ONLY ON HOMEPAGE
		  var currentDate = moment().format('MM-DD')

		  $('#detail_search_checkin, #detail_search_checkout').daterangepicker(
		    {
		      locale: {
		        format: 'YYYY-MM-DD',
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
		      },

		      alwaysShowCalendars: true,
		      minDate: currentDate,
		      autoApply: true,
		      autoUpdateInput: false,
		      ranges: {
		        오늘: [moment(), moment()],
		        내일: [moment(), moment().add(1, 'days')],
		        '2일': [moment(), moment().add(2, 'days')],
		        '3일': [moment(), moment().add(3, 'days')],
		        일주일: [moment(), moment().add(7, 'days')]
		      }
		    },
		    function (start, end, label) {
		      // console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
		      // Lets update the fields manually this event fires on selection of range
		      var selectedStartDate = start.format('YYYY-MM-DD') // selected start
		      var selectedEndDate = end.format('YYYY-MM-DD') // selected end

		      $checkinInput = $('#detail_search_checkin')
		      $checkoutInput = $('#detail_search_checkout')

		      // Updating Fields with selected dates
		      $checkinInput.val(selectedStartDate)
		      $checkoutInput.val(selectedEndDate)

		      // Setting the Selection of dates on calender on CHECKOUT FIELD (To get this it must be binded by Ids not Calss)
		      var checkOutPicker = $checkoutInput.data('daterangepicker')
		      checkOutPicker.setStartDate(selectedStartDate)
		      checkOutPicker.setEndDate(selectedEndDate)

		      // Setting the Selection of dates on calender on CHECKIN FIELD (To get this it must be binded by Ids not Calss)
		      var checkInPicker = $checkinInput.data('daterangepicker')
		      checkInPicker.setStartDate(selectedStartDate)
		      checkInPicker.setEndDate(selectedEndDate)
		    }
		  )
		} // End Daterange Picker
	
		function viewCamping(campingNo, checkIn, checkOut){
			const memberId = $("#memberId").val();
			location.href="/viewCamping.do?campingNo="+campingNo+"&checkIn="+checkIn+"&checkOut="+checkOut+"&memberId="+memberId;
		}
		
		$(function(){
			startMap();
		})
	</script>
	<script src="resources/js/camping/dateRangePicker.js"></script>
</body>
</html>