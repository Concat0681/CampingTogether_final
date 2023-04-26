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
						<th >캠핑장 명</th>
						<th>지역</th>
						<th >방 개수</th>
						<th class="th5">방 추가</th>
						<th class="th6">캠핑장 수정 및 삭제</th>

					</tr>
				<c:forEach items="${list }" var="l">  
					<tr>
						<td>${l.rnum }</td>
						<%--<td class="c-title">${l.campingTitle }</td>  --%>
						<td onClick="roomNameToggle(${l.campingNo},'${sessionScope.m.memberId }',${l.rnum })" class="c-title">
						${l.campingTitle }
						<td>${l.campingSido }</td> 
						
						<td>${l.rct }</td> 
						<!-- 
							<c:forEach items="${l.campingRoomList }" var="r">
								${r.campingRoomTitle}
							</c:forEach>
						 -->
						
						<td>
							<div class="updael" style="width: 120px;">
							<div class="c-delete room-up">
								<a href="/campingRoomWriteFrm.do?campingNo=${l.campingNo }&campingTitle=${l.campingTitle }">추가</a>
							</div>
						</div>
						</td>

						<td>
						<div class="updael">
							<div class="c-update">
								<a href="/updateCampingFrm.do?campingNo=${l.campingNo }">수정</a>
							</div>
							<div class="c-delete">
								<a href="javascript:void(0)" class="deleteCamping" onclick="deleteCamping(this,${l.campingNo },'${sessionScope.m.memberId }');">삭제</a>
							</div>
						</div>
						</td>
					</tr>
					<tr class="room-toggle" style="display: none;" >
						<td colspan="6">
							<div class="info-wrap"><%-- 
								<div class="room-name">방 이름</div>
								<div class="room-type">방 유형</div>
								<div class="room-prics">가격(1박)</div>--%>
								<table class="info-wrap info-table">
									<tr class="info-menu1">
										<th>방 이름</th>
										<th>방 유형</th>
										<th>가격(1박)</th>
										<th>방 수정 및 삭제</th>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</c:forEach> 
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
		function deleteCampingRoom(obj,campingRoomNo,campingNo, memberId){
			if(confirm("캠핑을 삭제하시겠습니까?")){
				location.href="/deleteCampingRoom.do?campingRoomNo="+campingRoomNo+"&campingNo="+campingNo+"&memberId="+memberId;
			}
		}
		
	</script>
	
	<script>
		function deleteCamping(obj,campingNo,memberId){
			if(confirm("캠핑장을 삭제하시겠습니까?")){
				location.href="/deleteCamping.do?campingNo="+campingNo+"&memberId="+memberId;
			}
		}
		
	</script>
	
	
	<script>
	<%-- $(".c-title").on("click",function(){
		$(".room-toggle").slideToggle("normal");
	}); --%>
	
	
	function roomNameToggle(campingNo, memberId, rnum){
		$(".goblin").empty();
		$.ajax({
			url : "/selectRoomInfo.do",
			type : "post",
			data : {campingNo : campingNo, memberId : memberId, rnum : rnum},
			success : function(data){
				console.log(data);
				
				for(let i=0; i<data.length; i++){
					//const tr = $("<tr>").addClass("info-menu2");
					const tr = $("<tr>").addClass("goblin").css("width", "800px");

					const td1 = $("<td>").text(data[i].campingRoomTitle).css("width","266px").css("padding-top","10px");
					const td2 = $("<td>").text(data[i].campingRoomType). css("width","266px").css("padding-top","10px");
					const td3 = $("<td>").text(data[i].campingRoomPrice).css("width","266px").css("padding-top","10px");
					
					const td4 = $("<td>").css("width","266px").css("padding-top","10px");
					const div = $("<div>").addClass("updael");
					const campingUpdateDiv = $("<div>").addClass("c-update").append($("<a>").attr("href", "/updateCampingRoomFrm.do?campingRoomNo=" + data[i].campingRoomNo).text("수정"));
					const campingDeleteDiv = $("<div>").addClass("c-delete").append($("<a>").attr("href", "javascript:void(0)").addClass("deleteCampingRoom").attr("onclick", "deleteCampingRoom(this,"+data[i].campingRoomNo+","+campingNo+",'"+memberId+"')").text("삭제"));
					div.append(campingUpdateDiv).append(campingDeleteDiv);
					td4.append(div);
					
					tr.append(td1).append(td2).append(td3).append(td4);
				    $(".info-table").append(tr);
					
					$(".goblin").css("margin-top","20px");
				}
				$(".room-toggle").eq(rnum-1).toggle(); //아작스 성공 코드 안으로(화면 채운 후 토글)
				$(".room-toggle").not(":eq(" + (rnum-1) + ")").hide();
			}
		});
	}
	</script>
	
	
	
	
</body>
</html>





