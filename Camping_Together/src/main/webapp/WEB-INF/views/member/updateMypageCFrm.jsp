<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<h2>개인정보 수정</h2>
		</div>

		<form action="/updateMypageC.do" method="post" enctype="multipart/form-data">
			<div class="mypage-content">
				<div class="image-div">
					<div class="img">
						<c:choose>
							<c:when test="${empty sessionScope.m.memberPhoto }">
								<img id="profile-img" alt="profile" src="/resources/image/member/img.jpeg" width="180px" height="180px">                 
							</c:when>
							<c:otherwise>
								<img id="profile-img" alt="profile" src="/resources/image/member/${sessionScope.m.memberPhoto }" width="180px" height="180px">                             
							</c:otherwise>
						</c:choose>
						<p>(jpg, jpeg, png 형식만 가능)</p>
					</div>
					<div class="image-btn">
						<label for="update" class="update">수정</label>
						<input disabled type='hidden' id="imgSrc" value="${ sessionScope.m.memberPhoto }">
						<input id="update" type="file" name="profileName" accept=".jpg, .jpeg, .png" onchange="openFile(event);" style="display : none;">
						<label for="delete" class="delete">삭제</label>
					</div>
				</div>
				<input type="hidden"  name="memberNo" value="${sessionScope.m.memberNo }" >
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" class="input" name="memberId" value="${sessionScope.m.memberId }" readonly></td>
						
					</tr>
					<tr>
						<td>회원구분</td>
						<td><input type="text" class="input" name="memberGrade"
							value=<c:choose>
									<c:when test="${sessionScope.m.memberGrade eq 'c'}"> 일반회원 readonly</c:when>
									<c:when test="${sessionScope.m.memberGrade eq 'a'}"> 관리자 readonly</c:when>
									<c:when test="${sessionScope.m.memberGrade eq 'b'}"> 사업자 readonly</c:when>
								</c:choose>>
						</td>
					</tr>
					<tr>
						<td>새 비밀번호</td>
						<td><input type="password" class="input" name="memberPw" placeholder="새 비밀번호를 입력하세요">
						<div class="comment" id="pw-Check" style="font-size : 15px; padding-left: 20px;"></div></td>
						
					</tr>
					<tr>
						<td>새 비밀번호 확인</td>
						<td><input type="password" class="input" name="memberPwRe" placeholder="비밀번호를 재입력하세요">
						<div class="comment" id="pw-ReCheck" style="padding-left: 20px;"></div></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" class="input" name="memberName"
							value="${sessionScope.m.memberName }" readonly></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" class="input" name="memberAddr"
							value="${sessionScope.m.memberAddr }" readonly></td>
					</tr>
					<tr>
						<td>주소 변경</td>
						<td><!-- <input type="text" class="postNo-input" id="sample4_postcode" placeholder="우편번호" readonly>  -->
							<input type="button" onclick="sample4_execDaumPostcode()" id="post-btn" value="주소 찾기" required><br> 
							<input type="text" class="input" name="memberAddr" id="sample4_roadAddress">
							<input type="text" class="input" placeholder="상세주소" id="detail-input"> <!-- <input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly><br> -->

						</td>

					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" class="input" name="memberEmail"
							value="${sessionScope.m.memberEmail }" readonly></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" class="input" name="memberPhone"
							value="${sessionScope.m.memberPhone}" required></td>
					</tr>
				</table>
			</div>
			
			<div class="btn-div">
				<button type="submit" id="update-btn" class="memberBtn">수정하기</button>
				<button type="button" class="memberBtn" id="delete-btn">회원탈퇴</button>
			</div>
		</form>


			<!-- 모달 -->
			<div class="del-modalWrap">
				<div class="del-modal">
					<div class="del-top">
						<h3>정말,,탈퇴하시겠습니까?</h3>
					</div>
					<div class="btnDiv">
						<a class="okBtn" href="/deleteMember.do?memberId=${sessionScope.m.memberNo }" id="delete-btn">확인</a>
						<button type="button" class="reset" id="reset">취소</button>
					</div>
				</div>
			</div>
	</div>




	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = roadAddr; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = '(' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							//document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							
							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							}
						}
					}).open();
		}

		$("#delete-btn").on("click", function() {
			$(".del-modalWrap").css("display", "flex");
		});

		$("#reset").on("click", function() {
			$(".del-modalWrap").css("display", "none");
		});
	
		$(".update").on("click", function(){
			const filename = $("#imgSrc").val()
			if(filename == '${sessionScope.m.memberPhoto}'){
				console.log("삭제")
				createDelInput(filename);
			}
		})
		
		
		var openFile = function(event) {
		    var input = event.target;
		    
		    var reader = new FileReader();
		    reader.onload = function(){
		      var dataURL = reader.result;
		      var img = document.getElementById('profile-img');
		      img.src = dataURL;
		    };
		    reader.readAsDataURL(input.files[0]);
		      $("#imgSrc").val(input.files[0].name);
		  };

	
		  $(".delete").on("click",function(){
			  const filename = $("#imgSrc").val()
			  if('${sessionScope.m.memberPhoto}' != "" && '${sessionScope.m.memberPhoto}' == filename){
				  createDelInput($("#update").val());
			  }
			  $("#update").val("");
			  $("#imgSrc").val("");
			  $("#profile-img").attr("src","/resources/image/member/img.jpeg");
		  });

		function createDelInput(val){
			const input = $("<input>").attr("name", "delProfile").attr("type", "hidden").val(val);
			$("#update").after(input);
		}
		
		
		const result = [false,false];
		$("[name=memberPw]").on("keyup",function() {
			const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
			const inputPw = $(this).val();
			const check = pwReg.test(inputPw);
			if (check) {
				$("#pw-Check").text("사용 가능한 비밀번호 입니다");
				$("#pw-Check").css("color", "#AD8B73");
				result[0] = true;
				
			} else {
				$("#pw-Check").text("영어 소문자 또는 대문자,숫자,특수문자($@!%*#?&)포함 8~12자리");
				$("#pw-Check").css("color", "red");
				result[0] = false;
			}
		});

		
		
		$("[name=memberPwRe]").on("keyup", function() {
			const pwInput = $("[name=memberPw]").val();
			if ($(this).val() == pwInput) {
				$("#pw-ReCheck").text("비밀번호가 일치합니다");
				$("#pw-ReCheck").css("color","#AD8B73");
				result[1] = true;
			} else {
				$("#pw-ReCheck").text("비밀번호가 일치하지 않습니다");
				$("#pw-ReCheck").css("color", "red");
				result[1] = false;
			}
		});
		
		
		
	</script>
</body>

</body>
</html>