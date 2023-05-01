<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 상세 보기  -->
	<div class="messageDetail-wrapper" id="messageDetail">
		<div class="messageDetail-modal">
			<div class="messageDetail-header">
				<h2>쪽지내용</h2>
				<button class="close-btn">&times</button>
			</div>
			<hr style="margin: 0px;">
			<div class="messageDetail-content3">
				<div class="messageFrm">
					<div>
						<span>발신자: </span> <span id="detailSender"></span>
					</div>
					<div>
						<span>날짜: </span> <span id="detailDate"></span>
					</div>
					<div>
						<span>내용: </span><span id="detailContent"></span>
					</div>
					<button onclick="closeDetail();">닫기</button>
					<button onclick="replyMessage();">답장</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>