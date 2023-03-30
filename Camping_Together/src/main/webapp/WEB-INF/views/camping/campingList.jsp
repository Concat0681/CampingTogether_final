<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="/resources/css/camping/campingListHeader.css" rel="stylesheet">
<link href="/resources/css/camping/campingList.css" rel="stylesheet">
</head>
<body>
	<div class="page-wrap">
		<div class="page-header" style="background-image: url(/resources/image/camping/${cityNameEN }.jpeg)">
			<div class="page-header-title">${cityNameKR } 캠핑가자</div>
			<div class="search-input-wrap">
				<input id="searchInput" type="text" placeholder="어디로 떠나실건가요?">
				<div>
					<img id="mapImg" src="/resources/image/camping/map.png">
					<label for="mapImg">지도</label>
				</div>
				<button type="button" class="searchInput-btn">검색하기</button>
			</div>
		</div>
		<div class="page-content">
			<div class="sidebar-menu">
				<div class="menu">
					<div class="menu-title">날짜</div>
					<div class="box input-wrap">
						<label for="calendarInput"><img src="/resources/image/camping/map.png"></label>
						<input id="calendarInput" type="text" placeholder="2023-03-28 ~ 2023-05-03">
					</div>
				</div>
				<form action="/detailSearchCamping.do" method="post">
					<div class="menu">
						<div class="menu-title">상세조건</div>
						<div class="box button-wrap">
							<button type="reset">초기화</button>
							<button type="submit">적용</button>
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
									<input type="text" name="ppl_count" value=1>
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
				</form>
			</div>
			<div class="campingList-content">
				<div class="campingList-box">111111111</div>
			</div>
		</div>
	</div>
	<script>
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
	</script>
</body>
</html>