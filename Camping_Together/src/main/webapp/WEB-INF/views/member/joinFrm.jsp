<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	
	
	<form action="/join.do" method="post">
		<fieldset>
			<legend>회원가입</legend>
			아디:<input type="text" name="memberId"><!-- <span id="idChk"></span>  --><br>
			비번:<input type="password" name="memberPw"><br>
			이름:<input type="text" name="memberName"><br>
			전번:<input type="text" name="memberPhone"><br>
			메일:<input type="text" name="memberEmail"><br>
			주소:<input type="text" name="memberAddr"><br>
			<select name="memberGrade">
			<option value="s">사업자</option>
			<option value="c">일반회원</option>
			</select>
			<input type="submit" value="회원가입">
			<input type="reset" value="취소">
		</fieldset>
	</form>
	<a href="/">메인으로</a>
	
	
	
	
	
	
	<!-- 
	<script>
		$("[name=memberId]").on("keyup",function(){
			const memberId = $(this).val();
			$.ajax({
				url: "/idCheck.do",
				type: "get",
				data: {memberId:memberId},
				success : function(data){
					console.log(data);
					if(data=="ok"){
					$("#idChk").text("사용 가능한 아이디 입니다.");
					$("#idChk").css("color","blue");
					}else{
						$("#idChk").text("사용 중인 아이디 입니다.");
						$("#idChk").css("color","red");
							
					}
					
						
				}
				
			})
			
		});
		
	</script>
	 -->
</body>
</html>