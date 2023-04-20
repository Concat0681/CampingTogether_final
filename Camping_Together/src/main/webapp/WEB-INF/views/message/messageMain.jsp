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
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
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
	      <form action="/insertMessage.do" id="send-form" method="post">
		      <div class="modal-body">
		         <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">보내는 사람:</label>
		            <input type="text" class="form-control" id="send-sender" value="${sessionScope.m.memberId }" name="sender" readonly>
		          </div>	
		        	
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">받는 사람:</label>
		            <input type="text" class="form-control" id="send-recipient" placeholder="아이디를 적어주세요" name="receiver">
		          </div>
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">제목:</label>
		            <input type="text" class="form-control" id="send-title" name="messageTitle">
		          </div>
		          <div class="mb-3">
		            <label for="message-text" class="col-form-label">내용:</label>
		            <textarea class="form-control" id="send-text" name="messageContent"></textarea>
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
	<button type="button" id="new-message-btn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">쪽지보내기</button>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
 $(document).ready(function() {
	  // 새 쪽지 작성 버튼 클릭 시 모달창 호출
	  $('#new-message-btn').click(function() {
	    $('#exampleModal').modal('show');
	  });

	  // 쪽지 전송 버튼 클릭 시 Ajax 통신을 통해 쪽지 전송
	  $('#send-message-btn').click(function() {
	    $.ajax({
	      type: 'POST',
	      url: '/insertMessage.do',
	      data: {
	        sender: $('#send-sender').val(),
	        receiver: $('#send-recipient').val(),
	        messageTitle: $('#send-title').val(),
	        messageContent: $('#send-text').val()
	      },
	      success: function() {
	        // 쪽지 전송 성공 시 모달창 닫기 및 쪽지 리스트 업데이트
	        $('#exampleModal').modal('hide');
	        updateMessageList();
	      },
	      error: function() {
	        alert('쪽지 전송에 실패했습니다.');
	      }
	    });
	  });

	  // 쪽지 리스트 업데이트 함수
	  function updateMessageList() {
	    $.ajax({
	      type: 'GET',
	      url: '/myMessageList.do',
	      dataType: 'json',
	      success: function(data) {
	        $('#messageList').empty(); // 쪽지 리스트 초기화
	        var count = 0; // 읽지 않은 쪽지 수 초기화
	        $.each(data, function(index, item) {
	          var row = '<tr>';
	          row += '<td>' + (index + 1) + '</td>';
	          row += '<td>' + item.sender + '</td>';
	          row += '<td><a href="/readMessage.do?messageId=' + item.messageId + '">' + item.messageTitle + '</a></td>';
	          row += '<td>' + item.sendDate + '</td>';
	          row += '<td>';
	          if (item.readFlag == 'N') {
	            row += '<span class="badge bg-danger">Unread</span>';
	            count++;
	          } else {
	            row += '<span class="badge bg-success">Read</span>';
	          }
	          row += '</td></tr>';
	          $('#messageList').append(row);
	        });
	        // 읽지 않은 쪽지 수 표시
	        $('#unread-count').text(count);
	      },
	      error: function() {
	        alert('쪽지 리스트 로딩에 실패했습니다.');
	      }
	    });
	  }

	  // 페이지 로딩 시 쪽지 리스트 업데이트
	  updateMessageList();
	  
    $('#send-form').submit(function(event) {
      event.preventDefault();

      var sender = $('#send-sender').val();
      var recipient = $('#send-recipient').val();
      var title = $('#send-title').val();
      var content = $('#send-text').val();

      if (recipient === '') {
        alert('받는 사람을 입력해주세요.');
        return false;
      }

      if (title === '') {
        alert('제목을 입력해주세요.');
        return false;
      }

      if (content === '') {
        alert('내용을 입력해주세요.');
        return false;
      }

      $.ajax({
        type: 'POST',
        url: '/insertMessage.do',
        data: {
          sender: sender,
          receiver: recipient,
          messageTitle: title,
          messageContent: content
        },
        success: function(data) {
          $('#exampleModal').modal('hide');
          $('#send-form').trigger('reset');
          alert('쪽지를 보냈습니다.');
        },
        error: function(xhr, status, error) {
          alert('쪽지 전송에 실패하였습니다. 다시 시도해주세요.');
        }
      });
    });
  });
</script>

</body>
</html>