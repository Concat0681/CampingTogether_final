<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/shop/viewShop.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
	<div class="page-wrap">
		<div class="page-header">
			<div class="slider-box">
				<div class="slider slider-for">
					<c:forEach items="${shop.shopPhotoList }" var="p">
							<img src="resources/upload/shop/${p.filepath }">
					</c:forEach>
				</div>
				<div class="slider slider-nav">
					<c:forEach items="${shop.shopPhotoList }" var="p">
							<img src="resources/upload/shop/${p.filepath }">
					</c:forEach>
				</div>
			</div>
			<div class="product-info-wrap">
				<div class="product-title">
					<div>캠핑용품</div>
					<div>${shop.shopTitle }</div>
				</div>
				<div class="product-info">
					<div>
						<div>판매가</div>
						<div id="shopPrice">${shop.shopPrice }</div>
					</div>
					<div>
						<div>배송방법</div>
						<div>택배</div>
					</div>
					<div>
						<div>배송비</div>
						<div id="delivaryPrice">${shop.delivaryPrice }</div>
					</div>
				</div>
				<div class="product-price-wrap">
					<div>
						<div>${shop.shopTitle }</div>
						<div class="shop-count-btn-box">
							<span id="minus" class="material-symbols-outlined">remove</span>
							<input type="text" name="sellCount" value=1>
							<span id="plus" class="material-symbols-outlined">add</span>
						</div>
					</div>
					<div>
						<div class="priceResult">0</div>
						<span>원</span>
					</div>
				</div>
				<div class="product-totalPrice-wrap">
					<div>
						<div>Total</div>
						<div>
							<div class="totalPrice"></div>
							<span>원</span>
						</div>
					</div>
					<div class="product-btn-wrap">
						<button class="btn1">buy</button>
						<button class="btn1">cart</button>
						<button class="btn1">wish</button>
					</div>
				</div>
			</div>
		</div>
		<div class="page-content">
			<div class="content-menu-box">
				<div class="content-menu">상품상세</div>
				<div class="content-menu">상품후가</div>
				<div class="content-menu">배송/교환/환불안내</div>
				<div></div>
			</div>
			<div class="content-box-wrap">
				<div class="content-box hidden">
					${shop.shopContent } 
				</div>
				<div class="content-box hidden">
					<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#commentFrm" aria-expanded="false" aria-controls="collapseCommentFrm">댓글쓰기</button>
					<div class="collapse" id="commentFrm">
						<div class="card card-body">
							<form id="commentForm" action="/insertShopComment.do" method="post" enctype="multipart/form-data">
								<input type="hidden" name="memeberId" value="${sessionScope.m.memberId }">
								<div class="review-frm-header">
									<div>${shop.shopTitle }</div>
									<div class="star-icon-wrap">
										<input type="hidden" id="shopReviewRating" name="shopReviewRating">
										<span class="material-symbols-outlined star">star</span>
										<span class="material-symbols-outlined star">star</span>
										<span class="material-symbols-outlined star">star</span>
										<span class="material-symbols-outlined star">star</span>
										<span class="material-symbols-outlined star">star</span>
									</div>
									<button type="button" class="btn-close"  data-bs-toggle="collapse" data-bs-target="#commentFrm" aria-expanded="false" aria-controls="collapseCommentFrm"></button>
								</div>
								<div class="review-frm-content">
									<div>
										<div id="img-viewer"></div>
										<input type="file" name="reviewPhotoList" onchange="uploadPhoto(this)" multiple>
									</div>
									<div>
										<textarea name="shopReviewContent" placeholder="내용을 입력해주세요"></textarea>
										<button type="submit" id="insertCommentBtn" class="btn1">댓글등록</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="content-box hidden">3</div>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			$('.slider-for').slick({
				slidesToShow: 1,
				slidesToScroll: 1,
				arrows: false,
				fade: true,
				asNavFor: '.slider-nav'
			});
			$('.slider-nav').slick({
				slider : 'img',
				slidesToShow : 2,		// 한 화면에 보여질 컨텐츠 개수
				slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
				speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
				arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
				dots : true, 	
				asNavFor: '.slider-for',
				centerMode: true,
				focusOnSelect: true,
				vertical : false,		// 세로 방향 슬라이드 옵션
				prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
				nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
				dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
				draggable : true 	//드래그 가능 여부
			});
		})
		$('#minus').on("click", function(){
			const val = $("[name=sellCount]").val();
			if(val > 1){
				$("[name=sellCount]").val(val -1);
				calPrice();
			}
		})
		$('#plus').on("click", function(){
			const val = $("[name=sellCount]").val();	
			if(val < 100){
				$("[name=sellCount]").val(val -1 + 2);
				calPrice();
			}
		})
		function calPrice() {
			const count = $("[name=sellCount]").val();
			const price = $("#shopPrice").text()
			$(".priceResult").text((count * price))
			calTotalPrice()
		}
		function calTotalPrice(){
			const price = $(".priceResult").text();
			const delivary = $("#delivaryPrice").text();
			$(".totalPrice").text(parseInt(price) + parseInt(delivary))
		}
		$(".content-menu").on("click", function(){
			const index = $(".content-menu").index($(this));
			$(".content-menu").removeClass("clicked")
			$(".content-menu").eq(index).addClass("clicked")
			$(".content-box").removeClass("hidden")
			$(".content-box").addClass("hidden")
			$(".content-box").eq(index).removeClass("hidden")
		})
		$(".star").on("click", function(){
			const index = $(".star").index(this);
			if($(".star").eq(index).hasClass("star-clicked")){
				$(".star").removeClass("star-clicked");
			} else {
				$(".star").removeClass("star-clicked");
				$(".star").slice(0, index+1).addClass("star-clicked");				
			}
			$("#shopReviewRating").val($((".star-clicked")).length)
		})
		function uploadPhoto(input){
			
			$('#img-viewer').empty();
			if (input.files && input.files.length > 0) {
				for (let i = 0; i < input.files.length; i++) {
					const reader = new FileReader();
					reader.readAsDataURL(input.files[i]);
					reader.onload = function(e) {
						const img = $("<img>").attr("src", e.target.result);
						$('#img-viewer').append(img)
					}
				}
			}
		}
		$("#insertCommentBtn").on("click", function(event){
			event.preventDefault();
			var form = $('#commentForm')[0];  	    
		    var data = new FormData(form);  	   
		    
		    $.ajax({             
		    	type: "POST",          
		        url: "/insertShopReview.do",        
		        data: data,          
		        processData: false,    
		        contentType: false,        
		        success: function (data) { 
		        	alert("complete");     
		        	$('#commentForm')[0].reset();
		        	$(".star").removeClass("star-clicked");
		        	$('.collapse').collapse('hide')
		        },          
		        error: function (e) {  
		        	console.log("ERROR : ", e);     
		            $("#btnSubmit").prop("disabled", false);    
		            alert("fail");      
		         }     
			});  
		})
		
		$(".content-menu").eq(0).click()
		calTotalPrice()
		calPrice()
	</script>
</body>
</html>