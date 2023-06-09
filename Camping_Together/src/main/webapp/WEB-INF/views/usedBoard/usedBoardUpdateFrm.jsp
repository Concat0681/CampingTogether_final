<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/resources/css/default.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 다음 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <style>
        *{
            outline: none;
            text-decoration: none;
        }
        .page-content{
        	width: 1200px;
            margin: 0 auto;
        	margin-top: 230px;
        }
        .btn2, .btn1{
        	padding: 10px;
        	font-family: ng-bold;
        	font-size: 16px;
        	cursor: pointer;
        }
        .material-symbols-outlined {
            font-variation-settings:
            'FILL' 0,
            'wght' 100,
            'GRAD' 0,
            'opsz' 48
        }
        .input-type{
            width: 580px;
            font-size: 16px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .long{
            width: 1000px;
        }
         .content-top>h2{
            font-family: ng-bold;
            color: #AD8B73;
        }
        .category-bottom{
        	margin-left: 40px;
        }
        input[name=usedBoardCategory]{
            display: none;
        }
        input[name=usedBoardCategory]+label{
            display: inline-block;
            text-align: center;
            cursor: pointer;
            border: 2px solid #E3CAA5;
            background-color: #E3CAA5;
            color: #fff;
            border-radius: 8px;
            margin: 8px;
            padding: 8px 10px;
            font-size: 13px;
            font-weight: bold;
        }
        input[name=usedBoardCategory]:checked+label{
            background-color: #AD8B73;
            border: 2px solid #AD8B73;
            color: #FFFBE9;
        }
        .usedWrite-text{
            float: left;
            text-align: center;
        }
        .usedWrite-text>span{
            font-size: 20px;
            font-weight: bold; 
            color: #AD8B73;
        }
        .category-content{
            text-align: center;
            height: 130px;
        }
        .category{
            margin: 30px 0px;
            border-bottom: 1px solid #ccc;
        }
        .image-wrap{
            overflow: hidden;
            border-bottom: 1px solid #ccc;
            padding-bottom: 30px;
        }
        .usedBoard-img{
            float: left;
            margin-right: 50px;
        }
        .uploadImg{
            width: 160px;
            height: 160px;
            border: 1px solid #ccc;
            border-radius: 8px;
            text-align: center;
        }
        .uploadImg>SPAN{
            font-size: 70px;
            color: #ccc;
            line-height: 150px;
        }
        #img-margin{
            margin-right: 170px;
        }
        input[name=usedBoardImg]{
            display: none;
        }
        .image-guide{
            height: 180px;
        }
        .image-guide>p{
            color: #AD8B73;
        }
        .img-sub-wrap, .current-img-sub-wrap{
            overflow: hidden;
            margin-left: 250px; 
        }
        .img-sub, .current-img-sub{
            float: left;
            width: 80px;
            height: 80px;
            border: 1px solid #ccc;
            margin-left: 10px; 
            position: relative;          
        }
        .delete-img{
        	position: absolute;
			right: 0px;
			bottom: 0px;
        	cursor: pointer;
        	background-color: #000;
        	opacity: 75%;
        	font-size: 20px;
        	color: #fff;
        	font-variation-settings:'wght' 400
        }
        .usedBoard-title{
            padding: 30px 0px;
            border-bottom: 1px solid #ccc;
        }
        .usedWrite-text{
        	margin-right: 30px;
        	line-height: 40px;
        }
        .delivery_location, .price{
        	margin: 30px 0px;
        }
        .price, .usedWrite-content{
        	padding-bottom: 30px;
        	border-bottom: 1px solid #ccc;
        }
        .product-status-radio, .exchange-status-radio{
        	height: 50px;
        	line-height: 40px;
        }
        .exchange-status-radio{
        	padding-bottom: 15px;
        	border-bottom: 1px solid #ccc;
        }
        .button-wrap{
       		padding: 30px 0px;      		
       		margin-right: 20px;
       		text-align: right;
       	}
       	.button-wrap>input{
       		margin-left: 5px;
       	}
        .txt{
        	resize: none;
        	height: 300px;
        	width: 900px;
        }
        input[type=checkbox], input[type=radio] {
    		accent-color: #AD8B73;
		}
		#usedTradeLocation{
			margin-left: 105px;
		}
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-content">
        <div class="content-top">
        	<h2>기본정보</h2>
        	<hr>
        </div>
        <form action="/boardUpdate.do" method="post" enctype="multipart/form-data" id="updateFrm">
        	<input type="hidden" value="${sessionScope.m.memberId }" name="usedBoardWriter">
        	<input type="hidden" value="${ub.usedBoardNo }" name="usedBoardNo">
            <div class="usedWrite-wrap">
                <div class="category">
                    <div class="usedWrite-text"><span>구분</span></div>
                    <div class="category-content">
                        <div class="category-top">
                        	<input type="hidden" id="usedBoardCategory" value="${ub.usedBoardCategory }">             
                            <input type="radio" name="usedBoardCategory" value="1" id="1">
                            <label for="1">전기/전자제품</label>
                            <input type="radio" name="usedBoardCategory" value="2" id="2">
                            <label for="2">캠핑카/카라반용품</label>
                            <input type="radio" name="usedBoardCategory" value="3" id="3">
                            <label for="3">화로/버너/BBQ</label>
                            <input type="radio" name="usedBoardCategory" value="4" id="4">
                            <label for="4">안전/위생용품</label>
                        </div>
                        <div class="category-bottom">
                            <input type="radio" name="usedBoardCategory" value="5" id="5">
                            <label for="5">텐트/타프</label>
                            <input type="radio" name="usedBoardCategory" value="6" id="6">
                            <label for="6">침낭/매트</label>
                            <input type="radio" name="usedBoardCategory" value="7" id="7">
                            <label for="7">차박용품</label>
                            <input type="radio" name="usedBoardCategory" value="8" id="8">
                            <label for="8">조명기구</label>
                            <input type="radio" name="usedBoardCategory" value="9" id="9">
                            <label for="9">기타캠핑용품</label>
                            <input type="radio" name="usedBoardCategory" value="10" id="10">
                            <label for="10">기타생활용품</label>
                        </div>        
                    </div>              
                </div>
                <div class="image-wrap">
                    <div class="usedWrite-text" id="img-margin"><span>상품이미지</span></div>
                    <div class="usedBoard-img">
                        <input type="file" name="usedBoardPhoto" accept="image/gif, image/jpeg, image/png" style="display:none;" id="usedBoardImg" multiple>
                        <label for="usedBoardImg">
                            <div class="uploadImg">
                            	<span class="material-symbols-outlined">photo_camera</span>
                            </div>
                        </label>
                    </div>
                    <div class="image-guide">
                        <p>
                        * 상품 이미지는 640x640에 최적화 되어 있습니다.<br>
                        - 상품 이미지는 PC에서는 1:1, 모바일에서는 1:1.23 비율로 보여집니다.<br>
                        - 이미지는 상품 등록 시 정사각형으로 잘려서 등록됩니다.<br>
                        - 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다.<br>
                        - 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br>
                        - 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수 있습니다.<br>
                                                          최대 지원 사이즈인 640 X 640으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
                        </p>
                    </div>
                    <div class="img-sub-wrap">
                    </div>
                    <div class="current-img-sub-wrap">
                    <c:forEach items="${ub.usedBoardPhotoList }" var="ubp">
                    	<div class="current-img-sub">
                    		<img style='width:100%;height:100%;'src="/resources/upload/usedBoard/${ubp.filepath }">
	                    	<div class="material-symbols-outlined delete-img current-delImg" onclick="deleteImg(this, ${ubp.fileNo}, '${ubp.filepath}')">close</div>
                    	</div>
                    </c:forEach>
                    </div>               
                </div>
                <div class="usedBoard-title" >
                    <div class="usedWrite-text" style="margin-right: 70px;"><span>제목</span></div>
                    <input type="text" name="usedBoardTitle" class="input-type long" value="${ub.usedBoardTitle }" required>
                </div>
                <div class="location-wrap">
                    <div class="delivery_location">
                        <div class="usedWrite-text"><span>거래지역</span></div>
                        <input type="button" value="주소검색" class="btn2" onclick="searchAddr();">
                        <input type="checkbox" id="location-none"><label for="location-none">지역설정안함</label>
                        <div class="location-input" name="usedTradeLocation">
                        	<input type="text" class="input-type" id="usedTradeLocation" name="usedTradeLocation" style="width:300px;margin-top:10px;" value="${ub.usedTradeLocation }" required>
                        </div>
                    </div>
                    <div class="product-status">
                    	<input type="hidden" id = "usedProductStatus" value="${ub.usedProductStatus}">
                        <div class="usedWrite-text" style="margin-right: 70px;" name="usedProductStatus"><span>상태</span></div>
                        <div class="product-status-radio">
	                        <input type="radio" name="usedProductStatus" value="0" id="status0" checked>
	                        <label for="status0">중고상품</label>
	                        <input type="radio" name="usedProductStatus" value="1" id="status1">
	                        <label for="status1">새상품</label>
                        </div>
                    </div>
                    <div class="exchange-status">
                    	<input type="hidden" id="exchangeStatus" value="${ub.exchangeStatus }">
                        <div class="usedWrite-text" style="margin-right: 70px;" name="exchangeStatus"><span>교환</span></div>
                        <div class="exchange-status-radio">
	                        <input type="radio" name="exchangeStatus" value="0" id="exchange0" checked>
	                        <label for="exchange0">교환가능</label>
	                        <input type="radio" name="exchangeStatus" value="1" id="exchange1">
	                        <label for="exchange1">교환불가능</label>
                        </div>
                    </div>
                </div>
                <div class="price">
                    <div class="usedWrite-text" style="margin-right: 70px;" ><span>가격</span></div>
                    <div class="price-input">
                        <input type="text" class="input-type" name="usedProductPrice" id="price-input"style="width:300px;" value="${ub.usedProductPrice }"required >
                    </div>
                </div>
                <div class="usedWrite-content">
                    <div class="usedWrite-text" style="margin-right: 70px;"><span>설명</span></div>
                    <div class="usedWrite-content-input">
                    	<textarea class="input-type txt" placeholder="내용을 입력하세요." name="usedBoardContent" required>${ub.usedBoardContent }</textarea>
                    </div>
                </div>
                <div class="button-wrap">
                	<input type="button" onclick="location.href='usedBoardList.do?reqPage=1'" class="btn2" value="취소">
                	<input type="submit" class="btn1" value="수정완료">
                </div>                
            </div>
        </form>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
    	/*지역관련 스크립트*/
	    $("#location-none").on("change", function(){
				if($(this).is(":checked")){
				$("#usedTradeLocation").val("지역설정안함");                   					
				}else{
					$("#usedTradeLocation").val("");
				}
		});
		function searchAddr(){
			 new daum.Postcode({
			        oncomplete: function(data) {
			        	const sido = data.sido;
			        	const sigungu = data.sigungu;
			        	$("#usedTradeLocation").val(sido+" "+sigungu);
			        }
			    }).open();
		}
		/* 이미지 관련 스크립트 */
		let sel_files = [];
		$(document).ready(function(){
			$("#usedBoardImg").on("change", function(e){
				let files = e.target.files;
				let filesArr = Array.prototype.slice.call(files);
				if($("#usedBoardImg")[0].files.length > 8){
					alert("상품이미지는 8개 이하만 첨부 가능합니다.");
					return false;
				}
				filesArr.forEach(function(f){
					$(".img-sub-wrap").html("");
					let img = [];
					sel_files.push(f);
					const reader = new FileReader();
					reader.onload = function(e){
						img.push("<img style='width:100%;height:100%;'src=\""+e.target.result+"\" /><div class='material-symbols-outlined delete-img' onclick='delImg(this)'>close</div>");
						const div = $("<div class='img-sub'></div>");
						div.append(img);
						$(".img-sub-wrap").append(div);	   
					}
				reader.readAsDataURL(f);
				});
			});
		});
		
		$("#price-input").on("change", function(){
			const priceVal = $(this).val();
			const regExp = /^[0-9]+$/;
			const check = regExp.test(priceVal);
            if(!check){
                alert("숫자만 입력해주세요.");
                $(this).val("");
                $(this).focus();
            }
		});
		
		$("#usedBoardImg").on("change", function(){
			$(".current-delImg").click();
		});
		
		/* 새로추가한 이미지 부분삭제 스크립트 */
		function delImg(obj){
			const index = $(".delete-img").index($(obj));
			console.log(index);
			
			const dataTransfer = new DataTransfer();
			let files = $("#usedBoardImg")[0].files;
			let fileArray = Array.from(files);
			fileArray.splice(index, 1);
			
			fileArray.forEach(function(file, items){
				dataTransfer.items.add(file);
			});
			
			$("#usedBoardImg")[0].files = dataTransfer.files;
		
			$(obj).parent().remove();
		}
		
		/* 기존이미지 삭제 스크립트 */
		function deleteImg(obj, fileNo, filepath){	
			const fileNoInput = $("<input>");
			fileNoInput.attr("name", "fileNo");
			fileNoInput.val(fileNo);
			fileNoInput.hide();
			
			const filepathInput = $("<input>");
			filepathInput.attr("name", "filepath");
			filepathInput.val(filepath);
			filepathInput.hide();
			
			$("#updateFrm").append(filepathInput).append(fileNoInput);
			$(obj).parent().remove();
		}
		
		$(function(){
    		const selectCategory = $("#usedBoardCategory").val();
    		const usedProductStatus = $("#usedProductStatus").val();
    		const exchangeStatus = $("#exchangeStatus").val();
    		
    		$("[name=usedBoardCategory][value="+selectCategory+"]").prop("checked", true);
    		$("[name=usedProductStatus][value="+usedProductStatus+"]").prop("checked", true);
    		$("[name=exchangeStatus][value="+exchangeStatus+"]").prop("checked", true);
    	});
	
    </script>
</body>
</html>