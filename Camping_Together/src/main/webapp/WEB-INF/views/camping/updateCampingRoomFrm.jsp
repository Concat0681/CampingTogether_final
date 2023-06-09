<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="/resources/css/camping/campingWriteFrm.css" rel="stylesheet"/>
<link href="/resources/css/default.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
	#img-viewer2 img {
  		width: 210px;
  		height: 210px;
  		padding: 5px;
	}
	
	#img-viewer2 {
  margin-top: 70px;
  overflow-x: auto;
  white-space: nowrap; /* 가로 스크롤 시 한 줄에 표시되도록 설정 */
}

.img-wrapper {
  display: inline-block; /* 이미지들이 옆으로 나란히 표시되도록 설정 */
  margin-right: 10px; /* 이미지간 간격을 조절하기 위한 마진 설정 */
   position: relative;
}

   
    .delete-btn {
        position: absolute;
        top: 0;
        right: 0;
    }
	
	.photoCamera3:hover{
		cursor: pointer;
	}
	
	 .backgroundPhoto {
			width: 100%;
			background-image: url(/resources/image/main/errorBack.gif);
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="backgroundPhoto">
	<div class="wrap" style="margin-top: 300px;">
        <div class="contentWrap" style="background-color: #fff; padding-left: 30px; padding-top: 50px; border-radius: 10px;">
        	<div class="contentDetail">
        		<h2 style="margin-bottom: 60px;">${campingRoom.campingRoomTitle } 방 수정</h2>
        		<form action="/updateCampingRoom.do" method="post" enctype="multipart/form-data" id="updateCampingRoomFrm">
        		<input type="hidden" name="campingRoomNo" value="${campingRoom.campingRoomNo }">
        		<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
	        		<table>
	        			<tr>
	        				<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px;">이름</td>
	        				<td style="padding-bottom: 20px;">
	        					<input type="text" class="input-long" name="campingRoomTitle" value="${campingRoom.campingRoomTitle }">
	        				</td>
	        			</tr>
	        			<tr>
	        				<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px;">객실 수</td>
	        				<td style="padding-bottom: 20px;">
	        					<input type="text" class="input-long" name="campingRoomCount" placeholder="최대 100개의 객실까지 등록 가능합니다." value="${campingRoom.campingRoomCount }">
	        				</td>
	        			</tr>
	        			<tr>
	        				<td></td>
	        				<td>
	        					<span class="priceComment"></span>
	       					</td>
        				</tr>
	        			<tr>
	        				<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px;">1박당 가격</td>
	        				<td style="padding-bottom: 20px;">
	        					<input type="text" class="input-long" name="campingRoomPrice" value="${campingRoom.campingRoomPrice }" placeholder="최소 100원부터 최대 1억까지 등록 가능합니다.">
	        				</td>
	        			</tr>
						<tr>
							<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px;">최대인원</td>
							<td style="padding-bottom: 20px;">
								<input type="number" class="input-long" name="campingRoomMaxPplCount" min="1" max="20" placeholder="최소 1명에서 최대 20명의 인원이 등록 가능합니다." value="${campingRoom.campingRoomMaxPplCount }">
							</td>
						</tr>
						<tr>
							<td style="width: 120px; font-size: 1.17em; font-weight: bold; padding-bottom: 20px;">캠핑 유형</td>
							<td style="padding-bottom: 20px;">
								<input type="radio" id="campingCheck1" name="campingRoomType" value="오토캠핑" ${campingRoom.campingRoomType == '오토캠핑' ? 'checked' : ''}>
			        			<label for="campingCheck1" style="padding-right: 50px;">오토캠핑</label>
			        			<input type="radio" id="campingCheck2" name="campingRoomType" value="글램핑" ${campingRoom.campingRoomType == '글램핑' ? 'checked' : ''}>
			        			<label for="campingCheck2" style="padding-right: 50px;">글램핑</label>
			        			<input type="radio" id="campingCheck3" name="campingRoomType" value="카라반" ${campingRoom.campingRoomType == '카라반' ? 'checked' : ''}>
			        			<label for="campingCheck3">카라반</label>
							</td>
						</tr>
	        		</table>
	        		<div class="contentTitle"><h3>설명</h3>
	        			<textarea class="campingRoomContent" name="campingRoomContent">${campingRoom.campingRoomContent }</textarea>
	       			</div>
	        		<div class="contentTitle"><h3>사진</h3>
	        		<h5>최소 3개 이상의 파일을 등록해주세요.</h5>
	        			<input type="file" name="campingRoomFile" onchange="loadImgs(this);" id="campingRoomFilepath" style="display: none;" multiple>
	        			<label for="campingRoomFilepath">
	        				<span class="material-symbols-outlined photoCamera3" style="font-size: 250px;">photo_camera</span>
	        			</label>
	        			<div id="img-viewer2" style="margin-top: 70px;">
	        				<c:forEach items="${filePaths}" var="f">
	        					<div class="img-wrapper">
								    <img src="resources/upload/campingRoom/${f.filepath }">
								    <button type="button" class="delete-btn" onclick="deleteUpdateCampingRoomFile(this,${f.campingRoomPhotoNo },'${f.filepath }');">
								    	<span class='material-symbols-outlined closeColor'>close</span>
								    </button>
	        					</div>
							</c:forEach>
	                    </div>
	       			</div>
	       			<button type="submit" name="updateCampingRoomBtn" class="btn1 nextBtn" style="margin-right: 50px; width: 600px; margin-bottom: 30px;">캠핑 수정</button>
       			</form>
        	</div>	
        	
        	
        	</div>
        </div>
	</div>
	
	<script>
		$("[name=updateCampingRoomBtn]").on("click",function(){
		  const campingRoomTitle = $("[name=campingRoomTitle]").val();
		  const campingRoomCount = $("[name=campingRoomCount]").val();
		  const campingRoomPrice = $("[name=campingRoomPrice]").val();
		  const campingRoomMaxPplCount = $("[name=campingRoomMaxPplCount]").val();
		  const campingRoomContent = $("[name=campingRoomContent]").val();
		  const campingRoomType = $("[name=campingRoomType]:checked").val();
		  const campingRoomFile = $("[name=campingRoomFile]");

		  if (campingRoomTitle != "" && campingRoomCount != "" && campingRoomPrice != "" && priceResult[0] == true && campingRoomMaxPplCount != "" && campingRoomContent != "" && campingRoomType != null && $('#img-viewer2').children('.img-wrapper').length >= 3) {
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
		const priceResult = [false];
		
		$(document).ready(function() {
			const campingRoomPrice = $("[name=campingRoomPrice]").val();
			if(campingRoomPrice >= 100 && campingRoomPrice <= 100000000){
				$(".priceComment").text("");
				priceResult[0] = true;
			}else{
				$(".priceComment").text("금액을 확인해주세요.");
				$(".priceComment").css("color","red");
				priceResult[0] = false;
			}
			
			
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
		    	  const imgWrapper = $("<div>").addClass("img-wrapper");
			        const img = $("<img>").attr("src", e.target.result)
			                              .addClass("review-img");
			        const deleteBtn = $("<button>").html("<span class='material-symbols-outlined closeColor'>close</span>")
			                                        .addClass("delete-btn")
			                                        .attr("type", "button").attr("onclick", "delNewPhoto(this)");
			        imgWrapper.append(img).append(deleteBtn).appendTo("#img-viewer2");
			        
			        deleteBtn.on("click", function() {
			        	
			        	  $(this).parent().remove();
			        	});
		      }
		    }
		  }
		}
	</script>
	
	<script>
		var imgViewer = $("#img-viewer2");
		imgViewer.empty();
		var fileList = ${campingRoomFile};
		if (fileList != null && fileList.length > 0) {
			for (let i = 0; i < fileList.length; i++) {
		        var imgWrapper = $("<div>").addClass("img-wrapper");
		        var img = $("<img>").attr("src", "resources/upload/campingRoom/" + fileList[i].filepath).addClass("review-img");
		        var deleteBtn = $("<button>").text("삭제").addClass("delete-btn").attr("type", "button").attr("campingRoomPhotoNo", fileList[i].campingRoomPhotoNo)
                 																					   .attr("filepath", fileList[i].filepath);
		        imgWrapper.append(img).append(deleteBtn);
		        imgViewer.append(imgWrapper);
		        
		    }
		 
		}
	</script>
	
	<script>
		function deleteUpdateCampingRoomFile(obj,campingRoomPhotoNo,filepath){
			const fileNoInput = $("<input>");  
			fileNoInput.attr("name","campingRoomPhotoNo"); 
			fileNoInput.val(campingRoomPhotoNo);		  
			fileNoInput.hide();				  
			
			const filepathInput = $("<input>");
			filepathInput.attr("name","filepath");
			filepathInput.val(filepath);
			filepathInput.hide();
			
			$("#updateCampingRoomFrm").append(fileNoInput).append(filepathInput);
			$(obj).parent().remove();
			
			
		}
	</script>
	
	<script>
		function delNewPhoto(obj){
			const fileNum = $(".img-wrapper").index($(obj).parent());
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
	
</body>
</html>