<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
   a{
       color: black;
       text-decoration: none;
   }
   .material-symbols-outlined {
       font-variation-settings:
       'FILL' 0,
       'wght' 400,
       'GRAD' 0,
       'opsz' 48
   }
   .page-content{
       width: 1200px;
       margin: 0 auto;
       padding-top: 130px;
   }
   .content-top>h1{
       margin: 20px;
       padding-top: 20px;
   }
   .category-wrap{
       margin: 20px;
       padding: 20px;
       border-top: 1px solid #AD8B73;
       border-bottom: 1px solid #AD8B73;
       overflow: hidden;
   }
   .category{
       float: left;
   }
   .category>select{
       height: 30px;
       border-radius: 5px;
   }
   .used-category{
       width: 200px;    
   }
   .used-location{
       width: 100px;
   }
   .usedBoardWrite{
       float: right; 
       width: 100px;
       height: 30px;
       line-height: 30px;
   }
   .usedBoardWrite>span{
       font-size: 25px;
   }
   .post{
       float: left;
       margin-right: 5px;
       line-height: 30px;
   }
   .content-mid-wrap{
       margin: 20px;
       padding: 20px;
       overflow: hidden;
   }
   .product-wrap{
       width: calc(100%/3);
       float: left;
       padding:20px;
       box-sizing: border-box;
       margin-top: 20px;
       margin-bottom: 30px;
   }
   .product{
	   width: 90%;
       border: 1px solid #ccc;
       border-radius: 5px;
       box-sizing: border-box;
       cursor: pointer;
   }
   .product:hover{
       border: 1px solid #E3CAA5;
   }
   .product-img{
       width: 100%;
       height: 250px;
       margin: 0 auto;
       padding: 20px;
       box-sizing: border-box;      
   }
   .product-img>img{
       width: 100%;
       height: 100%;
       border: 1px solid #ccc;
       border-radius: 5px;
   }
   .product_title>span{
       font-size: 20px;
       font-weight: bold;
   }
   .product_mid{
       overflow: hidden;
   }
   .array{
       margin-left: 20px;
       margin-top:5px;
   }
   .product-price{
       display: inline-block;
       margin-left: 20px;
   }
   .zero{
       height: 70px;
   }
   .product-wish{
       float: right;
       margin-right: 20px;
       margin-bottom: 10px;
   }
   .product_mid{
       margin: 0 auto;
       border-bottom: 1px solid #ccc;
   }

   .product-bottom{
       overflow: hidden;
   }
   .product-regDate{
       display: inline-block;
   }
   .product-etc{
       float: right;
       display: flex;
       margin-right: 8px;
       font-size: 16px;
       color: #ccc;
   }
   .product-etc div{
       float: left;
       height: 30px;
   }
   .product-etc>div{
       height: 30px;
       margin-left: 8px;
   }
   .icon{
       font-size: 18px;
       line-height: 27px;
   }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="page-content">
        <div class="content-top">
            <h1>중고장터</h1>
            <div class="category-wrap">
                <div class="category">
                    <select class="used-category" name="usedBoardCategory">
                        <option value="0">전체종류</option>
                        <option value="1">침낭/매트</option>
                        <option value="2">겨울용품</option>
                        <option value="3">전기/전자제품</option>
                        <option value="4">차박용품</option>
                        <option value="5">기타캠핑용품</option>
                    </select>
                    <select class="used-location" name="usedTradeLocation">
                        <option value="0">전국</option>
                        <option value="1">서울</option>
                        <option value="2">인천</option>
                        <option value="3">경기</option>
                        <option value="4">충북</option>
                        <option value="5">충남</option>
                    </select>
                </div>
                <div class="usedBoardWrite">
                	<c:if test="${not empty sessionScope.m }">
	                    <div class="material-symbols-outlined post">post_add</div>
	                    <div class="write"><a href="/usedBoardWriteFrm.do">작성하기</a></div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="content-mid-wrap">
            <div class="content-mid">
            	<c:forEach items="${list }" var="ub">
            	<div class="product-wrap">
                    <div class="product">
                        <div class="product-img">
                        
                        <c:choose>
                        	<c:when test="${empty Thumbnail.ub }">
                        		<img src="/resources/image/usedBoard/noImg.gif">
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/resources/upload/usedBoard/12과일바구니.png">
                        	</c:otherwise>
                        </c:choose>
                         
                        </div>
                        <div class="product_title array">
                            <span>${ub.usedBoardTitle }</span>
                        </div>
                        <div class="product_location array">
                        	<c:choose>
                        		<c:when test="${ub.usedTradeLocation eq '지역설정안함'}">
                        			<span>전국</span>
                        		</c:when>
                        		<c:otherwise>
		                            <span>${ub.usedTradeLocation }</span>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                        <div class="zero"></div>
                        <div class="product_mid array">
                            <div class="product-price">
                                <span>${ub.usedProductPrice }</span><span>원</span>
                            </div>
                            <div class="product-wish">
                                <span class="material-symbols-outlined">favorite</span>
                            </div>
                        </div>
                        <div class="product-bottom array">
                            <div class="product-regDate">
                                <span>${ub.regDate }</span>
                            </div>
                            <div class="product-etc">
                                <div class="product-comment">
                                    <div class="material-symbols-outlined icon">chat_bubble</div>
                                    <div>10</div>
                                </div>
                                <div class="product-wishView">
                                    <div class="material-symbols-outlined icon">favorite</div>
                                    <div>20</div>
                                </div>
                                <div class="product-readCount">
                                    <div class="material-symbols-outlined icon">visibility</div>
                                    <div>${ub.readCount }</div>
                                </div>
                            </div>
                        </div>   
                    </div>
                </div>
            	</c:forEach>   
            </div>
        </div>
    </div>
</body>
</html>