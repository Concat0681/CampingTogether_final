$(document).scroll(function() {
    const scrollTop = $(this).scrollTop();
    if (scrollTop == 0) {
      $('.wrapper-top').removeClass('wrapper-top').addClass('scroll-top');
    } else {
      $('.scroll-top').removeClass('scroll-top').addClass('wrapper-top');
    }
  });
  
 // 모달창 열기
$(".messageBtn").click(function() {
	$(".messageBox").css("display", "none");
}); 
 
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
	})