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
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp" />
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
		<div class="input-div">
			<div class="input-title">
				<h2>내가 쓴 캠핑장 리뷰</h2>
			</div>
		</div>
		
		<div class="pay-list">
			<div class="list-content">
				<div class="total">
					<p>총 [${count }]건</p>
				</div>
				<table>
					<tr>
						<th class="number">No</th>
						<th class="name">캠핑장 명</th>
						<th>리뷰 사진</th>
						<th class="content">내용</th>
						<th class="date">작성일</th>
					</tr>
				<c:forEach items="${list }" var="r">  
					<tr>
						<td class="rnum">${r.rnum }</td>
						<td class="camping-name"><a href="/viewCamping.do?campingNo=${r.campingNo }"><span class="camping-title">${r.campingTitle }</span></a></td> 
						<td><div><a href="/viewCamping.do?campingNo=${r.campingNo }"><img class="review-img"  src="/resources/upload/campingReview/${r.filepath }"></a></div></td> 
						<td><div class="re-content"><a href="/viewCamping.do?campingNo=${r.campingNo }">${r.campingReviewContent }</a></div></td><!-- div사이즈(너비)지정, 내려가지말고 한줄로, 넘어가는걸 숨겨, ..찍어줘,, -->
						<td>${r.campingReviewDate }</td>
					</tr>
					
				</c:forEach> 
					
				</table>
			</div>
			<div class="pagination">
				${navi }
		  </div>
		</div>
		
		 <div class="footer-wrap">
			<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		 </div>
</body>
</html>