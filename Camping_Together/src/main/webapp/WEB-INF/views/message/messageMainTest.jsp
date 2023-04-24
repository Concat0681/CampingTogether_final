<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>

.modal-wrapper{
    position: fixed;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0,0,0,0.5);
    top: 0;
    left: 0;
    display: none;
    justify-content: center;
    align-items: center;

}
.modal{
    width: 350px;
    background-color: #fff;

}
.modal-header{
    padding: 10px;

}
.modal-content{
    padding: 20px;
}
textarea[name=messageContent]{
    width: 100%;
    height: 100px;
    resize: none;
}
</style>
</head>
<body>

<div> 
	<h1>쪽지함</h1>
	<hr>
	<h3>쪽지보내기</h3>
	<button onclick="sendMessageModal();">쪽지보내기</button>
	<hr>
	<h3>받은 쪽지함</h3>
	<table border="1" class="receiveTbl">
		<thead></thead>
		<tr>
			<th>보낸사람</th>
			<td>내용</td>
			<th>시간</th>
			<th>읽음여부</th>
		</tr>
		<tbody></tbody>
	</table>

	<hr>

	<h3>보낸 쪽지함</h3>
	<table border="1" class="sendTbl">
		<thead></thead>
		<tr>
			<th>보낸사람</th>
			<td>내용</td>
			<th>시간</th>
			<th>읽음여부</th>
		</tr>
		<tbody></tbody>
	</table>
</div>
	<!-- 쪽지 보내기 모달 -->
	<div id="sendMessage-modal" class="modal-wrapper" style="border: 2px solid #fff;">
		<div class="modal">
			<div class="modal-header">
				<h2>쪽지보내기</h2>
			</div>

			<hr>
			<div class="modal-content">
				<div class="sendMessageFrm">
					<label>수신자 : </label> <select name="receiver" id="receiver"></select>
					<input type="text" id="messageTitle" name="messageTitle">
					<textarea name="messageContent"></textarea>
					<input type="hidden" id="sender" name="sender" value="${sessionScope.m.memberId }">
					<button onclick="messageSend();">보내기</button>
					<button onclick="closeModal();">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 쪽지 상세 보기 모달 -->
	<div id="messageDetail" class="modal-wrapper">
		<div class="modal">
			<div class="modal-header">
				<h2>쪽지내용</h2>
			</div>
			<hr>
			<div class="modal-content">
				<div class="messageFrm">
					<div>
						<span>발신자: </span>
						<span id="detailSender"></span>
					</div>
					<div>
						<span>날짜: </span>
						<span id="detailDate"></span>
					</div>
					<div id="detailContent"></div>
					<button onclick="closeDetail();">닫기</button>
					<button onclick="replyMessage();">답장</button>
				</div>
			</div>
		</div>
	</div>
	
	<button class="buttonon1" onclick="start1();"></button>
	<script>
	
	function sendMessageModal(){
	    $.ajax({
	        url : "/selectAllMemberId.do", //멤버 컨드롤러에서 만들겁니다
	        success : function(list){
	            $("[name=receiver]").empty(); //empty() 안넣어주면 중복으로 아이디가 들어감
	            for(let i=0;i<list.length;i++){
	                const option = $("<option>");
	                option.val(list[i]);
	                option.text(list[i]);
	                $("[name=receiver]").append(option);
	            }
	            $("#sendMessage-modal").css("display","flex");
	        }
	    });
	}    
	
	function closeModal(){
	    $("#sendMessage-modal").hide();
	    $("textarea[name=messageContent]").val("");
	}

	function messageSend(){
	    const receiver = $("[name=receiver]").val();
	    const sender = $("#sender").val();
	    const messageContent = $("[name=messageContent]").val();
	    const messageTitle = $("[name=messageTitle]").val();
	    
	    $.ajax({
	        url : "/insertMessage.do",
	        type : "post",
	        data : {receiver:receiver, sender:sender, messageContent:messageContent, messageTitle:messageTitle },
	        success : function(data){
	            if(data == "0"){
	                alert("쪽지보내기 실패");
	            }
	            const sendData = {type:"sendMessage", receiver:receiver};
	            ws.send(JSON.stringify(sendData));
	            getSendMessage();
	            closeModal();
	        }
	    });
	}

	function getSendMessage(){
	    const sender = $("#sender").val();
	    $.ajax({
	        url: "/myMessageList.do",
	        data: {sender:sender},
	        success : function(list){
	            const tbody = $(".sendTbl>tbody");
	            tbody.empty();
	            for(let i=0;i<list.length;i++){
	                const message = list[i];
	                const tr = $("<tr>");
	                //보낸사람, ,제목,내용 , 시간, 읽음여부
	                const td1 = $("<td>");
	                td1.text(message.sender);
	                const td2 = $("<td>");
	                td2.text(message.messageTitle);
	                const td3 = $("<td>");
	                td3.text(message.messageDate);
	                const td4 = $("<td>");
	                if(message.readCheck == 0){
	                    tr.addClass("bold");
	                    td4.text("읽지않음");
	                }else{
	                    td4.text("읽음");
	                }
	                
	                tr.append(td1).append(td2).append(td3).append(td4);
	                tbody.append(tr);
	                
	            }
	        }
	    });
	}
	

	function getReceiveMessage(){
	    const receiver = $("#sender").val();
	    $.ajax({
	        url: "/myMessageList.do",
	        data: {receiver:receiver},
	        success : function(list){
	            const tbody = $(".receiveTbl>tbody");
	            tbody.empty();
	            for(let i=0;i<list.length;i++){
	                const message = list[i];
	                const tr = $("<tr>");
	                //보낸사람, 내용 , 시간, 읽음여부
	                const td1 = $("<td>");
	                td1.text(message.sender);
	                const td2 = $("<td>");
	                td2.text(message.messageContent);
	                td2.attr("onclick","messageDetail("+message.messageNo+");");
	                const td3 = $("<td>");
	                td2.text(message.messageDate);
	                const td4 = $("<td>");
	                if(message.readCheck == 0 ){
	                    tr.addClass("bold");
	                	td4.text("읽지않음");

	                }else{
	                    td4.text("읽음");
	                }
	                tr.append(td1).append(td2).append(td3).append(td4);
	                tbody.append(tr);
	                
	            }
	        }
	    });
	    
	}
	function messageDetail(messageNo){
	    console.log(messageNo);
	    $.ajax({
	        url : "/messageDetail.do",
	        data: {messageNo : messageNo},
	        success : function(data){
	            $("#detailSender").text(data.sender);
	            $("#detailDate").text(data.messageDate);
	            $("#detailContent").text(data.messageContent);
	            $("#messageDetail").css("display","flex");
	            getReceiveMessage();
	            const sendData = {type:"readCheck", sender:data.sender, receiver:data.receiver};
	            ws.send(JSON.stringify(sendData));
	        }
	    });
	}
	function closeDetail(){
	    $("#messageDetail").hide();
	}
	
	$(function(){
		getSendMessage();
		getReceiveMessage();
	})
	</script>
</body>
</html>