<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/shop/shopMainList.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-wrap">
		<div>
			<c:if test="${sessionScope.m.memberGrade eq 'a' }">
				<button id="insertShopBtn">물품등록</button>			
			</c:if>
		</div>
		<div class="camping-shop-wrap">
			<div>캠핑물품</div>
			<div class="camping-shop-list">
				<c:forEach items="${list0 }" var="c">
					<div>${c.shopTitle }</div>
				</c:forEach>
			</div>
		</div>
		<div class="car-shop-wrap">
			<div>카박물품</div>
			<div class="car-shop-list">
				<c:forEach items="${list1 }" var="c">
					<div>${c.shopTitle }</div>
				</c:forEach>
			</div>
		</div>
		<div class="etc-shop-wrap">
			<div>기타물품</div>
			<div class="etc-shop-list">
				<c:forEach items="${list2 }" var="c">
					<div>${c.shopTitle }</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script>
		$("#insertShopBtn").on("click", function(){
			location.href="/insertShopFrm.do";
		})
	</script>
</body>
</html>