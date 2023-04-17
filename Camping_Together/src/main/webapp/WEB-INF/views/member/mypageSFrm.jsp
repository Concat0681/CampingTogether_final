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

	<form action="/updateMypageC.do">
			<div class="mypage-content">

				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" class="input" name="memberId"
							value="${sessionScope.m.memberId }" readonly></td>
					</tr>
					<tr>
						<td>회원구분</td>
						<td><input type="text" class="input" name="memberGrade"
							value=<c:choose>
									<c:when test="${sessionScope.m.memberGrade eq 'c'}"> 일반회원 </c:when>
									<c:when test="${sessionScope.m.memberGrade eq 'a'}"> 관리자 </c:when>
									<c:when test="${sessionScope.m.memberGrade eq 'b'}"> 사업자 </c:when>
								</c:choose>>
						</td>
					</tr>
					<tr>
						<td>새 비밀번호</td>
						<td><input type="password" class="input" name="memberPw" placeholder="새 비밀번호를 입력하세요"></td>
						
					</tr>
					<tr>
						<td>새 비밀번호 확인</td>
						<td><input type="password" class="input" name="memberPwRe" placeholder="비밀번호를 재입력하세요"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" class="input" name="memberName"
							value="${sessionScope.m.memberName }" readonly></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" class="input" name="memberName"
							value="${sessionScope.m.memberAddr }" readonly></td>
					</tr>
					<tr>
						<td>주소 변경</td>
						<td><input type="text" class="postNo-input" id="sample4_postcode" placeholder="우편번호" readonly> 
							<input type="button" onclick="sample4_execDaumPostcode()" id="post-btn" value="우편번호 찾기"><br> 
							<input type="text" class="input" name="memberAddr" id="sample4_roadAddress">
							<input type="text" class="input" placeholder="상세주소" id="detail-input"> <!-- <input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly><br> -->

						</td>

					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" class="input" name="memberEmail"
							value="${sessionScope.m.memberEmail }" readonly></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" class="input" name="memberPhone"
							value="${sessionScope.m.memberPhone}"></td>
					</tr>
				</table>
			</div>
			
			<div class="btn-div">
				<button type="submit" id="update-btn" class="memberBtn">수정하기</button>
				<button type="button" class="memberBtn" id="delete-btn">회원탈퇴</button>
			</div>
		</form>

</body>
</html>