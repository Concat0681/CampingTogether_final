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
	<jsp:include page="/WEB-INF/views/common/sellerPageMenu.jsp" />


	<div class="input-div">
		<div class="input-title">
			<h2>판매자 정보 수정</h2>
		</div>
	</div>

	<form action="/updateMypageC.do">
			<div class="mypage-content">
				<div class="image-div">
					<div class="img">
						<img id="profile-img" alt="profile" src="/resources/image/member/img.jpeg" width="180px" height="180px">                             
						<p>(jpg, jpeg, png 형식만 가능)</p>
					</div>
					<div class="image-btn">
						<label for="update" class="update">수정</label>
						<input id="update" type="file" name="profileName" accept=".jpg, .jpeg, .png" onchange="openFile(event);" style="display : none;">
						<label for="delete" class="delete">삭제</label>
					</div>
				</div>
				
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" class="input" name="memberId" value="${sessionScope.m.memberId }" readonly></td>
					</tr>
					<tr>
						<td>회원구분</td>
						<td><input type="text" class="input" name="memberGrade"
							value=<c:choose>
									<c:when test="${sessionScope.m.memberGrade eq 'c'}"> 일반회원 </c:when>
									<c:when test="${sessionScope.m.memberGrade eq 'a'}"> 관리자 </c:when>
									<c:when test="${sessionScope.m.memberGrade eq 's'}"> 사업자 </c:when>
								</c:choose>>
						</td>
					</tr>
					<tr>
						<td>새 비밀번호</td>
						<td><input type="password" class="input" name="memberPw" placeholder="새 비밀번호를 입력하세요">
						<div class="comment" id="pwCheck" style="font-size : 15px;"></div></td>
						
					</tr>
					<tr>
						<td>새 비밀번호 확인</td>
						<td><input type="password" class="input" name="memberPwRe" placeholder="비밀번호를 재입력하세요">
						<div class="comment" id="pwReCheck"></div></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" class="input" name="memberName" value="${sessionScope.m.memberName }" readonly></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" class="input" name="memberName" value="${sessionScope.m.memberAddr }" readonly></td>
					</tr>
					<tr>
						<td>주소 변경</td>
						<td>
							<input type="button" onclick="sample4_execDaumPostcode()" class="postBtn" id="post-btn" value="주소 찾기" style= "margin-left : 0; padding-left : 0;"><br> 
							<input type="text" class="input" name="memberAddr" id="sample4_roadAddress">
							<input type="text" class="input" placeholder="상세주소" id="detail-input"> <!-- <input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly><br> -->

						</td>

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
			
			<div class="update-btn">
				<button type="submit" id="update-btn" class="updateBtn">수정하기</button>
			</div>
		</form>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />


		<script>
		var openFile = function(event) {
		    var input = event.target;

		    var reader = new FileReader();
		    reader.onload = function(){
		      var dataURL = reader.result;
		      var img = document.getElementById('profile-img');
		      img.src = dataURL;
		    };
		    reader.readAsDataURL(input.files[0]);
		  };

	
		  $(".delete").on("click",function(){
			  $("#update").val("");
			  $("#profile-img").attr("src","/resources/image/member/img.jpeg");
		  });
		</script>
		
		
		
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

	</script>

</body>


</html>