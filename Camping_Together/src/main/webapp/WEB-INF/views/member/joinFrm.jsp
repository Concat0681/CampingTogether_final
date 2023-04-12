<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
	#sample4_extraAddress{
		width: 250px;
	} 

</style>
</head>
<body>
	
	
	<form action="/join.do" method="post">
		<fieldset>
			<legend>회원가입</legend>
			
			아디:<input type="text" name="memberId" id="memberId" placeholder="아이디를 입력해주세요." required maxlength="12">
			<span class="point successIdChk"></span><br>
			<span class="point">※ 영문자, 소문자 입력가능, 최대 12자 까지 입력</span>
			<input type="hidden" id="idDoubleChk"><!-- <span id="idChk"></span>  --><br>
			비번:<input type="password" name="memberPw" id="memberPw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,16}" required title="조건에 맞춰 다시 작성해주세요!"><br>
			<span class="point successPwChk"></span>
			<span class="point">※ 최소 하나의 대문자, 소문자, 숫자, 특수문자(!@#$%^&*)를 포함한 최소 8자부터 최대 16자의 비밀번호를 입력해주세요</span><br>
			비번확인:<input type="text" name="pwDoubleChk" id="pwDoubleChk">
			<input type="hidden" id="pwDoubleChk"><span class="point pwDoubleChk"></span><br>
			이름:<input type="text" name="memberName" id="memberName" pattern=""><br>
			전번:<input type="text" name="memberPhone" id="memberPhone" oninput="oninputPhone(this)"><br>
			<div class="form-group email-form">
				<label for="memberEamil">이메일</label>
				<div class="input-group">
				<input type="text" class="form-control" name="memberEamil" id="memberEamil1" placeholder="이메일" >
					<select class="form-control" name="memberEamil" id="memberEamil2" >
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@gmail.com</option>
						<option>@hanmail.com</option>
					 	<option>@yahoo.co.kr</option>
					</select>
				</div>   
			<div class="input-group-addon">
				<button type="button" class="btn btn-primary" id="mail-Confirm-Btn">본인인증</button>
			</div>
				<div class="mail-check-box">
			<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
			</div>
				<span id="mail-check-warn"></span>
			</div>
			주소:<input type="text" name="memberAddr" id="sample4_extraAddress" placeholder="주소를 입력해주세요" readonly><br>
			<input type="text" id="sample4_postcode" placeholder="우편번호" readonly>
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly><br>
			<select name="memberGrade" id="memberGrade">
			<option value="s">사업자</option>
			<option value="c">일반회원</option>
			</select>
			<input type="submit" value="회원가입">
			<input type="reset" value="취소">
		</fieldset>
	



<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" readonly>
<input type="hidden" id="sample4_detailAddress" placeholder="상세주소"><br>
<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
			
	</form>
	<a href="/">메인으로</a>

<script>

$("[name=memberId]").blur(function(){
	const memberId = $("#memberId").val();
	if(memberId == "" || memberId.length < 6){
		$(".successIdChk").text("아이디는 6자 이상 12자 이하로 입력해주세요 ");
		$(".successIdChk").css("color", "red");
		$("#idDoubleChk").val("false");
	}else{
		$.ajax({
			url : "${pageContext.request.contextPath}/idCheck.do?memberId="+ memberId,
			type : "post",
			cache : false,
			success : function(data) {
				if (data == 0) {
					$(".successIdChk").text("사용가능한 아이디입니다");
					$(".successIdChk").css("color", "green");
					$("#idDoubleChk").val("true");
				} else {
					$(".successIdChk").text("사용중인 아이디입니다");
					$(".successIdChk").css("color", "red");
					$("#idDoubleChk").val("false");
				}
			}, error : function() {
				console.log("실패");
			}
		});
	}
});

//비밀번호 확인
$("#pwDoubleChk").blur(function(){
	if($("#pwDoubleChk").val() == $("#memberPw").val()){
		$(".pwDoubleChk").text("비밀번호가 일치합니다.");
		$(".pwDoubleChk").css("color", "green");
	}else{
		$(".pwDoubleChk").text("비밀번호가 일치하지 않습니다.");
		$(".pwDoubleChk").css("color", "red");
	}
});

$('#mail-Confirm-Btn').click(function() {
	const memberEamil = $('#memberEamil1').val() + $('#memberEamil2').val(); // 이메일 주소 값 합쳐서 전달 하기
	console.log('완성된 이메일 : ' + memberEamil); // 이메일 오는지 확인
	const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	
	$.ajax({
		type : 'post',
		url : "/mailCheck.do",
		data: {memberEmail:memberEamil},
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}, error : function() {
			console.log("실패");
		}
	}); // end ajax
}); // end send eamil

//인증번호 비교 
// blur -> focus가 벗어나는 경우 발생
$('.mail-check-input').blur(function () {
	const inputCode = $(this).val();
	const resultMsg = $('#mail-check-warn');
	
	if(inputCode === code){
		resultMsg.html('인증번호가 일치합니다.');
		resultMsg.css('color','green');
		$('#mail-Check-Btn').attr('disabled',true);
		$('#userEamil1').attr('readonly',true);
		$('#userEamil2').attr('readonly',true);
		$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
	}else{
		$resultMsg.html('인증번호가 불일치 합니다. 다시 입력해주세요 .');
		$resultMsg.css('color','red');
	}
});
</script>	
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
   function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
</script>
</body>
</html>