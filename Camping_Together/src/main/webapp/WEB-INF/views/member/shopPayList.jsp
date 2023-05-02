<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp" />
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
		<div class="input-div">
			<div class="input-title">
				<h2>캠핑장 결제 내역</h2>
			</div>
		</div>
		<div class="pay-list">
			<div class="list-content">
				<div class="total">
					<p>총 [${count }]건</p>
				</div>
				<table>
					<tr>
						<th class="camping-name">캠핑방 명</th>
						<th>결제 날짜</th>
						<th>체크인 날짜</th>
						<th>체크아웃 날짜</th>
						<th>결제 금액</th>
					</tr>
				<c:forEach items="${list }" var="p">
					<tr onclick="location.href='/reservationMyInfo.do?campingReservationNo=${p.campingReservationNo }'">
<%-- 						<td style="cursor: pointer;"><a href="/viewCamping.do?campingNo=${p.campingNo }">${p.campingRoomTitle }</a></td> --%>
							<input type="hidden" name="campingRoomNo" value="${p.campingNo }">
							<td style="color :#AD8B73; font-family : ng-bold;">${p.campingRoomTitle }</td>
							<td>${p.campingPaymentDate }</td>
							<td class="checkIn">${p.checkIn }</td>
							<td class="checkOut">${p.checkOut }</td>
							<td class="total-price">원</td>
							<td class="oneDayPay" style="display:none;"></td>
							<input type="hidden" name="roomPrice" value="${p.campingRoomPrice }">
					</tr>
					
				</c:forEach>
					
				</table>
			</div>
			
			
				<div class="pagination">
					${navi }
			 	</div>
		  	</div>
		
			 <div class="footer-wrap">
					<jsp:include page="/WEB-INF/views/common/footer.jsp" />
			</div>
			
		<script>
			const checkInTag = $(".checkIn");
			console.log(checkInTag);
				
			for(let i=0; i<checkInTag.length; i++ ) {
				const checkIn = $(".checkIn");
				const checkOut = $(".checkOut");
				const totalPrice = $(".total-price");
				const oneDayPay = $("[name=roomPrice]");
					
				const date1 = moment(checkIn[i].innerText);
				const date2 = moment(checkOut[i].innerText);
				
				const totalCheck = moment.duration(date2.diff(date1)).asDays();
				//console.log(oneDayPay[i]);
				//console.log(oneDayPay[i].innerText);
				//console.log(totalCheck);
				totalPrice.eq(i).text(oneDayPay.eq(i).val() * totalCheck + "원");
				
			}
		</script>
</body>
</html>