<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
						<div>
							<div id="shopPrice">${shop.shopPrice }</div>
							<span>원</span>
						</div>
					</div>
					<div>
						<div>배송방법</div>
						<div>택배</div>
					</div>
					<div>
						<div>배송비</div>
						<div>
							<div id="delivaryPrice">${shop.delivaryPrice }</div>
							<span>원</span>
						</div>
					</div>
				</div>
				<div class="product-price-wrap">
					<div>
						<div>수량</div>
						<div class="shop-count-btn-box">
							<span id="minus" class="material-symbols-outlined">remove</span>
							<input type="text" name="sellCount" value=1 readonly>
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
						<div>TOTAL</div>
						<div>
							<div class="totalPrice"></div>
							<span>원</span>
						</div>
					</div>
					<div class="product-btn-wrap">
						<c:choose>
							<c:when test="${empty sessionScope.m }">
								<button class="btn1 loginBtn">Buy</button>
								<button type="button" class="btn1 loginBtn">Cart</button>
							</c:when>
							<c:otherwise>
								<button class="btn1" id="payBtn">Buy</button>
								<button type="button" id="shopCartBtn" class="btn1">Cart</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<div class="page-content">
			<div class="content-menu-box">
				<div class="content-menu">상품상세</div>
				<div class="content-menu">상품후기</div>
				<div class="content-menu">배송/교환/환불안내</div>
				<div><input id="menu" type="hidden" value="${menu }"></div>
			</div>
			<div class="content-box-wrap">
				<div class="content-box hidden">
					${shop.shopContent } 
				</div>
				<div class="content-box hidden">
					<div class="review-list-header">
					<div>Review</div>
					<div>
						<div>총점</div>
						<div class="avg-icon-wrap">
							<span class="material-symbols-outlined avgRating">star</span>
							<span class="material-symbols-outlined avgRating">star</span>
							<span class="material-symbols-outlined avgRating">star</span>
							<span class="material-symbols-outlined avgRating">star</span>
							<span class="material-symbols-outlined avgRating">star</span>
						</div>
						<div id="avgRating">${shop.avgRating }</div>
					</div>
					</div>
					<div class="review-list-wrap">
						<c:forEach items="${shopReviewList }" var="r" varStatus="i">
							<div class="review-box">
								<div class="member-info-wrap">
									<div class="profile-box">
										<img src="resources/upload/member/${r.memberPhoto }" onerror="this.onerror=null; this.src='resources/image/member/img.jpeg';">
									</div>
									<div class="member-info-box">
										<div class="reviewRating hidden">${r.shopReviewRating }</div>
										<div class="rating-icon-wrap">
											<span class="material-symbols-outlined rating">star</span>
											<span class="material-symbols-outlined rating">star</span>
											<span class="material-symbols-outlined rating">star</span>
											<span class="material-symbols-outlined rating">star</span>
											<span class="material-symbols-outlined rating">star</span>
										</div>
										<div class="member-info">
											<div>${r.memberId }</div>
											<div>${r.reviewDate }</div>
										</div>
									</div>
								</div>
								<div class="review-content-box">
									<div class="review-img-wrap">
										<c:forEach items="${r.reviewPhotoList }" var="p">
											<img src="resources/upload/shopReview/${p.filepath }">
										</c:forEach>
									</div>
									<div>${r.shopReviewContent }</div>
									<c:if test="${r.memberId eq sessionScope.m.memberId }">
										<div class="review-update-btn">
											<button type="button" onclick="updateReview(this);">수정</button>
											<button type="button" onclick="deleteReview(this, '${r.shopReviewNo}')">삭제</button>
										</div>
									</c:if>
								</div>
							</div>
							<div class="review-box hidden">
								<form id="updateCommentFrm-${i.index }" action="/updateShopComment.do" method="post" enctype="multipart/form-data">
									<input type="hidden" id="memberId" name="memeberId" value="${sessionScope.m.memberId }">
									<input type="hidden" id="shopNo" name="shopNo" value="${shop.shopNo }">
									<input type="hidden" name="shopReviewNo" value="${r.shopReviewNo }">
									<input type="hidden" name="reqPage" value="${reqPage }">
									<div class="review-frm-header">
										<div>댓글 수정</div>
										<input type="hidden" name="shopReviewRating" value="${r.shopReviewRating }">
										<div class="star-icon-wrap">
											<span class="material-symbols-outlined update-star">star</span>
											<span class="material-symbols-outlined update-star">star</span>
											<span class="material-symbols-outlined update-star">star</span>
											<span class="material-symbols-outlined update-star">star</span>
											<span class="material-symbols-outlined update-star">star</span>
										</div>
									</div>
									<div class="review-frm-content">
										<div>
											<div class="img-viewer">
												<div class="old-photo-list">
													<c:forEach items="${r.reviewPhotoList }" var="p">
														<div class="old-list photo-name-box">
															<img id="${p.filepath }" src="resources/upload/shopReview/${p.filepath }">
															<div>${p.filepath }</div>
															<button type="button" class="btn-close" onclick="delPhoto(this, '${p.filepath}')"></button>
														</div>
													</c:forEach>
												</div>
												<div class="new-photo-list">
													
												</div>
											</div>
											<input type="file" name="photoList" onchange="uploadPhoto(this)" multiple>
										</div>
										<div>
											<textarea name="shopReviewContent">${r.shopReviewContent }</textarea>
											<div>
												<button type="submit" id="updateCommentBtn" class="btn1">댓글수정</button>
												<button type="button" onclick="closeUpdateFrm(this);">취소</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</c:forEach>
						<div class="pagination">${reviewPageNavi }</div>
					</div>
					<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#commentFrm" aria-expanded="false" aria-controls="collapseCommentFrm">댓글쓰기</button>
					<div class="collapse" id="commentFrm">
						<div class="card card-body">
							<form id="commentForm" action="/insertShopComment.do" method="post" enctype="multipart/form-data">
								<input type="hidden" id="memberId" name="memeberId" value="${sessionScope.m.memberId }">
								<input type="hidden" id="shopNo" name="shopNo" value="${shop.shopNo }">
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
										<input type="file" name="photoList" onchange="uploadPhoto(this)" multiple>
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
				$("#shopReviewRating").val(0)
			} else {
				$(".star").removeClass("star-clicked");
				$(".star").slice(0, index+1).addClass("star-clicked");				
				$("#shopReviewRating").val($((".star-clicked")).length);
			}
		})
		$("[name=shopReviewRating]").each(function(i, r){
			const index = $("[name=shopReviewRating]").index($(r));
			const val = $("[name=shopReviewRating]").eq(index).val();
			const ratings = $(".star-icon-wrap").eq(index).children();
			ratings.slice(0, val).addClass("star-checked")
		})
		$(".update-star").on("click", function(){
			const starIndex = $(".update-star").index($(this));
			const wrap = $(this).parent();
			const wrapIndex = $(".star-icon-wrap").index(wrap);
			const index = starIndex - (wrapIndex * 5) + 1;
			const ratings = $(".star-icon-wrap").eq(wrapIndex).children();
			if($(this).hasClass("star-checked")){
				ratings.removeClass("star-checked");
				$("[name=shopReviewRating]").eq(wrapIndex).val(0)
			} else {
				ratings.removeClass("star-checked");
				ratings.slice(0, index).addClass("star-checked")
				$("[name=shopReviewRating]").eq(wrapIndex).val(index);
			}
		})
		$(".reviewRating").each(function(i, r){
			const index = $(".reviewRating").index($(r));
			const val = $(r).text();
			const ratings = $(".rating-icon-wrap").eq(index).children();
			ratings.slice(0, val).addClass("star-checked")
		})
		$(".reviewRating").each(function(i, r){
			const index = $(".reviewRating").index($(r));
			const val = $(r).text();
			const ratings = $(".rating-icon-wrap").eq(index).children();
			ratings.slice(0, val).addClass("star-checked")
		})
		function calAvgRating(){
			const index = $("#avgRating").text();
			$(".avgRating").slice(0, index).addClass("star-checked");
		}
		
		function uploadPhoto(input){
			const viewer = $(input).prev();
			const viewerIndex = $('.img-viewer').index(viewer);
			if (input.files && input.files.length > 0) {
				for (let i = 0; i < input.files.length; i++) {
					const reader = new FileReader();
					reader.fileName = input.files[i].name;
					reader.readAsDataURL(input.files[i]);
					reader.onload = function(e) {
						const div = $("<div>").addClass("new-list").addClass("photo-name-box")
						const img = $("<img>").attr("src", e.target.result);
						div.append(img);
						$(".new-photo-list").eq(viewerIndex).append(div);
						const name = e.target.fileName;
					}
				}
			}
		}
		$("#insertCommentBtn").on("click", function(event){
			event.preventDefault();
			var form = $('#commentForm')[0];  	    
		    var data = new FormData(form);  	   
		    console.log(data);
		    $.ajax({             
		    	type: "POST",          
		        url: "/insertShopReview.do",   
		        enctype: 'multipart/form-data', 
		        data: data,  
		        processData: false,    
		        contentType: false, 
		        cache:false,
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
		function sendNavi(shopNo, reqPage){
			location.href="/viewShop.do?shopNo="+shopNo+"&reqPage="+reqPage+"&menu=1";
		}
		$("#shopCartBtn").on("click", function(){
			const memberId = $("#memberId").val();
			const shopNo = $("#shopNo").val();
			$.ajax({
				url : "/insertBasket.do",
				data : {memberId : memberId, shopNo : shopNo},
				type : "post",
				success : function(data){
					console.log(data);
					alert("장바구니에 추가 되었습니다");
				},
				error : function(){
					
				}
			})
		})
		function updateReview(obj, shopReviewNo){
			const reviewBox = $(obj).parents(".review-box");
			reviewBox.addClass("hidden");
			reviewBox.next().removeClass("hidden");
		}
		function deleteReview(obj, shopReviewNo){
			$.ajax({
				url : "/deleteShopReview.do",
				data : {shopReviewNo : shopReviewNo},
				success : function(data){
					console.log(data);
					if(data == "success"){
						$(obj).parents(".review-box").next().remove();
						$(obj).parents(".review-box").remove();
					}
				},
				error : function(e){
					console.log(e)
				}
			})
		}
		function closeUpdateFrm(obj){
			const reviewBox = $(obj).parents(".review-box");
			reviewBox.addClass("hidden");
			reviewBox.prev().removeClass("hidden");
		}
		function delPhoto(obj, filepath){
			const box = $(obj).parent().parent();
			const wrapIndex = $(".old-photo-list").index(box);
			$(obj).parent().remove();
			const input = $("<input>").attr("type","hidden").attr("name","delPhotoList").val(filepath);
			$(".img-viewer").eq(wrapIndex).after(input)
		}
		
		$(".content-menu").eq($("#menu").val()).click()
		calTotalPrice()
		calPrice()
		calAvgRating()
	</script>
	
	<script>
	$("#payBtn").on("click",function(){
		const price = $(".totalPrice").text();
		const sellCount = $("[name=sellCount]").val();
		const d = new Date();
		const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
		
		IMP.init("imp76553310");
		
		IMP.request_pay({
			pg : "html5_inicis",
			pay_method : "card",
			merchant_uid : "상품번호_"+date,//상점에서 관리하는 주문번호
			name : "${shop.shopTitle}", //결제 이름
			amount : price,  // 결제 금액
			buyer_email : "${sessionScope.m.memberEmail}",
			buyer_name : "${sessionScope.m.memberName}",
			buyer_tel : "${sessionScope.m.memberPhone}",
			buyer_addr : "${sessionScope.m.memberAddr}",
			buyer_postcode : "12345"
		},function(rsp){
			if(rsp.success){
				alert("결제성공");
				//결제관련 정보를 DB에 insert하는 작업이 필요
				$.ajax({
					url : "/insertShopOrder.do",
					type : "post",
					data : {
						orderName:"${sessionScope.m.memberName}",
						orderPhone:"${sessionScope.m.memberPhone}",
						orderAddr:"${sessionScope.m.memberAddr}",
						totalPrice:price,
						shopNo:${shop.shopNo},
						memberId:"${sessionScope.m.memberId}",
						sellCount:sellCount,
						},
					success : function(data){
						console.log("결재 정보 DB UPDATE 성공");
					},
					error : function(){
						console.log("결재 정보 DB UPDATE 실패");
					}
				});
			}else{
				alert("결제실패");
			}
		});
	});
	</script>
</body>
</html>