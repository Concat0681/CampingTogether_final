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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/sellerPageMenu.jsp" />
	
		<div class="input-div">
			<div class="input-title">
				<h2>My 캠핑장</h2>
			</div>
		</div>
	
	<div>
	<c:forEach items="${list }" var="l">
		<div>${l.campingTitle }</div>
		<a href="/campingRoomWriteFrm.do?campingNo=${l.campingNo }">캠핑추가</a>
		<a href="javascript:void(0)" class="deleteCampingRoom" onclick="deleteCampingRoom(this,${l.campingRoomNo },${l.campingNo })">캠핑삭제</a>
		<a href="/updateCampingRoomFrm.do?campingRoomNo=${l.campingRoomNo }">캠핑수정</a>
	</c:forEach>
		${navi }
	</div>
	
	
	
	<script>
		function deleteCampingRoom(obj,campingRoomNo,campingNo){
			if(confirm("캠핑을 삭제하시겠습니까?")){
				location.href="/deleteCampingRoom.do?campingRoomNo="+campingRoomNo+"&campingNo="+campingNo;
			}
		}
		
	</script>
</body>
</html>