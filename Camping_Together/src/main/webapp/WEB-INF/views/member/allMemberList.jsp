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
				<h4>[총 ${count }명]</h4>
			</div>
		</div>
		
		<div class="list">
			<table>
				<tr>
					<td class="td1" style="border-top-left-radius: 10px;">No</td>
					<td class="td2" >이름</td>
					<td class="td3">아이디</td>
					<td class="td4">회원 구분</td>
					<td class="td5"  style="border-top-right-radius: 10px;">가입일</td>
				</tr>
				<c:forEach items="${list }" var="m">
				<tr>
					<td>${m.rnum }</td>
					<td onClick="memberModal(${m.memberNo})" class="nameTd">
						${m.memberName } 
					</td>
					<td>${m.memberId }</td>
					<c:choose >
						<c:when test="${m.memberGrade eq 'c' }">
							<td>일반회원</td>
						</c:when>
						<c:when test="${m.memberGrade eq 's' }">
							<td>개인 사업자</td>
						</c:when>
					</c:choose>
					<td>${m.memberDate }</td>
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
                        <div class="member-content">
                        	<div class="m-no" id="content-title">
                        		<h4>회원번호</h4>
                        		<p></p>
                        	</div>
                        	<div class="m-name" id="content-title">
                        		<h4>이름</h4>
                        		<p></p>
                        	</div>
                        	<div class="m-phone" id="content-title">
                        		<h4>전화번호</h4>
                        		<p></p>
                        	</div>
                        	<div class="m-mail" id="content-title">
                        		<h4>이메일</h4>
                        		<p></p>
                        	</div>
                        	<div class="m-addr" id="content-title">
                        		<h4>주소</h4>
                        		<p></p>
                        	</div>
                        </div>
                        <div class="btn-div">
	                  		<button type="button" class="reset" id="reset">X</button>
                  		</div>
                 </div>
			</div>
		
		
	</div>
	
	
	<script>

	function memberModal(memberNo){
		$(".modalWrap").css("display", "flex");
	
			console.log(memberNo);
		$.ajax({
			url : "/adminOneMember.do",
			type : "post",
			data : {memberNo : memberNo},
			success : function(data){
				console.log(data);
				$(".m-no").find("p").text(data.memberNo);
				$(".m-name").find("p").text(data.memberName);
				$(".m-phone").find("p").text(data.memberPhone);
				$(".m-mail").find("p").text(data.memberEmail);
				$(".m-addr").find("p").text(data.memberAddr);
			}
		});
	}


	$("#reset").on("click", function() {
		$(".modalWrap").css("display", "none");
	});
	
	
	
	

	
	</script>

</body>
</html>