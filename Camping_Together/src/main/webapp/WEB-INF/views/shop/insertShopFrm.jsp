<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/shop/insertShopFrm.css">
<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/summernote/summernote-lite.css">
<!--  -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-wrap">
		<div class="page-title">물품등록</div>
		<form action="/insertShop.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
			<div class="shop-category-wrap">
				<label>구분</label>
				<button type="button" class="shop-category-btn" id="0">캠핑</button>
				<button type="button" class="shop-category-btn" id="1">차박</button>
				<button type="button" class="shop-category-btn" id="2">기타</button>
				<input type="hidden" name="shopCategory">	
			</div>
			<div class="shop-photo-wrap">
				<label for="shopPhotoList">상품이미지</label>
				<input id="shopPhotoList" type="file" name="shopFileList" onchange="uploadPhoto(this);" multiple required>
			</div>
			<div id="img-viewer"></div>
			<div class="shop-title-wrap">
				<label for="shopTitle">제목</label>
				<input id="shopTitle" type="text" name="shopTitle" required>
			</div> 
			<div class="shop-price-wrap">
				<div class="shop-price">
					<label for="shopPrice">상품가격</label>
					<input id="shopPrice" type="text" class="number-input" name="shopPrice" required>
					<div class="check-result"></div>
				</div>
				<div class="delivary-price-wrap">
					<label for="delivaryPrice">배송비</label>
					<input id="delivaryPrice" type="text" class="number-input" name="delivaryPrice" required>
					<div class="check-result"></div>
				</div>
			</div>
			<div class="shop-content-wrap">
				<label>내용</label>
				<textarea id="shop-content" name="shopContent"></textarea>
			</div>
			<div class="max-count-wrap">
				<label for="maxCount">수량</label>
				<input id="maxCount" type="text" class="number-input" name="maxCount" required>
				<div class="check-result"></div>
			</div>
			<div class="insert-shop-btn-wrap">
				<button id="backToListBtn" type="button">취소</button>
				<button type="submit" onclick="return checkInputs();">등록</button>
			</div>
		</form>
	</div>
	<script>
		$(".shop-category-btn").on("click", function(){
			$("[name=shopCategory]").val("");
			$("[name=shopCategory]").val($(this).attr("id"));
			console.log($("[name=shopCategory]").val());
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
			if(val == "" || result != null){
				$(this).next().addClass("wrong")
			}
			$(this).next().append(result)
		})
		
		function checkOnlyNumber(str){
			const check = /^[0-9]+$/; 
			if (!check.test(str)) {
			    return "숫자만 입력 가능합니다.";
			}
		}
		
		function uploadPhoto(input){
			
			$('#img-viewer').empty();
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