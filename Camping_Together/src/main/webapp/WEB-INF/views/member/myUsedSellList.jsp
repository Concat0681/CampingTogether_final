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
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="input-div">
		<div class="input-title">
			<h2>판매 중 중고상품</h2>
			<div class="used-list">
			<div class="list-content">
				<div class="total">
					<p>총 [${list.size() }]건</p>
				</div>
				<table>
					<tr>
						<th class="used-name" style="width: 320px;">중고물품 명</th>
						<th style="width: 140px;">물품 상태</th>
						<th style="width: 140px;">가격</th>
						<th style="width: 140px;">판매 상태</th>
						<th>작성일</th>
					</tr>
				<c:forEach items="${list }" var="u">
					<tr onclick="viewUsed('${u.usedBoardNo}')">
						<td class="used-title">${u.usedBoardTitle }</td>
						<c:choose>
							<c:when test="${u.usedProductStatus == 0 }">
								<td>판매중</td>
							</c:when>
							<c:otherwise>
								<td>판매완료</td>
							</c:otherwise>
						</c:choose>
						<td>${u.usedProductPrice}</td>
						<td>${u.usedBoardStatus }</td>
						<td>${u.regDate }</td>
					</tr>
					
				</c:forEach>
					
				</table>
			</div>
			<div class="pagination">
				${pageNavi }
		  </div>
		</div>
		</div>
	</div>
	<script>
		function viewUsed(usedBoardNo){
			location.href="/usedBoardView.do?usedBoardNo="+usedBoardNo;
		}
	</script>
</body>
</html>