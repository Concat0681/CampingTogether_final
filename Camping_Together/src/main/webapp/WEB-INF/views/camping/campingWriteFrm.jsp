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
        		
        		<div class="contentTitle"><h3>캠핑장 사진 등록</h3></div>
        			<div id="img-viewer">
	        			<input type="file" name="campingFilepath" onchange="loadImg(this);" id="campingFilepath">
	        			<label for="campingFilepath">
							<img id="img-view" width="620px" height="620px">
						</label>
                    </div>
	        		<div>
		        		<button type="submit" class="btn1 nextBtn" style="margin-right: 80px;">캠핑장 등록</button>
	        		</div>
	        		</form>
				</div>
				
        	</div>
        	
        	
        	
	</div>
	
	<script>
		const contentDetail = $(".contentDetail");
		const nextBtn = $(".nextBtn");
		
		nextBtn.eq(0).on("click",function(){
			const campingTitle = $("[name=campingTitle]").val();
			const campingPhone = $("[name=campingPhone]").val();
			const campingContent = $("[name=campingContent]").val();
			const postcode = $("[name=postcode]").val();
			const campingAddr = $("[name=campingAddr]").val();
			const campingAddrDetail = $("[name=campingAddrDetail]").val();
			const campingFilepath = $("[name=campingFilepath]");
			if(campingTitle != "" && campingContent != "" && campingPhone != "" && postcode != "" && campingAddr != "" && campingAddrDetail != ""){
				contentDetail.eq(0).hide();
				contentDetail.eq(1).show();
			}else{
				alert("입력란을 모두 입력해주세요.")
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