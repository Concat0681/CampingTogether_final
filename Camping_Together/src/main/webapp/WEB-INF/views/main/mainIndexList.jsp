<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 style="text-align: center;"><span style="font-size: 30px; font-family: ng-bold;" ><a href="usedBoardList.do?reqPage=1&memberId=">중고 장터</a> </span></h3>
            <div class="content-mid" style="height: 500px;">
            	<c:forEach items="${top3UsedBoards }" var="ub">
            	<input type="hidden" id="usedBoardNo" value="${ub.usedBoardNo }">
            	<div class="product-wrap">
                    <div class="product">
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
                        <div class="product_title" onclick="location.href='/usedBoardView.do?usedBoardNo=${ub.usedBoardNo}'">
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
                            <div>
                            <span class="material-symbols-outlined" style="float:left; color:#ccc;"> visibility</span>
		        			<p style="float:left; color:#ccc;">:: ${ub.readCount } &nbsp; </p>
		        			</div>
                        </div>
                    </div>
                </div>
            	</c:forEach>   
            </div>
<a class="mainlist" href="/usedBoardIndex.do"></a>
</body>
<script>
	$(document).ready(function(){
		$(".mainlist").click();
	});
</script>
</html>