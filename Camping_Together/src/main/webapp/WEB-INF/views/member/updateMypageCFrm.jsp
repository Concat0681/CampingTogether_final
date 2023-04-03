<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="/resources/css/default.css" rel="stylesheet"/>
<link rel="stylesheet" href="resources/css/mypageC.css">
<link rel="stylesheet" href="resources/css/updateMypageC.css">
</head>
<body>
	
		<div class= "title-wrap">
			<div class="title-list">
				<ul>
					<li><a href="/shopPayList.do">캠핑장 결제 내역</a></li>
					<li><a href="#">캠핑용품 구매 내역</a></li>
					<li><a href="#">포인트</a></li>
					<li><a href="#">내가 쓴 리뷰</a></li>
					<li><a href="#">내가 쓴 댓글</a></li>
					<li><a href="#">개인정보 수정 및 탈퇴</a></li>
				</ul>
			</div>
		</div>
		
		<div class="input-div">
			<div class="input-title">
				<h2>개인정보 수정</h2>
			</div>
			
			<form action="/updateMypageC.do">
			<div class="mypage-content">
			
				<div class="image-div">
						<div class="img">
							<img id="profile-img" alt="profile" src="/resources/image/member/img.jpeg" width="180px" height="180px">
						</div>
					<div class="image-btn">
						<button type="button" calss="update">수정</button>
						<button type="button" calss="delete">삭제</button>
					</div>
				</div>
				
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" class="input" name="memberId" value="${sessionScope.m.memberId }" readonly>
							</td>
						</tr>
						<tr>
							<td>회원구분</td>
							<td><input type="text" class="input" name="memberGrade" value=
								<c:choose>
									<c:when test="${sessionScope.m.memberGrade eq 'c'}"> 일반회원 </c:when>
									<c:when test="${sessionScope.m.memberGrade eq 'a'}"> 관리자 </c:when>
									<c:when test="${sessionScope.m.memberGrade eq 'b'}"> 사업자 </c:when>
								</c:choose>
								>
							</td>
						</tr>
						<tr>
							<td>새 비밀번호</td>
							<td><input type="password" class="input" name="memberPw" placeholder="새 비밀번호를 입력하세요"></td>
						</tr>
						<tr>
							<td>새 비밀번호</td>
							<td><input type="password" class="input" name="memberPwRe" placeholder="비밀번호를 재입력하세요"></td>
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
							<input type="text" class="postNo-input" id="sample4_postcode" placeholder="우편번호" readonly>
							<input type="button" onclick="sample4_execDaumPostcode()" id="post-btn" value="우편번호 찾기"><br>
							<input type="text" class="input" name="memberAddr" id="sample4_roadAddress" >
							<input type="text" class="input" placeholder="상세주소" id="detail-input">
							<!-- <input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly><br> -->
							
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
			<div class="btn-div">
				<input type="submit" value="수정하기" id="update-btn" class="memberBtn">
				<button type="button" class="memberBtn" id="delete-btn">회원탈퇴</button>
			</div>


			<div class="del-modalWrap">
           	     <div class="del-modal" >
                       <div class="del-top">
                             <h3>정말,,탈퇴하시겠습니까?</h3>               
                        </div>
                        <div class="btnDiv">
	                        <a class="okBtn" href="/deleteMember.do?memberId=${sessionScope.m.memberNo }" id="delete-btn">확인</a>
	                  		<button type="button" class="reset" id="reset">취소</button>
                  		</div>
                 </div>
			</div>
			
			
		</form>
	</div>
	
	
	
	
	
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>

   function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = roadAddr; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = '('+ extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } 
            }
        }).open();
    }
   
   
	$("#delete-btn").on("click",function(){
		$(".del-modalWrap").css("display","flex");
	});
	
	$("#reset").on("click",function(){
		$(".del-modalWrap").css("display","none");
	});
	
   
</script>
</body>

</body>
</html>