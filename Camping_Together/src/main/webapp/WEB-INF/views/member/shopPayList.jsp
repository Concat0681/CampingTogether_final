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


<script src="resources/js/moment.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp" />
		
		<div class="input-div">
			<div class="input-title">
				<h2>캠핑장 결제 내역</h2>
			</div>
		</div>
		<div class="pay-list">
			<div class="list-content">
				<table>
					<tr>
						<th class="camping-name">캠핑방 명</th>
						<th>결제 날짜</th>
						<th>체크인 날짜</th>
						<th>체크아웃 날짜</th>
						<th>결제 금액</th>
					</tr>
				<c:forEach items="${list }" var="p">
					<tr>
						<td>${p.campingRoomTitle }</td>
						<td>${p.campingPaymentDate }</td>
						<td class="checkIn">${p.checkIn }</td>
						<td class="checkOut">${p.checkOut }</td>
						<td class="total-price"></td>
					<td class="oneDayPay" style="display:none;">${p.campingRoomPrice }</td>
					</tr>
					
				</c:forEach>
					
				</table>
			</div>
			<div class="pagination">
				${navi }
		  </div>
		</div>
			  
		
			
			
		<script>
			const checkInTag = $(".checkIn");
			console.log(checkInTag);
				
			for(let i=0; i<checkInTag.length; i++ ) {
				const checkIn = $(".checkIn");
				const checkOut = $(".checkOut");
				const totalPrice = $(".total-price");
				const oneDayPay = $(".oneDayPay");
				console.log(checkIn[i].innerText);
					
				const date1 = moment(checkIn[i].innerText);
				const date2 = moment(checkOut[i].innerText);
				
				const totalCheck = moment.duration(date2.diff(date1)).asDays();
				//console.log(oneDayPay[i]);
				//console.log(oneDayPay[i].innerText);
				//console.log(totalCheck);
				console.log(oneDayPay[i].innerText * totalCheck);
				totalPrice.eq(i).text(oneDayPay[i].innerText * totalCheck);
				
			}

		</script>
</body>
</html>


