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
	.material-symbols-outlined {
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 300,
	  'GRAD' 0,
	  'opsz' 48
	}
	.detail-content-wrap a{
		font-family: ng-bold;
	}
	.detail-content-wrap a:hover{
		color: #CEAB93;
	}
   .page-content{
   		width: 1200px;
        margin: 0 auto;
   		padding-top: 130px;
   }
   .content-top>h2{
        margin: 20px;
   }
   .category-info>p{
   		margin: 0;
   		color: #CEAB93;
   }
   .detail-wrap{
   		width: 80%;
   		margin: 30px auto;
   		border-bottom: 1px solid #ccc;
   }
   .detail-title>h3{
   		margin-bottom: 0;
   		font-family: ng-bold;
   }
   .detail-info{
   		display: flex;
   }
   .detail-top-wrap, .detail-price-wrap, .comment-list-wrap{
   		padding-left: 20px;
   		padding-bottom: 15px;
   		padding-top: 15px;
   		border-bottom: 1px solid #ccc;
   }
   .comment-list-wrap{
   		border: 0;
   		margin-top: 10px;
   }
   .detail-price-wrap{
   		position: relative;
   }
   #phone-check{
   		font-size: 14px;
   		color: #AD8B73;
   }
   #phone-check:hover{
   		cursor: pointer;
   		color: #E3CAA5;
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
   .detail-content{
   		display: flex;
   }
   .detail-content-img{
   		margin-top: 30px;
   		width: 500px;
   		height: 500px;
   }
   .detail-content-img img{
   		width: 500px;
   		height: 500px;
   		border-radius: 6px;
   		border: 1px solid #ccc;
   }
   .detail-content-text{
   		width: 400px;
   		padding-top: 50px;
   		padding-left: 50px;
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
   #comment-box:focus{
   		border: 2px solid #CEAB93;
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
   		margin-top: 50px;
   }
   .comment-writer-wrap{
   		width: 10%;
   		text-align: center;
   		padding-top: 13px;
   }
   .user-profile{
   		width: 50px;
   		height: 50px;
   		margin: 0 auto; 		
   }
   .user-profile>img{
   		width: 100%;
   		border-radius: 50px;
   }
   .user-id>p{
   		font-family: ng-extra-bold;
   		color: #AD8B73;
   		margin-bottom: 0;
   }
   .comment-write-content{
   		width: 85%;
   		border: 1px solid #ccc;
   		padding: 10px;
   		border-radius: 8px;
   		word-break:break-all;
   }
   .comment-write-info{
   		text-align: right;
   		color: #ccc;
   		font-family: ng-bold;
   		font-size: 14px;
   }
   .comment-write-info>a:hover{
   		color: #E3CAA5;
   }
   .comment-write-content>p{
   		margin-bottom: 0;
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
        		<div class="category-info">
        			<p class="font-bold">${ub.getUsedBoardCategory() }</p>
        		</div>
        		<div class="detail-title">
        			<h3>${ub.usedBoardTitle }</h3>
        		</div>
        		<div class="detail-info">
	        			<span class="font-bold">${ub.usedBoardWriter }</span>
	        			<span>&nbsp; :: &nbsp;</span>
	        			<span>${ub.regDate }</span>
	        			<span>&nbsp; :: &nbsp;</span>
	        			<span class="material-symbols-outlined">visibility</span>
	        			<span>${ub.readCount }</span>
        		</div>
        	</div>
        	<div class="detail-price-wrap">
        		<div class="detail-price">
        			<p class="font-bold">판매금액 : <fmt:formatNumber value="${ub.usedProductPrice }" pattern="#,###" /></p>
        			<div class="detail-info">
        				<span class="font-bold">상품상태 : </span><span>&nbsp;${ub.getUsedProductStatus() }</span>
        				<span>&nbsp; || &nbsp;</span>
        				<span class="font-bold">교환여부 :</span> <span>&nbsp;${ub.getExchangeStatus() }</span>
        				<span>&nbsp; || &nbsp;</span>
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
					<div class="detail-content-img">
						<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
						  <div class="carousel-inner">
						  	<c:choose>
						  		<c:when test="${empty ub.usedBoardPhotoList }">
						  			<div class="carousel-item">
						      			<img src="/resources/image/usedBoard/noImg.gif" class="d-block w-100" alt="...">
						    		</div>
						  		</c:when>
						  		<c:otherwise>
						  		<c:forEach items="${ub.usedBoardPhotoList}" var="ubp">
						  			<div class="carousel-item">
						      			<img src="/resources/upload/usedBoard/${ubp.filepath }" class="d-block w-100" alt="...">
						    		</div>
						  		</c:forEach>	
						  		</c:otherwise>
						  	</c:choose>
						  </div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						  </button>
						</div>
					</div>  
					<script>
						$(".carousel-item").eq(0).addClass("active");
					</script>
        			<div class="detail-content-text">
        				<span>${ub.usedBoardContent }</span>
        			</div>
        		</div>      		
        			<c:choose>
        				<c:when test="${sessionScope.m.memberId eq ub.usedBoardWriter }">
        				<div style="text-align: right;" class="usedBoard-link">
							<a href="#">수정</a>
							<a href="#">삭제</a>
						</div>        				
        				</c:when>
        				<c:otherwise>
        				<div style="text-align: right" class="blackList-report">
		        			<a href="#">신고하기</a>
		        		</div>
        				</c:otherwise>
        			</c:choose>
        	</div>
        </div>
        <div class="comment-wrap">
        	<div class="comment-box-wrap">
    			<form action="/usedBoardCommentWrite.do" method="post">
    				<div class="comment-box">
     				<div class="comment-content">
 	    				<textarea placeholder="내용을 입력해 주세요." name="usedBoardCommentContent" id="comment-box"></textarea>
     				</div>
	    				<input type="hidden" name="usedBoardCommentWriter" value="${sessionScope.m.memberId }">
	    				<input type="hidden" name="usedBoardNo" value="${ub.usedBoardNo }">
	    				<div class="comment-submit">
 	    				<input type="submit" value="작성" class="btn2">
	    				</div>
    				</div>
   				</form>
        	</div>
        	<script>
        		if($("[name='usedBoardCommentWriter']").val() == ""){
        			$("#comment-box").text("");
        			$("#comment-box").attr("disabled", true);
        			$("#comment-box").text("로그인 후 이용할 수 있습니다.");
        			$("[type='submit']").on("click", function(){
        				alert("로그인 후 이용할 수 있습니다.");
        				return false;
        			});
        		}
        	</script>
        	<div class="comment-list-wrap">
        		<c:forEach items="${list }" var="ubc">
	        		<div class="comment-list">	        			
	        			<div class="comment-writer-wrap">
	        				<div class="user-profile">
	        					<img src="/resources/image/member/img.jpeg">
	        				</div>
	        				<div class="user-id">
	        					<p>${ubc.usedBoardCommentWriter }</p>
	        				</div>
	        			</div>
	        			<div class="comment-write-content">
	        				<div class="comment-write-info">
	        					<c:choose>
	        						<c:when test="${sessionScope.m.memberId eq ubc.usedBoardCommentWriter }">
	        							<a href="#">수정</a>
	        							<a href="#">삭제</a>
	        						</c:when>
	        					</c:choose>
	        					:: ${ubc.regDate }
	        				</div>
	        				<p>${ubc.getUsedBoardCommentContent() }</p>
	        			</div>
	        		</div>        		
        		</c:forEach>
        	</div>
        </div>
	</div>
</body>
</html>