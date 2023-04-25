<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/updateMypageC.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp" />
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
		<div class="input-div">
			<div class="input-title">
				<h2>투게더shop 상품 구매내역</h2>
			</div>
		</div>
		<div class="pay-list">
			<div class="list-content">
				<div class="total">
					<p>총 [${count }]건</p>
				</div>
				<table>
					<tr>
						<th>No</th>
						<th class="name"></th>
						<th>구매수량</th>
						<th>결제날짜</th>
						<th>결제금액</th>
					</tr>
					
				<c:forEach items="${list }" var="p"> 
					<tr>
						<td>${p.rnum }</td>
						<td><a href="/viewShop.do?reqPage=1&shopNo=${p.shopNo }&memberId=${sessionScope.m.memberId}&menu=0">상품명${p.productName }</a></td>
						<input type="hidden" name="shopNo" value="${p.shopNo }">
						<td>${p.buyCount }</td>
						<td>${p.productPaymentDate }</td>
						<td>${p.totalPrice} 원</td>
					</tr>
					
				</c:forEach> 
					
				</table>
			</div>
			<div class="pagination">
				${navi }
		  </div>
		</div>
		
		
</body>
</html>