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
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp" />

		<div class="input-div wishCam">
			<div class="input-title">
				<h2>찜한 캠핑장</h2>
			</div>
		</div>
		
		<div class="bookmark-wrap">
			<div class="infomation">
				<p>총 [${count }] 개</p>
			</div>
		<div class="c-list">
			<c:forEach items="${list }" var="c">
			<div class="c-info">
                <a href="#">
                    <div class="camping-img"><img src="/resources/image/shop/${a.filepath }" width="280px;" height="280px;"></div>
                    <div class="info">
                        <div class="camping-name"></div>
                        <div class="sido"></div>
                    </div>
                </a>
            </div>
            </c:forEach>
		</div>
		
		
		<div class="pagination">
				${navi }
		 </div>
	</div>
		
</body>
</html>