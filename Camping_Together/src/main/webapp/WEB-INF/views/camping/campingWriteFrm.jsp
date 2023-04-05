<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=jx1rdgburv&submodules=geocoder"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="/resources/css/default.css" rel="stylesheet"/>
<link href="/resources/css/camping/campingWriteFrm.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
	#img-viewer2 img {
  		width: 200px;
  		height: 200px;
	}
</style>
</head>
<body>
	<div class="wrap">
        <div class="contentWrap">
        	<div class="contentDetail activeContent">
        		<h2 style="margin-bottom: 60px;">캠핑장을 찾고 있는 여행객들을 정확히 사로잡아보세요!</h2>
        		<form action="/campingWrite.do" method="post" enctype="multipart/form-data">
	        		<table>
	        			<tr>
	        				<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 30px;">캠핑장 이름</td>
	        				<td style="padding-bottom: 30px;">
	        					<input type="text" class="input-long" name="campingTitle">
	        				</td>
	        			</tr>
	        			<tr>
	        				<td style="width: 120px; font-size: 1.17em; font-weight: bold;">전화번호</td>
	        				<td>
	        					<input type="text" class="input-long" name="campingPhone" placeholder="010-0000-0000">
	        				</td>
	        			</tr>
	        			<tr>
	        				<td></td>
	        				<td>
	        					<span class="phoneComment"></span>
	       					</td>
	        			</tr>
	        		</table>
	        		
	        		<div class="contentTitle"><h3>캠핑장 설명</h3></div>
	        		<textarea class="campingContent" name="campingContent"></textarea>
	        		
					<div class="contentTitle"><h3>캠핑장 위치</h3></div>
		        		<div class="address-wrap">
							<table class="addressTbl">
								<tr>
									<td>지번</td>
									<td>
										<input type="text" name="postcode" id="postcode" readonly>
									</td>
									<td rowspan="2" style="padding-left: 20px;">
										<button type="button" class="btn2" id="searchBtn" onclick="searchAddr();">주소찾기</button>
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>
										<input type="text" name="campingAddr" id="address" readonly>
									</td>
								</tr>
								<tr>
									<td>상세주소 입력</td>
									<td colspan="2">
										<input type="text" name="campingAddrDetail" id="detailAddress">
									</td> 
								</tr>
								<tr>
									<td>
										<button type="button" onclick="loadMap();" class="btn2 moveMapBtn">주소로 지도 이동</button>
									</td>
								</tr>
							</table>
						</div>
					
	        		<div id="map" style="width:620px; height:500px;"></div>
	        		
		        		<div>
			        		<button type="button" class="btn1 nextBtn" style="margin-right: 80px;">다음</button>
		        		</div>
		        	</div>
	        		<div class="contentDetail" >
	        			<div class="contentTitle"><h3>캠핑장 사진 등록</h3></div>
	        			<h5 style="padding-bottom: 20px">캠핑장의 메인 사진을 등록해주세요.</h5>
	        				<div id="img-viewer1">
		        				<input type="file" name="campingFilepath" onchange="loadImg(this);" id="campingFilepath">
		        				<label for="campingFilepath">
									<img id="img-view" width="700px" height="620px">
								</label>
	                    	</div>
	                    	<div>
	        					<button type="button" class="btn1 prevBtn">이전</button>
		        				<button type="button" class="btn1 nextBtn">다음</button>
	        				</div>
		        	</div>
		        		
		        		
					
					
					<div class="contentDetail" >
	        		<h2>숙소 제공 편의 시설/서비스 관리하기</h2>
	        		<h5>숙소에서 제공하는 편의 시설/서비스를 설정하세요.</h5>
	        		<div class="contentTitle"><h3>공용시설</h3></div>
	        		<table class="campingServiceTbl">
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
	        		<table class="campingServiceTbl">
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
	        		<table class="campingServiceTbl">
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
			<div class="contentDetail" >
        		<h2 style="margin-bottom: 60px;">캠핑장 캠핑 등록</h2>
	        		<table>
	        			<tr>
	        				<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px;">이름</td>
	        				<td style="padding-bottom: 20px;">
	        					<input type="text" class="input-long" name="campingRoomTitle" >
	        				</td>
	        			</tr>
	        			<tr>
	        				<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px;">객실 수</td>
	        				<td style="padding-bottom: 20px;">
	        					<input type="text" class="input-long" name="campingRoomCount">
	        				</td>
	        			</tr>
	        			<tr>
	        				<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px;">1박당 가격</td>
	        				<td style="padding-bottom: 20px;">
	        					<input type="text" class="input-long" name="campingRoomPrice">
	        				</td>
	        			</tr>
						<tr>
							<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px;">최대인원</td>
							<td style="padding-bottom: 20px;">
								<input type="text" class="input-long" name="campingRoomMaxPplCount">
							</td>
						</tr>
						<tr>
							<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px;">캠핑 유형</td>
							<td style="padding-bottom: 20px;">
								<input type="radio" id="campingCheck1" name="campingRoomType" value="오토캠핑">
			        			<label for="campingCheck1" style="padding-right: 50px;">오토캠핑</label>
			        			<input type="radio" id="campingCheck2" name="campingRoomType" value="글램핑">
			        			<label for="campingCheck2" style="padding-right: 50px;">글램핑</label>
			        			<input type="radio" id="campingCheck3" name="campingRoomType" value="카라반">
			        			<label for="campingCheck3">카라반</label>
							</td>
						</tr>
	        		</table>
	        		<div class="contentTitle"><h3>설명</h3>
	        			<textarea class="campingRoomContent" name="campingRoomContent"></textarea>
	       			</div>
	        		<div class="contentTitle"><h3>사진</h3>
	        		<h5>최소 3개 이상의 파일을 등록해주세요.</h5>
	        			<input type="file" name="campingRoomFilepath" onchange="loadImgs(this);" id="campingRoomFilepath" multiple>
	        			<div id="img-viewer2">
	        			
	                    </div>
	       			</div>
	       			<button type="button" class="btn1 prevBtn">이전</button>
	       			<button type="submit" name="campingRoomBtn" class="btn1 nextBtn" style="margin-right: 80px;">등록</button>
       			</form>
        	</div>	
       	</div>
        	
	</div>
	
	<script>
		const contentDetail = $(".contentDetail");
		const nextBtn = $(".nextBtn");
		const prevBtn = $(".prevBtn");
		const phoneResult = [false];
		
		$("[name=campingPhone]").on("change",function(){
			const phoneReg = /01\d{1}-\d{4}-\d{4}/;
			const campingPhone = $("[name=campingPhone]").val();
			const phoneCheck = phoneReg.test(campingPhone);
			if(phoneCheck){
				$(".phoneComment").text("");
				phoneResult[0] = true;
			}else{
				$(".phoneComment").text("전화번호 형식을 지켜주세요.");
				$(".phoneComment").css("color","red");
				phoneResult[0] = false;
			}
		});
		
		nextBtn.eq(0).on("click",function(){
			const campingTitle = $("[name=campingTitle]").val();
			const campingPhone = $("[name=campingPhone]").val();
			const campingContent = $("[name=campingContent]").val();
			const postcode = $("[name=postcode]").val();
			const campingAddr = $("[name=campingAddr]").val();
			const campingAddrDetail = $("[name=campingAddrDetail]").val();
			if(!(campingTitle != "" && campingContent != "" && campingPhone != "" && phoneResult[0] == true && postcode != "" && campingAddr != "" && campingAddrDetail != "")){
				alert("입력란을 모두 확인해주세요.")
				return false;
			}else{
				contentDetail.eq(0).hide();
				contentDetail.eq(1).show();
			}
			
		});
		
		nextBtn.eq(1).on("click",function(){
			const campingFilepath = $("[name=campingFilepath]");
			if(!(campingFilepath.get(0).files.length != 0)){
				alert("입력란을 확인해주세요.")
				return false;
			}else{
				contentDetail.eq(1).hide();
				contentDetail.eq(2).show();
			}
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
		
		nextBtn.eq(2).on("click",function(){
			const campingService = $("[name=campingService]:checked").val();
			const campingRoomService = $("[name=campingRoomService]:checked").val();
			const campingEtc = $("[name=campingEtc]:checked").val();
			console.log(campingService);
			console.log(campingRoomService);
			console.log(campingEtc);
			if(!(campingService != null && campingRoomService != null && campingEtc != null)){
				alert("입력란을 확인하세요.");
				return false;
			}else{
				contentDetail.eq(2).hide();
				contentDetail.eq(3).show();
			}
		});
		
		
		
		$("[name=campingRoomBtn]").on("click",function(){
			  const campingRoomTitle = $("[name=campingRoomTitle]").val();
			  const campingRoomCount = $("[name=campingRoomCount]").val();
			  const campingRoomPrice = $("[name=campingRoomPrice]").val();
			  const campingRoomMaxPplCount = $("[name=campingRoomMaxPplCount]").val();
			  const campingRoomContent = $("[name=campingRoomContent]").val();
			  const campingRoomType = $("[name=campingRoomType]:checked").val();
			  const campingRoomFilepath = $("[name=campingRoomFilepath]");

			  if (campingRoomTitle != "" && campingRoomCount != "" && campingRoomPrice != "" && campingRoomMaxPplCount != "" && campingRoomContent != "" && campingRoomType != null && campingRoomFilepath.get(0).files.length >= 3) {
			    // 모든 값이 공백이 아닐 때 서브밋 동작
			  } else {
			    alert("입력란을 모두 확인해주세요.");
			    return false;
			  }
			});
	</script>
	
	
	<script>
		function loadImg(f) {
			if(f.files.length != 0 && f.files[0] != 0){
				const reader = new FileReader();
				reader.readAsDataURL(f.files[0]);
				reader.onload = function(e){
					$("#img-view").attr("src",e.target.result);
				}
			}else{
				$("#img-view").attr("src","");
			}
		}
	</script>
	
	<script>
		function loadImgs(input) {
		  // 기존에 있는 이미지 삭제
		  $('#img-viewer2 img').remove();
		  
		  if (input.files && input.files.length > 0) {
		    for (let i = 0; i < input.files.length; i++) {
		      const reader = new FileReader();
		      reader.readAsDataURL(input.files[i]);
		      reader.onload = function(e) {
		        $("<img>").attr("src", e.target.result).attr("id", "img-" + i).appendTo("#img-viewer2"); // 이미지를 보여줄 DOM 엘리먼트에 추가
		      }
		    }
		  }
		}
	</script>
	
	<script>
		const map = new naver.maps.Map("map",{
			center : new naver.maps.LatLng(37.533837,126.896836),
			zoom : 8,
			zoomControl : true,
			zoomControlOptions : {
				position : naver.maps.Position.TOP_RIGHT,
				style : naver.maps.ZoomControlStyle.SMALL
			}
		});
		const marker = new naver.maps.Marker({
			position :  new naver.maps.LatLng(37.533837,126.896836),
			map : map
		});
		
		let infoWindow = new naver.maps.InfoWindow();
		
		//marker에 클릭이벤트 추가
		naver.maps.Event.addListener(marker,"click",function(e){
			infoWindow = new naver.maps.InfoWindow({
				content : contentString
			});
			//생성된 infoWindow를 map의 marker위치에 생성
			infoWindow.open(map,marker);
		});
		
		naver.maps.Event.addListener(map,"click",function(e){
			marker.setPosition(e.coord);//클릭한 위치로 마커 이동
			map.setCenter(e.coord);//클릭한 위치로 지도 중심 이동
			if(infoWindow.getMap()){//정보창이 지도위에 올라가 있으면
				infoWindow.close();
			}
			//위경도를 통해서 해당 위치의 주소를 알아내기(reverseGeocode)
			naver.maps.Service.reverseGeocode({
				location : new naver.maps.LatLng(e.coord.lat(),e.coord.lng())
			},function(status,response){
				if(status != naver.maps.Service.Status.OK){
					return alert("주소를 찾을 수 없습니다.");
				}
				console.log(response);
				const address = response.result.items[1].address;
				contentString = [
					"<div class='iw_inner'>",
					"	<p>"+address+"</p>",
					"</div>"
				].join("");
			});
		});
		
		function loadMap(){
			const addr = $("#address").val();
			naver.maps.Service.geocode({
				address : addr
			},function(status,response){
				if(status === naver.maps.Service.Status.ERROR){
					return alert("조회 에러");
				}
				console.log(response);
				const lng = response.result.items[1].point.x;//경도
				const lat = response.result.items[1].point.y;//위도
				//위경도 객체
				const latlng = new naver.maps.LatLng(lat,lng);
				map.setCenter(latlng);
				marker.setPosition(latlng);
			});
		}
		
		function searchAddr() {
			 new daum.Postcode({
			        oncomplete: function(data) {
			        	$("#postcode").val(data.zonecode);
			        	$("#address").val(data.address);
			        	$("#detailAddress").focus();
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			        }
			    }).open();
		}
	</script>
	
</body>
</html>