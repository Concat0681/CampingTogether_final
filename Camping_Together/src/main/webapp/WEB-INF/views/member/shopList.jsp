<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
                <a href="#">
                    <div class="product-img"><img src="/resources/image/shop/${a.filepath }" width="280px;" height="280px;"></div>
                    <div class="info">
                        <div class="product-name">${a.shopTitle }</div>
                        <div class="price">${a.shopPrice }원</div>
                        <div class="count">재고 : ${a.count }</div>
                        <div class="score">평점 : ${a.score }</div>
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
	
</body>
</html>



