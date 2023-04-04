<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="/resources/css/default.css" rel="stylesheet"/>
<link rel="stylesheet" href="resources/css/mypageC.css">
</head>
<body>
	<div class="all-wrap">
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
				<p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 재입력해주세요.</p>
			</div>
				<div class="input-content">
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" class="input" name="memberId" value="${sessionScope.m.memberId }" readonly></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" class="input" name="memberPw"></td>
						</tr>
					</table>
				</div>
				<button type="button" value="확인" id="pwCheck">확인</button>
		</div>
		
			<div class="ok-modalWrap">
           	     <div class="ok-modal" >
                       <div class="ok-top">
                             <h3>비밀번호를 확인해 주세요.</h3>               
                        </div>
                        <div class="btnDiv">
	                  		<button type="button" class="reset" id="reset">확인</button>
                  		</div>
                 </div>
			</div>
		
	</div>
	
	
	
	<script>
		$("#pwCheck").on("click",function(){
			const memberId = $("[name=memberId]").val();
			const memberPw = $("[name=memberPw]").val();
			console.log(memberId, memberPw);
			$.ajax({
				url : "/pwCheck.do",
				type : "post",
				data : {memberId : memberId, memberPw : memberPw},
				success : function(data){
					console.log(data);
					
					if(data == "ok"){
						location.href = "/updateMypageCFrm.do";
					}else{
						$(".ok-modalWrap").css("display","flex");
					
					}
				}
			});
		});
		
		$("#reset").on("click",function(){
			$(".ok-modalWrap").css("display","none");
		});
	
	
	</script>
	
	
	
	
</body>
</html>








