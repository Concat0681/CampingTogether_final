<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/default.css" rel="stylesheet"/> 	
<link href="/resources/css/main.css" rel="stylesheet"/> 	
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<h1>파이널</h1>
	<button class="btn1" style="width : 100px; height : 30px;">버튼</button>
	<button class="btn2" style="width : 100px; height : 30px;">버튼</button>
	<button class="btn2" style="width : 100px; height : 30px;">버튼</button>
	<a href="/campingWriteFrm.do">캠핑 등록</a>
	<a href="/usedBoardList.do">중고장터</a>
	
	<c:choose>
		<c:when test="${empty sessionScope.m }">
	<form action="/login.do" method="post">
		<fieldset>
			<legend>로그인</legend>
			아이디: <input type="text" name="memberId"><br> 
			비밀번호: <input type="text" name="memberPw"><br> 
			<input type="submit" value="로그인">
		</fieldset>
	</form>
		</c:when>
	</c:choose>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</body>
</html>