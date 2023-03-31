<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/resources/css/default.css">
   <style>
        *{
            outline: none;
        }
        .btn2{
        	padding: 10px;
        	font-family: ng-bold;
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
        .page-content{
            width: 1200px;
            margin: 0 auto;
        }
        .content-top>h1{
            margin: 20px;
            padding-top: 20px;
        }
        .category-bottom{
        	margin-left: 40px;
        }
        input[name=usedBoardCategory]{
            display: none;
        }
        input[name=usedBoardCategory]+label{
            display: inline-block;
            height: 30px;
            line-height: 30px;
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
            height: 150px;
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
            width: 180px;
            height: 180px;
            border: 2px solid #ccc;
            border-radius: 8px;
            font-size: 70px;
            color: #ccc;
        }
        #img-margin{
            margin-right: 170px;
        }
        input[name=usedBoardImg]{
            display: none;
        }
        .image-guide{
            padding-top: 15px;
            height: 180px;
        }
        .image-guide>p{
            color: #AD8B73;
        }
        .img-sub-wrap{
            overflow: hidden;
            margin-left: 250px;
        }
        .img-sub{
            float: left;
            width: 80px;
            height: 80px;
            border: 1px solid #ccc;
            border-radius: 10px;
            margin-left: 10px;
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
        .price{
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
        .txt{
        	resize: none;
        	height: 300px;
        	width: 900px;
        }
    </style>
</head>
<body>
	<div class="page-content">
        <div class="content-top">
            <h1>기본정보</h1>
            <hr>
        </div>
        <form action="/boardWrite.do" method="post" enctype="multipart/form-data">
            <div class="usedWrite-wrap">
                <div class="category">
                    <div class="usedWrite-text"><span>구분</span></div>
                    <div class="category-content">
                        <div class="category-top">
               
                            <input type="radio" name="usedBoardCategory" value="1" id="1" checked>
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
                            <input type="radio" name="usedBoardCategory" value="10" id="10">
                            <label for="10">조명기구</label>
                            <input type="radio" name="usedBoardCategory" value="8" id="8">
                            <label for="8">기타캠핑용품</label>
                            <input type="radio" name="usedBoardCategory" value="9" id="9">
                            <label for="9">기타생활용품</label>
                        </div>        
                    </div>              
                </div>
                <div class="image-wrap">
                    <div class="usedWrite-text" id="img-margin"><span>상품이미지</span></div>
                    <div class="usedBoard-img">
                        <input type="file" name="usedBoardImg" multiple accept="image/gif, image/jpeg, image/png" id="usedBoardImg">
                        <label for="usedBoardImg">
                            <div class="uploadImg"></div>
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
                        <div class="img-sub"></div>
                        <div class="img-sub"></div>
                        <div class="img-sub"></div>
                    </div>
                </div>
                <div class="usedBoard-title" >
                    <div class="usedWrite-text"><span>제목</span></div>
                    <input type="text" name="usedBoardTitle" class="input-type long" placeholder="제목을 입력하세요">
                </div>
                <div class="location-wrap">
                    <div class="delivery_location">
                        <div class="usedWrite-text"><span>거래지역</span></div>
                        <input type="button" value="주소검색" class="btn2">
                        <input type="checkbox"> 지역설정안함
                        <div class="location-input">
                        	<input type="text" class="input-type" style="width:300px;margin-top:10px;" readonly>
                        </div>
                    </div>
                    <div class="product-status">
                        <div class="usedWrite-text"><span>상태</span></div>
                        <div class="product-status-radio">
	                        <input type="radio" name="usedProductStatus" value="0" id="0">
	                        <label for="0">중고상품</label>
	                        <input type="radio" name="usedProductStatus" value="1" id="1">
	                        <label for="1">새상품</label>
                        </div>
                    </div>
                    <div class="exchange-status">
                        <div class="usedWrite-text"><span>교환</span></div>
                        <div class="exchange-status-radio">
	                        <input type="radio" name="exchangeStatus" value="0" id="0">
	                        <label for="0">교환가능</label>
	                        <input type="radio" name="exchangeStatus" value="1" id="1">
	                        <label for="1">교환불가능</label>
                        </div>
                    </div>
                </div>
                <div class="price">
                    <div class="usedWrite-text"><span>가격</span></div>
                    <div class="price-input">
                        <input type="text" class="input-type" style="width:300px;">
                    </div>
                </div>
                <div class="usedWrite-content">
                    <div class="usedWrite-text"><span>설명</span></div>
                    <div class="usedWrite-content-input">
                    	<textarea class="input-type txt"></textarea>
                    </div>
                </div>
                <div class="button-wrap"></div>
                
            </div>
        </form>
    </div>
</body>
</html>