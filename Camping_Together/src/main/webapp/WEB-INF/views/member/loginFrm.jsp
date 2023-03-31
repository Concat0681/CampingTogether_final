<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/login.do" method="post">
		<fieldset>
			<legend>로그인</legend>
			아이디: <input type="text" name="memberId"><br> 
			비밀번호: <input type="text" name="memberPw"><br> 
			<input type="submit" value="로그인">
		</fieldset>
	</form>
</body>
</html>