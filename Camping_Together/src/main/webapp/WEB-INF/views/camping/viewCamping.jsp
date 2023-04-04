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
	<div class="page-wrap">
		<div class="header-wrap">
			<div class="img-wrap">
				<img src="resources/upload/camping/${camping.filepath }">
			</div>
			<div class="header-info">
				<div class="header-title">${camping.campingTitle }</div>
				<div class="header-content">${camping.campingContent }</div>
				<a><button>문의하기</button></a>
			</div>
		</div>
		<div class="service-info">
			<div class="type-info">
				<div class="type-title">캠핑유형</div>
				<c:forEach items="${campingRoomList }" var="r">
					<c:if test="r.campingRoomType == '오토캠핑'">
						<div class="type-box">
							<div class="type-icon"></div>
							<div class="type-name">오토캠핑</div>
						</div>
					</c:if>
					<c:if test="r.campingRoomType == '글램핑'">
						<div class="type-box">
							<div class="type-icon"></div>
							<div class="type-name">글램핑</div>
						</div>
					</c:if>
					<c:if test="r.campingRoomType == '카라반'">
						<div class="type-box">
							<div class="type-icon"></div>
							<div class="type-name">카라반</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>