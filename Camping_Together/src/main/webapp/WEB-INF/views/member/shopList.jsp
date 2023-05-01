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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/adminMenu.jsp" />
	
	<div class="content-wrap">
		<div class="admin-content">
			<div class="admin-title">
				<h3>SHOP 판매 상품</h3>
				<div class="insert-btn" id="insertBtn"><span class="material-symbols-outlined">edit_note</span><a href="/insertShopFrm.do">상품 등록</a></div>
			</div>
		</div>
		
			
	<div class="admin-shop">
			<div class="infomation">
				<p>총 [${count }개] 상품</p>
	</div>

		<div class="p-list">
			<c:forEach items="${list }" var="a">
			<div class="p-info">
                <a href="/viewShop.do?reqPage=1&shopNo=${a.shopNo }&menu=0&memberId=${sessionScope.m.memberId}">
                    <div class="product-img">
                    	<img src="/resources/upload/shop/${a.shopPhotoList[0].filepath }" width="280px;" height="280px;">
                    </div>
                    <div class="info">
                        <div class="product-name">${a.shopTitle }</div>
                       	<div class="price"><fmt:formatNumber value="${a.shopPrice }" pattern="#,###"/>원</div> 
                        <%-- <div class="price">${a.shopPrice }원</div>--%>
                        <div class="count">재고 : ${a.count }</div>
                        <div class="score">평점 : ${a.avgRating }</div>
                    </div>
                </a>
            </div>
            </c:forEach>
		</div>
		
		
		<div class="pagination">
				${navi }
		  </div>
	</div>
	</div>

			<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>



