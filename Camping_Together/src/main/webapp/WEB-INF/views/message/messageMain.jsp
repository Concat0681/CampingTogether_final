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
	
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">쪽지보내기</button>
	
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
	


<!-- 부트스트랩 스크립트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</body>
</html>