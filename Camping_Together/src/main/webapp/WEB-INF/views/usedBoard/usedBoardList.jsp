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
	a{
   	   color: var(--text-color);
       color: black;
       text-decoration: none;
     }
   .material-symbols-outlined {
       font-variation-settings:
       'FILL' 0,
       'wght' 300,
       'GRAD' 0,
       'opsz' 48
   }
   .fill-icon{
    	font-variation-settings: 'FILL' 1
	}
   .page-content{
       width: 1200px;
       margin: 0 auto;
       padding-top: 130px;
   }
   .content-top>h2{
       margin: 20px;
       padding-top: 20px;
       font-family: ng-bold;
   }
   .category-wrap{
       margin: 20px;
       padding: 20px;
       border-top: 1px solid #000;
       border-bottom: 1px solid #000;
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
   .write>a{
   		font-weight: bold;
   }
   .write>a:hover{
		color: #E3CAA5;
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
       box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2);
   }
   .product-img{
       width: 100%;
       height: 250px;
       margin: 0 auto;
       padding: 20px;
       box-sizing: border-box;  
       position: relative;    
   }
   .sel-status{
   		position:absolute;
   		margin-top: 18px;
   		margin-left: 185px;
   		padding: 6px;
   		background-color: #E3CAA5;
   		font-size: 14px;
   		font-weight: bold;
   		border-radius: 5px;
   		color: #FFFBE9;
   }
   .product-img>img{
       width: 100%;
       height: 100%;
       border: 1px solid #ccc;
       border-radius: 5px;
   }
   .product_title, .product_location{
   		width: 240px;
   		margin: 0 auto;
   		overflow: hidden;
   		text-align: center;
   		text-overflow: ellipsis;
   		white-space: nowrap;
   }
   .product_location{
   		font-size: 15px;
   		color: #ccc;
   }
   .product_title>span{
       font-size: 17px;
       font-family: ng-extra-bold;
   }
   .product_title:hover{
   		color: #E3CAA5;
   }
   .zero{
       height: 30px;
       border-bottom: 4px double #ccc;
   }
	.product_mid{
		width: 90%;
		margin: 10px auto;
		display: flex;
		position: relative;
	}
	.product-price>span{
		font-size: 15px;
		font-family: ng-extra-bold;
	}
	.product-wish{
		position: absolute;
		right: 5px;
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
       font-size: 17px;
       line-height: 25px;
   }
   .icon:last-child{
   		font-size: 18px;
   }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="page-content">
        <div class="content-top">
            <h2>중고장터</h2>
            <div class="category-wrap">
                <div class="category">
                    <select class="used-category" name="usedBoardCategory">
                        <option value="0">전체종류</option>
                        <option value="1">전기/전자제품</option>
                        <option value="2">캠핑카/카라반용품</option>
                        <option value="3">화로/버너/BBQ</option>
                        <option value="4">안전/위생용품</option>
                        <option value="8">텐트/타프</option>
                        <option value="5">침낭/매트</option>
                        <option value="6">차박용품</option>
                        <option value="7">조명기구</option>
                        <option value="8">기타캠핑용품</option>
                        <option value="9">기타생활용품</option>
                        
                    </select>
                    <select class="used-location" name="usedTradeLocation">
                        <option>전국</option>
                        <option>서울</option>
                        <option>인천</option>
                        <option>경기</option>
                        <option>대전</option>
                        <option>대구</option>
                        <option>부산</option>
                        <option>강원</option>
                        <option>광주</option>
                        <option>울산</option>
                        <option>경남</option>
                        <option>경북</option>
                        <option>전남</option>
                        <option>전북</option>
                        <option>제주</option>
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
            	<input type="hidden" id="usedBoardNo" value="${ub.usedBoardNo }">
            	<div class="product-wrap">
                    <div class="product" onclick="location.href='/usedBoardView.do?usedBoardNo=${ub.usedBoardNo}'">
                        <div class="product-img">
                        <c:choose>
                        	<c:when test="${ub.usedBoardStatus eq 0}">
                        	<div class="sel-status">
	                        	<span>판매중</span>                    		
                        	</div>                      
                       		</c:when>
                       		<c:otherwise>
                       		<div class="sel-status" style="background-color: #ccc; color:#fff;">
	                        	<span>판매완료</span>                    		
                        	</div>
                       		</c:otherwise>
                       	</c:choose>
                        <c:choose>
                        	<c:when test="${empty ub.thumbnail }">
                        		<img src="/resources/image/usedBoard/noImg.gif">
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/resources/upload/usedBoard/${ub.thumbnail }">
                        	</c:otherwise>
                        </c:choose>
                         
                        </div>
                        <div class="product_title">
                            <span>${ub.usedBoardTitle }</span>
                        </div>
                        <div class="product_location">
                        	<c:choose>
                        		<c:when test="${ub.usedTradeLocation eq '지역설정안함'}">
                        			<span>전국</span>
                        		</c:when>
                        		<c:otherwise>
		                            <span>${ub.usedTradeLocation }</span>
                        		</c:otherwise>
                        	</c:choose>
                        	:: ${ub.regDate }
                        </div>
                        <div class="zero"></div>
                        <div class="product_mid">
                            <div class="product-price">
                                <span><fmt:formatNumber value="${ub.usedProductPrice }" pattern="#,###" /></span><span>원</span>
                            </div>
                            <span id="favorite" class="material-symbols-outlined product-wish" style="z-index:1000;">favorite</span>
                        </div>
                        <!-- 
                        <div class="product-bottom array">
                            <div class="product-regDate">
                                <span>${ub.regDate }</span>
                            </div>
                            <div class="product-etc">
                            	<div class="product-wishView">
                                    <div class="material-symbols-outlined icon">favorite</div>
                                    <div><p>20</p></div>
                                </div>
                                <div class="product-comment">
                                    <div class="material-symbols-outlined icon">chat_bubble</div>
                                    <div><p>10</p></div>
                                </div>
                                <div class="product-readCount">
                                    <div class="material-symbols-outlined icon">visibility</div>
                                    <div><p>${ub.readCount }</p></div>
                                </div>
                            </div>
                        </div>  
                         --> 
                    </div>
                </div>
            	</c:forEach>   
            </div>
        </div>
        <div class="pagenation">
	        ${pageNavi }
        </div>
    </div>  
    <script>
    	$("#favorite").on("click", function(){
			alert("bb");
			window.event.stopPropagation();
    	})
    </script>
</body>
</html>