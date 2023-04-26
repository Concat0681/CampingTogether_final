<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	
	
	.image-container {
  position: relative;
  width: 620px;
  height: 620px;
}

.image-container input[type="file"],
.image-container label {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.image-container label {
  z-index: 1;
}

.image-container img {
  display: block;
  margin: 0 auto;
}

.image-container {
  position: relative;
}

.img-wrapper {
  position: relative;
  display: inline-block;
}

.delete-btn {
  position: absolute;
  top: 0;
  right: 0;
  color: white;
  border: none;
  padding: 5px;
  font-size: 14px;
  cursor: pointer;
  display: none;
}

.photoCamera2:hover{
	cursor: pointer;
}

#img-viewer2 {
    display: flex;
    flex-wrap: nowrap;
    max-width: 100%;
    overflow-x: auto;
    margin-top: 70px;
    margin-bottom: 20px;
  }
  
  .img-wrapper2 {
    position: relative;
    margin-right: 10px;
    margin-bottom: 10px;
  }
  
  .review-img2 {
    width: 150px;
    height: 150px;
    object-fit: cover;
    border-radius: 10px;
  }
  
  .delete-btn2 {
    position: absolute;
    top: 0;
    right: 0;
    background-color: transparent;
    border: none;
    color: white;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
  }
  
  .closeColor{
    color: black;
    background-color: #fff;
  }
  
  .backgroundPhoto {
	width: 100%;
	 background-image: url(/resources/image/main/campingImg.jpg);
    background-repeat: no-repeat;
    background-size: cover;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
}

		.wrap {
			position: relative;
			z-index: 1;
		}
	
	input, textarea{
		border: 1px solid #ccc;
	}
	
	h2, h3{
		color: #AD8B73;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="backgroundPhoto">
	<div class="wrap" style="margin-top: 300px;">
        <div class="contentWrap" style="background-color: #fff; padding-left: 30px; padding-top: 50px; border-radius: 10px; margin-bottom: 100px;">
        	<div class="contentDetail activeContent">
        		<h2 style="font-weight: 900;">${camping.campingTitle } 캠핑장 수정</h2>
        		<h5 style="color: #808080; margin-bottom: 50px;">모든 입력란은 "필수" 항목입니다.</h5>
        		<form action="/updateCamping.do" method="post" enctype="multipart/form-data" id="updateCampingFrm">
        			<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
        			<input type="hidden" name="campingNo" value="${camping.campingNo }">
	        		<table>
	        			<tr>
	        				<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 30px; color: #AD8B73;">캠핑장 이름</td>
	        				<td style="padding-bottom: 30px;">
	        					<input type="text" class="input-long" name="campingTitle" value="${camping.campingTitle }">
	        				</td>
	        			</tr>
	        			<tr>
	        				<td style="width: 120px; font-size: 1.17em; font-weight: bold; color: #AD8B73;">전화번호</td>
	        				<td>
	        					<input type="text" class="input-long" name="campingPhone" placeholder="010-0000-0000" value="${camping.campingPhone }">
	        				</td>
	        			</tr>
	        			<tr>
	        				<td></td>
	        				<td>
	        					<span class="phoneComment"></span>
	       					</td>
	        			</tr>
	        		</table>
	        		
	        		<div class="contentTitle"><h3 style="font-weight: bold;">캠핑장 설명</h3></div>
	        		<textarea class="campingContent" name="campingContent">${camping.campingContent }</textarea>
	        		
					<div class="contentTitle"><h3 style="font-weight: bold;">캠핑장 사진 등록</h3></div>
	        			<h5 style="padding-bottom: 20px; color: #808080;">캠핑장의 메인 사진을 등록해주세요.</h5>
	        				<div class="image-container">
							  <input type="file" name="campingFilepath" onchange="loadImg(this);" id="campingFilepath" style="display: none;">
							  <label for="campingFilepath">
							    <span class="material-symbols-outlined photoCamera2" style="font-size: 250px; display: none;">photo_camera</span>
							  </label>
							  <div class="img-wrapper">
							    <img src="resources/upload/camping/${camping.filepath }" id="img-view" width="620px" height="620px">
							    <button type="button" class="delete-btn" style="display: block;" onclick="deleteCampingFile(this,'${camping.filepath }');">
							    	<span class="material-symbols-outlined" style="padding-top: 5px; color: #000">close</span>
							    </button>
							  </div>
							</div>
					
	        		
		        		<div>
			        		<button type="button" class="btn1 nextBtn" style="margin-right: 50px; margin-bottom: 30px;">다음</button>
		        		</div>
		        	</div>
	        		<div class="contentDetail" style="display: none;">
        				<div class="contentTitle"><h3 style="font-weight: bold;">캠핑장 위치</h3></div>
		        		<div class="address-wrap">
							<table class="addressTbl">
								<tr>
									<td>도/시</td>
									<td>
										<input type="text" name="campingSido" id="campingSido" style="width: 350px; height: 40px;" value="${camping.campingSido }" readonly>
									</td>
									<td rowspan="2" style="padding-left: 20px;">
										<button type="button" class="btn2" id="searchBtn" onclick="searchAddr();">주소찾기</button>
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>
										<input type="text" name="campingAddr" id="address" value="${camping.campingAddr }" readonly>
									</td>
								</tr>
								<tr>
									<td style="padding-right: 10px;">상세주소 입력</td>
									<td colspan="2">
										<input type="text" name="campingAddrDetail" id="detailAddress" value="${camping.campingAddrDetail }">
									</td> 
								</tr>
								<tr>
									<td>
										<button type="button" onclick="loadMap();" class="btn2 moveMapBtn" style="margin-top: 20px;">주소로 이동</button>
									</td>
								</tr>
							</table>
						</div>
	        		<div id="map" style="width:620px; height:500px;"></div>
	        				<div style="padding-bottom: 30px;">
	        					<button type="button" class="btn1 prevBtn">이전</button>
		        				<button type="button" class="btn1 nextBtn" style="margin-right: 50px;">다음</button>
	        				</div>
		        	</div>
		        		
		        		
					
					
					<div class="contentDetail" style="display: none;">
	        		<h2 style="font-weight: 900;">숙소 제공 편의 시설/서비스 관리하기</h2>
	        		<h5 style="color: #808080">숙소에서 제공하는 편의 시설/서비스를 설정하세요.</h5>
	        		<div class="contentTitle"><h3 style="font-weight: bold;">공용시설</h3></div>
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
	        		<div class="contentTitle"><h3 style="font-weight: bold;">객실 내 시설</h3></div>
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
	       			<div class="contentTitle"><h3 style="font-weight: bold;">기타</h3></div>
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
		        		<button type="submit" class="btn1 nextBtn" style="margin-right: 50px; margin-bottom: 30px;">수정</button>
	        		</div>
        		</div>
   			</form>
       	</div>
       	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
	<script>
		const contentDetail = $(".contentDetail");
		const nextBtn = $(".nextBtn");
		const prevBtn = $(".prevBtn");
		const phoneResult = [false];
		
		$(document).ready(function() {
		    const phoneReg = /01\d{1}-\d{4}-\d{4}$/;
		    const campingPhone = $("[name=campingPhone]").val();
		    const phoneCheck = phoneReg.test(campingPhone);

		    if (phoneCheck) {
		        $(".phoneComment").text("");
		        phoneResult[0] = true;
		    } else {
		        $(".phoneComment").text("전화번호 형식을 지켜주세요.");
		        $(".phoneComment").css("color","red");
		        phoneResult[0] = false;
		    }

		    $("[name=campingPhone]").on("change",function(){
		        const campingPhone = $("[name=campingPhone]").val();
		        const phoneCheck = phoneReg.test(campingPhone);

		        if (phoneCheck) {
		            $(".phoneComment").text("");
		            phoneResult[0] = true;
		        } else {
		            $(".phoneComment").text("전화번호 형식을 지켜주세요.");
		            $(".phoneComment").css("color","red");
		            phoneResult[0] = false;
		        }
		    });
		});
		
		nextBtn.eq(0).on("click",function(){
			const campingTitle = $("[name=campingTitle]").val();
			const campingPhone = $("[name=campingPhone]").val();
			const campingContent = $("[name=campingContent]").val();
			const campingFilepath = $("[name=campingFilepath]");
			if(!(campingTitle != "" && campingContent != "" && campingPhone != "" && phoneResult[0] == true && $('#img-view').attr('src'))){
				alert("입력란을 모두 확인해주세요.")
				return false;
			}else{
				contentDetail.eq(0).hide();
				contentDetail.eq(1).show();
			}
			
		});
		
		nextBtn.eq(1).on("click",function(){
			const postcode = $("[name=postcode]").val();
			const campingAddr = $("[name=campingAddr]").val();
			const campingAddrDetail = $("[name=campingAddrDetail]").val();
			if(!(postcode != "" && campingAddr != "" && campingAddrDetail != "")){
				alert("입력란을 확인해주세요.")
				return false;
			}else{
				contentDetail.eq(1).hide();
				contentDetail.eq(2).show();
				$("#showPhoto").show();
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
				
			}
		});
		
		
		
		$("[name=campingRoomBtn]").on("click", function() {
			  const campingRoomTitle = $("[name=campingRoomTitle]").val();
			  const campingRoomCount = $("[name=campingRoomCount]").val();
			  const campingRoomPrice = $("[name=campingRoomPrice]").val();
			  const campingRoomMaxPplCount = $("[name=campingRoomMaxPplCount]").val();
			  const campingRoomContent = $("[name=campingRoomContent]").val();
			  const campingRoomType = $("[name=campingRoomType]:checked").val();
			  const campingRoomFilepath = $("[name=campingRoomFilepath]");

			  if (campingRoomTitle != "" && campingRoomCount != "" && campingRoomPrice != "" && priceResult[0] == true && campingRoomMaxPplCount != "" && campingRoomContent != "" && campingRoomType != null && campingRoomFilepath[0].files.length >= 3) {
			    // 모든 값이 공백이 아닐 때 서브밋 동작
			  } else {
			    alert("입력란을 모두 확인해주세요.");
			    return false;
			  }
			});
	</script>
	
	
	<script>
		function loadImg(input) {
			  const icon = $('.photoCamera2');
			  const wrapper = $('#img-wrapper');
			  const deleteBtn = $('.delete-btn');
			  if (input.files && input.files.length > 0) {
			    const reader = new FileReader();
			    reader.readAsDataURL(input.files[0]);
			    reader.onload = function(e) {
			      $("#img-view").attr("src", e.target.result);
			      icon.hide();
			      deleteBtn.show();
			    }
			  } else {
			    $("#img-view").attr("src", "");
			    icon.show();
			    deleteBtn.hide();
			  }
			}
	
			$(document).ready(function() {
			  $('.delete-btn').on('click', function() {
			    $('#img-view').attr('src', '');
			    $('#campingFilepath').val('');
			    $('.photoCamera2').show();
			    $('.delete-btn').hide();
			  });
			});
	</script>
	
	<script>
	function loadImgs(input) {
		  
		  if (input.files && input.files.length > 0) {
		    for (let i = 0; i < input.files.length; i++) {
		      const reader = new FileReader();
		      reader.readAsDataURL(input.files[i]);
		      reader.onload = function(e) {
		        const imgWrapper2 = $("<div>").addClass("img-wrapper2");
		        const img2 = $("<img>").attr("src", e.target.result)
		                              .addClass("review-img2");
		        const deleteBtn2 = $("<button>").html("<span class='material-symbols-outlined closeColor'>close</span>")
		                                        .addClass("delete-btn2")
		                                        .attr("type", "button").attr("onclick", "delNewPhoto(this)");
		        imgWrapper2.append(img2).append(deleteBtn2).appendTo("#img-viewer2");
		        
		        deleteBtn2.on("click", function() {
		          $(this).parent().remove();
		        });
		      }
		    }
		  }
		}
	</script>
	
	<script>
		function delNewPhoto(obj){
			const fileNum = $(".img-wrapper2").index($(obj).parent());
			const dataTransfer = new DataTransfer();
		    
		    let files = $('#campingRoomFilepath')[0].files;	//사용자가 입력한 파일을 변수에 할당
		    
		    let fileArray = Array.from(files);	//변수에 할당된 파일을 배열로 변환(FileList -> Array)
		    
		    fileArray.splice(fileNum, 1);	//해당하는 index의 파일을 배열에서 제거
		    
		    fileArray.forEach(file => { dataTransfer.items.add(file); });
		    //남은 배열을 dataTransfer로 처리(Array -> FileList)
		    
		    $('#campingRoomFilepath')[0].files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
		   console.log($(obj).parent())
		    $(obj).parent().remove();
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
			        	$("#campingSido").val(data.sido);
			        	console.log(data.sido)
			        	$("#detailAddress").focus();
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			        }
			    }).open();
		}
	</script>
	
	<script>
		$(document).ready(function() {
		  $('input[name="campingRoomMaxPplCount"]').on('input', function() {
		    var value = parseInt($(this).val());
		    if (isNaN(value) || value < 1 || value > 20) {
		      $(this).val('');
		    }
		  });
		});
	</script>
	
	<script>
		$(function() {
		  $("input[name='campingRoomCount']").on("input", function() {
		    var val = parseInt($(this).val());
		    if (isNaN(val) || val < 1 || val > 100 || !(/^\d+$/.test($(this).val()))) {
		      $(this).val("");
		    }
		  });
		});
	</script>
	
	<script>
	const priceResult = [false];
	
	$("[name=campingRoomPrice]").on("change",function(){
		const campingRoomPrice = $("[name=campingRoomPrice]").val();
		if(campingRoomPrice >= 100 && campingRoomPrice <= 100000000){
			$(".priceComment").text("");
			priceResult[0] = true;
		}else{
			$(".priceComment").text("금액을 확인해주세요.");
			$(".priceComment").css("color","red");
			priceResult[0] = false;
		}
	});
	</script>
	
	<script>
		$(document).ready(function() {
		  // 체크박스의 name 속성값
		  var checkboxName = "campingEtc";
		  
		  // 체크될 값을 배열로 저장
		  var checkedValues = [
		    <%-- 체크될 값을 JSP 코드로 작성 --%>
		    <c:forEach items="${campingEtc}" var="ce">
		      "${ce.campingEtc}",
		    </c:forEach>
		  ];

		  // 체크박스 루프
		  $('input[name="' + checkboxName + '"]').each(function() {
		    // 체크될 값을 포함하면 체크
		    if ($.inArray($(this).val(), checkedValues) >= 0) {
		      $(this).prop('checked', true);
		    }
		  });
		});
	</script>
	
	<script>
		$(document).ready(function() {
		  // 체크박스의 name 속성값
		  var checkboxName = "campingEtc";
		  
		  // 체크될 값을 배열로 저장
		  var checkedValues = [
		    <%-- 체크될 값을 JSP 코드로 작성 --%>
		    <c:forEach items="${campingEtc}" var="ce">
		      "${ce.campingEtc}",
		    </c:forEach>
		  ];

		  // 체크박스 루프
		  $('input[name="' + checkboxName + '"]').each(function() {
		    // 체크될 값을 포함하면 체크
		    if ($.inArray($(this).val(), checkedValues) >= 0) {
		      $(this).prop('checked', true);
		    }
		  });
		});
	</script>
	
	<script>
		$(document).ready(function() {
		  // 체크박스의 name 속성값
		  var checkboxName = "campingRoomService";
		  
		  // 체크될 값을 배열로 저장
		  var checkedValues = [
		    <%-- 체크될 값을 JSP 코드로 작성 --%>
		    <c:forEach items="${campingRoomService}" var="crs">
		      "${crs.campingRoomService}",
		    </c:forEach>
		  ];

		  // 체크박스 루프
		  $('input[name="' + checkboxName + '"]').each(function() {
		    // 체크될 값을 포함하면 체크
		    if ($.inArray($(this).val(), checkedValues) >= 0) {
		      $(this).prop('checked', true);
		    }
		  });
		});
	</script>
	
	
	<script>
		$(document).ready(function() {
		  // 체크박스의 name 속성값
		  var checkboxName = "campingService";
		  
		  // 체크될 값을 배열로 저장
		  var checkedValues = [
		    <%-- 체크될 값을 JSP 코드로 작성 --%>
		    <c:forEach items="${campingService}" var="cs">
		      "${cs.campingService}",
		    </c:forEach>
		  ];

		  // 체크박스 루프
		  $('input[name="' + checkboxName + '"]').each(function() {
		    // 체크될 값을 포함하면 체크
		    if ($.inArray($(this).val(), checkedValues) >= 0) {
		      $(this).prop('checked', true);
		    }
		  });
		});
	</script>
	
	<script>
		function deleteCampingFile(obj,filepath){
			const filepathInput = $("<input>");
			filepathInput.attr("name","filepath");
			filepathInput.val(filepath);
			filepathInput.hide();
			
			$("#updateCampingFrm").append(filepathInput);
		}
	</script>
	
</body>
</html>