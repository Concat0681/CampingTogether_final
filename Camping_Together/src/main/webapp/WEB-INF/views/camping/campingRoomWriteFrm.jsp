<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="/resources/css/camping/campingWriteFrm.css" rel="stylesheet"/>
<link href="/resources/css/default.css" rel="stylesheet"/>
<style>
	#img-viewer img {
  		width: 200px;
  		height: 200px;
	}
</style>
</head>
<body>
	<div class="wrap">
        <div class="contentWrap">
        	<div class="contentDetail">
        		<h2 style="margin-bottom: 60px;">캠핑장 캠핑 등록</h2>
        		<form action="/campingRoomWrite.do" method="post" enctype="multipart/form-data">
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
	        			<input type="file" name="campingRoomFilepath" onchange="loadImgs(this);" id="campingRoomFilepath" multiple>
	        			<div id="img-viewer">
	        			<!--  
		        			<label for="campingRoomFilepath">
								<img id="img-view" width="200px" height="200px">
							</label>
							-->
	                    </div>
	       			</div>
	       			<button type="submit" name="campingRoomBtn" class="btn2 nextBtn" style="margin-right: 80px;">등록</button>
       			</form>
        	</div>
        	
        	
        	
        </div>
	</div>
	
	<script>
		function loadImgs(input) {
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
		$("[name=campingRoomBtn]").on("click",function(){
			const roomTitle = $("[name=campingRoomTitle]").val();
			const campingRoomCount = $("[name=campingRoomCount]").val();
			const campingRoomPrice = $("[name=campingRoomPrice]").val();
			const campingRoomMaxPplCount = $("[name=campingRoomMaxPplCount]").val();
			const campingRoomContent = $("[name=campingRoomContent]").val();
			const campingRoomType = $("[name=campingRoomType]:checked").val();
			const campingRoomFilepath = $("[name=campingRoomFilepath]");
			if(!(campingRoomTitle != "" && campingRoomCount != "" && campingRoomPrice != "" && campingRoomMaxPplCount != "" && campingRoomContent != "" && campingRoomType != null && campingRoomFilepath.get(0).files.length != 0)){
				alert("입력란을 모두 확인해주세요.")
				console.log(campingRoomType);
				return false;
			}
		});
	</script>
	
	
</body>
</html>