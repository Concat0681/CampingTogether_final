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
<link href="/resources/css/camping/campingListHeader.css" rel="stylesheet">
<link href="/resources/css/camping/campingList.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<div class="page-wrap">
		<div class="page-header" style="background-image: url(/resources/image/camping/${cityNameEN }.jpeg)">
			<div class="page-header-title">${cityNameKR } 캠핑가자</div>
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
						<input type="text" name="date" readonly>
						<input type="hidden" name="checkIn">
						<input type="hidden" name="checkOut">
						<input name="pplCount" type="text" value=1>
						<input name="reqPage" type="hidden" value="1">
						<input name="order" type="hidden" value="avgReviewRating">
						<button type="submit" class="searchInput-btn">검색하기</button>
					</div>
				</form>
			</div>
		</div>
		<div class="page-content">
			<div class="sidebar-menu">
				<div class="menu">
					<div class="menu-title">날짜</div>
					<div class="box input-wrap">
						<label for="calendarInput"><img src="/resources/image/camping/map.png"></label>
						<c:choose>
							<c:when test="${not empty date }">
								<input type="text" name="date" value="${date }" readonly>
								<input type="hidden" name="checkIn" value="${checkIn }">
								<input type="hidden" name="checkOut" value="${checkOut }">
							</c:when>
							<c:otherwise>
								<input type="text" name="date" readonly>
								<input type="hidden" name="checkIn">
								<input type="hidden" name="checkOut">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="menu">
					<div class="menu-title">상세조건</div>
					<input type=hidden id="cityAddr" name="cityAddr" value="${cityNameKR }">
					<div class="box button-wrap">
						<button type="button" onclick="resetInputs();">초기화</button>
						<button type="button" onclick="sendDetailSearch();">적용</button>
					</div>
					<div class="sub-menu">
						<div class="menu-title">캠핑유형</div>
						<div class="checkbox-wrap">
							<div class="checkbox-box">
								<input id="autoCamping" type="checkbox" name="campingType" value="오토캠핑">
								<label for="autoCamping">오토캠핑</label>
							</div>
							<div class="checkbox-box">
								<input id="glenCamping" type="checkbox" name="campingType" value="글램핑">
								<label for="glenCamping">글램핑</label>
							</div>
							<div class="checkbox-box">
								<input id="caraban" type="checkbox" name="campingType" value="카라반">
								<label for="caraban">카라반</label>
							</div>
						</div>
					</div>
					<div class="sub-menu">
						<div class="ppl-count-wrap box">
							<div class="menu-title">인원</div>
							<div class="ppl-count-input-wrap">
								<img id="minus" src="/resources/image/camping/minus.png">
								<c:choose>
									<c:when test="${not empty pplCount }">
										<input type="text" name="ppl_count" value=${pplCount }>
									</c:when>
									<c:otherwise>
										<input type="text" name="ppl_count" value=1>
									</c:otherwise>
								</c:choose>
								<img id="plus" src="/resources/image/camping/plus.png">
							</div>
						</div>
					</div>
				</div>
				<div class="menu">
					<div class="menu-title">공용시설</div>
					<div class="box input-wrap" style="flex-wrap: wrap; justify-content : flex-start;">
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
					<div class="box input-wrap" style="flex-wrap: wrap; justify-content : flex-start;">
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
					<div class="box input-wrap" style="flex-wrap: wrap; justify-content : flex-start;">
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
					<button type="button" id="avgReviewRating" onclick="sendOrder(this);">평점순</button>
					<button type="button" id="maxRoomPrice" onclick="sendOrder(this);">가격순</button>
					<button type="button" name="viewByMap">지도로 보기</button>
				</div>
				<div class="campingList-box">
					<div class="list-by-review">
						<c:forEach items="${list }" var="c">
							<div class="camping-box">							
								<div class="campingTitle"><a href="/viewCamping.do?campingNo=${c.campingNo }">${c.campingTitle }</a></div>
								<div class="campingAddr">${c.campingAddr }</div>
								<div>${c.avgReviewRating }</div>
								<div>${c.maxRoomPrice }</div>
							</div>
						</c:forEach>	
						<div>${pageNavi }</div>
					</div>
					<div class="hidden list-by-map">
						<div id="map" style="width:100%; height:500px;"></div>
					</div>
					<div id="allList" class="hidden">
						<c:forEach items="${allList }" var="c">			
								<div class="allCampingTitle"><a href="/viewCamping.do?campingNo=${c.campingNo }">${c.campingTitle }</a></div>				
								<div class="allCampingAddr">${c.campingAddr }</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
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
		
		function sendOrder(obj){
			const order = $(obj).attr("id");
			$(".list-by-map").addClass("hidden")
			$(".list-by-review").removeClass("hidden")
			const reqPage = 1;
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
		}
		
		function sendDetailSearch(order, reqPage){
			const campingType = [];
			const campingService = [];
			const campingRoomService = [];
			const campingEtc = [];
			if(order == null){
				order = "avgReviewRating";
			}
			if(reqPage == null){
				reqPage = 1;
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
			$.ajax({
				url : "/detailSearchCamping.do",
				data : {order : order, campingTypeStr : campingTypeStr , campingServiceStr : campingServiceStr, campingRoomServiceStr : campingRoomServiceStr, campingEtcStr : campingEtcStr, pplCount : pplCount, cityAddr : cityAddr, reqPage : reqPage},
				success : function(data){
					$(".list-by-review").empty();
					data.list.forEach(function(c,i){
						const div = $("<div>").addClass("campingTitle").attr("id", c.campingNo);
						const a = $("<a>");
						a.attr("href", "/viewCamping.do?campingNo="+c.campingNo);
						a.append(c.campingTitle);
						div.append(a);
						const div2 = $("<div>")
						div2.append(c.avgReviewRating)
						const div3 = $("<div>");
						div3.append(c.maxRoomPrice);
						const div4 = $("<div>").addClass("campingAddr");
						div4.append(c.campingAddr);
						$(".list-by-review").append(div).append(div2).append(div3).append(div4);
					})
					$(".list-by-review").append(data.pageNavi);
					$("#allList").empty();
					data.allList.forEach(function(c,i){
						const div = $("<div>").addClass("allCampingTitle").attr("id", c.campingNo);
						const a = $("<a>");
						a.attr("href", "/viewCamping.do?campingNo="+c.campingNo);
						a.append(c.campingTitle);
						div.append(a);
						const div2 = $("<div>").addClass("allCampingAddr");
						div2.append(c.campingAddr);
						$("#allList").append(div).append(div2);
					})
					startMap();
				},
				error : function(){
					
				}
			})
		}
		
		/* 네이버 지도 api */
		function startMap(){
			const cityAddr = $("#cityAddr").val();
			naver.maps.Service.geocode({
		        address: cityAddr
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
					zoom : 10,
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
				       	const campingTitle = $(".allCampingTitle").eq(i).find("a").text();
				        const href = $(".allCampingTitle").eq(i).find("a").attr("href");
				        let contentString = [
							"<div class='iw_inner'>",
							"	<div><a  href="+href+">"+campingTitle+"</a></div>",
							"	<p>"+$(addr).text()+"</p>",
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
				    });		
				})
		    });	
		}
		
		$(function(){
			startMap();
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
	</script>
	<script src="resources/js/camping/dateRangePicker.js"></script>
</body>
</html>