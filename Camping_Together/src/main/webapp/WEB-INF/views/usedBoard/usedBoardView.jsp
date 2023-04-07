<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
   .page-content{
   		width: 1200px;
        margin: 0 auto;
   		padding-top: 130px;
   }
   .content-top>h1{
       margin: 20px;
   }
   .detail-wrap{
   		width: 80%;
   		margin: 30px auto;
   }
   .detail-info{
   		padding-top: 8px;
   }
   .detail-top-wrap, .detail-price-wrap{
   		padding-left: 20px;
   		padding-bottom: 15px;
   		padding-top: 15px;
   		border-bottom: 1px solid #ccc;
   }
   .detail-price-wrap{
   		position: relative;
   }
   .detail-info{
   		display: flex;
   }
   #phone-check:hover{
   		cursor: pointer;
   }
   .wish-list{
		position: absolute;
		margin-left: 890px;
		top: 25px;
   }
   .wish-list>span{
   		font-size: 30px;
   		font-weight: 100;
   		cursor: pointer;
   }
   .detail-content-wrap{
   		margin-top: 20px;
   		padding: 10px;
   }
   .detail-content-wrap div{
   		margin-bottom: 20px;
   }
   .detail-content-img{
		width: 400px;
		height: 400px;
   }
   .detail-content-img>img{
   		width: 100%;
   }
   .detail-content{
   		display: flex;
   }
   .detail-content-text{
   		margin-top: 20px;
   		margin-left: 30px;
   }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-content">
		<div class="content-top">
            <h1>상품정보</h1>
            <hr>
        </div>
        <div class="detail-wrap">
        	<div class="detail-top-wrap">
        		<div class="detail-title">
        			<h2>${ub.usedBoardTitle }</h2>
        		</div>
        		<div class="detail-info">
	        			<span>${ub.usedBoardWriter }</span>
	        			<span>&nbsp; | &nbsp;</span>
	        			<span>${ub.regDate }</span>
	        			<span>&nbsp; | &nbsp;</span>
	        			<span class="material-symbols-outlined">visibility</span>
	        			<span>${ub.readCount }</span>
        		</div>
        	</div>
        	<div class="detail-price-wrap">
        		<div class="detail-price">
        			<h5>판매금액 : ${ub.usedProductPrice }</h5>
        			<div class="detail-info">
        				<span>상품상태 : ${ub.usedProductStatus }</span>
        				<span>&nbsp; | &nbsp;</span>
        				<span>교환여부 : ${ub.exchangeStatus }</span>
        				<span>&nbsp; | &nbsp;</span>
        				<span>거래지역 : ${ub.usedTradeLocation }</span>
        			</div>
        		</div>
        		<div class="wish-list">
        			<span class="material-symbols-outlined">favorite</span>
        		</div>
        	</div>
        	<div class="detail-content-wrap">
        		<div class="seller-phone">
        			<span id="phone-check">연락처를 확인하려면 클릭하세요.</span>
        		</div>
        		<div class="detail-content">
        			<div class="detail-content-img">
        				<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
						  <div class="carousel-indicators">
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						  </div>
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img src="/resources/upload/usedBoard/12과일바구니.png" class="d-block w-100" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="/resources/upload/usedBoard/13자두.png" class="d-block w-100" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="/resources/upload/usedBoard/14초록사과.png" class="d-block w-100" alt="...">
						    </div>
						  </div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						  </button>
						</div>
        			</div>
        			<div class="detail-content-text">
        				<span>${ub.usedBoardContent }</span>
        			</div>
        		</div>
        		<div class="blackList-report">
        			<a href="#">신고하기</a>
        		</div>
        	</div>
        </div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>