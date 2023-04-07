<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
   		border-bottom: 1px solid #ccc;
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
		top: 32px;
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
   		cursor: pointer;
   }
   .comment-wrap{
   		width: 80%;
   		margin: 50px auto;
   }
   .comment-box-wrap{
   		overflow: hidden;
   }
	.comment-box{
		width: 95%;
		display: flex;
		margin: 0 auto;
	}
   #comment-box{
   		width: 800px;
   		height: 80px;
   		border: 1px solid #ccc;
   		resize: none;
   		padding: 8px;
   		box-sizing: border-box;
   		border-radius: 5px;
   }
   .btn2{
		width: 100px;
		height: 80px;
		font-weight: bold;
   }
   .btn2:hover{
   		background-color: #CEAB93;
   }
   .font-bold{
   		font-weight: bold;
   }
   .comment-list{
   		display: flex;
   		min-height: 80px;
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
        			<p class="font-bold">판매금액 : <fmt:formatNumber value="${ub.usedProductPrice }" pattern="#,###" /></p>
        			<div class="detail-info">
        				<span class="font-bold">상품상태 : </span><span>&nbsp;${ub.usedProductStatus }</span>
        				<span>&nbsp; | &nbsp;</span>
        				<span class="font-bold">교환여부 :</span> <span>&nbsp;${ub.exchangeStatus }</span>
        				<span>&nbsp; | &nbsp;</span>
        				<span class="font-bold">거래지역 :</span><span>&nbsp;${ub.usedTradeLocation }</span>
        			</div>
        		</div>
        		<div class="wish-list">
        			<span class="material-symbols-outlined">favorite</span>
        		</div>
        	</div>
        	<div class="detail-content-wrap">
        		<div class="seller-phone">
        			<span id="phone-check" class="font-bold">연락처를 확인하려면 클릭하세요.</span>
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
        		<div style="text-align: right" class="blackList-report">
        			<a href="#">신고하기</a>
        		</div>
        	</div>
        </div>
        <div class="comment-wrap">
        	<div class="comment-box-wrap">
        		<c:choose>
        			<c:when test="${not empty sessionScope.m }">
	        			<form action="/usedBoardCommentWrite.do" method="post">
	        				<div class="comment-box">
		        				<div class="comment-content">
		    	    				<textarea placeholder="내용을 입력해 주세요." name="usedBoardCommnetContent" id="comment-box"></textarea>
		        				</div>
	    	    				<input type="hidden" name="usedBoardCommentWriter" value="${sessionScope.m.memberId }">
	    	    				<input type="hidden" name="usedBoardNo" value="${ub.usedBoardNo }">
	    	    				<div class="comment-submit">
		    	    				<input type="submit" value="작성" class="btn2">
	    	    				</div>
	        				</div>
        				</form>
        			</c:when>
        		</c:choose>
        	</div>
        	<div class="comment-list-wrap">
        		<c:forEach items="${list }" var="ubc">
	        		<div class="comment-list">
	        			<div class="comment-writer">${ubc.usedBoardCommentWriter }</div>
	        			<div class="comment-write-content">${ubc.usedBoardCommnetContent }</div>
	        		</div>        		
        		</c:forEach>
        	</div>
        </div>
	</div>
</body>
</html>