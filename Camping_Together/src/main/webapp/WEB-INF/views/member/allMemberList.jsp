<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/adminMenu.jsp" />
	
	
	<div class="content-wrap">
		<div class="admin-content">
			<div class="admin-title">
				<h3>전체 회원</h3>
			</div>
		</div>
		
		<div class="list">
			<table>
				<tr>
					<td class="td1" style="border-top-left-radius: 10px;">No</td>
					<td class="td2" >이름</td>
					<td class="td3">아이디</td>
					<td class="td4">전화번호</td>
					<td class="td5">주소</td>
					<td class="td6">메일</td>
					<td class="td7" style="border-top-right-radius: 10px;">회원 구분</td>
				</tr>
				<c:forEach items="${list }" var="m">
				<tr>
					<td>${m.rnum }</td>
					<td onClick="memberModal()" class="nameTd">${m.memberName } </td>
					<td>${m.memberId }</td>
					<td>${m.memberPhone }</td>
					<td>${m.memberAddr }</td>
					<td>${m.memberEmail }</td>
					<c:choose >
						<c:when test="${m.memberGrade eq 'c' }">
							<td>일반회원</td>
						</c:when>
						<c:when test="${m.memberGrade eq 's' }">
							<td>개인 사업자</td>
						</c:when>
					</c:choose>
				</tr>
				</c:forEach>
			</table>
		  <div class="pagination all-navi">
				${navi }
		  </div>
		</div>
		
		
			<div class="modalWrap">
           	     <div class="member-modal" >
                       <div class="ok-top">
                             <h3>회원 정보</h3>               
                        </div>
                        <div class="modal-content">
                        	<table>
                        		<tr>이름</tr>
                        		<td>${m.memberName }</td>
                        		<tr>전화번호</tr>
                        		<td>이름</td>
                        		<tr>주소</tr>
                        		<td>이름</td>
                        	</table>
                        </div>
                        <div class="btn-div">
	                  		<button type="button" class="reset" id="reset">확인</button>
                  		</div>
                 </div>
			</div>
		
		
	</div>
	
	
	<script>

	function memberModal(){
		$(".modalWrap").css("display", "flex");
	}
	
	/*
	$(".modalWrap").on("click", function() {
		$(".modal").css("display", "flex");
	});
	*/

	$("#reset").on("click", function() {
		$(".modalWrap").css("display", "none");
	});

	
	</script>

</body>
</html>