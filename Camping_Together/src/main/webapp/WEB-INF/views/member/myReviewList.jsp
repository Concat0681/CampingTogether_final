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
						<th calss="number">번호</th>
						<th>캠핑장 명</th>
						<th>리뷰 사진</th>
						<th>내용</th>
						<th>작성일</th>
					</tr>
				<c:forEach items="${list }" var="r">  
					<tr>
						<td>${r.rnum }</td>
						<td><div class="title">${r.campingTitle }</div></td> <!-- div사이즈(너비)지정, 내려가지말고 한줄로, 넘어가는걸 숨겨, ..찍어줘,, -->
						<td><div><img class="review-img"  src="/resources/upload/campingReview/${r.filepath }"></div></td> 
						<td>${r.campingReviewContent }</td>
						<td>${r.campingReviewDate }</td>
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