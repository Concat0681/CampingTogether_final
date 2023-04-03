<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
.chatting{
		width: 472px;
/* 		display: none; */
	}
		<%-- y축으로 내부컨텐츠가 넘어가면 스크롤생성 --%>
	.messageArea{
		overflow-y : auto;
		border: 2px solid #e3e4e5;
		height: 500px;
		display: flex;
		flex-direction: column;
		background-color: #F2F3F5;
	}
	.messageArea>p{
		text-align: center;
		width: 100%;
	}
	#sendMsg{
		width: 85%;
	}
	#sendBtn{
		width:15%;
	}
	.chat{
		margin-bottom: 10px;
		padding: 8px;
		border-radius: 3px;
	}
	.left{
		max-width: 300px;
		align-self: flex-start;
		background-color: #EBEDF0;
		border-radius: 15px;
		margin-left: 16px;
	}

	.right{
		max-width: 200px;
		align-self: flex-end;
		background-color: #1877F2;
		border-radius: 15px;
		margin-right: 16px;
		color: #fff
	}

	#btn-chat{
		display: none;
	}
	.title{
		text-align: center;
		border-bottom: 1px solid #e3e4e5;
		display: flex;
	}
	.title>h3{
	margin: 5px;
	background-color #1877F2;
	line-height: 25px;
	height: 50px;
	line-height: 50px
	}
	.chatId{
		margin-left: 20px;
		font-weight: bold;
	}
	.title>img{
	margin-left: 65px;
	margin-top: 5px;
	margin-bottom: 5px;
	}
	.sendBox{
		position: relative;
	}
	.sendBox>input{
		position:absolute;
		top: -36px;
		left:1px;
		border: 2px solid #e3e4e5; 
		height: 30px;
		width: 450px;
		outline: none;
	}
	.sendBox>button{
		position:absolute;
		top: -36px;
		left:400px;
		border: 2px solid #e3e4e5;
		height: 35px;
		width: 50px;
		background-color: #CCCCCC;
		cursor: pointer;
	}
</style>
</head>
<body>
	<c:if test="${not empty sessionScope.m }">
		<button id="btn-chat" onclick="initChat('${sessionScope.m.memberId }');">채팅 시작하기</button>
		<div class="chatting">
			<%--채팅 메세지 구현 --%>
			<div class="messageArea">
				<div class="title"><img src="/resources/image/chatting/tent.png" style="width:50px";><h3>CAMPING TOGETHER 자유채팅방</h3></div>
				
			</div>
			<div class="sendBox">
				<%-- 입력 --%>
				<input type="text" id="sendMsg" placeholder="메세지를 입력하세요.">
				<button id ="sendBtn" onclick="sendMsg();">전송</button>
			</div> 
			
		</div>
		<script>
			//웹소켓 객체를 저장하는 변수
			let ws;
			//회원아이디를 저장하는 변수
			let memberId;
			$("#btn-chat").trigger("click");
			function initChat(param){
				//전역변수에 아이디 저장
				memberId = param;
				//웹소켓 연결 시도
				ws = new WebSocket("ws://192.168.10.46/chat.do");
				//웹소켓 연결 성공 시 실행할 함수 지정
				ws.onopen = startChat;
				//서버에서 데이터를 받으면 처리할 함수 지정
				ws.onmessage = receiveMsg;
				//웹소켓 연결이 종료되면 실행될 함수 지정
				ws.onclose = endChat;
				
 			}
				$(".chatting").show();
			function startChat(){
				console.log("웹소켓 연결완료");
				//연결 완료 시 아이디 전달 받음(객체타입)
				const data = {type : "enter", msg: memberId}; 
				//문자열로 변환
				ws.send(JSON.stringify(data));
				appendChat("<p>채팅방에 입장했습니다</p>");
			}
			function receiveMsg(param){
				console.log(param); //서버가 준 데이터
				appendChat(param.data); //sendMsg
			}
			function endChat(){
				console.log("웹소켓 연결종료");
			}
			function sendMsg(){
				const msg = $("#sendMsg").val();
				console.log(msg);
				//메세지가 빈 문자열이 아닐 때
				if(msg !=''){
					//입력한 내용 전달 받음(객체타입)
					const data = {type:"chat", msg:msg};
					//문자열로 변환
					ws.send(JSON.stringify(data));
					appendChat("<div class='chat right'>"+msg+"</div");
					$("#sendMsg").val(''); //input창 비우기
				}
			}
			//엔터치면 전송
			$("#sendMsg").on("keyup",function(e){
				if(e.keyCode == 13){
					sendMsg();
				}
			});
			function appendChat(chatMsg){
				$(".messageArea").append(chatMsg); //발송 메세지 추가 
				//스크롤상단
				$(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);
			}
		</script>
	</c:if>
</body>
</html>