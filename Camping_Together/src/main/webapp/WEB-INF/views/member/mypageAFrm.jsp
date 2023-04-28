<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/adminMenu.jsp" />
	
	<div class="content-wrap">
		<div class="admin-content" style="border-bottom : none;">
			<div class="admin-title">
				<h3>관리자 정보</h3>
			</div>
		
		
		<form action="/adminPwUpdate.do" method="post">
		<div class="admin-info">
			<table>
				<tr>
					<td>관리자 아이디</td>
					<td><input type="text" class="input" name="memberId" value="${sessionScope.m.memberId }" readonly></td>
				</tr>
				<tr>
					<td>새 비밀번호</td>
					<td><input type="password" class="input" id="pwinput" name="memberPw" placeholder="새 비밀번호를 입력하세요">
					<div class="comment" id="pwCheck" style="font-size : 15px;"></div></td>
						
				</tr>
				<tr>
					<td>새 비밀번호 확인</td>
					<td><input type="password" class="input" name="memberPwRe" placeholder="비밀번호를 재입력하세요">
					<div class="comment" id="pwReCheck"></div></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" class="input" name="memberEmail" value="${sessionScope.m.memberEmail }" readonly></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" class="input" name="memberPhone" value="${sessionScope.m.memberPhone}"></td>
				</tr>
				</table>
			</div>
			<div class="admin-pwUp">
				<button type="submit" id="admin-pw" class="admin-pwupdate">비밀번호 수정하기</button>
			</div>
		</div>
			
		</form>
	</div>
		
		
	
	
	
	
	<script>
	const result = [false,false];
	$("[name=memberPw]").on("keyup",function() {
		const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
		const inputPw = $(this).val();
		const check = pwReg.test(inputPw);
		if (check) {
			$("#pwCheck").text("사용 가능한 비밀번호 입니다");
			$("#pwCheck").css("color", "#AD8B73");
			result[0] = true;
			
		} else {
			$("#pwCheck").text("영어 소문자 또는 대문자,숫자,특수문자($@!%*#?&)포함 8~12자리");
			$("#pwCheck").css("color", "red");
			result[0] = false;
			}
		});
	
	
	$("[name=memberPwRe]").on("keyup", function() {
		const pwInput = $("[name=memberPw]").val();
		if ($(this).val() == pwInput) {
			$("#pwReCheck").text("비밀번호가 일치합니다");
			$("#pwReCheck").css("color","#AD8B73");
			result[1] = true;
		} else {
			$("#pwReCheck").text("비밀번호가 일치하지 않습니다");
			$("#pwReCheck").css("color", "red");
			result[1] = false;
		}
	});
	
	<%--
	$("[type=submit]").on("click",function(event){ //하나라도 TRUE가 아닐때
		if(!(result[0] && result[1]){
	        event.preventDefault();
	        alert("입력하신 정보를 확인하세요");		        
		}
	});
	 --%>
	 
	
	 $(".admin-pwupdate").on("click",function(){			 
		 const pw = $("#pwinput").val();
		 if(pw.length === 0){
			 alert("비밀번호를 입력하세요");
		 }
		});

	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>


