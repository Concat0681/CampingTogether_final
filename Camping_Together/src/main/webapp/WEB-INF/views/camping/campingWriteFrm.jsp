<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="/resources/css/default.css" rel="stylesheet"/>
<link href="/resources/css/campingWriteFrm.css" rel="stylesheet"/>
</head>
<body>
	<div class="wrap">
		<div class="tabsWrap">
			<ul class="tabs">
	            <li>기본 정보</li>
	            <li>캠핑 등록</li>
	            <li>편의시설,서비스</li>
	            <li>캠핑장 위치</li>
	        </ul>
		</div>
        <div class="contentWrap">
        	<div class="contentDetail">
        		<h2>캠핑장을 찾고 있는 여행객들을 정확히 사로잡아보세요!</h2>
        		<div class="contentTitle"><h3>캠핑장 이름</h3>
	        		<input type="text" class="input-long" name="campingTitle">
        		</div>
        		<div class="contentTitle"><h3>캠핑장 전화번호</h3>
	        		<input type="text" class="input-long" name="campingPhone">
        		</div>
        		<div class="contentTitle"><h3>캠핑장 설명</h3></div>
        		<textarea class="campingContent" name="campingContent"></textarea>
        		
        		<div class="contentTitle"><h3>캠핑장 사진 등록</h3></div>
        		<input type="file">
        		<div>
	        		<button type="button" class="btn1 nextBtn">다음</button>
        		</div>
        	</div>
        	<div class="contentDetail">
        		<h2>캠핑장 캠핑 등록</h2>
        		<div class="contentTitle"><h3>이름</h3>
        			<input type="text" class="campingRoomInput" name="campingRoomTitle" >
       			</div>
        		<div class="contentTitle"><h3>객실 수</h3>
        			<input type="text" class="campingRoomInput" name="campingRoomCount">
       			</div>
        		<div class="contentTitle"><h3>1박당 가격</h3>
        			<input type="text" class="campingRoomInput" name="campingRoomPrice">
       			</div>
        		<div class="contentTitle"><h3>최대인원</h3>
        			<input type="text" class="campingRoomInput" name="campingRoomMaxPplCount">
       			</div>
       			<div class="contentTitle"><h3>캠핑 유형</h3></div>
        		<div class="campingCheckDiv">
        			<input type="checkbox" id="campingCheck1" name="campingCheck" value="오토캠핑">
        			<label for="campingCheck1" style="padding-right: 50px;">오토캠핑</label>
        			<input type="checkbox" id="campingCheck2" name="campingCheck" value="글램핑">
        			<label for="campingCheck2" style="padding-right: 50px;">글램핑</label>
        			<input type="checkbox" id="campingCheck3" name="campingCheck" value="카라반">
        			<label for="campingCheck3">카라반</label>
        		</div>
        		<div class="contentTitle"><h3>설명</h3>
        			<textarea class="campingRoomContent" name="campingRoomContent"></textarea>
       			</div>
        		<div class="contentTitle"><h3>사진</h3>
        			<input type="file">
       			</div>
        		<div>
        			<button type="button" class="btn1 prevBtn">이전</button>
	        		<button type="button" class="btn1 nextBtn">다음</button>
        		</div>
        	</div>
        	<div class="contentDetail activeContent">
        		<h2>숙소 제공 편의 시설/서비스 관리하기</h2>
        		<h5>숙소에서 제공하는 편의 시설/서비스를 설정하세요.</h5>
        		<div class="contentTitle"><h3>공용시설</h3></div>
        		<table>
        			<tr>
        				<td>
        					<input type="checkbox" id="serviceCheck1" name="campingService" value="전기사용기능">
        					<label for="serviceCheck1">전기사용기능</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck2" name="campingService" value="BBQ">
        					<label for="serviceCheck2">BBQ</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck3" name="campingService" value="개수대">
        					<label for="serviceCheck3">개수대</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck4" name="campingService" value="공용샤워실">
        					<label for="serviceCheck4">공용샤워실</label>
        				</td>
        			</tr>
        			<tr>
        				<td>
        					<input type="checkbox" id="serviceCheck5" name="campingService" value="인터넷">
        					<label for="serviceCheck5">인터넷</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck6" name="campingService" value="매점">
        					<label for="serviceCheck6">매점</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck7" name="campingService" value="공용화장실">
        					<label for="serviceCheck7">공용화장실</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck8" name="campingService" value="물놀이시설">
        					<label for="serviceCheck8">물놀이시설</label>
        			</tr>
        			<tr>
        				<td>
	        				<input type="checkbox" id="serviceCheck9" name="campingService" value="카페">
	        				<label for="serviceCheck9">카페</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck10" name="campingService" value="편의점">
        					<label for="serviceCheck10">편의점</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck11" name="campingService" value="노래방">
        					<label for="serviceCheck11">노래방</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck12" name="campingService" value="주방/식당">
        					<label for="serviceCheck12">주방/식당</label>
        				</td>
        			</tr>
        			<tr>
        				<td>
        					<input type="checkbox" id="serviceCheck13" name="campingService" value="세탁기">
        					<label for="serviceCheck13">세탁기</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck14" name="campingService" value="건조기">
        					<label for="serviceCheck14">건조기</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck15" name="campingService" value="탈수기">
        					<label for="serviceCheck15">탈수기</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck16" name="campingService" value="공용PC">
        					<label for="serviceCheck16">공용PC</label>
        				</td>
        			</tr>
        			<tr>
        				<td>
        					<input type="checkbox" id="serviceCheck17" name="campingService" value="주차장">
        					<label for="serviceCheck17">주차장</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck18" name="campingService" value="라운지">
        					<label for="serviceCheck18">라운지</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck19" name="campingService" value="전자레인지">
        					<label for="serviceCheck19">전자레인지</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck20" name="campingService" value="취사가능">
        					<label for="serviceCheck20">취사가능</label>
        				</td>
        			</tr>
        		</table>
        		<div class="contentTitle"><h3>객실 내 시설</h3></div>
        		<table>
        			<tr>
        				<td>
        					<input type="checkbox" id="serviceCheck21" name="campingRoomService" value="객실샤워실">
        					<label for="serviceCheck21">객실샤워실</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck22" name="campingRoomService" value="드라이기">
        					<label for="serviceCheck22">드라이기</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck23" name="campingRoomService" value="와이파이">
        					<label for="serviceCheck23">와이파이</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck24" name="campingRoomService" value="TV">
        					<label for="serviceCheck24">TV</label>
        				</td>
        			</tr>
        			<tr>
        				<td>
        					<input type="checkbox" id="serviceCheck25" name="campingRoomService" value="욕실용품">
        					<label for="serviceCheck25">욕실용품</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck26" name="campingRoomService" value="미니바">
        					<label for="serviceCheck26">미니바</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck27" name="campingRoomService" value="에어컨">
        					<label for="serviceCheck27">에어컨</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck28" name="campingRoomService" value="냉장고">
        					<label for="serviceCheck28">냉장고</label>
        				</td>
        			</tr>
        			<tr>
        				<td>
        					<input type="checkbox" id="serviceCheck29" name="campingRoomService" value="욕조">
        					<label for="serviceCheck29">욕조</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck30" name="campingRoomService" value="다리미">
        					<label for="serviceCheck30">다리미</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck31" name="campingRoomService" value="전기밥솥">
        					<label for="serviceCheck31">전기밥솥</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck32" name="campingRoomService" value="객실스파">
        					<label for="serviceCheck32">객실스파</label>
        				</td>
        			</tr>
        			<tr>
        				<td colspan="4">
        					<input type="checkBox" id="serviceCheck33" name="campingRoomService" value="세면도구">
        					<label for="serviceCheck33">세면도구</label> 
        				</td>
        			</tr>
        		</table>
       			<div class="contentTitle"><h3>기타</h3></div>
        		<table>
        			<tr>
        				<td>
        					<input type="checkbox" id="serviceCheck34" name="campingEtc" value="장비대여">
        					<label for="serviceCheck34">장비대여</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck35" name="campingEtc" value="사이트주차">
        					<label for="serviceCheck35">사이트주차</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck36" name="campingEtc" value="카드결제">
        					<label for="serviceCheck36">카드결제</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck37" name="campingEtc" value="조식포함">
        					<label for="serviceCheck37">조식포함</label>
        				</td>
        			</tr>
        			<tr>
        				<td>
        					<input type="checkbox" id="serviceCheck38" name="campingEtc" value="객실내흡연">
        					<label for="serviceCheck38">객실내흡연</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck39" name="campingEtc" value="발렛파킹">
        					<label for="serviceCheck39">발렛파킹</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck40" name="campingEtc" value="반려견동반">
        					<label for="serviceCheck40">반려견동반</label>
        				</td>
        				<td>
        					<input type="checkbox" id="serviceCheck41" name="campingEtc" value="객실내취사">
        					<label for="serviceCheck41">객실내취사</label>
        				</td>
        			</tr>
        			<tr>
        				<td>
        				<input type="checkbox" id="serviceCheck42" name="campingEtc" value="픽업가능">
        				<label for="serviceCheck42">픽업가능</label>
        				</td>
        				<td>
        				<input type="checkbox" id="serviceCheck43" name="campingEtc" value="캠프파이어">
        				<label for="serviceCheck43">캠프파이어</label>
        				</td>
        				<td>
        				<input type="checkbox" id="serviceCheck44" name="campingEtc" value="금연">
        				<label for="serviceCheck44">금연</label>
        				</td>
        			</tr>
        		</table>
        		<div>
        			<button type="button" class="btn1 prevBtn">이전</button>
	        		<button type="button" class="btn1 nextBtn">다음</button>
        		</div>
        	</div>
        	<div class="contentDetail">
        		<h2>캠핑장 위치</h2>
        		<h5>투숙객이 머무르게 되는 곳이 어디인지 알려 주세요.</h5>
        		<div class="contentTitle">캠핑장 위치</div>
        		<div>
        			<input type="text">
        		</div>
        		<div>
        			지도api사용
        		</div>
        		<button type="button" class="btn1 prevBtn">이전</button>
        		<button type="button" class="btn1">등록</button>
        	</div>
        </div>
	</div>
	
	<script>
		const contentDetail = $(".contentDetail");
		const nextBtn = $(".nextBtn");
		const prevBtn = $(".prevBtn");
		
		nextBtn.eq(0).on("click",function(){
			const campingTitle = $("[name=campingTitle]").val();
			const campingPhone = $("[name=campingPhone]").val();
			const campingContent = $("[name=campingContent]").val();
			const campingCheck = $("[name=campingCheck]").val();
			if(campingTitle != "" && campingContent != "" && campingPhone != "" && campingCheck != ""){
				contentDetail.eq(0).hide();
				contentDetail.eq(1).show();
			}else{
				alert("입력값을 모두 입력해주세요.")
			}
		});
		nextBtn.eq(1).on("click",function(){
			const campingRoomTitle = $("[name=campingRoomTitle]").val();
			const campingRoomCount = $("[name=campingRoomCount]").val();
			const campingRoomPrice = $("[name=campingRoomPrice]").val();
			const campingRoomMaxPplCount = $("[name=campingRoomMaxPplCount]").val();
			const campingRoomContent = $("[name=campingRoomContent]").val();
			if(campingRoomTitle != "" && campingRoomCount != "" && campingRoomPrice != "" && campingRoomMaxPplCount != "" && campingRoomContent != ""){
				contentDetail.eq(1).hide();
				contentDetail.eq(2).show();
			}else{
				alert("입력값을 모두 입력해주세요.")
			}
		});
		nextBtn.eq(2).on("click",function(){
			contentDetail.eq(2).hide();
			contentDetail.eq(3).show();
		});
		prevBtn.eq(0).on("click",function(){
			contentDetail.eq(1).hide();
			contentDetail.eq(0).show();
		});
		prevBtn.eq(1).on("click",function(){
			contentDetail.eq(2).hide();
			contentDetail.eq(1).show();
		});
		prevBtn.eq(2).on("click",function(){
			contentDetail.eq(3).hide();
			contentDetail.eq(2).show();
		});
	</script>
	
</body>
</html>