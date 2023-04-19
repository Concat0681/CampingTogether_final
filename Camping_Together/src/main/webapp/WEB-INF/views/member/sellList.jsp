<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/sellerPageMenu.jsp" />
	
		<div class="input-div">
			<div class="input-title">
				<h2>My 캠핑장</h2>
			</div>
		</div>

		<div class="pay-list">
			<div class="list-content">
				<table>
					<tr>
						<th>No</th>
						<th>캠핑장 명</th>
						<th>지역</th>
						<th>방 이름</th>
						<th>사진</th>
					</tr>
				<c:forEach items="${list }" var="l">  
					<tr>
						<td>${l.rnum }</td>
						<td>${l.campingTitle }</td> 
						<td>${l.campingSido }</td> 
						<td>${l.campingRoomTitle }</td>
						<td><div><a href="#"><img class="camping-img"  src="/resources/upload/campingRoom/${l.filepath } }"></a></div></td> 
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