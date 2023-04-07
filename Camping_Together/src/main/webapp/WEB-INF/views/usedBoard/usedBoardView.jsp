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
<style>
   .page-content{
   		width: 1200px;
        margin: 0 auto;
   		padding-top: 130px;
   }
   .content-top>h2{
       margin: 20px;
   }
   .detail-wrap{
   		width: 80%;
   		margin: 30px auto;
   }
   .detail-info{
   		display: flex;
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
   		padding: 10px;
   }
   .detail-content-wrap div{
   		margin-bottom: 20px;
   }
   .detail-content-img{
   		margin-top: 30px;
		width: calc(100%/2);
		float:left;
   }
   .detail-content-img>img{
   		width: 100%;
   		cursor: hover;
   }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-content">
		<div class="content-top">
            <h2>상품정보</h2>
            <hr>
        </div>
        <div class="detail-wrap">
        	<div class="detail-top-wrap">
        		<div class="detail-title">
        			<h3>${ub.usedBoardTitle }</h3>
        		</div>
        		<div class="detail-info">
	        			<span>${ub.usedBoardWriter }</span>
	        			<span>&nbsp; | &nbsp;</span>
	        			<span>${ub.regDate }</span>
	        			<span>&nbsp; | &nbsp;</span>
	        			<span style="color:#ccc;"class="material-symbols-outlined">visibility</span>
	        			<span style="color:#ccc;">${ub.readCount }</span>
        		</div>
        	</div>
        	<div class="detail-price-wrap">
        		<div class="detail-price">
        			<p>판매금액 : ${ub.usedProductPrice }</p>
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
        			<c:forEach items="${ub.usedBoardPhotoList}" var="ubp">
        			<div class="detail-content-img">
        				<img src="/resources/upload/usedBoard/${ubp.filepath }">
					</div>        			
        			</c:forEach>
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
</body>
</html>