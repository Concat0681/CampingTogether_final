<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/updateMypageC.css">


<script src="resources/js/moment.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp" />
		
		<div class="input-div">
			<div class="input-title">
				<h2>캠핑장 결제 내역</h2>
			</div>
		</div>
		<div class="pay-list">
			<div class="list-content">
				<table border="1">
				<c:forEach items="${list }" var="p">
					<tr>
						<th>캠핑방 이름</th>
						<th>결제 날짜</th>
						<th>체크인 날짜</th>
						<th>체크아웃 날짜</th>
						<th>결제 금액</th>
					</tr>
					<tr>
						<td>${p.campingRoomTitle }</td>
						<td>${p.campingPaymentDate }</td>
						<td id="checkIn">${p.checkIn }</td>
						<td id="checkOut">${p.checkOut }</td>
						<td id="total-price"></td>
					</tr>

				</c:forEach>
					
				</table>
			</div>
			</div>
			  
			<div class="page-navi">

		  </div>
		
			
			
			
		<script>
			var totalPrice = $("#total-price");
			var checkIn = $("#checkIn").text();
			var checkOut = $("#checkOut").text();
			console.log(checkIn);
			
			var date1 = moment(checkIn).format('yyyy-dd-mm');
			var date2 = moment(checkOut).format('yyyy-dd-mm');
			console.log(date1);
			console.log(date2);
			
			var totalCheck = moment.duration(date2.diff(date1)).asDays();
			
			//var totalCheck = date1.diff(date2, "days"); 
			console.log(totalCheck);
			
			
		</script>
</body>
</html>


