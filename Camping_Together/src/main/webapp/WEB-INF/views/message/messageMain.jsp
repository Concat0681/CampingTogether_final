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

 

</body>
</html>