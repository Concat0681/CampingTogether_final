<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/updateMypageC.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp" />
	
		<div class="input-div">
			<div class="input-title">
				<h2>내가 쓴 캠핑장 리뷰</h2>
			</div>
		</div>
		
		<div class="pay-list">
			<div class="list-content">
				<table>
					<tr>
						<th>번호</th>
						<th>캠핑장 명</th>
						<th>리뷰 사진</th>
						<th>내용</th>
						<th>작성일</th>
					</tr>
			<!-- 	<c:forEach items="${list }" var="p">  -->
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					
				<!-- </c:forEach> -->
					
				</table>
			</div>
			<div class="pagination">
				${navi }
		  </div>
		</div>
	
</body>
</html>