<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지함</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
.material-symbols-outlined {
	  font-variation-settings:
	  'FILL' 1,
	  'wght' 300,
	  'GRAD' 0,
	  'opsz' 48
}
/*
.fill{
		font-variation-settings: 'FILL' 1
}
*/
	
.wrapper-header{
  display: flex;
  justify-content: space-between;
}
.wrapper{
  width: 500px;
  height: auto;
  border: 1px solid black;
  
}
table{
  margin: 0 auto;
  text-align: center;
}
.tab-content{
  text-align: center;
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
	width: calc(100%/3);
	background-color: #CEAB93;
	text-align: center;
	border-radius: 8px;
	padding: 12px;
}

.modal-wrapper{
    margin: 0 auto;
    width: 90%;
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
    margin: 0 auto;
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
.tab>a{
  text-decoration: none;
  color: #fff;
}
#receiveBox{
  display: none;
  width: 90%;
  height: 300px;
 border: 1px solid blue;
  margin: 0 auto;
}
#sendBox{
  display: none;
  width: 90%;
  height: 300px;
  border: 1px solid blue;
  margin: 0 auto;
}
</style>
</head>
<body>
<!--  쪽지함 modal -->
<div class="wrapper">
	  <div class="wrapper-header">
	    <div class="material-symbols-outlined fill" id="modal-cancle">cancel</div>
	  </div>
	  <hr>
	  <div class="wrapper-body">
		      <ul class="tab-group">
			       <li class="tab"><a href="#receiveBox">받은 쪽지</a></li>
			       <li class="tab"><a href="#sendBox">보낸 쪽지</a></li>
			       <li class="tab"><a href="#sendMessage-modal">쪽지 보내기</a></li>
		      </ul>
		<!-- 쪽지 보내기 -->
	<div class="tab-content">
	  <div id="sendMessage-modal" class="modal-wrapper" style="border: 2px solid #fff;">
			<div class="modal">
				<div class="modal-header">
					<h2>쪽지보내기</h2>
				</div>
				<hr style="padding: 0px;">
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
		<!-- 받은 쪽지 -->
		<div id="receiveBox">
		<table class="receiveTbl">
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
		<!-- 보낸 쪽지 -->
		<div id="sendBox">
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
		<!-- 상세 보기  -->
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
	  </div>
	</div>
</div>
<script>
//탭 변경창
$('.tab a').on('click', function (e) {
  e.preventDefault();
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  target = $(this).attr('href');
  $('.tab-content > div').not(target).hide();
  $(target).fadeIn(1000);
});


$("#sendMessage-modal").on("click", function(){
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
            $("#sendMessage-modal").css("display","block");
        }
    });

})
	
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
                td3.text(message.messageContent);
                const td4 = $("<td>");
                td4.text(message.messageDate);
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
                td2.text(message.messageTitle);
                const td3 = $("<td>");
                td3.text(message.messageContent);
                td3.attr("onclick","messageDetail("+message.messageNo+");");
                const td4 = $("<td>");
                td4.text(message.messageDate);
                const td5 = $("<td>");
                if(message.readCheck == 0 ){
                    tr.addClass("bold");
                	td5.text("읽지않음");

                }else{
                    td5.text("읽음");
                }
                tr.append(td1).append(td2).append(td3).append(td4).append(td5);
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
});
	
	
</script>

</body>
</html>