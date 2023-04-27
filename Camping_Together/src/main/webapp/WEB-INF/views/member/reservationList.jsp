<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/sellCamping.css">
<link rel="stylesheet" href="resources/css/updateMypageC.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/sellerPageMenu.jsp" />
	
		<div class="input-div">
			<div class="input-title">
				<h2>캠핑장 예약 리스트</h2>
			</div>
		</div>

		<div class="list-content">
			<div class="total">
				<p>총 [${count }]건</p>
			</div>
			<table>
				<tr>
					<td class="td1" style="border-top-left-radius: 10px;">캠핑장 이름</td>
					<td class="td2" >방 이름</td>
					<td class="td3">예약한 회원ID</td>
					<td class="td4">체크인</td>
					<td class="td4">체크아웃</td>
					<td class="td5"  style="border-top-right-radius: 10px;">결제 금액</td>
				</tr>
				<c:forEach items="${list }" var="c">
				<tr>
					<%--<td onClick="memberModal(${m.memberNo})" class="nameTd">
						${m.memberName } 
					</td> --%>
					<td>${c.campingTitle }</td>
					<td>${c.campingRoomTitle }</td>
					<td>${c.memberId }</td>
					<td>${c.checkIn }</td>
					<td>${c.checkOut }</td>
					<td>${c.price }</td>
				</tr>
				</c:forEach>
			</table>
		  <div class="pagination all-navi">
				${navi }
		  </div>
	</div>

</body>
</html>