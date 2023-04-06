<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<h1> 쪽지함 </h1>
	
	<!--  쪽지 쓰기 버튼  -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">쪽지보내기</button>
	<!--  쪽지 쓰기 버튼 클릭시 모달창  -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form action="/insertMessage.do" method="post">
		      <div class="modal-body">
		         <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">보내는 사람:</label>
		            <input type="text" class="form-control" id="recipient-name" value="${sessionScope.m.memberId }" name="sender" readonly>
		          </div>	
		        	
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">받는 사람:</label>
		            <input type="text" class="form-control" id="recipient-name" placeholder="아이디를 적어주세요" name="receiver">
		          </div>
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">제목:</label>
		            <input type="text" class="form-control" id="recipient-name" name="messageTitle">
		          </div>
		          <div class="mb-3">
		            <label for="message-text" class="col-form-label">내용:</label>
		            <textarea class="form-control" id="message-text" name="messageContent"></textarea>
		          </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Send message</button>
		      </div>
	        </form>
	      
	    </div>
	  </div>
	</div>
	<!--  쪽지 리스트 -->
	
	<h2>내가 받은 쪽지 리스트</h2>
	<p>쪽지 갯수 : <span id="msgCount"></span></p>
	<table border="1">
		<thead>
			<tr>
				<th>보낸 사람</th>
				<th>제목</th>
				<th>받은 날짜</th>
				<th>읽음 여부</th>
			</tr>
		</thead>
		<tbody id="msgList">
			<c:forEach var="msg" items="${msgList}">
				<tr>
					<td>${msg.sender}</td>
					<td><a href="#" class="modal-link" data-msg-no="${msg.messageNo}">${msg.messageTitle}</a></td>
					<td>${msg.messageDate}</td>
					<td>${msg.readCheck == 0 ? '읽지 않음' : '읽음'}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h3 id="modal-title"></h3>
			<p id="modal-sender"></p>
			<p id="modal-date"></p>
			<p id="modal-content"></p>
		</div>
	</div>

<!-- 부트스트랩 스크립트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function showMessageDetail(messageNo) {
	    const xhr = new XMLHttpRequest();
	    xhr.open('GET', '/messageDetail.do?messageNo=' + messageNo, true);
	    xhr.onload = function() {
	        if (xhr.status === 200) {
	            const message = JSON.parse(xhr.responseText);
	            const messageModalBody = document.getElementById("messageModalBody");
	            messageModalBody.innerHTML = "";
				/*
	            const countP = doument.createElment("p");
	            messageP.innerHTML = "쪽지 갯수: " + message.count;
	            messageModalBody.appendChilde(countP)
	         	*/  
	            const senderP = document.createElement("p");
	            senderP.innerHTML = "보낸 사람: " + message.sender;
	            messageModalBody.appendChild(senderP);
	
	            const titleP = document.createElement("p");
	            titleP.innerHTML = "제목: " + message.messageTitle;
	            messageModalBody.appendChild(titleP);
	
	            const dateP = document.createElement("p");
	            dateP.innerHTML = "받은 날짜" + message.messageDate;
	            messageModalBody.appendChild(dateP);
	        }
	    }
	}
	    // 쪽지 리스트 가져오는 함수
	    function getMyMessageList() {
	        var xhr = new XMLHttpRequest();
	        xhr.onreadystatechange = function() {
	            if (xhr.readyState === xhr.DONE) {
	                if (xhr.status === 200 || xhr.status === 201) {
	                    var messageList = JSON.parse(xhr.responseText);
	                    var messageCount = messageList.length;
	                    var messageTable = document.getElementById("messageTable");

	                    // 메시지 리스트를 테이블에 추가
	                    for (var i = 0; i < messageCount; i++) {
	                        var message = messageList[i];

	                        // 테이블 행 추가
	                        var row = messageTable.insertRow();

	                        // 쪽지 보낸 사람 셀 추가
	                        var senderCell = row.insertCell(0);
	                        senderCell.innerHTML = message.sender;

	                        // 쪽지 제목 셀 추가
	                        var titleCell = row.insertCell(1);
	                        var titleLink = document.createElement("a");
	                        titleLink.innerHTML = message.messageTitle;
	                        titleLink.href = "javascript:openMessageDetail(" + message.messageNo + ")";
	                        titleCell.appendChild(titleLink);

	                        // 쪽지 날짜 셀 추가
	                        var dateCell = row.insertCell(2);
	                        var dateP = document.createElement("p");
	                        dateP.innerHTML = message.messageDate;
	                        dateCell.appendChild(dateP);

	                        // 쪽지 읽음 여부 셀 추가
	                        var readCheckCell = row.insertCell(3);
	                        var readCheckSpan = document.createElement("span");
	                        if (message.readCheck == 1) {
	                            readCheckSpan.innerHTML = "읽음";
	                        } else {
	                            readCheckSpan.innerHTML = "안 읽음";
	                        }
	                        readCheckCell.appendChild(readCheckSpan);
	                    }
	                } else {
	                    alert("쪽지 리스트를 불러오는 데 실패하였습니다.");
	                }
	            }
	        };

	        xhr.open("GET", "/myMessageList.do", true);
	        xhr.send();
	    }
</script>
</body>
</html>