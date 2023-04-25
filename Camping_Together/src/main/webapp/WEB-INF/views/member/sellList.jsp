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
				<div class="camping-insert">
					<span class="material-symbols-outlined">edit_note</span><a href="/campingWriteFrm.do?memberId=${sessionScope.m.memberId }">캠핑장 등록</a>
				</div>
		</div>

		<div class="pay-list">
			<div class="list-content">
				<table>
					<tr>
						<th>No</th>
						<th>캠핑장 명</th>
						<th>지역</th>
						<th>방 개수</th>
						<th class="th4">캠핑장 수정 및 삭제</th>
					</tr>
				<c:forEach items="${list }" var="l">  
					<tr>
						<td>${l.rnum }</td>
						<%--<td class="c-title">${l.campingTitle }</td>  --%>
						<td onClick="roomNameToggle(${l.campingNo})" class="c-title">
						${l.campingTitle }
						<td>${l.campingSido }</td> 
						
						<td>${l.rct }</td> 
						<!-- 
							<c:forEach items="${l.campingRoomList }" var="r">
								${r.campingRoomTitle}
							</c:forEach>
						 -->
						<td>
						<div class="updael">
							<div class="c-update">
								<a href="">수정</a>
							</div>
							<div class="c-delete">
								<a href="">삭제</a>
							</div>
						</div>
						</td>
							
					</tr>
				</c:forEach> 
				<tr class="room-toggle" style="display: none;" >
					<td colspan="5">
						<div class="info-wrap"><%-- 
							<div class="room-name">방 이름</div>
							<div class="room-type">방 유형</div>
							<div class="room-prics">가격(1박)</div>--%>
							<table class="info-wrap">
								<tr class="info-menu1">
									<th>방 이름</th>
									<th>방 유형</th>
									<th>가격(1박)</th>
								</tr>
								<tr class="goblin" style="width:800px;">
								</tr>
								
								
							</table>
						</div>
					</td>
				</tr>
			</table>
			</div>
			
			<div class="pagination">
				${navi }
		  </div>
		</div>

	<%--  
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
	--%>
	
	
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
	
	
	<script>
	<%-- $(".c-title").on("click",function(){
		$(".room-toggle").slideToggle("normal");
	}); --%>
	
	
	function roomNameToggle(campingNo){
		$(".goblin").empty();
		$.ajax({
			url : "/selectRoomInfo.do",
			type : "post",
			data : {campingNo : campingNo},
			success : function(data){
				console.log(data);
				
				for(let i=0; i<data.length; i++){
					//const tr = $("<tr>").addClass("info-menu2");
					
					const td1 = $("<td>").text(data[i].campingRoomTitle).css("width","266px").css("padding-top","10px");
					const td2 = $("<td>").text(data[i].campingRoomType). css("width","266px").css("padding-top","10px");
					const td3 = $("<td>").text(data[i].campingRoomPrice).css("width","266px").css("padding-top","10px");
					
					$(".goblin").append(td1).append(td2).append(td3);
					
					$(".room-toggle").toggle(); //아작스 성공 코드 안으로(화면 채운 후 토글)
					$(".goblin").css("margin-top","20px");
					
				}
			}
		});
	}
	</script>
	
	
	
	
</body>
</html>





