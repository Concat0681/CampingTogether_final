<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/shop/insertShopFrm.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/summernote/summernote-lite.css">
<!--  -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
	<div class="page-wrap">
		<div class="page-title">SHOP 상품 등록</div>
		<form action="/insertShop.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
			<div class="input-group mb-3">
				<label class="input-group-text">구분</label>
				<div class="form-control category-btn-wrap">
					<button type="button" class="shop-category-btn" id="0">캠핑</button>
					<button type="button" class="shop-category-btn" id="1">차박</button>
					<button type="button" class="shop-category-btn" id="2">기타</button>
				</div>
				<input type="hidden" name="shopCategory">	
			</div>
			<div class="input-group mb-3">
				<label for="shopTitle" class="input-group-text">제목</label>
				<input id="shopTitle"  class="form-control" type="text" name="shopTitle" required>
			</div> 
			<div class="input-group mb-3">
				<label for="shopPhotoList" class="input-group-text">상품이미지</label>
				<input id="shopPhotoList" class="form-control" type="file" name="shopFileList" onchange="uploadPhoto(this);" multiple required>
			</div>
			<div id="img-viewer"></div>
			<div class="shop-price-wrap">
				<div class="input-group mb-3">
					<label for="shopPrice" class="input-group-text">상품가격</label>
					<input id="shopPrice" type="text" class="number-input form-control" name="shopPrice" required>
					<div class="check-result input-group-text"></div>
				</div>
				<div class="input-group mb-3">
					<label for="delivaryPrice" class="input-group-text">배송비</label>
					<input id="delivaryPrice" type="text" class="number-input form-control" name="delivaryPrice" required>
					<div class="check-result input-group-text"></div>
				</div>
				<div class="input-group mb-3">
					<label for="maxCount" class="input-group-text">수량</label>
					<input id="maxCount" type="text" class="number-input form-control" name="maxCount" required>
					<div class="check-result input-group-text"></div>
				</div>
			</div>
			<div class="shop-content-wrap">
				<textarea id="shop-content" name="shopContent"></textarea>
			</div>
			<div class="insert-shop-btn-wrap">
				<button id="backToListBtn" class="btn-2" type="button">취소</button>
				<button type="submit" class="btn1" onclick="return checkInputs();">등록</button>
			</div>
		</form>
	</div>
	<script>
		$(".shop-category-btn").on("click", function(){
			$(".shop-category-btn").removeClass("btn1")
			$(this).addClass("btn1")
			$("[name=shopCategory]").val("");
			$("[name=shopCategory]").val($(this).attr("id"));
		})
		
		$(".number-input").on("focusin", function(){
			$(this).next().empty();
			$(this).next().removeClass("wrong");
		})
		
		$(".number-input").on("focusout", function(){
			const val = $(this).val();
			var result = "";
			if(val == ""){
				result = "내용을 입력해주세요"
			} else {
				result = checkOnlyNumber(val);
			}
			if(val == "" || result == "숫자만 입력 가능합니다."){
				$(this).next().addClass("wrong")
				$(this).next().css("color", "red");
			} else {
				$(this).next().css("color", "green");			
			}
			$(this).next().append(result)
		})
		
		function checkOnlyNumber(str){
			const check = /^[0-9]+$/; 
			if (!check.test(str)) {
			    return "숫자만 입력 가능합니다.";
			} else {
				return "사용 가능합니다.";
			}
		}
		
		function destroySlick(){
			if ($('#img-viewer').hasClass('slick-initialized')) {
			    $('#img-viewer').slick('destroy');
			  } 
		}
		
		function applySlick(){
			$('#img-viewer').slick({
				slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
				slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
				speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
				arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
				dots : true, 	
				centerMode: true,
				focusOnSelect: true,
				prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
				nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
				dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
				draggable : true 	//드래그 가능 여부
			});
		}
		
		function uploadPhoto(input){
			if (input.files && input.files.length > 0) {
				destroySlick();
				$("#img-viewer").empty();
				for (let i = 0; i < input.files.length; i++) {
					const reader = new FileReader();
					reader.readAsDataURL(input.files[i]);
					reader.onload = function(e) {
						const div = $("<div>").addClass("img-box");
						const button = $("<button>").addClass("btn1").attr("type", "button").attr("onclick", "delNewPhoto(this)").text("삭제");
						const img = $("<img>").attr("src", e.target.result); // 이미지를 보여줄 DOM 엘리먼트에 추가
						div.append(img).append(button);
						$("#img-viewer").append(div);
					}
				}
				setTimeout(function () {
					applySlick()
		        }, 10);
			}
		}
		
		function delNewPhoto(obj){
			destroySlick();
			const fileNum = $(".img-box").index($(obj).parent());
			const dataTransfer = new DataTransfer();
		    
		    let files = $('#shopPhotoList')[0].files;	//사용자가 입력한 파일을 변수에 할당
		    
		    let fileArray = Array.from(files);	//변수에 할당된 파일을 배열로 변환(FileList -> Array)
		    
		    fileArray.splice(fileNum, 1);	//해당하는 index의 파일을 배열에서 제거
		    
		    fileArray.forEach(file => { dataTransfer.items.add(file); });
		    //남은 배열을 dataTransfer로 처리(Array -> FileList)
		    
		    $('#shopPhotoList')[0].files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
		   console.log($(obj).parent())
		    $(obj).parent().remove();
		    setTimeout(function () {
				applySlick()
	        }, 10);
		}
		
		$('#shop-content').summernote({
			  height: 300,                 // 에디터 높이
			  lang: "ko-KR",					// 한글 설정
			  callbacks : {
				  onImageUpload : function(files){
					  uploadImage(files[0], this);
				  }
			  }
		});
		
		$("#backToListBtn").on("click", function(){
			location.href="/shopMainList.do";
		})
		
		function checkInputs(){
			var result = 0;
			var str = "";
			$(".check-result").each(function(i, r){
				if($(r).hasClass("wrong")){
					result = 1;
					str = "입력창을 확인해 주세요";
				}
			})
			if( $("[name=shopCategory]").val() == "" ){
				result = 1;
				str = "구분을 골라주세요"
			}
			if(result == 1){
				alert(str);
				return false;
			}
		}
	</script>
</body>
</html>