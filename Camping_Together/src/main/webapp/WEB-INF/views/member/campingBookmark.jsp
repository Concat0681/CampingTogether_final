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

	<div class="input-div wishCam">
		<div class="input-title">
			<h2>찜한 캠핑장</h2>
		</div>
	</div>
	<div class="bookmark-wrap">
		<div class="infomation">
			<p>총 [${list.size() }] 개</p>
		</div>
	</div>
	<div class="c-list">
		<input type="hidden" id="memberId" value="${sessionScope.m.memberId }"> 
		<c:forEach items="${list }" var="c">
		<div class="c-info">
			<input type="hidden" name="campingNo" value="${c.campingNo }">
	        <div class="camping-img"><img src="/resources/image/shop/${c.filepath }" width="280px;" height="280px;"></div>
	        <div class="info">
	             <div class="camping-name">${c.campingTitle }</div>
	             <div class="sido">${c.campingSido }</div>
	        </div>
        </div>
        </c:forEach>
	</div>
	<div class="pagination">
		${navi }
	</div>
		
	<script>
		$(".c-info").on("click", function(){
			const campingNo = $(this).find("input[name=campingNo]").val();
			const memberId = $("#memberId").val();
			location.href = "/viewCamping.do?campingNo="+campingNo+"&memberId="+memberId;
		})
	</script>
</body>
</html>