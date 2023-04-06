<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지함</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        table {
            width: 100%;
        }

        table th {
            font-weight: bold;
        }

        table td {
            padding: 0.5rem;
            vertical-align: middle;
        }
    </style>
</head>
<body>
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
<div class="container mt-3">
    <h1>쪽지함</h1><!--  쪽지 쓰기 버튼  -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">쪽지보내기</button>
	<a href="/">메인화면으로</a>    
    <div class="row mt-3">
        <div class="col-md-12">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">쪽지 갯수</th>
                    <th scope="col">보낸 사람</th>
                    <th scope="col">제목</th>
                    <th scope="col">받은 날짜</th>
                    <th scope="col">읽음 유무</th>
                </tr>
                </thead>
                <%-- 쪽지 리스트는 Ajax 통시후 생성. --%>
                <tbody id="messageList"></tbody>
            </table>
			
        </div>
    </div>
</div>



<!-- 쪽지 상세 모달창 -->
<div class="modal fade" id="messageDetailModal" tabindex="-1" role="dialog" aria-labelledby="messageDetailModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="messageDetailModalLabel">쪽지 상세보기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="sender"></p>
                <p id="title"></p>
                <p id="content"></p>
                <p id="date"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 쪽지 리스트 생성
    
    function getMyMessageList() {
    	  var xhr = new XMLHttpRequest();
    	  xhr.open('POST', '/myMessageList.do');
    	  xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
    	  xhr.onload = function () {
    	    if (xhr.status === 200) {
    	      var messageList = JSON.parse(xhr.responseText);
    	      var messageListContainer = document.querySelector('#messageListContainer');
    	      messageListContainer.innerHTML = '';
    	      if (messageList.length > 0) {
    	        messageList.forEach(function (message) {
    	          var messageRow = createMessageRow(message);
    	          messageListContainer.appendChild(messageRow);
    	        });
    	      } else {
    	        var noMessageRow = createNoMessageRow();
    	        messageListContainer.appendChild(noMessageRow);
    	      }
    	    } else {
    	      console.error('Failed to get my message list.');
    	    }
    	  };
    	  var data = {
    	    receiver: '<%= session.getAttribute("loginMemberId") %>'
    	  };
    	  xhr.send(JSON.stringify(data));
    	}

    	function createMessageRow(message) {
    	  var row = document.createElement('div');
    	  row.classList.add('row');
    	  row.classList.add('messageRow');
    	  row.dataset.messageNo = message.messageNo;

    	  var countCell = document.createElement('div');
    	  countCell.classList.add('cell');
    	  countCell.classList.add('messageCount');
    	  countCell.innerText = message.messageCount;

    	  var senderCell = document.createElement('div');
    	  senderCell.classList.add('cell');
    	  senderCell.classList.add('messageSender');
    	  senderCell.innerText = message.sender;

    	  var titleCell = document.createElement('div');
    	  titleCell.classList.add('cell');
    	  titleCell.classList.add('messageTitle');
    	  titleCell.innerText = message.messageTitle;
    	  titleCell.addEventListener('click', function () {
    	    showMessageDetail(message.messageNo);
    	  });

    	  var dateCell = document.createElement('div');
    	  dateCell.classList.add('cell');
    	  dateCell.classList.add('messageDate');
    	  dateCell.innerText = message.messageDate;

    	  var checkCell = document.createElement('div');
    	  checkCell.classList.add('cell');
    	  checkCell.classList.add('messageCheck');
    	  checkCell.innerText = message.readCheck === 1 ? '읽음' : '안읽음';

    	  row.appendChild(countCell);
    	  row.appendChild(senderCell);
    	  row.appendChild(titleCell);
    	  row.appendChild(dateCell);
    	  row.appendChild(checkCell);

    	  return row;
    	}

    	function createNoMessageRow() {
    	  var row = document.createElement('div');
    	  row.classList.add('row');
    	  row.classList.add('noMessageRow');

    	  var cell = document.createElement('div');
    	  cell.classList.add('cell');
    	  cell.colSpan = 5;
    	  cell.innerText = '받은 쪽지가 없습니다.';

    	  row.appendChild(cell);

    	  return row;
    	}

    	function showMessageDetail(messageNo) {
    	    // Get the message detail using AJAX
    	    var xhr = new XMLHttpRequest();
    	    xhr.open("POST", "/messageDetail.do", true);
    	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    	    xhr.onreadystatechange = function() {
    	        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
    	            var message = JSON.parse(this.responseText);
    	            if (message) {
    	                // Fill in the message detail modal
    	                document.getElementById("detailMessageTitle").innerHTML = message.messageTitle;
    	                document.getElementById("detailMessageSender").innerHTML = "보낸 사람: " + message.sender;
    	                document.getElementById("detailMessageContent").innerHTML = message.messageContent;
    	                document.getElementById("detailMessageDate").innerHTML = "받은 날짜: " + message.messageDate;

    	                // If the message is unread, mark it as read
    	                if (message.readCheck === 0) {
    	                    message.readCheck = 1;
    	                    updateMessageReadStatus(message);
    	                }

    	                // Show the message detail modal
    	                var modal = document.getElementById("messageDetailModal");
    	                modal.style.display = "block";
    	            } else {
    	                alert("쪽지를 불러오는 데 실패하였습니다.");
    	            }
    	        }
    	    };
    	    xhr.send("messageNo=" + messageNo);
    	}

    	function updateMessageReadStatus(message) {
    	    // Update the read status using AJAX
    	    var xhr = new XMLHttpRequest();
    	    xhr.open("POST", "/updateMessageReadStatus.do", true);
    	    xhr.setRequestHeader("Content-Type", "application/json");
    	    xhr.onreadystatechange = function() {
    	        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
    	            var result = JSON.parse(this.responseText);
    	            if (result === "success") {
    	                // Do something if the update is successful
    	            } else {
    	                alert("읽음 처리를 실패하였습니다.");
    	            }
    	        }
    	    };
    	    xhr.send(JSON.stringify(message));
    	}

    
 </script>
</body>
</html>