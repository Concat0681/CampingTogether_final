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
	<div>
		<ul>
			<li>
				<ol class="boardBox" style="display: block;">
					<li class="title Tip-title">캠핑Tip</li>
					<c:forEach items="${Foodlist}" var="bf">
						<li>><span>${bf.boardFoodTitle }</span> </li>
					</c:forEach>
					
				</ol>
			</li>
			<li>
				<ol class="boardBox">
					<li class="title Food-title">캠핑Food</li>
					<c:forEach items="${Foodlist}" var="bf">
						<li>><span>${bf.boardFoodTitle }</span> </li>
					</c:forEach>
				</ol>
			</li>
			<li>
				<ol class="boardBox">
					<li class="title Free-title">자유게시판</li>
					<c:forEach items="${Foodlist}" var="bf">
						<li>><span>${bf.boardFoodTitle }</span> </li>
					</c:forEach>
				</ol>
			</li>
		</ul>
	</div>
<a class="mainlist" href="/boardMainFoodList.do"></a>
</body>
<script>
	$(document).ready(function(){
		$(".mainlist").click();
	});
</script>
</html>