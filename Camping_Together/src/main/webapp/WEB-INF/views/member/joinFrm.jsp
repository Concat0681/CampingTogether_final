<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style>
.tab-content > div:last-child {
  display:none;
}



label.active {
  transform:translateY(50px);
  left:2px;
  font-size:14px;
  .req {
    opacity:0;
  }
}
@font-face {
  font-family: ng-bold;
  src: url(../font/Nanum_Gothic/NanumGothic-Bold.ttf);
}
@font-face {
  font-family: ng-extra-bold;
  src: url(../font/Nanum_Gothic/NanumGothic-ExtraBold.ttf);
}
@font-face {
  font-family: ng-regular;
  src: url(../font/Nanum_Gothic/NanumGothic-Regular.ttf);
}

input {
	height: 40px;
    width: 100%;
    margin: 20px auto;
    border-left: none;
    border-right: none;
    border-top: none;
    color: white;
    background: rgba(173, 139, 115, 0.5);
    padding-left:5px;
    font-family: FontAwesome, "Open Sans", Verdana, sans-serif;
    font-style: normal;
    font-weight: normal;
    text-decoration: inherit;
    }
button {
	height:50px;
	width: 80%;
	border-radius: 4px;
	margin-bottom: 20px;
    border: none;
    background: #CEAB93;
    color: #ffffff;
    font-family: sans-serif;
    font-weight: 700;
    font-size: 14pt;
    cursor: pointer;
}
form {
	width: 90%;
	margin: 40px auto;
	text-align: center;
	    	
}
    
input:focus {
	outline: none
}
.logo {
	color: white;
	font-family: sans-serif;
	font-size: 15pt;
	font-weight: 600;
	text-align: center;
	padding-top: 40px
	}
.tab-group{
	list-style-type: none;
	display: block;
	padding: 15px;
	display: flex;
	text-align: center;
	
	
}
.tab-group>li{
	margin: 20px;
	width: calc(100%/2);
	background-color: #CEAB93;
	text-align: center;
	border-radius: 8px;
	padding: 12px;
}
.signup-input{
	border: none;
}
    
    .myform {
    	
        background: url(/resources/image/loginBackground1.jpeg);
        background-color:#0b2144;
        width: 40%;
        margin: auto;
        height: 600px;
        -webkit-box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
        -moz-box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
        box-shadow: 0px 30px 60px -6px #000;
        max-width: 500px;
    	min-width: 400px;
    	display: inline-table;
    }
    
    .myform a {
        text-decoration: none;
        color: white;
        font-family: ng-extra-bold;
        font-size: 20px;
        
    }
    .myform a:hover {
        text-decoration: underline;
        color: white;
        font-family: ng-extra-bold;
        font-size: 20px;
        
    }
    
     ::-webkit-input-placeholder {
        /* Chrome/Opera/Safari */
         color: #fbfbfb;
       
    }
	.fa-cloud-upload{
  		font-size:90px;
  
	}
    
    ::-moz-placeholder {
        /* Firefox 19+ */
        color: #cccccc;
          }
    
    :-ms-input-placeholder {
        /* IE 10+ */
         color: #cccccc;
         }
    
    :-moz-placeholder {
        /* Firefox 18- */
        color: #cccccc;
      
    }
  @media screen and (max-width:500px){
        .myform{
            width:80%;
        }
    }
    @media screen and (max-width:800px){
        .myform{
            width:60%;
        }
    }
    .searchBox{
    	text-align: center;
    	width: 80%;
    	display: inline-block;
    	min-width: 250px;
    }
    .searchPw{
    	float: right;
    }
    .searchId{
    	float: left;
    }
    .formBox{
    	padding: 20px;
    }
    .signup-input{
    	margin: 5px auto;
    	border: none;
    }
    .signup-input:focus{
    	background-color: rgba(173, 139, 115, 1);
    }
    .signup{
    text-align: left;
    }
    .addrbtn{
    	cursor: pointer;
    }
    .mail-check-input{
    	border: none;
    }
    .mail-confirmBox{
    	width: 150px;
    }
    .btn-primary{
    	width: 150px;
    }
    .memberGrade{
    	width: 100px;
    	font-family: ng-extra-bold;
    	font-weight:bold;
        font-size: 15px;
        border: none;
    }
    .memberGrade>option{
    	width: 100px;
    	text-align: center;
    	font-family: ng-extra-bold;
    	font-weight:bold;
        font-size: 15px;
        border: none;
    }
</style>
</head>
<body>
	<div class="wrapper" style="display: grid; margin-top: 50px;">
		<div class="myform">
	      	<ul class="tab-group">
	        <li class="tab active"><a href="#signup">Sign Up</a></li>
	        <li class="tab"><a href="#login">Log In</a></li>
	      </ul>
	      <div class="tab-content">
	        <div id="login">   
				    <div class="logo">Wellcome Back! Camping Together
				    	
				    </div>
					    <form action="/login.do" method="post" autocomplete="off">
					        <input type="text" placeholder=" &#xf007;   UserId" name="memberId"/>
					        <input type="password" placeholder=" &#xf023;  Password" name="memberPw" />
					        <div>
						        <button type="submit">로그인 </button>
						        <hr>
						        <div class="searchBox"> <a href="#" class="searchId">아이디 찾기</a> <a href="#" class="searchPw">비밀번호 찾기</a> </div>
						    </div>
					    </form>
					
	        </div>
	        
	        <div id="signup">   
	          <div class="logo">Let`s Join Camping Together
			  </div>
	          <form action="/join.do" method="post" class="signup" autocomplete="off">
	            <div class="field-wrap">
		            <select name="memberGrade" id="memberGrade" class="memberGrade">
						<option value="s" >사업자</option>
						<option value="c" >일반회원</option>
					</select>
				</div>
	            
	            <div class="field-wrap">
	            <input type="text" name="memberId" id="memberId" class="signup-input" placeholder="아이디  입력" required maxlength="12">
	            <span class="point successIdChk"></span>
	            <input type="hidden" id="idDoubleChk" >
	            </div>
	          <div class="field-wrap">
	            <input type="password" name="memberPw" id="memberPw" class="signup-input" placeholder="비밀번호 입력" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,16}" required maxlength="16" title="조건에 맞춰 다시 작성해주세요!"><br>
				<span class="point successPwChk"></span>
	          </div>
	          <div class="field-wrap">
	          	<input type="password" name="pwDoubleChk" id="pwDoubleChk" class="signup-input" placeholder="비밀번호 재확인"><br>
				<input type="hidden" id="pwDoubleChk"><span class="point pwDoubleChk"></span>
	          </div>
	          <div class="field-wrap">
	          	<input type="text" name="memberName" id="memberName" class="signup-input" placeholder="이름 입력" pattern=".{2,10}" required  maxlength="10">
	          </div>
	          <div class="field-wrap">
	          	<input type="text" name="memberPhone" id="memberPhone" oninput="oninputPhone(this)" class="signup-input" placeholder="전화번호 입력(- 입력 제외)" required  maxlength="13"><br>
	          </div>
	          <div class="field-wrap">
	          	<div class="form-group email-form">
					<div class="input-group">
						<input type="email" class="form-control signup-input" name="memberEmail" id="memberEmail" placeholder="이메일 입력" >
						<input class="form-control mail-check-input signup-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6" style="display:none; width:200px;" ><button type="button" class="btn btn-primary" id="mail-Confirm-Btn">본인인증</button>	
						<button type="button" class="btn btn-primary" id="mail-Confirm-Btn">본인인증</button><span id="mail-check-warn"></span>
					</div>   
					<div class="mail-check-box">
				</div>
					
				</div>
	          
	          </div>
	          <div class="field-wrap"></div>
				<input type="text" name="memberAddr" id="sample4_extraAddress" class="signup-input" placeholder="주소 입력" readonly><br>
				<input type="text" id="sample4_detailAddress" class="signup-input" placeholder="상세주소"><span><input type="button" onclick="sample4_execDaumPostcode()" class="signup-input addrbtn" value="주소 찾기" style="background-color:#CEAB93 "></span><br>
				<div class="field-wrap" >
					<input type="submit" value="회원가입" style="width:40%; cursor: pointer;" >
					<input type="reset" value="취소" style="width:40%; float: right; cursor: pointer;">
				
				</div>
	          </form>
	        </div>
	        
	      </div><!-- tab-content -->
	      
	</div> <!-- /form -->
	</div>
<input type="hidden" id="sample4_postcode" placeholder="우편번호" readonly>
<input type="hidden" id="sample4_roadAddress" placeholder="도로명주소" readonly><br>
<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" readonly>
<br>
<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
<script>

$('.form').find('input, textarea').on('keyup blur focus', function (e) {
	  
	  const $this = $(this),
	      label = $this.prev('label');

		  if (e.type === 'keyup') {
				if ($this.val() === '') {
	          label.removeClass('active highlight');
	        } else {
	          label.addClass('active highlight');
	        }
	    } else if (e.type === 'blur') {
	    	if( $this.val() === '' ) {
	    		label.removeClass('active highlight'); 
				} else {
			    label.removeClass('highlight');   
				}   
	    } else if (e.type === 'focus') {
	      
	      if( $this.val() === '' ) {
	    		label.removeClass('highlight'); 
				} 
	      else if( $this.val() !== '' ) {
			    label.addClass('highlight');
				}
	    }

	});

	$('.tab a').on('click', function (e) {
	  e.preventDefault();
	  $(this).parent().addClass('active');
	  $(this).parent().siblings().removeClass('active');
	  target = $(this).attr('href');
	  $('.tab-content > div').not(target).hide();
	  $(target).fadeIn(1000);
	});
	$("#mail-Confirm-Btn").on('click', function() {
		$('.mail-check-input').css("display","block");
		
	});
	

//아이디 조건 출력 및 조건 일치 확인
$("[name=memberId]").blur(function(){
	const memberId = $("#memberId").val();
	const number = memberId.search(/[0-9]/g);
	const english = memberId.search(/[a-z]/ig);
	const spece = memberId.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	const korean = memberId.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/);
	if(memberId == "" || memberId.length < 6){
		$(".successIdChk").text("아이디는 6자 이상 12자 이하로 입력해주세요 ");
		$(".successIdChk").css("color", "white");
		$("#idDoubleChk").val(false);
	}else if (memberId.search(/\s/) != -1) {
        $(".successIdChk").text("아이디는 공백 없이 입력해주세요.");
  		$(".successIdChk").css("color", "white");
  		$("#idDoubleChk").val(false);
     }else if(memberId.korean > 1 || english < 0 || number < 0){
    	$(".successIdChk").text("아이디는 영문과 숫자를 포함하여 입력해주세요");
   		$(".successIdChk").css("color", "white");
   		$("#idDoubleChk").val(false);
     }else{
		$.ajax({
			url : "${pageContext.request.contextPath}/idCheck.do?memberId="+ memberId,
			type : "post",
			cache : false,
			success : function(data) {
				if (data == 0) {
					$(".successIdChk").text("사용가능한 아이디입니다");
					$(".successIdChk").css("color", "white");
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


//비밀번호  조건 출력 및 조건 일치 확인
$("[name=memberPw]").blur(function(){
	const memberPw = $("#memberPw").val();
	const number = memberPw.search(/[0-9]/g);
	const english = memberPw.search(/[a-z]/ig);
	const spece = memberPw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	if (memberPw.length<8 || memberPw.length>16) {
    	$(".successPwChk").text("비밀번호는 8자 이상 16자 이하로 입력해주세요");
 		$(".successPwChk").css("color", "white");
         
     } else if (memberPw.search(/\s/) != -1) {
        $(".successPwChk").text("비밀번호는 공백 없이 입력해주세요.");
  		$(".successPwChk").css("color", "white");
         
     } else if (number < 0 || english < 0 || spece < 0) {
        $(".successPwChk").text("영문,숫자,특수문자를 혼합하여 입력해주세요.");
   		$(".successPwChk").css("color", "white");
         
     } else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
    	 $(".successPwChk").text("영문,숫자,특수문자를 포한하여 입력해주세요");
    	 $(".successPwChk").css("color", "white");
          
     } else if (/(\w)\1\1\1/.test(memberPw)) {
    	$(".successPwChk").text("같은 문자를 4번 이상 사용할 수 없습니다.");
    	$(".successPwChk").css("color", "white");
          
     } else {
    	$(".successPwChk").text("사용가능한 비밀번호 입니다!");
     	$(".successPwChk").css("color", "white");
         return true;
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
	const memberEmail = $('#memberEmail').val() // 이메일 주소
	console.log('완성된 이메일 : ' + memberEmail); // 이메일 오는지 확인
	const checkInput = $('.mail-check-input') // 인증번호 입력하는곳  
	$.ajax({
		type : 'post',
		url : "/mailCheck.do",
		data: {memberEmail:memberEmail},
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