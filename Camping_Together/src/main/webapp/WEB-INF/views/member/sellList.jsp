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
				<a href="/campingWriteFrm.do?memberId=${sessionScope.m.memberId }">캠핑장 등록</a>
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

	
	<div>
	<c:forEach items="${list }" var="l">
		<div>${l.campingTitle }</div>
		<a href="/campingRoomWriteFrm.do?campingNo=${l.campingNo }&campingTitle=${l.campingTitle }">캠핑방추가</a>
		<a href="javascript:void(0)" class="deleteCampingRoom" onclick="deleteCampingRoom(this,${l.campingRoomNo },${l.campingNo })">캠핑삭제</a>
		<a href="/updateCampingRoomFrm.do?campingRoomNo=${l.campingRoomNo }">캠핑방수정</a>
		<a href="javascript:void(0)" class="deleteCamping" onclick="deleteCamping(this,${l.campingNo })">캠핑장삭제</a>
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
	
	<script>
		function deleteCamping(obj,campingNo){
			if(confirm("캠핑장을 삭제하시겠습니까?")){
				location.href="/deleteCamping.do?campingNo="+campingNo;
			}
		}
		
	</script>
</body>
</html>