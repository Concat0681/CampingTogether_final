<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/modalAlert.jsp" />
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
	<div class="page-wrap">
		<div class="page-header">
			<div class="slider-box">
				<div class="slider slider-for">
					<c:forEach items="${shop.shopPhotoList }" var="p">
							<img src="resources/upload/shop/${p.filepath }" style="width : 100%;">
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
					<div class="title-1" >캠핑용품</div>
					<div>${shop.shopTitle }</div>
				</div>
				<div class="product-info">
					<div>
						<div class="p-title">판매가</div>
						<div>
							<div><fmt:formatNumber value="${shop.shopPrice }" pattern="#,###"/></div>
							<input type="hidden" id="shopPrice" value="${shop.shopPrice  }">
							<span>원</span>
						</div>
					</div>
					<div>
						<div class="p-title">배송방법</div>
						<div id="shopD">택배</div>
					</div>
					<div>
						<div class="p-title">배송비</div>
						<div>
							<div><fmt:formatNumber value="${shop.delivaryPrice }" pattern="#,###"/></div>
							<input type="hidden" id="delivaryPrice" value="${shop.delivaryPrice  }">
							<span>원</span>
						</div>
					</div>
				</div>
				<div class="product-price-wrap">
					<div>
						<div style="font-size: 22px; color: #AD8B73; font-family:ng-bold;">수량</div>
						<div class="shop-count-btn-box">
							<span id="minus" class="material-symbols-outlined">remove</span>
							<input type="text" name="sellCount" value=1 readonly>
							<span id="plus" class="material-symbols-outlined">add</span>
						</div>
					</div>
					<div>
						<div class="priceResult" style="padding : 30px 0 30px 0; color: #5d5d5d; font-size: 22px;"></div>
						<input type="hidden" id="priceResult">
						<span style="padding : 30px 0 30px 0; color: #5d5d5d; font-size: 22px;">원</span>
					</div>
				</div>
				<div class="product-totalPrice-wrap">
					<div>
						<div style="font-size: 22px; color: #AD8B73; font-family:ng-bold;">TOTAL</div>
						<div>
							<div class="totalPrice tp"></div>
							<input type="hidden" id="totalPrice">
							<span class="tp">원</span>
						</div>
					</div>
					<div class="product-btn-wrap">
						<c:choose>
							<c:when test="${empty sessionScope.m }">
								<button class="btn1 loginBtn">Buy</button>
								<button type="button" class="btn1 loginBtn">Cart</button>
							</c:when>
							<c:when test="${sessionScope.m.memberGrade == 'a' }">
								<button class="btn1" id="updateShopBtn">수정</button>
								<button class="btn1" id="deleteShopBtn">삭제</button>
							</c:when>
							<c:otherwise>
								<button class="btn1" id="payBtn"  style="margin: 0; font-size: 22px;">Buy</button>
								<c:choose>
									<c:when test="${shop.shopBasketNo eq 0 }">
										<button type="button" id="shopCartBtn" class="btn1" style="font-size: 22px;">Cart</button>
									</c:when>
									<c:otherwise>
									<button type="button" id="shopCartedBtn" class="btn2" style="font-size: 22px;">장바구니로</button>
									</c:otherwise>
								</c:choose>
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
					<div>${shop.shopContent }</div>
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
					<c:if test="${empty shopReviewList }">
						<div class="no-result-wrap">
							<img src="/resources/image/logo/logo250x80.png">
							<h3>리뷰가 없습니다</h3>
						</div>
					</c:if>
					<div class="review-list-wrap">
						<c:forEach items="${shopReviewList }" var="r" varStatus="i">
							<div class="review-box">
								<div class="member-info-wrap">
									<div class="profile-box">
										<img src="resources/image/member/${r.memberPhoto }" onerror="this.onerror=null; this.src='resources/image/member/img.jpeg';">
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
											<button type="button" class="btn1" onclick="updateReview(this);">수정</button>
											<button type="button" class="btn2" onclick="deleteReview(this, '${r.shopReviewNo}')">삭제</button>
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
												<button type="button" class="btn2" onclick="closeUpdateFrm(this);">취소</button>
												<button type="submit" id="updateCommentBtn" class="btn1">댓글수정</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</c:forEach>
						<c:if test="${not empty  shopReviewList}">
							<div class="pagination">${reviewPageNavi }</div>
						</c:if>
					</div>
						<button class="up-btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#commentFrm" aria-expanded="false" aria-controls="collapseCommentFrm">댓글쓰기</button>
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
										<div id="img-viewer" style="min-height : 175px;">
											<div class="new-photo-list">
													
											</div>
										</div>
										<input type="file" name="photoList" onchange="uploadPhoto(this)" multiple>
									</div>
									<div>
										<textarea name="shopReviewContent" placeholder="내용을 입력해주세요"></textarea>
										<div class="review-update-btn">
											<button type="submit" id="insertCommentBtn" style="width : 100%" class="btn1">댓글등록</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="content-box hidden">
					<table>
                                <caption>배송/교환/반품/AS</caption>
                                <colgroup>
                                    <col width="250" style="background-color: #e3caa545;" >
                                    <col width="*">
                                </colgroup>
                                <tbody><tr>
                                	<th>배송안내</th>
                                	<td>
                                		<b>제품 수령 후 구성품을 꼭 확인해주세요.</b><br>
										수령 후 30일이 지난 제품의 구성품 누락 및 오배송에 대한 문의는 당사에서 해결해 드리기 어려우니, <br>반드시 수령 후 구성품과 제품확인으로 문제가 없는지 확인해주시기 바랍니다.<br><br>										
										<b>제품 사진은 촬영시 카메라 플래쉬, 모니터에 따라 실제 제품 이미지와 다소 차이가 있을 수 있습니다.</b><br><br>
                                                                                <b>제품 실측 사이즈는 측정에 따라 실제 사이즈와 약간의 오차가 발생할 수 있습니다.</b><br><br>
										<b>주문상품 배송은 결제 확인 후 2~5일 정도 소요되며, 제품에 따라 배송일이 지연될 수 있음을 양해바랍니다.</b><br><br>
										<b>택배사는 로젠택배를 이용하고 있으며, 배송 및 택배 관련 문의는 1588-9988 로젠택배로 문의하시기 바랍니다.</b><br><br>
                                                                                <b>총 결제금액 50,000원 미만시 배송비 3,000원이 청구됩니다.(도서 산간지역 별도 적용)</b><br><br>						
										<b>제품에 따라 묶음배송 불가상품이 있으며, 주문금액과 상관없이 별도 배송비가 부과될 수 있습니다.</b>										
                                	</td>
                                </tr>
                                <tr>
                                	<th>교환/반품안내</th>
                                	<td>
                                		<b>교환/반품이 가능한 경우</b><br>
										- 단순변심으로 인한 교환/반품은 왕복배송비를 고객님께서 지불해 주셔야 합니다.<br>
                                                                                - 초기불량, 배송오류는 오캠몰에서 왕복 택배비를 부담하여 교환 및 반품처리 해드립니다.<br><br>
										
										<b>교환/반품이 불가능한 경우</b><br>
										- 상품 수령 후 7일을 초과한 경우 변심 또는 제품 만에 대한 교환/반품은 불가합니다.(디자인,사이즈,실측정보,소재,색상,스크래치,실밥 등)<br>
										- 고객부주의 또는 제품 사용으로 상품훼손 등 상품 가치가 떨어진 경우 교환/반품이 불가합니다.<br>
                                                                                - 브랜드 박스 개봉 및 훼손, 상품태그 제거 등 상품 가치가 떨어진 경우 교환/반품이 불가합니다.<br>
                                                                                - 상품 초기불량 확인 후 고객의 과실에 의한 상품훼손 및 사용으로 상품 가치가 떨어진 경우 교환/반품이 불가합니다.<br>
                                                                                - 세탁,수선 등 취급부주의로 인하여 상품이 훼손된 경우 교환/반품이 불가합니다.
										
                                                                                
                                	</td>

                                </tr>
                                <tr>
                                	<th>A/S안내</th>
                                	<td>
                                                <b>제품 A/S는 반드시 손상된 제품이 입고되어야 A/S가 가능합니다.</b><br><br>
                                		                                         <b>본사제품의 경우 제품 결함에 의한 수리는 제품 구입일로부터 30일간 무상 A/S를 받으실 수 있습니다.</b><br>
										                                            그외 A/S는 모두 유상 수리로 진행되며, 일부 손상 정도에 따라 A/S가 불가할 수 있습니다.<br><br>										
										                                         <b>자세한 A/S 정책은 AS라운지의 게시판을 참고해 주시기 바랍니다.</b>
										
                                	</td>
                                </tr>
                                <tr>
                                	<th style="border-bottom: 1px solid #E3CAA5;">교환/반품/AS 주소</th>
                                	<td> 						
										        <b>주소 : (13550) 경기도 성남시 분당구 대왕판교로 361번길(궁내동) 오캠몰</b> <br>
										        <b> 연락처 : 031-712-4371</b><br><br>
                                                교환/반품/AS접수는 로젠택배(1588-9988)로 전화하셔서 배송 운송장 번호 또는 개별접수로 반송해 주시면 됩니다.
										
                                	</td>
                                </tr>
                            </tbody></table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
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
				slidesToShow : 3,		// 한 화면에 보여질 컨텐츠 개수
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
			const price = $("#shopPrice").val()
			$(".priceResult").text(String(count * price).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$("#priceResult").val((count * price))
			calTotalPrice()
		}
		function calTotalPrice(){
			const price = $("#priceResult").val();
			const delivary = $("#delivaryPrice").val();
			$(".totalPrice").text(String(parseInt(price) + parseInt(delivary)).replace(/\B(?=(\d{3})+(?!\d))/g, ","))
			$("#totalPrice").val(parseInt(price) + parseInt(delivary));
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
		$("#updateShopBtn").on("click", function(){
			const shopNo = $("#shopNo").val();
			location.href="/updateShopFrm.do?shopNo="+shopNo;
		})
		$("#deleteShopBtn").on("click", function(){
			const shopNo = $("#shopNo").val();
			location.href="/deleteShop.do?shopNo="+shopNo;
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
						const fileNameDiv = $("<div>").append(input.files[i].name);
						const button = $("<button>").addClass("btn-close").attr("type", "button").attr("onclick", "delNewPhoto(this)")
						div.append(img).append(fileNameDiv).append(button);
						$(".new-photo-list").eq(viewerIndex).append(div);
						const name = e.target.fileName;
					}
				}
			}
		}
		
		function delNewPhoto(obj){
			const fileNum = $(".new-list").index($(obj).parent());
			const viewerIndex = $(".img-viewer").index($(obj).parent().parent().parent())
			const dataTransfer = new DataTransfer();
		    
		    let files = $("input[name=photoList]").eq(viewerIndex)[0].files;	//사용자가 입력한 파일을 변수에 할당
		    
		    let fileArray = Array.from(files);	//변수에 할당된 파일을 배열로 변환(FileList -> Array)
		    
		    fileArray.splice(fileNum, 1);	//해당하는 index의 파일을 배열에서 제거
		    
		    fileArray.forEach(file => { dataTransfer.items.add(file); });
		    //남은 배열을 dataTransfer로 처리(Array -> FileList)
		    
		    $("input[name=photoList]").eq(viewerIndex)[0].files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
		    $(obj).parent().remove();
		}
		
		$("#insertCommentBtn").on("click", function(event){
			event.preventDefault();
			var form = $('#commentForm')[0];  	    
		    var data = new FormData(form);  	   
		    $.ajax({             
		    	type: "POST",          
		        url: "/insertShopReview.do",   
		        enctype: 'multipart/form-data', 
		        data: data,  
		        processData: false,    
		        contentType: false, 
		        cache:false,
		        success: function (data) { 
		        	if(data == "success"){
		        		const memberId = $("#memberId").val();
		    			const shopNo = $("#shopNo").val();
			        	$('#commentForm')[0].reset();
			        	$(".star").removeClass("star-clicked");
			        	$('.collapse').collapse('hide')
			        	swalAlert("/viewShop.do?shopNo="+shopNo+"&reqPage=1&menu=1&memberId="+memberId , "success", "댓글등록 성공", "댓글 등록에 성공하였습니다.");		        		
		        	}
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
					if(data =="exist"){
						swalAlert("/viewShop.do?shopNo="+shopNo+"&reqPage=1&menu=0&memberId="+memberId, "error", "장바구니에 추가 실패", "상품이 장바구니에 이미 존재합니다");
					} else {
						swalAlert("/viewShop.do?shopNo="+shopNo+"&reqPage=1&menu=0&memberId="+memberId, "success", "장바구니에 추가", "상품이 장바구니에 추가 되었습니다");
					}
				},
				error : function(){
					
				}
			})
		})
		
		$("#shopCartedBtn").on("click", function(){
			const memberId = $("#memberId").val();
			location.href="/shopWishList.do?reqPage=1&memberId="+memberId;
		})
		function updateReview(obj, shopReviewNo){
			const reviewBox = $(obj).parents(".review-box");
			reviewBox.addClass("hidden");
			reviewBox.next().removeClass("hidden");
		}
		function deleteReview(obj, shopReviewNo){
			const memberId = $("#memberId").val();
			const shopNo = $("#shopNo").val();
			$.ajax({
				url : "/deleteShopReview.do",
				data : {shopReviewNo : shopReviewNo},
				success : function(data){
					console.log(data);
					if(data == "success"){
						swalAlert("/viewShop.do?shopNo="+shopNo+"&reqPage=1&menu=1&memberId="+memberId, "success", "리뷰 삭제 성공", "리뷰 삭제에 성공하였습니다.");
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
			const price = $("#totalPrice").val();
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
							maxCount:sellCount,
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