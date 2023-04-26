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
	#img-viewer2 img {
  		width: 210px;
  		height: 210px;
  		padding: 5px;
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
		
		h2, h3{
		color: #AD8B73;
	}
	
	.photoCamera2:hover{
		cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="backgroundPhoto">
	<div class="wrap" style="margin-top: 300px;">
        <div class="contentWrap" style="background-color: #fff; padding-left: 30px; padding-top: 50px; border-radius: 10px; margin-bottom: 50px;">
        	<div class="contentDetail">
	        		<h2 style="margin-bottom: 60px;">${campingTitle } 캠핑 추가 등록</h2>
	        		<form action="/campingRoomWrite.do" method="post" enctype="multipart/form-data">
	        			<input type="hidden" name="campingNo" value="${campingNo }">
	        			<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
		        		<table>
		        			<tr>
		        				<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px; color: #AD8B73;">이름</td>
		        				<td style="padding-bottom: 20px;">
		        					<input type="text" class="input-long" name="campingRoomTitle" >
		        				</td>
		        			</tr>
		        			<tr>
		        				<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px; color: #AD8B73;">객실 수</td>
		        				<td style="padding-bottom: 20px;">
		        					<input type="text" class="input-long" name="campingRoomCount" placeholder="최대 100개의 객실까지 등록 가능합니다.">
		        				</td>
		        			</tr>
		        			<tr>
		        				<td></td>
		        				<td>
		        					<span class="priceComment"></span>
		       					</td>
	        				</tr>
		        			<tr>
		        				<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px; color: #AD8B73;">1박당 가격</td>
		        				<td style="padding-bottom: 20px;">
		        					<input type="text" class="input-long" name="campingRoomPrice" placeholder="최소 100원부터 최대 1억까지 등록 가능합니다.">
		        				</td>
		        			</tr>
							<tr>
								<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px; color: #AD8B73;">최대인원</td>
								<td style="padding-bottom: 20px;">
									<input type="number" class="input-long" name="campingRoomMaxPplCount" min="1" max="20" placeholder="최소 1명에서 최대 20명의 인원이 등록 가능합니다.">
								</td>
							</tr>
							<tr>
								<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px; color: #AD8B73;">캠핑 유형</td>
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
		        		<h5 style="color: #808080;">최소 3개 이상의 파일을 등록해주세요.</h5>
		        			<input type="file" name="campingRoomFilepath" onchange="loadImgs(this);" id="campingRoomFilepath" style="display: none;" multiple>
		        			<label for="campingRoomFilepath">
		        				<span class="material-symbols-outlined photoCamera2" style="font-size: 250px;">photo_camera</span>
		        			</label>
		        			<div id="img-viewer2">
		        			
		                    </div>
		       			</div>
		       			<button type="submit" name="campingRoomBtn" class="btn1 nextBtn" style="margin-right: 50px; width: 600px; margin-bottom: 30px;">캠핑 추가등록</button>
	       			</form>
        	</div>	
        	
        	
        	
        </div>
        </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script>
		$("[name=campingRoomBtn]").on("click",function(){
		  const campingRoomTitle = $("[name=campingRoomTitle]").val();
		  const campingRoomCount = $("[name=campingRoomCount]").val();
		  const campingRoomPrice = $("[name=campingRoomPrice]").val();
		  const campingRoomMaxPplCount = $("[name=campingRoomMaxPplCount]").val();
		  const campingRoomContent = $("[name=campingRoomContent]").val();
		  const campingRoomType = $("[name=campingRoomType]:checked").val();
		  const campingRoomFilepath = $("[name=campingRoomFilepath]");

		  if (campingRoomTitle != "" && campingRoomCount != "" && campingRoomPrice != "" && priceResult[0] == true && campingRoomMaxPplCount != "" && campingRoomContent != "" && campingRoomType != null && $('#img-viewer2').children('.img-wrapper2').length >= 3) {
		    // 모든 값이 공백이 아닐 때 서브밋 동작
		  } else {
		    alert("입력란을 모두 확인해주세요.");
		    return false;
		  }
		});
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
		$(document).ready(function() {
		    $('input[name="campingRoomPrice"]').on('input', function() {
		        // 현재 입력된 값에서 숫자 이외의 문자를 제거합니다.
		        var value = $(this).val().replace(/[^0-9]/g, '');
		        // 0 이상의 정수인지 확인합니다.
		        if (value >= 0 && value == parseInt(value)) {
		            // 입력된 값이 0 이상의 정수이면 값을 그대로 유지합니다.
		            $(this).val(value);
		        } else {
		            // 입력된 값이 0 이하의 정수나 소수점을 포함한 값이면 값을 0으로 변경합니다.
		            $(this).val("");
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
	
</body>
</html>